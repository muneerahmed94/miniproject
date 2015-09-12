<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="../../../include/check-password.jsp" %>

<%!
	String loginName;
%>

<%
	
	try
	{	
		String alternate_userid_set = (String)session.getAttribute(alternate_userid_set);
		if(alternate_userid_set == null)
		{
			response.sendRedirect("../../");
		}
		loginName = (String)session.getAttribute("login_name");
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
		<title>Update Alternate UserID</title>
		<script>
			function validate()
			{
				
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
		</style>
	</head>
	<body style="margin:0px;padding:0px;">
		<table width="100%" height="100%" cellspacing="2">
			<!-- ============ HEADER SECTION ============== -->
			<tr style="height:80px">
				<td width="220px">
					<a href="http://miniproject-jntuhceh.rhcloud.com/"><img src="../../../images/jntu-logo.png" alt="JNTU Logo" height="80px" width="220px"></a>
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
						<li><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/fundtransfer/">Fund Transfer</a></li>
						<li><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/profile">Profile</a></li>
						<li style="float:right;"><a class="linkh" href="http://miniproject-jntuhceh.rhcloud.com/customer_logout.jsp">Logout</a></li>
						<li style="float:right;color:white;vertical-align:center">Welcome:<% out.print(" " + loginName); %></li>
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
					<form name="myForm" action="process.jsp" method="POST" onsubmit="return validate()">
						<table class="content" border="1" style="border-collapse:collapse;" align="center" cellpadding="10px">
							<tr>
								<td colspan="2" style="color:green;text-align:center">Alternate UserID Updated Successfully</td>
							</tr>
							<tr>
								<th colspan="2" style="text-align:center">Update Alternate UserID</th>
							</tr>
							<tr>
								<td style="font-weight:bold;">New UserID: </td>
								<td><input type="text" size="25" name="new_user_id"></td>
							</tr>
							<tr>
								<td style="font-weight:bold;">Confirm New UserID: </td>
								<td><input type="password" size="25" name="confirm_user_id"> </td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Update">
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