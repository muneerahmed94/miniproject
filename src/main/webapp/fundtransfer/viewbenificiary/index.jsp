<%@ include file="../../include/check-password.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>
<%!
	String benificiaryName;
	Integer benificiary;
	int i;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>View Benificiary</title>
		<link rel="icon" type="image/x-icon" href="images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../../css/main.css">
		<script>
			
		</script>
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
					<ul>
						<li><a class="linkh" href="../../account">Account</a></li>
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
					<form name="myForm" action="delete-benificiary.jsp" method="POST" onsubmit="return validateDelete()">
						<marquee  onmouseover="this.stop()" onmouseout="this.start()"><font color="blue">Welcome to JNTU Bank Internet Banking</font></marquee>
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<th>Select</th>
								<th>Benificiary Name</th>
								<th>Benificiary Account Number</th>
							</tr>
							<%
								try
								{
									Integer benificiaryOf = Integer.parseInt((String)session.getAttribute("account_number"));
									sql = "SELECT * FROM Benificiaries WHERE BenificiaryOf=?";
									pst = conn.prepareStatement(sql);
									pst.setInt(1, benificiaryOf);
									rs = pst.executeQuery();
									i = 0;
									while(rs.next())
									{
										benificiaryName = rs.getString("BenificiaryName");
										benificiary = rs.getInt("Benificiary");
							%>
										<tr>
											<td>
							<%
												i++;
												if(i == 1)
												{
							%>
													<input type="radio" name="benificiary_account_number" value=<%= benificiary.toString() %> checked>
							<%
												}
												else
												{
							%>
													<input type="radio" name="benificiary_account_number" value=<%= benificiary.toString() %>>
							<%
												}
							%>
											</td>
											<td>
												<%= benificiaryName %>
											</td>
											<td>
												<%= benificiary %>
											</td>
										</tr>
							<%
									}
								}
								catch(Exception e)
								{
									out.print(e);
								}
							%>
										<tr>
							<%
										if(i != 0)
										{
							%>
											<td colspan="3"><input type="submit" value="Delete"></td>
							<%
										}
							%>
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