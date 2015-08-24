<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%!
	String loginName = (String)session.getAttribute("login_name");
%>


<%
	try
	{	
		String customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}

		String otp_correct = (String)session.getAttribute("otp_correct");
		if(otp_correct == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}
		
		
		String currentPassword = (String)session.getAttribute("current_password");
		String passwordEntered = request.getParameter("current_password");
		String new_password = request.getParameter("new_password");
		
		if(currentPassword.equals(passwordEntered))
		{
			Connection conn = null;
			PreparedStatement pst = null;
			ResultSet rs = null;
			
			String sql = "UPDATE Users SET LoginPassword=? WHERE UserID=?"; 
			String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
			String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
			String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
			String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
			String MYSQL_DATABASE_NAME = "miniproject";

			String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, new_password);
			
			
			int updated = 0;
			updated = pst.executeUpdate();
			
			if(updated != 0)
			{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_change_login_password_successful");
			}
		}
		else
		{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_invalid_login_password");
		}
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo);
		out.print(e);
	}
%>
