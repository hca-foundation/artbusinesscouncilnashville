@isTest
private class SwagDefaultApiTest {
    /**
     * 
     *
     * 
     */
    @isTest
    private static void giveApiDonationsGetTest() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setStatus('OK');
        Test.setMock(HttpCalloutMock.class, new SwaggerResponseMock(res));

        Map<String, Object> params = new Map<String, Object>{
            'r_number' => '"50"',
            'key' => '"xxx"',
            'token' => '"xxx"',
            'r_date' => '"yesterday"'
        };

        SwagClient client;
        SwagDefaultApi api;
        SwagModel0 response;
        SwagModel0 expectedResponse;
        String js = '{}';

        api = new SwagDefaultApi(new SwagClient());

        js = JSON.serialize('');
        res.setHeader('Content-Type', 'application/json');
        res.setBody(js);
        expectedResponse = null;
        response = (SwagModel0) api.giveApiDonationsGet(params);
        System.assertEquals(expectedResponse, response);
    }
}