<%
	String customer_id = (String)session.getAttribute("customer_id");
	if(customer_id == null)
	{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	}
	
	String otp_correct = (String)session.getAttribute("otp_correct");
	if(otp_correct == null)
	{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_otp.jsp");
	}
	
	session.setAttribute("customer_id", null);
	session.setAttribute("otp_correct", null);
	session.setAttribute("otp", null);
	
	response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com");
%>