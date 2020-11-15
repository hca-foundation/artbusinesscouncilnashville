/**
 * Created by lydon.bergin on 11/1/20.
 */

@IsTest
private class ContactSelectorTest {

    @TestSetup
    static void setup() {
        List<Account> testAccounts = new List<Account> {
            new Account(
                Name = 'Individual'
            ),
            new Account(
                Name = 'Organizational'
            )
        };

        insert testAccounts;

        List<Contact> testContacts = new List<Contact> {
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
    }

    @IsTest
    static void testIndividual() {
        Account individualAccount = [SELECT Id FROM Account WHERE Name = 'Individual' LIMIT 1];
        Map<String, Contact> returnedContacts;

        Test.startTest();
        {
            returnedContacts = ContactSelector.getExistingIndividualContactsByEmail(
                new List<String>{
                    'individual@abcnashville.org'
                },
                individualAccount.Id
            );
        }
        Test.stopTest();
        System.debug(returnedContacts);
        System.assert(returnedContacts.containsKey('INDIVIDUAL@ABCNASHVILLE.ORG'), 'Selector should return individual contact');
    }

    @IsTest
    static void testOrganizational() {
        Account individualAccount = [SELECT Id FROM Account WHERE Name = 'Individual' LIMIT 1];
        Map<String, Contact> returnedContacts;

        Test.startTest();
        {
            returnedContacts = ContactSelector.getExistingOrganizationalContactsByEmail(
                new List<String>{
                    'organizational@abcnashville.org'
                },
                individualAccount.Id
            );
        }
        Test.stopTest();

        System.assert(returnedContacts.containsKey('ORGANIZATIONAL@ABCNASHVILLE.ORG'), 'Selector should return organizational contact');
    }
}