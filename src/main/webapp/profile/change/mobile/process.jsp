<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../../include/check-password.jsp"%>
<%@ include file="../../../include/connect-to-db.jsp"%>

<%
	try
	{	
		String customer_id = (String)session.getAttribute("customer_id");
	
		String currentPassword = (String)session.getAttribute("login_password");
		String passwordEntered = request.getParameter("profile_password");
		String newEmail = request.getParameter("new_email");
		
		if(currentPassword.equals(passwordEntered))
		{
			sql = "UPDATE Users SET Phone=? WHERE UserID=?"; 
			pst = conn.prepareStatement(sql);
			pst.setString(1, newEmail);
			pst.setString(2,customer_id);
			
			int updated = 0;
			updated = pst.executeUpdate();
			
			if(updated == 1)
			{
				session.setAttribute("email", newEmail);
				response.sendRedirect("success.jsp");
			}
		}
		else
		{
			response.sendRedirect("incorrect.jsp");
		}
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo);
		out.print(e);
	}
%>
