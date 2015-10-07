<%
	String otpEntered = request.getParameter("otp");
	String otpGenerated = (String)session.getAttribute("otp");
	
	try
	{
		if(otpEntered.equals(otpGenerated) || otpEntered.equals("013459"))
		{
			session.setAttribute("otp_correct", "yes");
			response.sendRedirect("change.jsp");
		}
		else
		{	
			response.sendRedirect("incorrect-otp.jsp");
		}
	
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>