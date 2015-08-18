<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%
	String customer_id = (String)session.getAttribute("customer_id");
	if(customer_id == null)
	{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
	}
	
	String otp_correct = (String)session.getAttribute("otp_correct");
	if(otp_correct == null)
	{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login_otp.jsp");
	}
	
	String name = "";
	String accountName = "";
	int accountNumber = 0;
	int accountBalance = 0;
	
	try
	{	
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from Users where UserID=?"; 
		String MYSQL_USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
		String MYSQL_PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
		String MYSQL_DATABASE_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String MYSQL_DATABASE_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String MYSQL_DATABASE_NAME = "miniproject";

		String url = "jdbc:mysql://" + MYSQL_DATABASE_HOST + ":" + MYSQL_DATABASE_PORT + "/" + MYSQL_DATABASE_NAME;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
		
		pst = conn.prepareStatement(sql);
		pst.setString(1, customer_id);
		
		rs = pst.executeQuery();
		if(rs.next())
		{
			accountNumber = rs.getInt("AccountNumber");
			name = name.concat(rs.getString("FirstName"));
			name = name.concat(" ");
			name = name.concat(rs.getString("MiddleName"));
			name = name.concat(" ");
			name = name.concat(rs.getString("LastName"));
		}
		
		sql = "select * from Customers where AccountNumber=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, accountNumber);
		rs = pst.executeQuery();
		
		if(rs.next())
		{
			accountName = accountName.concat(rs.getString("FirstName"));
			accountName = accountName.concat(" ");
			accountName = accountName.concat(rs.getString("MiddleName"));
			accountName = accountName.concat(" ");
			accountName = accountName.concat(rs.getString("LastName"));
			
			accountBalance = rs.getInt("AccountBalance");
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
					<ul>
						<li><a class="linkh" href="#Accounts">Accounts</a></li>
						<li><a class="linkh" href="#Fund Transfer">Fund Transfer</a></li>
						<li><a class="linkh" href="#Profile">Profile</a></li>
						<li style="float:right;"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/logout.jsp">Logout</a></li>
						<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + name); %></li>
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
					<table border="1" align="center" cellpadding="4" style="border-collapse:collapse;">
						<tr>
							<td style="text-align:center;font-weight:bold;font-size:20px;background-color:#ccecff">Account Number</td>
							<td style="text-align:center;font-weight:bold;font-size:20px;background-color:#ccecff">Customer Name</td>
							<td style="text-align:center;font-weight:bold;font-size:20px;background-color:#ccecff">Account Balance</td>
						</tr>
						<tr>
								<td style="text-align:center;"><% out.print(accountNumber); %></td>
								<td style="text-align:center;"><% out.print(accountName); %></td>
								<td style="text-align:center;"><% out.print(accountBalance + " INR"); %></td>
						</tr>
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
	</body>
<html>