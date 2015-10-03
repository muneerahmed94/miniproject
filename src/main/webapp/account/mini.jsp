<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../include/check-password.jsp" %>
<%@ include file="../include/connect-to-db.jsp" %>


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
		<title>Mini Statement</title>
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
						<li class="lih"><a class="linkh" href="index.jsp">Account</a></li>
						<li class="lih"><a class="linkh" href="../fundtransfer/">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="../profile">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="logout.jsp">Logout</a></li>
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
					<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
						<tr>
							<th style="text-align:center">Date</th>
							<th style="text-align:center">Transaction Remarks</th>
							<th style="text-align:center">Debit</th>
							<th style="text-align:center">Credit</th>
						</tr>
						<%
							sql = "SELECT * FROM Transactions WHERE FromAccountNumber = ? OR ToAccountNumber = ?";

							pst = conn.prepareStatement(sql);
							pst.setInt(1,accountNumber);
							pst.setInt(2,accountNumber);
							
							rs = pst.executeQuery();
							while(rs.next)
							{
								String dateTime = rs.getString("TransactionTimeStamp");
								String remarks = rs.getString("TransactionRemarks");
								Integer toAccountNumber = rs.getInt("ToAccountNumber");
								Integer credit;
								Integer debit;
								if(toAccountNumber == accountNumber)
								{
									credit = rs.getInt("TransactionAmount");
									debit = 0;
								}
								else
								{
									debit = rs.getInt("TransactionAmount");
									credit = 0;
								}
						%>
								<tr>
									<td style="text-align:center"><%= dateTime %></td>
									<td style="text-align:center"><%= remarks %></td>
						<%
								if(debit == 0)
								{
						%>
									<td style="text-align:center"><%= credit %></td>
									<td style="text-align:center"></td>
								</tr>
						<%			
								}
								else
								{
						%>
									<td style="text-align:center"></td>
									<td style="text-align:center"><%= debit %></td>
								</tr>
						<%
								}
						%>
								</tr>
						
						<%
							}
						%>
					</table>
				</td>
			</tr>	
			<!-- ============ FOOTER SECTION ============== -->
			<tr>
				<td colspan="2" style="height:20px;padding:5px;text-align:center;background-color:#e7e6e6">
					JNTUHCEH Internet Banking Mini Project
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