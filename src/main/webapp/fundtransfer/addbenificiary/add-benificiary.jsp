<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../include/check-password.jsp" %>

<%
	Integer benificiaryOf = new Integer(0);
	Integer benificiaryAccountNumber = new Integer(0);
	String accountNumber = (String)session.getAttribute("account_number");
	if(accountNumber != null)
	{
			benificiaryOf = Integer.parseInt(accountNumber);
	}
	String temp = request.getParameter("benificiary_account_number");
	if(temp != null)
	{
		benificiaryAccountNumber = Integer.parseInt(temp);
	}
	String benificiaryName = request.getParameter("benificiary_name");
	
	try
	{	
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		
		String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
		String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
		String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String MYSQL_DATABASE_NAME = "miniproject";

		String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
		
		String sql = "SELECT * FROM Benificiaries WHERE BenificiaryOf=? AND Benificiary=?";
		pst = conn.prepareStatement(sql); 
		pst.setInt(1, benificiaryOf);
		pst.setInt(2, benificiaryAccountNumber);
		rs = pst.executeQuery();
		if(rs.next())
		{
			response.sendRedirect("../viewbenificiary");
		}
		
		sql = "SELECT * FROM Customers WHERE AccountNumber=?"; 
		pst = conn.prepareStatement(sql);
		pst.setInt(1, benificiaryAccountNumber);
		rs = pst.executeQuery();
		if(rs.next())
		{
			sql = "INSERT INTO Benificiaries (BenificiaryOf, Benificiary, BenificiaryName) VALUES ('"+benificiaryOf+"', '"+benificiaryAccountNumber+"', '"+benificiaryName+"')";
			pst = conn.prepareStatement(sql);
			int x = pst.executeUpdate(sql);
			if(x == 1)
			{
				response.sendRedirect("../viewbenificiary");
			}
		}
		else
		{
			response.sendRedirect("no-such-benificiary.jsp");
		}
			
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo);
		out.print("<br/><br/>");
		out.print(e);
	}
%>