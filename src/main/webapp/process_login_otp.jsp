<%
	String otp_entered = request.getParameter("otp");
	String otp_generated = (String)session.getAttribute("otp");
	 
	try
	{
		if(otp_entered.equals(otp_generated))
		{
			session.setAttribute("otp_correct", "yes");
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/welcome.jsp");
		}
		else
		{	
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/invalid_login_otp.jsp");
		}
	
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>