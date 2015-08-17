<%
	String otp_required = (String)session.getAttribute("otp_required");
	String customer_id = (String)session.getAttribute("customer_id");
	
	if(customer_id == null || otp_required == null)
	{
		response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Customer Login OTP</title>
		<style>
			
			ul.unliv 
			{
				list-style-type: none;
				margin: 0;
				padding: 0;
			}
			a.linkv:link, a.linkv:visited 
			{
				display: block;
				width: 196px;
				color: black;
				font-size: 15px;
				background-color: #f3f3f3;
				text-align: left;
				padding: 4px;
				padding-left:20px;
				text-decoration: none;
			}
			a.linkv:hover, a.lielv:active 
			{
				background-color: #cccccc;
				font-size: 17px;
				font-weight: bold;
			}
			td, tr
			{
				border-color:#E0E0E0;
			}
		</style>
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="jntu-logo2.png" alt="JNTU Logo" height="80px" width="220px"></a>
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
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/open_account.html">Open an Account</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_registration.html">Internet Banking-Register</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_login.html">Internet Banking-Login</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/employee_login.html">Employee Login</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/admin_login.html">Administrator Login</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td style="background-color:white;vertical-align:top;">
					<form action="http://miniproject-jntuhceh.rhcloud.com/customer_process_login_otp.jsp" method="POST">
						<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="background-color:#ccecff;font-weight:bold;">Customer Login</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="color:red;">Invalid OTP...Please try again</td>
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
									<b>Haven't received OTP? </b><a href=#ClickHere>Click Here</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>	
			<!-- ============ FOOTER SECTION ============== -->
			<tr>
				<td colspan="2" style="height:20px;padding:5px;text-align:center;background-color:#e7e6e6">
					JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>