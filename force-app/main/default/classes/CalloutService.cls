public with sharing class CalloutService {

    public static String getWeatherByLocation(String location){
        HttpRequest req = new HttpRequest();
        VisualCrossingCredentials__c credential = VisualCrossingCredentials__c.getInstance('Default');
        String unitGroup = credential.UnitGroup__c;
        String apiKey = credential.APIKey__c;
        String contentType = credential.ContentType__c;
        req.setEndPoint(credential.Endpoint__c + location + '?unitGroup='+unitGroup +
                                                            '&key=' + apiKey +
                                                            '&contentType=' + contentType);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
       return res.getBody();
       
       
    }
    
}
