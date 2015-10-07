<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%@ page import="java.util.Random" %>
<%@ include file="../../include/check-password.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>

<%!
	Integer accountNumber;
	Integer accountBalance;
	String loginName;
	String accountName;
	
	String transactionTimeStamp;
	String dateTimeString;
	String remarks;
	Integer transactionAmount;
	Integer debit;
	Integer credit;
	
	String benificiaryName;
	Integer benificiaryAccountNumber;
%>

<%
	try
	{	
		accountNumber = Integer.parseInt((String)session.getAttribute("account_number"));
		accountBalance = Integer.parseInt((String)session.getAttribute("account_balance"));
		loginName = (String)session.getAttribute("login_name");
		accountName = (String)session.getAttribute("account_name");
		
		benificiaryAccountNumber = Integer.parseInt(request.getParameter("benificiary_account_number"));
		sql = "SELECT * FROM Benificiaries WHERE Benificiary=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1,benificiaryAccountNumber);
		rs = pst.executeQuery();
		if(rs.next())
		{
			benificiaryName = rs.getString("BenificiaryName");
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
		<title>Payment History</title>
		<link rel="icon" type="image/x-icon" href="../../images/jntu-logo.ico">
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
						<li class="lih"><a class="linkh" href="../../account">Account</a></li>
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
				<td style="background-color:white;vertical-align:top;">
					<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
					
					<table align="center" border="0">
						<tr>
							<td style="text-align:center"><b>Benificiary Name:</b></td>
							<td><%= benificiaryName %></td>
						</tr>
						<tr>
							<td style="text-align:center"><b>Benificiary Account Number:</b></td>
							<td><%= benificiaryAccountNumber %></td>
						</tr>
					</table>
					
					<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
						<tr>
							<th style="text-align:center">#</th>
							<th style="text-align:center">Date</th>
							<th style="text-align:center">Transaction Remarks</th>
							<th style="text-align:center">Transaction Amount</th>
						</tr>
						<%
							try
							{
								sql = "SELECT * FROM Transactions WHERE FromAccountNumber = ? AND ToAccountNumber = ? ORDER BY TransactionTimeStamp DESC";

								pst = conn.prepareStatement(sql);
								pst.setInt(1,accountNumber);
								pst.setInt(2,benificiaryAccountNumber);
								
								rs = pst.executeQuery();
								int count = 0;
								while(rs.next())
								{
									count++;
									transactionTimeStamp = rs.getString("TransactionTimeStamp");
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									Date dateTimeObject = formatter.parse(transactionTimeStamp);
									DateFormat displayFormat = new SimpleDateFormat("EEE, MMM d, yyyy hh:mm aaa");
									dateTimeString = displayFormat.format(dateTimeObject).toString();
											
									remarks = rs.getString("TransactionRemarks");
									transactionAmount = rs.getInt("TransactionAmount");
									
									
							%>
									<tr>
										<td style="text-align:center;font-weight:bold;"><%= count %></td>
										<td style="text-align:center"><%= dateTimeString %></td>
										<td style="text-align:center"><%= remarks %></td>
										<td style="text-align:center"><%= transactionAmount %></td>
									</tr>
							<%
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