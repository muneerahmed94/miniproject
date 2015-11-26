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
		
		out.println(request.getParameter("date"));
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		df.setTimeZone(TimeZone.getTimeZone("Asia/Calcutta"));
		Date d = df.parse(request.getParameter("date"));
		out.println(insertFormat.format(d));
		
		Calendar c = Calendar.getInstance(); 
		c.setTime(d); 
		c.add(Calendar.DATE, 1);
		d = c.getTime();
		
		out.println(insertFormat.format(d));
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
