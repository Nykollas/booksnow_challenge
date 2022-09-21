@isTest
public with sharing class VisualCrossingControllerTest {

    @TestSetup
    static void makeCredentials(){
        VisualCrossingCredentials__c vsc = new VisualCrossingCredentials__c();
        vsc.UnitGroup__c = 'metrics';
        vsc.ContentType__c = 'json';
        vsc.APIKey__c = 'sample';
        vsc.Name = 'Default';
        insert vsc;
    }


    @isTest
    public static void test(){
        Test.setMock(HttpCalloutMock.class, new MockCallout());
        Test.startTest();
        VisualCrossingController.getWeatherByLocation('London');
        Test.stopTest();
    }

}
