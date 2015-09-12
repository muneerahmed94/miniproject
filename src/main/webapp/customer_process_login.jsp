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
				out.print("inside 1");
				validUser = 1;
				email = rs.getString("Email");
				mobile = rs.getString("Mobile");
				session.setAttribute("email", email);
				session.setAttribute("mobile", mobile);	
				
			}
			sql = "select * from Users where AlternateUserID=? and LoginPassword=?";
			pst = conn.prepareStatement(sql);
            pst.setString(1, customerId);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next())
            {
				out.print("inside 2");
				validUser = 2;
				customer_id = rs.getString("UserID");
				email = rs.getString("Email");
				mobile = rs.getString("Mobile");
				session.setAttribute("email", email);
				session.setAttribute("mobile", mobile);				
			}
			if(validUser == 1 || validUser ==2)
			{

				out.print("inside 12");
				session.setAttribute("otp_type", "Login OTP");
				if(validUser == 2)
				{
					out.print("inside 12 2")
					session.setAttribute("customer_id",customer_id);
				}
				else
				{
					out.print("inside 12 1");
					session.setAttribute("customer_id", customerId);
				}
%>
				<%@ include file="../../include/send-otp.jsp" %>
<%
				
			}
			else
			{
				out.print("inside else");
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