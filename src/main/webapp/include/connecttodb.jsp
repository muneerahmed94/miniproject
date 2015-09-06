<%@ page import="java.sql.*" %>

<%!
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	String sql;
%>
<%
	try
	{
		conn = null;
		st = null;
		pst = null;
		rs = null;
		sql = "";
		
		String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
		String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
		String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String MYSQL_DATABASE_NAME = "miniproject";

		String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
	}
	catch(Exception e)
	{
		out.print(e);	
	}
%>