<jsp:useBean id="otpBean" class="action.OtpBean"/>
<%!
	String email;
	String src;
	String mobile;
	String otp;
	String otp_type;
%>

<%
	src = "+919505286369";
	email = (String)session.getAttribute("email");
	mobile = (String)session.getAttribute("mobile");
	otp_type = (String)session.getAttribute("otp_type");
	otp = otpBean.getOtp();
	session.setAttribute("otp", otp);
%>

<jsp:useBean id="sendOtpBean" class="action.SendOtpBean">
	<jsp:setProperty name="sendOtpBean" property="otp" value="<%= otp %>"/>
	<jsp:setProperty name="sendOtpBean" property="email" value="<%= email %>"/>
	<jsp:setProperty name="sendOtpBean" property="subject" value="<%= otp_type %>"/>
</jsp:useBean>
<%
	sendOtpBean.sendOtp();
%>
<jsp:useBean id="sendSmsBean" class="action.SendSmsBean">
	<jsp:setProperty name="sendSmsBean" property="src" value="<%= src %>"/>
	<jsp:setProperty name="sendSmsBean" property="dst" value="<%= mobile %>"/>
	<jsp:setProperty name="sendSmsBean" property="body" value="<%= otp %>"/>
</jsp:useBean>
<%
	otp = "Your " + otp_type + " is:" + " " + otp;
	sendSmsBean.sendSms();
%>
