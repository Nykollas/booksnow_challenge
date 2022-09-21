@isTest
public with sharing class CalloutServiceTest {
    @isTest    
    public static void test(){
        CalloutService.getWeatherByLocation('London');
    }
}
