<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%@ include file="include/connect-to-db.jsp" %>

<%!
	String username;
	String password;
	String email;
	String mobile;
%>

<%
	try
	{
		int validUser = 0;
		
		username = request.getParameter("customer_id");
		password = request.getParameter("password");
		
		sql = "select * from Users where UserID=? and LoginPassword=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, password);
		rs = pst.executeQuery();
		if(rs.next())
		{
			out.print("inside 1");
			validUser = 1;
			email = rs.getString("Email");
			mobile = rs.getString("Mobile");
			session.setAttribute("email", email);
			session.setAttribute("mobile", mobile);	
			session.setAttribute("customer_id",username);
		}
		sql = "select * from Users where AlterUserID=? and LoginPassword=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, password);
		rs = pst.executeQuery();
		if(rs.next())
		{
			out.print("inside 2");
			validUser = 2;
			email = rs.getString("Email");
			mobile = rs.getString("Mobile");
			Integer userid = rs.getInt("UserID");
			String userid2 = userid.toString();
			session.setAttribute("email", email);
			session.setAttribute("mobile", mobile);	
			session.setAttribute("customer_id",userid2);
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
