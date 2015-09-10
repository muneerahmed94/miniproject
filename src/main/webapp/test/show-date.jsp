<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ include file="../include/connect-to-db.jsp" %>

<%
	try
	{
        String name = request.getParameter("name");
		String dateStr = request.getParameter("date");
		
		Date dateObj = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		DateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy");
		out.print(formatter.format(dateObj));
		
		
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");//dd/MM/yyyy
		Date now = new Date();
		String strDate = sdfDate.format(now);
		out.print(strDate);
		
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
