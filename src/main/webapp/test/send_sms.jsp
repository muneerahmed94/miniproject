<%
	String src = "+919963242352";
	String dst = request.getParameter("to");
	String body = request.getParameter("body");
%>
	<jsp:useBean id="sendSmsBean" class="action.SendSmsBean">
		<jsp:setProperty name="sendSmsBean" property="src" value="<%= src %>"/>
		<jsp:setProperty name="sendSmsBean" property="dst" value="<%= dst %>"/>
		<jsp:setProperty name="sendSmsBean" property="body" value="<%= body %>"/>
	</jsp:useBean>
<%
	String status = sendSmsBean.sendSms();
	out.print(status);
%>
