@IsTest
public with sharing class MockCalloutTest {
    @IsTest
    public static void test(){
        HttpRequest httpReq = new HttpRequest();
        MockCallout mock = new MockCallout();
        HTTPResponse res = mock.respond(httpReq);

    }

}
