<%@ include file="../../include/check-password.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>
<%
	try
	{
		Integer benificiaryOf = Integer.parseInt((String)session.getAttribute("account_number"));
		Integer benificiary = Integer.parseInt(request.getParameter("benificiary_account_number"));
		
		sql = "DELETE FROM Benificiaries WHERE BenificiaryOf=? AND Benificiary=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1,benificiaryOf);
		pst.setInt(2,benificiary);
		int x = pst.executeUpdate();
		if(x == 1)
		{
			response.sendRedirect("index.jsp");
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>