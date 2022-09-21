public with sharing class VisualCrossingController {
    @AuraEnabled
    public static WeatherWrapper getWeatherByLocation(String location){

       String resBody = CalloutService.getWeatherByLocation(location) ;
       WeatherWrapper wrapper =  (WeatherWrapper)JSON.deserialize(resBody ,WeatherWrapper.class);  
       return wrapper;
       
    }

    public  class WeatherWrapper{
        @AuraEnabled public String resolvedAddress  {get;set;}
        @AuraEnabled public CurrentConditionWrapper currentConditions {get;set;}
    }
    public class CurrentConditionWrapper{


		@AuraEnabled public Integer datetimeEpoch {get;set;} 
		@AuraEnabled public Decimal temp {get;set;}
		@AuraEnabled public Decimal feelslike {get;set;}
		@AuraEnabled public Decimal humidity {get;set;}
		@AuraEnabled public Decimal dew {get;set;}
		@AuraEnabled public Decimal precip {get;set;}
		@AuraEnabled public Decimal precipprob {get;set;}
		@AuraEnabled public Decimal snow {get;set;}
		@AuraEnabled public Decimal snowdepth {get;set;}
		@AuraEnabled public String  preciptype {get;set;}
        @AuraEnabled public Decimal windspeed {get;set;}
		@AuraEnabled public Decimal windgust {get;set;}
		@AuraEnabled public Decimal winddir {get;set;}
		@AuraEnabled public Decimal pressure {get;set;} 
		@AuraEnabled public Decimal visibility {get;set;}
		@AuraEnabled public Decimal cloudcover {get;set;}
		@AuraEnabled public Decimal solarradiation {get;set;}
		@AuraEnabled public Decimal solarenergy {get;set;}
		@AuraEnabled public Decimal uvindex {get;set;}
		@AuraEnabled public String conditions {get;set;}
		@AuraEnabled public String icon {get;set;}
        @AuraEnabled public String sunrise {get;set;}
        @AuraEnabled public Integer sunriseEpoch {get;set;}
        @AuraEnabled public String sunset {get;set;}
        @AuraEnabled public Integer sunsetEpoch {get;set;}
        @AuraEnabled public Decimal moonPhase {get;set;}

    }
}
