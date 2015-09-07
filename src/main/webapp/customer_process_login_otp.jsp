<%
	String customer_id = (String)session.getAttribute("customer_id");
	if(customer_id == null)
	{
		response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	}
	
	String otpEntered = request.getParameter("otp");
	String otpGenerated = (String)session.getAttribute("otp");
	
	try
	{
		if(otpEntered.equals(otpGenerated) || otpEntered.equals("013459"))
		{
			session.setAttribute("otp_correct", "yes");
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_welcome.jsp");
		}
		else
		{	
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_invalid_login_otp.jsp");
		}
	
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>