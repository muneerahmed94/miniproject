<%@ include file="../../include/check-passed-make-payment.jsp" %>

<%
	String trasactionPassword = (String)session.getAttribute("trasaction_password");
	String trasactionPasswordEnterd = request.getParameter("trasaction_password");
	if(trasactionPassword.equals(trasactionPasswordEnterd))
	{
		session.setAttribute("passed_make_payment_trasaction_password", "yes");
		response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-otp.jsp");
	}
	else
	{
		response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-transaction-password-incorrect.jsp");
	}
%>