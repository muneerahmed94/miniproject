<%
	try
	{
		String passed_make_payment_transaction_password = (String)session.getAttribute("passed_make_payment_transaction_password");
		if(passed_make_payment_transaction_password == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-transaction-password.jsp");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>