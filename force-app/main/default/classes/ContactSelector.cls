/**
 * Created by lydon.bergin on 10/30/20.
 */

public class ContactSelector {

    public static Map<String, Contact> getExistingIndividualContactsByEmail(List<String> emails, Id individualAccountId) {
        List<Contact> contacts = [SELECT Id, Email FROM Contact WHERE AccountId = :individualAccountId AND Email IN :emails];
        Map<String, Contact> contactsByEmail = new Map<String, Contact>();
        for (Contact contact : contacts) {
            contactsByEmail.put(contact.Email.toUpperCase(), contact);
        }

        return contactsByEmail;
    }

    public static Map<String, Contact> getExistingOrganizationalContactsByEmail(List<String> emails, Id individualAccountId) {
        List<Contact> contacts = [SELECT Id, Email, AccountId FROM Contact WHERE AccountId != :individualAccountId AND Email IN :emails];
        Map<String, Contact> contactsByEmail = new Map<String, Contact>();
        for (Contact contact : contacts) {
            contactsByEmail.put(contact.Email.toUpperCase(), contact);
        }

        return contactsByEmail;
    }
}