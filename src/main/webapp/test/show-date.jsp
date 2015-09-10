<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
        String name = request.getParameter("name");
		String dateStr = request.getParameter("date");
		
		Date dateObj = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		DateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy");
		out.print(formatter.format(dateObj+ "<br>"));
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date date = new Date();
		out.println(dateFormat.format(date));

		/*
		 * Add x hours to the time
		 */

		int x = 10;

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		calendar.add(Calendar.HOUR, x);

		out.println(dateFormat.format(calendar.getTime()));
		
%>
		<%= new java.util.Date() %>
<%
		
		
		
		
		
		
		sql = "INSERT INTO Test (Name, DateTime) VALUES (?, ?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1,name);
		pst.setString(2, strDate);
		
		pst.executeUpdate();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
