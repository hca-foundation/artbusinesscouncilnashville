/**
 * Created by lydon.bergin on 10/30/20.
 */

global class Donation {
    @InvocableVariable(Required=true)
    @AuraEnabled
    global Integer giveId;

    @InvocableVariable
    @AuraEnabled
    global String status;

    @InvocableVariable
    @AuraEnabled
    global String name;

    @InvocableVariable
    @AuraEnabled
    global String firstName;

    @InvocableVariable
    @AuraEnabled
    global String lastName;

    @InvocableVariable
    @AuraEnabled
    global String email;

    @InvocableVariable
    @AuraEnabled
    global Datetime giveDate;

    @InvocableVariable
    @AuraEnabled
    global String billingFirstName;

    @InvocableVariable
    @AuraEnabled
    global String billingLastName;

    @InvocableVariable
    @AuraEnabled
    global String billingAddress1;

    @InvocableVariable
    @AuraEnabled
    global String billingAddress2;

    @InvocableVariable
    @AuraEnabled
    global String billingCity;

    @InvocableVariable
    @AuraEnabled
    global String billingState;

    @InvocableVariable
    @AuraEnabled
    global String billingZip;

    @InvocableVariable
    @AuraEnabled
    global String billingCountry;

    @InvocableVariable
    @AuraEnabled
    global Integer donorId;

    @InvocableVariable
    @AuraEnabled
    global Boolean isDonationRecurring;

    @InvocableVariable
    @AuraEnabled
    global Double totalAmount;

    @InvocableVariable
    @AuraEnabled
    global Double donationAmount;

    @InvocableVariable
    @AuraEnabled
    global Double feeAmount;

    @InvocableVariable
    @AuraEnabled
    global Integer formId;

    @InvocableVariable
    @AuraEnabled
    global String formName;

    @InvocableVariable
    @AuraEnabled
    global Double formPrice;

    @InvocableVariable
    @AuraEnabled
    global String formPriceName;

    @InvocableVariable
    @AuraEnabled
    global String formPriceId;

    @InvocableVariable
    @AuraEnabled
    global String artsOrganizationIfApplicable;

    @InvocableVariable
    @AuraEnabled
    global String giveCurrentUrl;
}