<%@ include file="../../include/check-passed-make-payment-otp.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>
<%!
	Integer accountNumber;
	Integer accountBalance;
	String benificiaryName;
	Integer benificiaryAccountNumber;
	Integer transactionAmount;
	String transactionRemarks;
	String transactionTime;
	Integer transactionID;
%>
<%
	try
	{
		if(session.getAttribute("payment_complete") != null)
		{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer");
		}
		else
		{
			session.setAttribute("payment_complete", "yes");
		}
		
		accountNumber = Integer.parseInt((String)session.getAttribute("account_number"));
		accountBalance = Integer.parseInt((String)session.getAttribute("account_balance"));
		benificiaryName = (String)session.getAttribute("benificiary_name");
		benificiaryAccountNumber = Integer.parseInt((String)session.getAttribute("benificiary_account_number"));
		transactionAmount = Integer.parseInt((String)session.getAttribute("transaction_amount"));
		transactionRemarks = (String)session.getAttribute("transaction_remarks");
		transactionTime = (String)session.getAttribute("transaction_time");
		transactionID = Integer.parseInt((String)session.getAttribute("transaction_id"));
		
		request.getSession().removeAttribute("benificiary_name");
		request.getSession().removeAttribute("benificiary_account_number");
		request.getSession().removeAttribute("transaction_amount");
		request.getSession().removeAttribute("transaction_remarks");
		request.getSession().removeAttribute("transaction_time");
		request.getSession().removeAttribute("transaction_id");
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Make Payment - Fund Transfer Successfull</title>
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
				text-align:left;
			}
			.content 
			{
				
				border-top:5px solid #0072c6;
				border-bottom:5px solid #0072c6;
				border-right:1px solid #0072c6;
				border-left:1px solid #0072c6;
			}
			th
			{
				background-color:#a9d0f5;
			}
			.bold
			{
				font-weight:bold;
				text-align:left;
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
						<li><a class="linkh" href="../../account">Accounts</a></li>
						<li><a class="linkh" href="../">Fund Transfer</a></li>
						<li><a class="linkh" href="../../profile">Profile</a></li>
						<li style="float:right;"><a class="linkh" href="../../account/logout.jsp">Logout</a></li>
						<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + (String)session.getAttribute("login_name")); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td valign="top">
					<form name="myForm" action="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/process-make-payment-transaction-password.jsp" onsubmit="return validate()" method="POST">
						<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th style="text-align:center" colspan="2">Fund Transfer Reciept</th>
							</tr>
							<tr>
								<tr>
									<td class="bold">
										Transaction ID: 
									</td>
									<td>
										<%= transactionID %>
									</td>
								</tr>
								<tr>
									<td class="bold">
										Payment Status: 
									</td>
									<td style="color:green">
										Successfull
									</td>
								</tr>
								<tr>
									<td class="bold">
										Transaction Time: 
									</td>
									<td>
										<%= transactionTime %>
									</td>
								</tr>
								<td class="bold">
									From Account:
								</td>
								<td>
									<%= accountNumber %>
								</td>
							</tr>
							<tr>
								<td class="bold">
									Benificiary Name: 
								</td>
								<td>
									<%= benificiaryName %>
								</td>
							</tr>
							<tr>
								<td class="bold">
									Benificiary Account Number: 
								</td>
								<td>
									<%= benificiaryAccountNumber %>
								</td>
							</tr>
							<tr>
								<td class="bold">
									Transaction Amount:
								</td>
								<td>
									<%= transactionAmount %>
								</td>
							</tr>
							<tr>
								<td class="bold">
									Transaction Remarks:
								</td>
								<td>
									<%= transactionRemarks %>
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