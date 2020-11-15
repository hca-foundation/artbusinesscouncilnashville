/**
 * Created by lydon.bergin on 11/15/20.
 */

@IsTest
private class OpportunitySelectorTest {

    @TestSetup
    static void setup() {
        List<Account> testAccounts = new List<Account>{
            new Account(
                Name = 'Individual'
            ),
            new Account(
                Name = 'Organizational'
            )
        };
        insert testAccounts;

        List<Contact> testContacts = new List<Contact>{
            new Contact(
                FirstName = 'Individual',
                LastName = 'Test',
                Email = 'individual@abcnashville.org',
                AccountId = testAccounts[0].Id
            ),
            new Contact(
                FirstName = 'Organizational',
                LastName = 'Test',
                Email = 'organizational@abcnashville.org',
                AccountId = testAccounts[1].Id
            )
        };
        insert testContacts;

        List<Opportunity> testOpportunities = new List<Opportunity> {
            new Opportunity(
                StageName = 'Prospecting',
                Type = 'Individual',
                ContactId = testContacts[0].Id,
                Primary_Contact__c = testContacts[0].Id,
                Name = 'Individual Opportunity',
                Amount = 100,
                CloseDate = Date.today().addDays(5)
            ),
            new Opportunity(
                StageName = 'Needs to Renew',
                Type = 'Arts Organization',
                ContactId = testContacts[1].Id,
                Primary_Contact__c = testContacts[1].Id,
                Name = 'Organizational Opportunity',
                Amount = 100,
                CloseDate = Date.today().addDays(5)
            )
        };
        insert testOpportunities;
    }

    @IsTest
    static void getExistingDonationOpportunities() {
        Map<String, Opportunity> selectedOpps =
            OpportunitySelector.getExistingDonationOpportunities(
                new List<String> {'individual@abcnashville.org', 'organizational@abcnashville.org'}
            );

        System.assertEquals(1, selectedOpps.size());
    }

    @IsTest
    static void getExistingMembershipOpportunities() {
        Map<String, Opportunity> selectedOpps =
                OpportunitySelector.getExistingMembershipOpportunities(
                        new List<String> {'individual@abcnashville.org', 'organizational@abcnashville.org'}
                );

        System.assertEquals(1, selectedOpps.size());
    }
}