<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%!
		String customer_id = "";
		String accountName = "";
		String loginName = "";
		String accountNumber = "";
		String email = "";
		String mobile = "";
%>

<%
	try
	{	
		customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}

		String otp_correct = (String)session.getAttribute("otp_correct");
		if(otp_correct == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}
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
				function validateForm()
				{
					current_password = myForm.current_password.value;
					if(current_password == null || current_password == "")
					{
						alert("Please enter Current Password");
						return false;
					}
					
					new_password = myForm.new_password.value;
					if(new_password == null || new_password == "")
					{
						alert("Please enter New Password");
						return false;
					}
					
					confirm_password = myForm.confirm_password.value;
					if(confirm_password == null || confirm_password == "")
					{
						alert("Please enter Confirm Password");
						return false;
					}
					
					
					
					if(new_password != confirm_password)
					{
						alert("New Password and Confirm Password doesn't match...");
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
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_login_password.html">Change Login Password</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_trasaction_password.html">Change Trasaction Password</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_email.html">Change Email</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_phone.html">Change Phone Number</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<form name="myForm" action="http://miniproject-jntuhceh.rhcloud.com/customer_process_change_login_password.jsp" method="POST" onsubmit=" return validateForm()">
						<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="text-align:center;background-color:#ccecff;font-weight:bold;">Change Login Password</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Current Password: </td>
								<td><input type="password" name="current_password"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">New Password: </td>
								<td><input type="password" name="new_password"/></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm Password: </td>
								<td><input type="password" name="confirm_password"/></td>
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
					� JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>