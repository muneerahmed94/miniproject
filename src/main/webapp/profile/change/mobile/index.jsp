<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../../include/check-password.jsp"%>

<%!	
		String loginName;
%>

<%
	try
	{	
		loginName = (String)session.getAttribute("login_name");
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo);
		out.print(e);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Change Phone Number</title>
		<link rel="icon" type="image/x-icon" href="../../../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../../../css/main.css">
		<script>
			function validate()
			{
				new_phone = myForm.new_phone.value;
				if(new_phone == null || new_phone == "")
				{
					alert("Enter New Phone number");
					return false;
				}
				
				confirm_phone = myForm.confirm_phone.value;
				if(confirm_phone == null || confirm_phone == "")
				{
					alert("Enter Confirm Phone number");
					return false;
				}
				
				if(new_phone != confirm_phone)
				{
					alert("New Phone number and Confirm Phone number should match");
					return false;
				}
				profile_password = myForm.profile_password.value;
				if(profile_password == null || profile_password == "")
				{
					alert("Enter Profile Password");
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
					<ul class="ulh">
						<li class="lih"><a class="linkh" href="../../../account">Account</a></li>
						<li class="lih"><a class="linkh" href="../../../fundtransfer">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="../../../profile">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="../../../account/logout.jsp">Logout</a></li>
						<li class="lih" style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="../userid">Change Alternate User ID</a></li>
						<li class="lielv"><a class="linkv" href="../loginpassword">Change Login Password</a></li>
						<li class="lielv"><a class="linkv" href="../transactionpassword">Change Trasaction Password</a></li>
						<li class="lielv"><a class="linkv" href="../email">Change Email</a></li>
						<li class="lielv"><a class="linkv" href="index.jsp">Change Phone Number</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					<form name="myForm" action="process.jsp" method="POST" onsubmit="return validate()">
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th colspan="2" style="text-align:center">Change Phone Number</th>
							</tr>
							<tr>
								<td style="font-weight:bold;">New Phone Number: </td>
								<td>
									<input type="text" size="1" maxlength="3" value="+91" disabled>
									<input type="text" size="20" name="new_phone">
								</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm Phone Number: </td>
								<td>
									<input type="text" size="1" maxlength="3" value="+91" disabled>
									<input type="text" size="20" name="confirm_phone"> 
								</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Profile Password: </td>
								<td><input type="password" size="26" name="profile_password"></td>
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