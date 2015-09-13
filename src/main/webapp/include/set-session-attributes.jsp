<%@ page import="java.util.Random" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%@ include file="check-password.jsp" %>
<%@ include file="connect-to-db.jsp" %>

<%!
		String alternate_id = "";
		String loginName = "";
		String accountName = "";
		String loginPassword = "";
		String transactionPassword = "";
		String email = "";
		String mobile = "";
		
		Integer accountNumber = 0;
		Integer accountBalance = 0;
		
%>

<%
	try
	{
		String customer_id = (String)session.getAttribute("customer_id");
		
		sql = "SELECT * FROM Users WHERE UserID=?"; 
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
			transactionPassword = rs.getString("TransactionPassword");
			
			mobile = rs.getString("Mobile");
			email = rs.getString("Email");
			alternate_id = rs.getString("AlternateUserID");
		}
		
		sql = "SELECT * FROM Customers WHERE AccountNumber=?";
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
		
		session.setAttribute("alternate_id", alternate_id);
		session.setAttribute("account_number", accountNumber.toString());
		session.setAttribute("login_name", loginName);
		session.setAttribute("account_name", accountName);
		session.setAttribute("account_balance", accountBalance.toString());
		session.setAttribute("login_password", loginPassword);
		session.setAttribute("transaction_password", transactionPassword);
		session.setAttribute("email", email);
		session.setAttribute("mobile", mobile);
	}
	catch(Exception e)
	{
		ByteArrayOutputStream ostr = new ByteArrayOutputStream();
		e.printStackTrace( new PrintWriter(ostr,true) );
		String foo = ostr.toString();
		out.println(foo);
		out.print("<br/><br/>");
		out.print(e);
	}
%>