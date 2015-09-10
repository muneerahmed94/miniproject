<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date dateObj =new SimpleDateFormat("dd MMM yyyy").parse(dateStr);
		
		out.println(dateObj);
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
