<%
	try
	{
		String passed_make_payment_otp = (String)session.getAttribute("passed_make_payment_otp");
		if(passed_make_payment_otp == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-otp.jsp");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>