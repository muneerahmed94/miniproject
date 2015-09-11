<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
        
		DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, yyyy HH:mm:ss");
		Date date = new Date();
		out.print(date.toString() + "<br/>");
		out.println(dateFormat.format(date) + "<br/>");

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		calendar.add(Calendar.HOUR, 9);
		calendar.add(Calendar.MINUTE, 30);

		out.println(dateFormat.format(calendar.getTime()) + "<br/>");
		
		String sql = "INSERT INTO Test(Name, DateTime) VALUES(?, ?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1, request.getParameter("name"));
		pst.setString(2, date.toString());
		pst.executeUpdate();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
