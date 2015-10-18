package action;

import java.io.Serializable;

import java.util.LinkedHashMap;
import com.plivo.helper.api.client.*;
import com.plivo.helper.api.response.message.MessageResponse;
import com.plivo.helper.exception.PlivoException;

public class SendSmsBean implements java.io.Serializable
{
   private String src;
   private String dst;
   private String body;
  
	public SendSmsBean() 
	{
		src = "";
		dst = "";
		body = "";
	}
   
	public void setSrc(String src)
	{
	  this.src = src;
	}
	public void setDst(String dst)
	{
	  this.dst = dst;
	}
	public void setBody(String body)
	{
	  this.body = body;	
	}
   
   public String sendSms()
   {
		String statusSuccess = "";
		String statusFailure = "";
		String statusException = "";
		
		int sent = 0;
		
		String authId = "MANWM5NZI3NGIYYWU1MT";
        String authToken = "MmEzYmVjMDNmMDA4ZDQ3MGU0YjI2YjU0NGI0MWFh";
		
		RestAPI api = new RestAPI(authId, authToken, "v1");

        LinkedHashMap<String, String> parameters = new LinkedHashMap<String, String>();
        parameters.put("src", src);
        parameters.put("dst", dst);
        parameters.put("text", body);
        parameters.put("url", "http://server/message/notification/");

        try 
		{
			MessageResponse msgResponse = api.sendMessage(parameters);
			statusSuccess = statusSuccess.concat(msgResponse.apiId);
			if (msgResponse.serverCode == 202) 
			{
				sent = 1;
				statusSuccess = statusSuccess.concat(" ");
				statusSuccess = statusSuccess.concat(msgResponse.messageUuids.get(0).toString());
			} 
			else 
			{
				statusFailure = statusFailure.concat(msgResponse.error);
			}
        } 
		catch (PlivoException e) 
		{
			statusException = statusException.concat(e.getLocalizedMessage());
			return statusException;
		}
		if(sent == 1)
		{
			return statusSuccess;
		}
		else
		{
			return statusFailure;
		}			
   }
}
