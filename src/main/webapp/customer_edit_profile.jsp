<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%!
		String loginName = "";
		String accountName = "";
		String loginPassword = "";
		String trasactionPassword = "";
		String email = "";
		String mobile = "";
		
		Integer accountNumber = 0;
		Integer accountBalance = 0;
%>

<%
	try
	{	
		customer_id = (String)session.getAttribute("customer_id");
		if(customer_id == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}

		String otp_correct = (String)session.getAttribute("otp_correct");
		if(otp_correct == null)
		{
				response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/customer_login.html");
		}
		
		String first_time = (String)session.getAttribute("first_time");
		if(first_time == null)
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
				
				loginName = "";
				loginName = loginName.concat(rs.getString("FirstName"));
				loginName = loginName.concat(" ");
				loginName = loginName.concat(rs.getString("MiddleName"));
				loginName = loginName.concat(" ");
				loginName = loginName.concat(rs.getString("LastName"));
				
				loginPassword = rs.getString("LoginPassword");
				trasactionPassword = rs.getString("TransactionPassword");
				
				mobile = rs.getString("Mobile");
				email = rs.getString("Email");
			}
			
			sql = "select * from Customers where AccountNumber=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, accountNumber);
			rs = pst.executeQuery();
			
			if(rs.next())
			{
				accountName = "";
				accountName = accountName.concat(rs.getString("FirstName"));
				accountName = accountName.concat(" ");
				accountName = accountName.concat(rs.getString("MiddleName"));
				accountName = accountName.concat(" ");
				accountName = accountName.concat(rs.getString("LastName"));
				
				accountBalance = rs.getInt("AccountBalance");
			}
			
			session.setAttribute("account_number", accountNumber.toString());
			session.setAttribute("login_name", loginName);
			session.setAttribute("account_name", accountName);
			session.setAttribute("account_balance", accountBalance.toString());
			session.setAttribute("login_password", loginPassword);
			session.setAttribute("trasaction_password", trasactionPassword);
			session.setAttribute("email", email);
			session.setAttribute("mobile", mobile);
			
			session.setAttribute("first_time", "no");
		}
		else
		{
			accountNumber = Integer.parseInt((String)session.getAttribute("account_number"));
			accountBalance = Integer.parseInt((String)session.getAttribute("account_balance"));
			loginName = (String)session.getAttribute("account_number");
			accountName = (String)session.getAttribute("account_name");
			loginPassword = (String)session.getAttribute("login_password");
			trasactionPassword = (String)session.getAttribute("trasaction_password");
			email = (String)session.getAttribute("email");
			mobile = (String)session.getAttribute("mobile");
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
		<title>Home</title>
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
			
			
			ul.ulh
			{
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
			}

			li.lih 
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
					<ul class="ulh">
						<li class="lih"><a class="linkh" href="#Accounts">Accounts</a></li>
						<li class="lih"><a class="linkh" href="#Fund Transfer">Fund Transfer</a></li>
						<li class="lih"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_edit_profile.jsp">Profile</a></li>
						<li class="lih" style="float:right;"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_logout.jsp">Logout</a></li>
						<li class="lih" style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
					</ul>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					<ul class="unliv">
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_login_password.html">Change Login Password</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_trasaction_password.html">Change Trasaction Password</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_email.html">Change Email</a></li>
						<li class="lielv"><a class="linkv" href="http://miniproject-jntuhceh.rhcloud.com/customer_change_phone.html">Change Phone Number</a></li>
					</ul>
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td bgcolor="white" valign="top">
					<table border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="text-align:center;background-color:#ccecff;font-weight:bold;">Your Details</td>
							</tr>
							<tr>
								<td style="font-weight:bold;">UserID: </td>
								<td><% out.print(customer_id); %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Account Number: </td>
								<td><% out.print(accountNumber); %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Account Holder's Name: </td>
								<td><% out.print(accountName); %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Email: </td>
								<td><% out.print(email); %></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Phone: </td>
								<td><% out.print(mobile); %></td>
							</tr>
						</table>
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