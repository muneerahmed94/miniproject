<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../include/check-password.jsp" %>

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
		<title>Welcome</title>
		<link rel="icon" type="image/x-icon" href="../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="style.css">
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
						<li><a class="linkh" href="../account">Accounts</a></li>
						<li><a class="linkh" href="index.jsp">Fund Transfer</a></li>
						<li><a class="linkh" href="../profile">Profile</a></li>
						<li style="float:right;"><a class="linkh" href="../account/logout.jsp">Logout</a></li>
						<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td style="background-color:white;vertical-align:top;">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					<table class="content" align="center" cellpadding="4" style="border-collapse:collapse;">
						<tr>
							<td height="80">
								<a style="text-decoration:none;color:white;"href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/addbenificiary">
									<div class="link">
										<span>Add Benificiary</span>
										
									</div>
								</a>
								To Register a Benificiary and then confirm, this is one time registration.
							</td>
						</tr>
						
						<tr>
							<td height="80">
								<a style="text-decoration:none;color:white;"href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/viewbenificiary">
									<div class="link">
										<span>View Benificiary</span>
									</div>
								</a>
								You can view the benificiary or delete the benificiary.
							</td>
						</tr>
						
						<tr>
							<td height="80">
								<a style="text-decoration:none;color:white;"href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment">
									<div class="link">
										<span>Make Payment</span>
									</div>
								</a>
								You can make payment only to a registerd benificiary, select the benificiary and then make payment.
							</td>
						</tr>
						 
						<tr>
							<td height="80">
								<a style="text-decoration:none;color:white;"href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/paymenthistory">
									<div class="link">
										<span>Payment History</span>
									</div>
								</a>
								To view the payment history.
							</td>
						</tr>
					</table>
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