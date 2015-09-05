<%
	String otp_correct = (String)session.getAttribute("otp_correct");
	if(otp_correct == null)
	{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	}
%>	