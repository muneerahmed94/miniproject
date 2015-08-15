package action;
import java.io.Serializable;
import java.util.Random;

public class OtpBean implements java.io.Serializable
{
   private String otp;
  
	public OtpBean() 
	{
		otp = "";
		Random randomGenerator = new Random();
		for (int idx = 1; idx <= 6; idx++)
		{
			int randomInt = randomGenerator.nextInt(100)%10;
			String temp = String.valueOf(randomInt);
			otp = otp.concat(temp);
		}
	}
   
   public String getOtp()
   {
      return otp;
   }
}