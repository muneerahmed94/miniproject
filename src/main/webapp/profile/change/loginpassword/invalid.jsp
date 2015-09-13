<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../../check-password.jsp"%>

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
		<title>Change Login Password</title>
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
			
			
			ul.ulh
			{
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
			}

			li.lih 
			{
				float: left;
			}
			a.linkh:link, a.linkh:visited 
			{
				display: block;
				width: 160px;
				font-weight: bold;
				color: white;
				padding: 4px;
				background-color: #0072c6;
				text-align: center;

				text-decoration: none;
				text-transform: uppercase;
			}
			a.linkh:hover, a.linkh:active 
			{
				background-color: #005798;
			}
			td, tr
			{
				border-color:#E0E0E0;
			}
		</style>
		<script>
				function validate()
				{
					current_password = myForm.current_password.value;
					if(current_password == null || current_password == "")
					{
						alert("Enter Current Password");
						return false;
					}
					
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
					
					if(new_password == current_password)
					{
						alert("New Password and Confirm Password should be different");
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
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="jntu-logo2.png" alt="JNTU Logo" height="80px" width="220px"></a>
				</td>
				<td style="background-color:#cb0076;color:white;text-align:center;font-size:45px">
					JNTU Bank Internet Banking
				</td>
			</tr>
			<!-- ============ NAVIGATION BAR SECTION ============== -->
			<tr height="28px">
				<td	colspan=2 bgcolor="#0072c6">		
					<ul class="ulh">
						<li class="lih"><a class="linkh" href="#Accounts">Accounts</a></li>
						<li class="lih"><a class="linkh" href="#Fund Transfer">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_edit_profile.jsp">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_logout.jsp">Logout</a></li>
						<li class="lih" style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="../userid">Change Alternate User ID</a></li>
						<li class="lielv"><a class="linkv" href="index.jsp">Change Login Password</a></li>
						<li class="lielv"><a class="linkv" href="../transactionpassword">Change Trasaction Password</a></li>
						<li class="lielv"><a class="linkv" href="../email">Change Email</a></li>
						<li class="lielv"><a class="linkv" href="../mobile">Change Phone Number</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					<form name="myForm" action="process.jsp" method="POST" onsubmit="return validate()">
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th colspan="2" style="text-align:center">Change Login Password</th>
							</tr>
							<tr>
								<td colspan="2" style="color: red; text-align:center">Current Password you entered is incorrect</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Current Login Password: </td>
								<td><input type="text" size="25" name="current_password"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">New Login Password: </td>
								<td><input type="text" size="25" name="new_password"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm Login Password: </td>
								<td><input type="text" size="25" name="confirm_password"> </td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Update">
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
					� JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>