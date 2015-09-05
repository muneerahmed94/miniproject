<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%!
		String loginName = "";
		String accountName = "";
		String loginPassword = "";
		String transactionPassword = "";
		String email = "";
		String mobile = "";
		
		Integer accountNumber = 0;
		Integer accountBalance = 0;
		
%>

<%
	try
	{	
		String customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}

		String otp_correct = (String)session.getAttribute("otp_correct");
		if(otp_correct == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}
		
		accountNumber = Integer.parseInt((String)session.getAttribute("account_number"));
		accountBalance = Integer.parseInt((String)session.getAttribute("account_balance"));
		loginName = (String)session.getAttribute("login_name");
		accountName = (String)session.getAttribute("account_name");
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
		<title>Welcome</title>
		<style>
			ul 
			{
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
			}

			li 
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
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="http://miniproject-jntuhceh.rhcloud.com/images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
				</td>
				<td style="background-color:#cb0076;color:white;text-align:center;font-size:45px">
					JNTU Bank Internet Banking
				</td>
			</tr>
			<!-- ============ NAVIGATION BAR SECTION ============== -->
			<tr height="28px">
				<td	colspan=2 bgcolor="#0072c6">		
					<ul>
						<li><a class="linkh" href="#Accounts">Accounts</a></li>
						<li><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/">Fund Transfer</a></li>
						<li><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_edit_profile.jsp">Profile</a></li>
						<li style="float:right;"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_logout.jsp">Logout</a></li>
						<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td valign="top">
					<form action="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/addbenificiary/add-benificiary.jsp" method="POST">
						<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="text-align:center;background-color:#ccecff;font-weight:bold;">Register Benificiary</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Benificiary Account Number: </td>
								<td><input type="text" size="25" name="benificiary_account_number"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm Account Number: </td>
								<td><input type="text" size="25" name="confirm_account_number"> </td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Benificiary Name: </td>
								<td><input type="text" size="25" name="benificiary_name"> </td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Login">
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
				<td colspan="2" style="height:20px;padding:5px;text-align:center;background-color:#e7e6e6">
					JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>