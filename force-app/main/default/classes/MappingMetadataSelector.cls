/**
 * Created by lydon.bergin on 10/30/20.
 */

public class MappingMetadataSelector {
    public static Map<String, Membership_Mapping__mdt> getMembershipMappingsByLabel() {
        List<Membership_Mapping__mdt> membershipMappings = [
            SELECT
                Campaign__c,
                DeveloperName,
                Donation_Record_Type__c,
                Id,
                Label,
                Language,
                MasterLabel,
                Membership_Sub_Type__c,
                Membership_Type__c,
                NamespacePrefix,
                QualifiedApiName,
                Stage__c,
                Type__c
            FROM Membership_Mapping__mdt
        ];

        Map<String, Membership_Mapping__mdt> membershipMappingsByLabel = new Map<String, Membership_Mapping__mdt>();
        for (Membership_Mapping__mdt mapping : membershipMappings) {
            membershipMappingsByLabel.put(mapping.Label, mapping);
        }

        return membershipMappingsByLabel;
    }

    public static Give_API_Token__mdt getGiveApiMetadata() {
        return [
                SELECT
                        DeveloperName,
                        Id,
                        Individual_Account_Id__c,
                        Organizational_Account_Id__c,
                        Donation_Prefix__c,
                        Label,
                        Language,
                        MasterLabel,
                        NamespacePrefix,
                        Public_Key__c,
                        QualifiedApiName,
                        Token__c
                FROM Give_API_Token__mdt][0];
    }
}