<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%@ include file="include/connect-to-db.jsp" %>

<%
	try
	{	
		String username = request.getParameter("customer_id");
		String password = request.getParameter("password");
		
		sql = "SELECT * FROM Users WHERE (UserID=? OR AlternateUserID=?) AND LoginPassword=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, username);
		pst.setString(3, password);
		rs = pst.executeQuery();
		if(rs.next())
		{
			Integer customer_id = rs.getInt("UserID");
			String email = rs.getString("Email");
			String mobile = rs.getString("Mobile");
			
			session.setAttribute("customer_id",customer_id.toString());
			session.setAttribute("email", email);
			session.setAttribute("mobile", mobile);	
		}
		else
		{
			out.print("inside else");
		}
		
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo + "<br/>");
		out.print(e);
	}
%>
