<%@ include file="../../../include/check-password.jsp" %>
<%@ include file="../../../include/connect-to-db.jsp" %>
<%
	try
	{
		String new_user_id = request.getParameter("new_user_id");
		String customer_id = (String)session.getAttribute("customer_id");
		
		sql = "SELECT * FROM Users WHERE AlternateUserID=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1,new_user_id);
		rs = pst.executeQuery();
		if(rs.next())
		{
			response.sendRedirect("duplicate.jsp");
		}
		
		sql = "UPDATE Users SET AlternateUserID=? WHERE UserID=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, new_user_id);
		pst.setString(2, customer_id);
		int x = pst.executeUpdate();
		if(x == 1)
		{
			session.setAttribute("alternate_userid_set", "yes");
			response.sendRedirect("success.jsp");
		}
	}
	catch(Exception e)
	{
			out.print(e);
	}
%>