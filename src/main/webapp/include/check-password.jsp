<%
	try
	{
		String customer_id = (String)session.getAttribute("customer_id");
		String otp_correct = (String)session.getAttribute("otp_correct");
		if(customer_id == null || otp_correct == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/login");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>