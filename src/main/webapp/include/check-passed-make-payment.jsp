<%@ include file="../../include/check-password.jsp" %>
<%
	try
	{
		String passed_make_payment = (String)session.getAttribute("passed_make_payment");
		if(passed_make_payment == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/make-payment.jsp");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>