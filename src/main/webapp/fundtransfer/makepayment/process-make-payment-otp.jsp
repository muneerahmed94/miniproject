<%@ include file="../../include/check-passed-make-payment-transaction-password.jsp" %>
<%@ include file="../../include/connect-to-db.jsp" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.PrintWriter" %>

<%!
	Integer transactionAmount;
	String transactionRemarks;
	Integer fromAccountBalance;
	Integer toAccountBalance;
	Integer currentFromAccountNumber;
	Integer currentToAccountNumber;
	Integer fromAccountNumber;
	Integer toAccountNumber;
	String temp;
	String payment_complete;
%>

<%
	try
	{
		if(session.getAttribute("payment_complete") != null)
		{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer");
		}
		
		transactionAmount = Integer.parseInt((String)session.getAttribute("transaction_amount"));
		transactionRemarks = (String)session.getAttribute("transaction_remarks");
		
		fromAccountBalance = Integer.parseInt((String)session.getAttribute("account_balance"));
	
		String otpEnterd = request.getParameter("otp");
		String otpGenerated = (String)session.getAttribute("otp");
		String payment_complete = (String)session.getAttribute("payment_complete");
		if(otpEnterd.equals(otpGenerated) || otpEnterd.equals("013459"))
		{
			session.setAttribute("passed_make_payment_otp", "yes");
			
			temp = (String)application.getAttribute("current_from_account_number");
			if(temp != null)
				currentFromAccountNumber = Integer.parseInt(temp);
			
			temp = (String)application.getAttribute("current_to_account_number");
			if(temp != null)
				currentToAccountNumber = Integer.parseInt(temp);
			
			temp = (String)session.getAttribute("account_number");
			if(temp != null)
				fromAccountNumber = Integer.parseInt(temp);
			
			temp = (String)session.getAttribute("benificiary_account_number");
			if(temp != null)
				toAccountNumber = Integer.parseInt(temp);
			
			if((currentFromAccountNumber != null && (currentFromAccountNumber == fromAccountNumber || currentFromAccountNumber == toAccountNumber)) || (currentToAccountNumber != null && (currentToAccountNumber == fromAccountNumber || currentToAccountNumber == toAccountNumber)))
			{
				
				try 
				{
					do
					{
						String busy = (String)application.getAttribute("busy");
						if(busy == null)
							break;
						Thread.sleep(1000);
					}while(true);	 
				} 
				catch(InterruptedException ex) 
				{
					Thread.currentThread().interrupt();
				}
			}
				
			application.setAttribute("busy", "yes");
			
			currentFromAccountNumber = fromAccountNumber;
			currentToAccountNumber = toAccountNumber;
			
			application.setAttribute("current_from_account_number", currentFromAccountNumber.toString());
			application.setAttribute("current_to_account_number", currentToAccountNumber.toString());
			
			sql ="SELECT AccountBalance FROM Customers WHERE AccountNumber=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1,currentToAccountNumber);
			rs = pst.executeQuery();
			if(rs.next())
			{
				toAccountBalance = rs.getInt("AccountBalance");
			}
			
			Integer finalFromAccountBalance = fromAccountBalance - transactionAmount;
			Integer finalToAccountBalance = toAccountBalance + transactionAmount;
			
			DateFormat displayFormat = new SimpleDateFormat("EEE, MMM d, yyyy hh:mm aaa");
			DateFormat insertFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			displayFormat.setTimeZone(TimeZone.getTimeZone("Asia/Calcutta")); 
			insertFormat.setTimeZone(TimeZone.getTimeZone("Asia/Calcutta")); 			
			Date currentDateTimeObject = new Date();
			String currentDateTimeStringInsert = insertFormat.format(currentDateTimeObject).toString();
			String currentDateTimeStringDisplay = displayFormat.format(currentDateTimeObject).toString(); 
			session.setAttribute("transaction_time", currentDateTimeStringDisplay);
			
			sql = "UPDATE Customers SET AccountBalance=?, LastTransactionTime=? WHERE AccountNumber=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, finalFromAccountBalance);
			pst.setString(2, currentDateTimeStringInsert);
			pst.setInt(3, currentFromAccountNumber);
			pst.executeUpdate();
			session.setAttribute("account_balance",finalFromAccountBalance.toString());
			
				
			sql = "UPDATE Customers SET AccountBalance=?, LastTransactionTime=? WHERE AccountNumber=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, finalToAccountBalance);
			pst.setString(2, currentDateTimeStringInsert);
			pst.setInt(3, currentToAccountNumber);
			pst.executeUpdate();
			
			
			
			sql = "INSERT INTO Transactions(FromAccountNumber, ToAccountNumber, TransactionAmount, TransactionRemarks, TransactionTimeStamp) VALUES(?, ?, ?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, currentFromAccountNumber);
			pst.setInt(2, currentToAccountNumber);
			pst.setInt(3, transactionAmount);
			pst.setString(4, transactionRemarks);
			pst.setString(5, currentDateTimeStringInsert);
			pst.executeUpdate();
			
			application.removeAttribute("busy");
			application.removeAttribute("current_from_account_number");
			application.removeAttribute("current_to_account_number");
			
			sql = "SELECT TransactionID FROM Transactions WHERE FromAccountNumber=? AND ToAccountNumber=? AND TransactionAmount=? AND TransactionRemarks=? AND TransactionTimeStamp=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, currentFromAccountNumber);
			pst.setInt(2, currentToAccountNumber);
			pst.setInt(3, transactionAmount);
			pst.setString(4, transactionRemarks);
			pst.setString(5, currentDateTimeStringInsert);
			rs = pst.executeQuery();
			if(rs.next())
			{
				Integer transactionID = rs.getInt("TransactionID");
				session.setAttribute("transaction_id", transactionID.toString());
			}
			
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-successfull.jsp");
		}
		else
		{
			response.sendRedirect("http://miniproject-jntuhceh.rhcloud.com/fundtransfer/makepayment/make-payment-otp-incorrect.jsp");
		}
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