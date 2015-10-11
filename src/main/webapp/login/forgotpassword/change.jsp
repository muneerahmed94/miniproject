<%
	if(session.getAttribute("otp_correct") == null)
	{
		response.sendRedirect("../");
	}

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Change Password</title>
		<link rel="icon" type="image/x-icon" href="../../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../../css/main.css">
	
		<script>
			function validate()
			{
				new_password = myForm.new_password.value;
				if(new_password == null || new_password == "")
				{
					alert("Enter New Password");
					return false;
				}
				
				confirm_password = myForm.confirm_password.value;
				if(confirm_password == null || confirm_password == "")
				{
					alert("Enter Confirm Password");
					return false;
				}
				
				if(new_password != confirm_password)
				{
					alert("New Password and Confirm Password doesn't match");
					return false;
				}
			}
		</script>
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="../../../images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
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
					
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					<form name="myForm" action="process-change.jsp" method="POST" onsubmit="return validate()">
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th colspan="2" style="text-align:center">Change Login Password</th>
							</tr>
							<tr>
								<td style="font-weight:bold;">New Login Password: </td>
								<td><input type="password" size="25" name="new_password"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm Login Password: </td>
								<td><input type="password" size="25" name="confirm_password"> </td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Change">
									&nbsp &nbsp &nbsp &nbsp &nbsp 
									<input type="reset" value="Reset">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>	
			<!-- ============ FOOTER SECTION ============== -->
			<tr>
				<td align="center" bgcolor="#e7e6e6" colspan="2" height="20px">
					© JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>