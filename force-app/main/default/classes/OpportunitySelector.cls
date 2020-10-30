/**
 * Created by lydon.bergin on 10/30/20.
 */

public class OpportunitySelector {

    public static Map<String, Opportunity> getExistingDonationOpportunities(List<String> emails) {
        List<Opportunity> opportunities = [
                SELECT Id, Primary_Contact_Email__c, StageName, Type
                FROM Opportunity
                WHERE IsClosed = FALSE
                AND StageName = 'Prospecting'
                AND Type IN ('Organization', 'Individual')
                AND Primary_Contact_Email__c IN :emails];

        Map<String, Opportunity> opportunitiesByEmail = new Map<String, Opportunity>();
        for (Opportunity opportunity : opportunities) {
            opportunitiesByEmail.put(opportunity.Primary_Contact_Email__c, opportunity);
        }

        return opportunitiesByEmail;
    }

    public static Map<String, Opportunity> getExistingMembershipOpportunities(List<String> emails) {
        List<Opportunity> opportunities = [
                SELECT Id, Primary_Contact_Email__c, StageName, Type
                FROM Opportunity
                WHERE IsClosed = FALSE
                AND StageName = 'Needs to Renew'
                AND Type IN ('Arts Organization', 'Individual')
                AND Primary_Contact_Email__c IN :emails];

        Map<String, Opportunity> opportunitiesByEmail = new Map<String, Opportunity>();
        for (Opportunity opportunity : opportunities) {
            opportunitiesByEmail.put(opportunity.Primary_Contact_Email__c, opportunity);
        }

        return opportunitiesByEmail;
    }
}