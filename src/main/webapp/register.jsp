<%@ page import="java.sql.*" %>
<%
	String firstName = request.getParameter("first_name");
	String middleName = request.getParameter("middle_name");
	String lastName = request.getParameter("last_name");
	String phoneNumber = request.getParameter("phone_number");
	String email = request.getParameter("email");
	String accountNumber = request.getParameter("account_number");
	
	try
	{
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
		String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
		String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String MYSQL_DATABASE_NAME = "miniproject";

		String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
		
		String sql = "INSERT INTO Users(FirstName, MiddleName, LastName, Mobile, Email, AccountNumber) VALUES('"+firstName+"', '"+middleName+"', '"+lastName+"', '"+phoneNumber+"', '"+email+"', '"+accountNumber+"')";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
		st = conn.createStatement();
		int x = st.executeUpdate(sql);
		if(x == 1)
			out.print("Registration Successful");
		else
			out.print("Registration Failed");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.print(e);
	}
%>