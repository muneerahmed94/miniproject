<%
	try
	{
		String customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("../login");
		}
		
		String otp_correct = (String)session.getAttribute("otp_correct");
		if(otp_correct == null)
		{
				response.sendRedirect("../login");
		}
		
		session.invalidate();
		
		response.sendRedirect("../");
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>