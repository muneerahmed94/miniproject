<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date dateObj =new SimpleDateFormat("dd-MM-yyyy").parse(dateStr);
		DateFormat formatter = DateFormat.getDateInstance(DateFormat.LONG);
		out.print(formatter.format(dateObj));
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
