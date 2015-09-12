<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%@ include file="include/connect-to-db.jsp" %>

<%
		try
		{
			int validUser = 0;;
			
			String customerId = request.getParameter("customer_id");
			String password = request.getParameter("password");
			
			String customer_id = "";
			
			sql = "select * from Users where UserID=? and LoginPassword=?";
			pst = conn.prepareStatement(sql);
            pst.setString(1, customerId);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next())
            {
				validUser = 1;
				email = rs.getString("Email");
				mobile = rs.getString("Mobile");
				session.setAttribute("email", email);
				session.setAttribute("mobile", mobile);	
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_otp.jsp");
			}
			
			sql = "select * from Users where AlternateUserID=? and LoginPassword=?";
			pst = conn.prepareStatement(sql);
            pst.setString(1, customerId);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next())
            {
				validUser = 2;
				customer_id = rs.getString("UserID");
				email = rs.getString("Email");
				mobile = rs.getString("Mobile");
				session.setAttribute("email", email);
				session.setAttribute("mobile", mobile);				
			}
			if(validUser == 1 || validUser ==2)
			{

				
				session.setAttribute("otp_type", "Login OTP");
				if(validUser == 2)
				{
					session.setAttribute("customer_id",customer_id);
				}
				else
				{
					session.setAttribute("customer_id", customerId);
				}
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