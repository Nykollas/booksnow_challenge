@isTest
public with sharing class VisualCrossingControllerTest {

    @isTest
    public static void test(){
        Test.setMock(HttpCalloutMock.class, new MockCallout());
        VisualCrossingController.getWeatherByLocation('London');
    }

}
