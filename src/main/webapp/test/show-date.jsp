<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date currentDate =new SimpleDateFormat("yyyy/MM/dd").parse(dateStr);
        out.println("Date is ::"+currentDate);
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>