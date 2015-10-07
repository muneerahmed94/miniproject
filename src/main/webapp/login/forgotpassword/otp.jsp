<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%
	if((String)session.getAttribute("customer_id") == null)
		response.sendRedirect("index.html");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Forgot Password</title>
		<link rel="icon" type="image/x-icon" href="../../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../../css/main.css">
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="../../"><img src="../../images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
				</td>
				<td style="background-color:#cb0076;color:white;text-align:center;font-size:45px">
					JNTU Bank Internet Banking
				</td>
			</tr>
			<!-- ============ NAVIGATION BAR SECTION ============== -->
			<tr height="28px">
				<td	colspan=2 bgcolor="#0072c6">
				
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="../openaccount">Open an Account</a></li>
						<li class="lielv"><a class="linkv" href="../register">Internet Banking-Register</a></li>
						<li class="lielv"><a class="linkv" href="index.html">Internet Banking-Login</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td style="background-color:white;vertical-align:top;">
					<form action="process-otp.jsp" method="POST">
						<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="text-align:center;background-color:#a9d0f5;font-weight:bold;">Forgot Password</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="color:green;">OTP sent to your registered Email and Mobile</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Enter the OTP: </td>
								<td><input type="text" size="25" name="otp"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Submit">
									&nbsp &nbsp &nbsp &nbsp &nbsp 
									<input type="reset" value="Reset">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<b>Haven't received OTP? </b><a href="#ClickHere">Click Here</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>	
			<!-- ============ FOOTER SECTION ============== -->
			<tr>
				<td align="center" bgcolor="#e7e6e6" colspan="2" height="20px">
					&#169; JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>