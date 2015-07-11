<%
	String otp_entered = request.getParameter("otp");
	String otp_generated = (String)session.getAttribute("otp");
	try
	{
		if(otp_entered.equals(otp_generated))
		{
			session.setAttribute("otp_correct","yes");
			out.print("yes");
		}
		else
		{	
			out.print("invalid otp!");
		}
	
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>