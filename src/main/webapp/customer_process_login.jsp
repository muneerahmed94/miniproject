<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%
	String customerId = request.getParameter("customer_id");
	String password = request.getParameter("password");
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	 
        try
        {
		
			String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
			String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
			String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
			String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
			String MYSQL_DATABASE_NAME = "miniproject";

			String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
			
			String sql = "select email from Users where UserID=? and LoginPassword=?";
			pst = conn.prepareStatement(sql);
            pst.setString(1, customerId);
            pst.setString(2, password);
            
            rs = pst.executeQuery();
            if(rs.next())
            {
				String email = rs.getString("Email");
				String mobile = rs.getString("Mobile");
				session.setAttribute("email", email);
				session.setAttribute("mobile", mobile);
				session.setAttribute("otp_type", "Login OTP");
				session.setAttribute("customer_id",customerId);
%>
				<%@ include file="../../include/send-otp.jsp" %>
<%
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_otp.jsp");
			}
			else
			{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_mismatch.html");
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