<%@ include file="../../include/check-password.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>
<%!
	String benificiaryName;
	Integer benificiaryAccountNumber;
%>
<%
	try
	{
		if(session.getAttribute("payment_complete") != null)
		{
			request.getSession().removeAttribute("payment_complete");
		}
		
		benificiaryAccountNumber = Integer.parseInt(request.getParameter("benificiary_account_number"));
		sql = "SELECT * FROM Benificiaries WHERE Benificiary=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1,benificiaryAccountNumber);
		rs = pst.executeQuery();
		if(rs.next())
		{
			benificiaryName = rs.getString("BenificiaryName");
		}
		session.setAttribute("benificiary_name", benificiaryName);
		session.setAttribute("benificiary_account_number", benificiaryAccountNumber.toString());
		session.setAttribute("passed_make_payment", "yes");
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Make Payment</title>
		<script>
			function validate()
			{
				var transaction_amount = myForm.transaction_amount.value;
				if(transaction_amount == "" || transaction_amount.search(/\b[0-9]+$\b/) != 0 || transaction_amount == 0)
				{
					alert("Enter a valid Transaction Amount");
					return false;
				}
				var transaction_remarks = myForm.transaction_remarks.value;
				var account_balance = myForm.account_balance.value;
				if(parseInt(transaction_amount) > parseInt(account_balance))
				{
					alert("Transaction Amount cannot exceed Available Balance");
					return false;
				}
				if(transaction_remarks == "")
				{
					alert("Enter valid Transaction Remarks");
					return false;
				}
				return true;
			}
		</script>
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
					<form name="myForm" action="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-transaction-password.jsp" onsubmit="return validate()" method="POST">
						<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th style="text-align:center" colspan="2">Fund Transfer</th>
							</tr>
							<tr>
								<td class="bold">
									From Account:
								</td>
								<td>
									<%= (String)session.getAttribute("account_number") %>
								</td>
							</tr>
							<tr>
								<td class="bold">
									Available Balance: 
								</td>
								<td>
									<%= (String)session.getAttribute("account_balance") %>
									<input type="hidden" id="account_balance" name="account_balance" value=<%= (String)session.getAttribute("account_balance") %> >
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
									Trasaction Amount:<font color="red">*</font> 
								</td>
								<td>
									<input type="text" name="transaction_amount">
								</td>
							</tr>
							<tr>
								<td class="bold">
									Transaction Remarks:<font color="red">*</font>
								</td>
								<td>
									<input type="text" name="transaction_remarks">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="text-align:center">
									<input type="submit" value="Transfer">
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