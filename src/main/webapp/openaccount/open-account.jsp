<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Account Opening</title>
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
		</style>
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
				
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/open_account.html">Open an Account</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_registration.html">Internet Banking-Register</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_login.html">Internet Banking-Login</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/employee_login.html">Employee Login</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/admin_login.html">Administrator Login</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<%@ page import="java.sql.*" %>
					<%
						String firstName = request.getParameter("first_name");
						String middleName = request.getParameter("middle_name");
						String lastName = request.getParameter("last_name");
						String fghType = request.getParameter("fghtype");
						String fatherFirstName = request.getParameter("father_first_name");
						String fatherMiddleName = request.getParameter("father_middle_name");
						String fatherlastName = request.getParameter("father_last_name");
						String dateOfBirth = request.getParameter("date_of_birth");
						String gender = request.getParameter("gender");
						String marritalStatus = request.getParameter("marrital_status");
						String motherName = request.getParameter("mother_name");
						
						Integer accountNumber = 0;
						
						try
						{
							Connection conn = null;
							Statement st = null;
							PreparedStatement pst = null;
							ResultSet rs = null;
							
							String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
							String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
							String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
							String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
							String MYSQL_DATABASE_NAME = "miniproject";

							String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
							
							String sql = "INSERT INTO Customers(FirstName, MiddleName, LastName, GuardianType, GuardianFirstName, GuardianMiddleName, GuardianLastName, Gender, MarritalStatus, MotherName) VALUES('"+firstName+"', '"+middleName+"', '"+lastName+"', '"+fghType+"', '"+fatherFirstName+"', '"+fatherMiddleName+"', '"+fatherlastName+"', '"+gender+"', '"+marritalStatus+"', '"+motherName+"')";
							
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
							st = conn.createStatement();
							int x = st.executeUpdate(sql);
							if(x == 1)
							{
								sql = "SELECT * FROM Customers WHERE FirstName=? AND GuardianFirstName=? AND MotherName=?";
								pst = conn.prepareStatement(sql);
								pst.setString(1, firstName);
								pst.setString(2, fatherFirstName);
								pst.setString(3, motherName);
								rs = pst.executeQuery();
								if(rs.next())
								{
									accountNumber = rs.getInt("AccountNumber");
									out.print(accountNumber);
									
						%>
									<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
										<tr>
											<td colspan="2" style="text-align:center;background-color:#ccecff;color:green;font-weight:bold;">Account Opened Successfully</td>
										</tr>
										<tr>
											<td style="font-weight:bold;text-align:center">Account Number: </td>
											<td style="text-align:center"><% out.print(accountNumber); %></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center">
												You can now register for Internet Banking Using this Account Number
											</td>
										</tr>
									</table>
								
						<%
								}
							}
							else
							{
						%>
								<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
									<tr>
										<td colspan="2" style="background-color:#ccecff;color:red;font-weight:bold;">Opening Account Failed!</td>
									</tr>
								</table>
						<%
							}
						}
						catch(Exception e)
						{
						%>
							<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
									<tr>
										<td colspan="2" style="text-align:center;background-color:#ccecff;color:red;font-weight:bold;">Opening Account Failed!</td>
									</tr>
									<td>
						<%
										e.printStackTrace();
										out.print(e);
						%>
									</td>
							</table>
						<%
							
						}
					%>
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
