package action;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Muneer
 */
public class SendOtpBean 
{

    private String otp;
	private String email;
	private String subject;
	private int status;
	
	public SendOtpBean() 
	{
		otp = "";
		email = "";
		subject = "";
		status = 0;
	}
   
   public void setOtp(String otp)
   {
      this.otp = otp;
   }
   public void setEmail(String email)
   {
      this.email = email;
   }
   public void setSubject(String subject)
   {
		this.subject = subject;
   }
   public void sendOtp()
   {
		String to = this.email;//change accordingly

      // Sender's email ID needs to be mentioned
      String from = "onlinebankingminiprojectjntuh@gmail.com";//change accordingly
      final String username = "onlinebankingminiprojectjntuh";//change accordingly
      final String password = "1a2b3c4d5e!@";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
      new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
         }
      });

      try {
         // Create a default MimeMessage object.
         Message message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.setRecipients(Message.RecipientType.TO,
         InternetAddress.parse(to));

         // Set Subject: header field
         message.setSubject(this.subject);

         // Now set the actual message
         message.setText("Your " + this.subject + " is: " + this.otp);

         // Send message
         Transport.send(message);

         this.status = 1;

      } catch (MessagingException e) {
            throw new RuntimeException(e);
      }
	  catch(Exception e)
	  {
		
	  }
   }
}