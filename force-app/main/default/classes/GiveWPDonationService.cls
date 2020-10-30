/**
 * Created by lydon.bergin on 10/29/20.
 */

global class GiveWPDonationService {
    @InvocableMethod(Label='Process Donations' Description='Processes donations pulled from the GiveWP WordPress extension')
    global static List<Donation> getDonations() {
        SwagDefaultApi api = new SwagDefaultApi();

        Map<String, Object> params = new Map<String, Object>{
                'r_number' => '"50"',
                'key' => '"f9a7930c7009cb8aefa17246278dcbfb"',
                'token' => '"17c5722a8992a0a7d373d58aea5d9150"',
                'r_date' => '"yesterday"'
        };

        SwagModel0 result;
        try {
            // cross your fingers
            result = api.giveApiDonationsGet(params);
            System.debug(result);
        } catch (Swagger.ApiException e) {
            // ...handle your exceptions
        }

        return new List<Donation>();
    }

    global class Donation {
        @InvocableVariable(required=true)
        global Integer giveId;

        @InvocableVariable
        global String status;

        @InvocableVariable
        global String name;

        @InvocableVariable
        global String firstName;

        @InvocableVariable
        global String lastName;

        @InvocableVariable
        global String email;

        @InvocableVariable
        global String giveDate;

        @InvocableVariable
        global String billingFirstName;

        @InvocableVariable
        global String billingLastName;

        @InvocableVariable
        global String billingAddress1;

        @InvocableVariable
        global String billingAddress2;

        @InvocableVariable
        global String billingCity;

        @InvocableVariable
        global String billingState;

        @InvocableVariable
        global String billingZip;

        @InvocableVariable
        global String billingCountry;

        @InvocableVariable
        global Integer donorId;

        @InvocableVariable
        global Boolean isDonationRecurring;

        @InvocableVariable
        global Double donationAmount;

        @InvocableVariable
        global String feeAmount;

        @InvocableVariable
        global Integer formId;

        @InvocableVariable
        global String formName;

        @InvocableVariable
        global String formPrice;

        @InvocableVariable
        global String formPriceName;

        @InvocableVariable
        global String formPriceId;
    }
}