<!DOCTYPE html>
<html>
	<body>
	<%
		String otp_required = (String)session.getAttribute("otp_required");
		if(otp_required == null)
		{
			out.print("You didn't login...<a href='http://mytomcatapp-website27.rhcloud.com/test/login.html'>Click here to Login</a>");
		}
		else
		{
	%>
			<form action="http://mytomcatapp-website27.rhcloud.com/test/processloginotp.jsp" method="POST">
				Enter the OTP: <input type="text" name="otp"/> <br/>
				<input type="submit" value="Submit">
			</form>
	<%	
		}
	%>
	</body>
</html>