<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date currentDate =new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		DateFormat dtformat = new DateFormat();
		dtformat = DateFormat.getDateInstance(DateFormat.LONG);
		out.println(dateform.format(currentDate));
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
