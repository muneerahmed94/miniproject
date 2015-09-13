<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{	
		String username = request.getParameter("customer_id");
		String password = request.getParameter("password");
		
		sql = "SELECT * FROM Users WHERE (UserID=? OR AlternateUserID=?) AND LoginPassword=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, username);
		pst.setString(3, password);
		rs = pst.executeQuery();
		if(rs.next())
		{
			Integer UserID = rs.getInt("UserID");
			String Email = rs.getString("Email");
			String Mobile = rs.getString("Mobile");
			
			session.setAttribute("customer_id",UserID.toString());
			session.setAttribute("email", Email);
			session.setAttribute("mobile", Mobile);	
			session.setAttribute("otp_type", "Login OTP");
%>
			<%@ include file="../../include/send-otp.jsp" %>
<%
				response.sendRedirect("otp.jsp");
		}
		else
		{
			response.sendRedirect("incorrect-password.html");
		}
		
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true));
		String foo = ostr.toString();
		out.println(foo + "<br/>");
		out.print(e);
	}
%>
