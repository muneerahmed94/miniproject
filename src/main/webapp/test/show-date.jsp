<%@ page import="java.util.Date" %>
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
		
		
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");//dd/MM/yyyy
		Date now = new Date();
		String strDate = sdfDate.format(now);
		
		out.print(strDate);
		
		sql = "INSERT INTO DateTime (Date, Time) VALUES (?, CURRENT_TIMESTAMP)";
		pst = conn.prepareStatement(sql);
		pst.setString(1,dateStr);
		pst.executeUpdate();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
