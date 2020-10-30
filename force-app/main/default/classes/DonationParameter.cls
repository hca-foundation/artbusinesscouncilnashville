/**
 * Created by lydon.bergin on 10/30/20.
 */

global class DonationParameter {
    @InvocableVariable
    @AuraEnabled
    global String key;

    @InvocableVariable
    @AuraEnabled
    global String token;
}