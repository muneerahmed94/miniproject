<%@ include file="../../include/check-passed-make-payment.jsp" %>

<%
	try
	{
		String trasactionPassword = (String)session.getAttribute("transaction_password");
		String trasactionPasswordEnterd = request.getParameter("transaction_password");
		if(trasactionPassword.equals(trasactionPasswordEnterd))
		{
			session.setAttribute("passed_make_payment_trasaction_password", "yes");
			response.sendRedirect("");
		}
		else
		{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-transaction-password-incorrect.jsp");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>