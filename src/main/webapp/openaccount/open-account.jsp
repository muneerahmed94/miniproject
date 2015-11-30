<%@ page import="java.sql.*" %>
<%!
	Integer accountNumber;
%>
<%
	String firstName = request.getParameter("first_name");
	String middleName = request.getParameter("middle_name");
	String lastName = request.getParameter("last_name");
	String fghType = request.getParameter("fghtype");
	String fatherFirstName = request.getParameter("fghfname");
	String fatherMiddleName = request.getParameter("fghmname");
	String fatherlastName = request.getParameter("fghlname");
	String dateOfBirth = request.getParameter("date_of_birth");
	String gender = request.getParameter("gender");
	String marritalStatus = request.getParameter("marrital_status");
	String motherName = request.getParameter("mother_name");
		
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
			}
		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Open Account</title>
		<link rel="icon" type="image/x-icon" href="../images/jntu-logo.ico">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="../"><img src="../images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
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
						<li class="lielv"><a class="linkv" href="index.html">Open an Account</a></li>
						<li class="lielv"><a class="linkv" href="../register">Internet Banking-Register</a></li>
						<li class="lielv"><a class="linkv" href="../login">Internet Banking-Login</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">					
					<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
						<tr>
							<th colspan="2" style="text-align:center;color:green;font-weight:bold;">Account Opened Successfully</th>
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
				</td>
			</tr>	
			<!-- ============ FOOTER SECTION ============== -->
			<tr>
				<td colspan="2" style="height:20px;padding:5px;text-align:center;background-color:#e7e6e6">
					&#169; JNTUHCEH Internet Banking Mini Project
				</td>
			</tr>
		</table>
	</body>
<html>
