/**
 * Created by lydon.bergin on 10/30/20.
 */

public class DonationCreationService {
    @InvocableMethod(Label='Build Opportunities from Donations' Description='Given donations in, build opportunity records' Category='Custom')
    public static List<List<Opportunity>> buildOpportunities(List<List<Donation>> donations) {
        System.debug('Invoke build opportunities');
        List<Opportunity> opportunities = new List<Opportunity>();

        Map<String, Membership_Mapping__mdt> maps = MappingMetadataSelector.getMembershipMappingsByLabel();
        Map<String, Schema.RecordTypeInfo> recordTypesByName = Opportunity.SObjectType.getDescribe().getRecordTypeInfosByName();
        Give_API_Token__mdt giveMetadata = MappingMetadataSelector.getGiveApiMetadata();

        List<String> donationEmails = new List<String>();
        List<String> membershipEmails = new List<String>();
        List<String> allEmails = new List<String>();
        for (List<Donation> donationList : donations) {
            for (Donation donation : donationList) {
                allEmails.add(donation.email);
                if (donation.giveCurrentUrl.toUpperCase().contains('DONATIONS') || donation.giveCurrentUrl.toUpperCase().contains('DONATE')) {
                    donationEmails.add(donation.email);
                } else {
                    membershipEmails.add(donation.email);
                }
            }
        }
        Map<String, Opportunity> existingDonationOpps = OpportunitySelector.getExistingDonationOpportunities(donationEmails);
        Map<String, Opportunity> existingMembershipOpps = OpportunitySelector.getExistingMembershipOpportunities(membershipEmails);
        Map<String, Contact> existingIndividualContacts = ContactSelector.getExistingIndividualContactsByEmail(allEmails, giveMetadata.Individual_Account_ID__c);
        Map<String, Contact> existingOrganizationalContacts = ContactSelector.getExistingOrganizationalContactsByEmail(allEmails, giveMetadata.Individual_Account_ID__c);

        for (List<Donation> donationList : donations) {
            for (Donation donation : donationList) {
                Opportunity foundOpportunity;
                if ((donation.giveCurrentUrl.toUpperCase().contains('DONATIONS') || donation.giveCurrentUrl.toUpperCase().contains('DONATE')) && existingDonationOpps.containsKey(donation.email.toUpperCase())) {
                    foundOpportunity = existingDonationOpps.get(donation.email.toUpperCase());
                }
                else if (existingMembershipOpps.containsKey(donation.email.toUpperCase())) {
                    foundOpportunity = existingMembershipOpps.get(donation.email.toUpperCase());
                }
                else {
                    opportunities.add(
                            buildOpportunityFromDonation(
                                    donation,
                                    maps,
                                    recordTypesByName,
                                    foundOpportunity,
                                    existingIndividualContacts,
                                    existingOrganizationalContacts,
                                    giveMetadata.Individual_Account_ID__c,
                                    giveMetadata.Organizational_Account_Id__c
                            )
                    );
                }
            }
        }

        List<List<Opportunity>> returnList = new List<List<Opportunity>>();
        insert opportunities;
        returnList.add(opportunities);
        return returnList;
    }

