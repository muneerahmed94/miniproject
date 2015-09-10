<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        Date dateObj =new SimpleDateFormat("dd-MM-yyyy").parse(dateStr);
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String dateToStr = format.format(dateObj);
		out.println(dateToStr);
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
