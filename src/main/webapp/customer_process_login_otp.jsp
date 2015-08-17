<%
	String otp_required = (String)session.getAttribute("otp_required");
	String customer_id = (String)session.getAttribute("customer_id");
	
	out.print(customer_id + " " + otp_required);
	//if(customer_id == null || otp_required == null)
	//{
		//response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	//}
	
	String otpEntered = request.getParameter("otp");
	String otpGenerated = (String)session.getAttribute("otp");
	
	try
	{
		if(otpEntered.equals(otpGenerated))
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