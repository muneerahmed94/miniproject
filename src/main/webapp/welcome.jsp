<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

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
					<%
						String userId = (String)session.getAttribute("email");
						String otp_correct = (String)session.getAttribute("otp_correct");
						String name = "";
						int valid_user = 1; 
						
						try
						{	
							if(userId == null || otp_correct == null)
							{
								response.sendRedirect("google.com");
								valid_user = 0;
							}
							else
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
								pst.setString(1, userId);
								
								rs = pst.executeQuery();
								if(rs.next())
								{
									name = name.concat(rs.getString("FirstName"));
									name = name.concat(rs.getString("MiddleName"));
									name = name.concat(rs.getString("LastName"));
								}
									
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
						if(valid_user == 1)
						{
							response.sendRedirect("www.google.com");
					%>
							
							<ul>
								<li><a class="linkh" href="#Accounts">Accounts</a></li>
								<li><a class="linkh" href="#Fund Transfer">Fund Transfer</a></li>
								<li><a class="linkh" href="#Profile">Profile</a></li>
								
								<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print("name"); %></li>
							</ul>
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<!-- ============ LEFT COLUMN (MENU) ============== -->
				<td width="220pxpx" valign="top" bgcolor="#f3f3f3">
					
				</td>
				<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
				<td style="background-color:white;vertical-align:top;">
					
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