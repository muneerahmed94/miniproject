<%
	try
	{
		String customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>