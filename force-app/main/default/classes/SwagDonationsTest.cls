@isTest
private class SwagDonationsTest {
    @isTest
    private static void equalsSameInstance() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = donations1;
        SwagDonations donations3 = new SwagDonations();
        SwagDonations donations4 = donations3;

        System.assert(donations1.equals(donations2));
        System.assert(donations2.equals(donations1));
        System.assert(donations1.equals(donations1));
        System.assert(donations3.equals(donations4));
        System.assert(donations4.equals(donations3));
        System.assert(donations3.equals(donations3));
    }

    @isTest
    private static void equalsIdenticalInstance() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = SwagDonations.getExample();
        SwagDonations donations3 = new SwagDonations();
        SwagDonations donations4 = new SwagDonations();

        System.assert(donations1.equals(donations2));
        System.assert(donations2.equals(donations1));
        System.assert(donations3.equals(donations4));
        System.assert(donations4.equals(donations3));
    }

    @isTest
    private static void notEqualsDifferentType() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = new SwagDonations();

        System.assertEquals(false, donations1.equals('foo'));
        System.assertEquals(false, donations2.equals('foo'));
    }

    @isTest
    private static void notEqualsNull() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = new SwagDonations();
        SwagDonations donations3;

        System.assertEquals(false, donations1.equals(donations3));
        System.assertEquals(false, donations2.equals(donations3));
    }

    @isTest
    private static void consistentHashCodeValue() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = new SwagDonations();

        System.assertEquals(donations1.hashCode(), donations1.hashCode());
        System.assertEquals(donations2.hashCode(), donations2.hashCode());
    }

    @isTest
    private static void equalInstancesHaveSameHashCode() {
        SwagDonations donations1 = SwagDonations.getExample();
        SwagDonations donations2 = SwagDonations.getExample();
        SwagDonations donations3 = new SwagDonations();
        SwagDonations donations4 = new SwagDonations();

        System.assert(donations1.equals(donations2));
        System.assert(donations3.equals(donations4));
        System.assertEquals(donations1.hashCode(), donations2.hashCode());
        System.assertEquals(donations3.hashCode(), donations4.hashCode());
    }
}