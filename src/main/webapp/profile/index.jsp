<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../include/check-password.jsp" %>

<%!
	String customer_id;
	String alternate_id;
	Integer accountNumber;
	String accountName;
	String loginName;
	String email;
	String mobile;

%>

<%
	try
	{	
		customer_id = (String)session.getAttribute("customer_id");
		alternate_id = (String)session.getAttribute("alternate_id");
		accountNumber = Integer.parseInt((String)session.getAttribute("account_number"));
		accountName = (String)session.getAttribute("account_name");
		loginName = (String)session.getAttribute("login_name");
		email = (String)session.getAttribute("email");
		mobile = (String)session.getAttribute("mobile");
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
		<title>Edit Profile</title>
		<link rel="icon" type="image/x-icon" href="../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="../images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
				</td>
				<td style="background-color:#cb0076;color:white;text-align:center;font-size:45px">
					JNTU Bank Internet Banking
				</td>
			</tr>
			<!-- ============ NAVIGATION BAR SECTION ============== -->
			<tr height="28px">
				<td	colspan=2 bgcolor="#0072c6">		
					<ul class="ulh">
						<li class="lih"><a class="linkh" href="../account">Account</a></li>
						<li class="lih"><a class="linkh" href="../fundtransfer">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="index.jsp">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="../account/logout.jsp">Logout</a></li>
						<li class="lih" style="float:right;color:white;vertical-align:center">Welcome: <%= loginName %></li> 
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="change/userid">Change Alternate UserID</a></li>
						<li class="lielv"><a class="linkv" href="change/loginpassword">Change Login Password</a></li>
						<li class="lielv"><a class="linkv" href="change/transactionpassword">Change Trasaction Password</a></li>
						<li class="lielv"><a class="linkv" href="change/email">Change Email</a></li>
						<li class="lielv"><a class="linkv" href="change/mobile">Change Phone Number</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th colspan="2">Your Details</th>
							</tr>
							<tr>
								<td style="font-weight:bold;">UserID: </td>
								<td><%= customer_id %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Alternate UserID: </td>
								<td><%= alternate_id %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Account Number: </td>
								<td><%= accountNumber %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Account Holder's Name: </td>
								<td><%= accountName %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Email: </td>
								<td><%= email %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Phone: </td>
								<td><%= mobile %></td>
							</tr>
						</table>
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