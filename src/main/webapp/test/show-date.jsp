<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
		DateFormat displayFormat = new SimpleDateFormat("EEE, MMM d, yyyy hh:mm aaa");
		DateFormat insertFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		displayFormat.setTimeZone(TimeZone.getTimeZone("Asia/Calcutta")); 
		insertFormat.setTimeZone(TimeZone.getTimeZone("Asia/Calcutta")); 
		
		Date currentDateTime = new Date();
	
		out.println(insertFormat.format(currentDateTime) + "<br/>");
		out.println(displayFormat.format(currentDateTime) + "<br/>");
		
		String sql = "INSERT INTO Test(Name, DateTime) VALUES(?, ?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1, request.getParameter("name"));
		pst.setString(2, insertFormat.format(currentDateTime).toString());
		pst.executeUpdate();
		
		System.out.println(request.getParameter("date"));
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
