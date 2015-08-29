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
   
   public void sendSms()
   {
		String authId = "MAZDEXN2VHYTBMMJVJNW";
        String authToken = "OWQyMmI3ZWI2ZDYwYjRiZWI3NDc2NTQ4YTdlY2Q5";
		
		RestAPI api = new RestAPI(authId, authToken, "v1");

        LinkedHashMap<String, String> parameters = new LinkedHashMap<String, String>();
        parameters.put("src", this.src);
        parameters.put("dst", this.dst);
        parameters.put("text", this.body);
        parameters.put("url", "http://server/message/notification/");

        try {
                MessageResponse msgResponse = api.sendMessage(parameters);
                System.out.println(msgResponse.apiId);
                if (msgResponse.serverCode == 202) {
                        System.out.println(msgResponse.messageUuids.get(0).toString());
                } else {
                        System.out.println(msgResponse.error); 
                }
        } catch (PlivoException e) {
                System.out.println(e.getLocalizedMessage());
        }
   }
}