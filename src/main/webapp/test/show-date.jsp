<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
        DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, yyyy HH:mm:ss");
		Date date = new Date();
		out.println(dateFormat.format(date) + "<br/>");

		/*
		 * Add x hours to the time
		 */

		int x = 10;

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		calendar.add(Calendar.HOUR, 9);
		calendar.add(Calendar.MINUTE, 30);

		out.println(dateFormat.format(calendar.getTime()) + "<br/>");
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
