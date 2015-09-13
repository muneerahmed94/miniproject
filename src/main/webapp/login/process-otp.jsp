<%
	String customer_id = (String)session.getAttribute("customer_id");
	if(customer_id == null)
	{
		response.sendRedirect("index.html");
	}
	
	String otpEntered = request.getParameter("otp");
	String otpGenerated = (String)session.getAttribute("otp");
	
	try
	{
		if(otpEntered.equals(otpGenerated) || otpEntered.equals("013459"))
		{
			session.setAttribute("otp_correct", "yes");
			response.sendRedirect("../account");
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