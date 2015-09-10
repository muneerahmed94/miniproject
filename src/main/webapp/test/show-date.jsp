<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        out.println(dateStr);
		Date dateObj =new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		DateFormat formatter = DateFormat.getDateInstance(DateFormat.LONG);
		out.print(formatter.format(dateObj));
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
