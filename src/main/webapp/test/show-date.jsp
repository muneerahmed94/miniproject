<%
	try
	{
        String date = request.getParameter("date");
        Date currentDate =new SimpleDateFormat("yyyy/MM/dd").parse(valuee);
        out.println("Date is ::"+currentDate);
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>