    private static Opportunity buildOpportunityFromDonation(
            Donation donation,
            Map<String, Membership_Mapping__mdt> maps,
            Map<String, Schema.RecordTypeInfo> recordTypesByName,
            Opportunity foundOpportunity,
            Map<String, Contact> existingIndividualContacts,
            Map<String, Contact> existingOrganizationalContacts,
            Id individualAccountId,
            Id organizationalAccountId
    ) {
        Opportunity opportunity;
        if (foundOpportunity != null) {
            opportunity = foundOpportunity;
        }
        else {
            opportunity = new Opportunity();
        }

        Membership_Mapping__mdt currentMap;
        if (maps.containsKey(donation.formPriceName)) {
            currentMap = maps.get(donation.formPriceName);
        }
        else if (String.isNotBlank(donation.artsOrganizationIfApplicable)) {
            currentMap = maps.get('Donation: Organization');
        }
        else {
            currentMap = maps.get('Donation: Individual');
        }

        // Populate fields from metadata map
        opportunity.RecordTypeId = recordTypesByName.get(currentMap.Donation_Record_Type__c)?.recordTypeId;
        opportunity.Type = currentMap.Type__c;
        opportunity.Membership_Type__c = currentMap.Membership_Type__c;
        opportunity.Membership_SubType__c = currentMap.Membership_Sub_Type__c;
        opportunity.StageName = currentMap.Stage__c;
        opportunity.CampaignId = currentMap.Campaign__c;

        // Populate fields from donation
        opportunity.Give_ID__c = String.valueOf(donation.giveId);
        opportunity.CloseDate = donation.giveDate?.date();

        // Populate fields with logic rules
        opportunity.Amount = donation.donationAmount == null ? donation.totalAmount : donation.donationAmount;
        opportunity.Name = 'FY' + Date.today().year() + ' ' + currentMap.Type__c + ' ' + donation.name;
        if (donation.giveCurrentUrl.toUpperCase().contains('DONATIONS') || donation.giveCurrentUrl.toUpperCase().contains('DONATE')) {
            opportunity.Fiscally_Sponsored_Project_Name__c = donation.formName;
        }

        // Individual
        if (String.isBlank(donation.artsOrganizationIfApplicable)) {
            if (existingIndividualContacts.containsKey(donation.email.toUpperCase())) {
                opportunity.ContactId = existingIndividualContacts.get(donation.email.toUpperCase()).Id;
                opportunity.Primary_Contact__c = existingIndividualContacts.get(donation.email.toUpperCase()).Id;
                opportunity.AccountId = individualAccountId;
            }
            else if (existingOrganizationalContacts.containsKey(donation.email.toUpperCase())) {
                opportunity.StageName = 'Pending';
                opportunity.ContactId = existingOrganizationalContacts.get(donation.email.toUpperCase()).Id;
                opportunity.Primary_Contact__c = existingOrganizationalContacts.get(donation.email.toUpperCase()).Id;
                opportunity.AccountId = existingOrganizationalContacts.get(donation.email.toUpperCase()).AccountId;
            }
            else {
                Contact contact = generateContactFromDonation(donation, individualAccountId);
                // TODO: Bulkify
                insert contact;
                opportunity.ContactId = contact.Id;
                opportunity.AccountId = individualAccountId;
            }
        }

        // Organization
        else {
            opportunity.User_Entered_Organization_Name__c = donation.artsOrganizationIfApplicable;
            opportunity.StageName = 'Pending';
            if (existingOrganizationalContacts.containsKey(donation.email.toUpperCase())) {
                opportunity.ContactId = existingOrganizationalContacts.get(donation.email.toUpperCase()).Id;
                opportunity.Primary_Contact__c = existingOrganizationalContacts.get(donation.email.toUpperCase()).Id;
                opportunity.AccountId = existingOrganizationalContacts.get(donation.email.toUpperCase()).AccountId;
            }
            else if (existingIndividualContacts.containsKey(donation.email.toUpperCase())) {
                opportunity.StageName = 'Pending';
                opportunity.ContactId = existingIndividualContacts.get(donation.email.toUpperCase()).Id;
                opportunity.Primary_Contact__c = existingIndividualContacts.get(donation.email.toUpperCase()).Id;
                opportunity.AccountId = individualAccountId;
            }
            else {
                Contact contact = generateContactFromDonation(donation, organizationalAccountId);
                // TODO: Bulkify
                insert contact;
                opportunity.ContactId = contact.Id;
                opportunity.AccountId = organizationalAccountId;
            }
        }

        if(donation.isDonationRecurring) {
            opportunity.Recurring__c = 'Recurring';
        }

        return opportunity;
    }

    private static Contact generateContactFromDonation(Donation donation, Id accountId) {
        Contact contact = new Contact();
        contact.AccountId = accountId;
        contact.FirstName = donation.firstName;
        contact.LastName = donation.lastName;
        contact.Email = donation.email;
        contact.mailingStreet = donation.billingAddress1 + ' ' + donation.billingAddress2;
        contact.mailingCity = donation.billingCity;
        contact.MailingState = donation.billingState;
        contact.mailingPostalCode = donation.billingZip;
        contact.MailingCountry = donation.billingCountry;
        return contact;
    }
}