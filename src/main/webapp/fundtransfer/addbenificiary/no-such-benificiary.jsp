<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../include/check-password.jsp" %>

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
		<title>Add Benificiary</title>
		<link rel="icon" type="image/x-icon" href="images/jntu-logo.ico">
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
					<ul class="ulh">
						<li class="lih"><a class="linkh" href="../../account">Accounts</a></li>
						<li class="lih"><a class="linkh" href="../">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="../../profile">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="../../account/logout.jsp">Logout</a></li>
						<li class="lih" style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
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
								<th colspan="2" style="text-align:center;background-color:#a9d0f5;font-weight:bold;">Add Benificiary</th>
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
								<td colspan="2" style="text-align:center;color:red">Benificiary Account Number you entered does not exist</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Add">
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
					&#169; JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>