<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date dateObj =new SimpleDateFormat("dd-MM-yyyy").parse(dateStr);
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
		String d = dateFormat.format(dateObj);
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
