package DAODTO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class APIExamMemberProfile {

	public String APIExamMemberProfile(String input){
			System.out.println("api도착");
			System.out.println(input);
			
			String first[] = input.split(",");
			String second[] = first[0].split(":");	
		
	        String header = "Bearer " + second[1] ; // Bearer 다음에 공백 추가
	        try {
	            String apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            JSONParser jp = new JSONParser();
	            JSONObject jo = (JSONObject)jp.parse(response.toString());
	            System.out.println("res"+response.toString());
	            
	            
	            br.close();
	            System.out.println(((String)(((JSONObject)(jo.get("response"))).get("email"))).split("@")[0]);
	            return ((String)(((JSONObject)(jo.get("response"))).get("email"))).split("@")[0];
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		
		
		return null;
	}
	
}
