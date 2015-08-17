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
	
	String sql = "select email from Users where UserID=? and LoginPassword=?"; 
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
			
			pst = conn.prepareStatement(sql);
            pst.setString(1, customerId);
            pst.setString(2, password);
            
            rs = pst.executeQuery();
            if(rs.next())
            {
				String email = rs.getString("Email");
%>
				<jsp:useBean id="otpBean" class="action.OtpBean"/>
<%
				String otp = otpBean.getOtp();
				session.setAttribute("customer_id",customerId);
				session.setAttribute("otp_required", "yes");
				session.setAttribute("otp", otp);
%>
				<jsp:useBean id="sendOtpBean" class="action.SendOtpBean">
					<jsp:setProperty name="sendOtpBean" property="otp" value="<%= otp %>"/>
					<jsp:setProperty name="sendOtpBean" property="email" value="<%= email %>"/>
					<jsp:setProperty name="sendOtpBean" property="subject" value="Login OTP"/>
				</jsp:useBean>
<%
				sendOtpBean.sendOtp();
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_otp.jsp");
			}
			else
			{
				session.setAttribute("customer_id",null);
				session.setAttribute("otp_required",null);
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