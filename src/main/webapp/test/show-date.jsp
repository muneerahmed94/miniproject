<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
        String dateStr = request.getParameter("date");
        out.println(dateStr);
		Date dateObj = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		DateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy");
		out.print(formatter.format(dateObj));
		
		sql = "INSERT INTO `miniproject`.`DateTime` (`Date`, `Time`) VALUES ('"+dateStr+"', CURRENT_TIMESTAMP);"
		pst = conn.prepareStatement(sql);
		pst.executeUpdate();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
