@isTest
private class SwagPaymentMetaTest {
    @isTest
    private static void equalsSameInstance() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = paymentMeta1;
        SwagPaymentMeta paymentMeta3 = new SwagPaymentMeta();
        SwagPaymentMeta paymentMeta4 = paymentMeta3;

        System.assert(paymentMeta1.equals(paymentMeta2));
        System.assert(paymentMeta2.equals(paymentMeta1));
        System.assert(paymentMeta1.equals(paymentMeta1));
        System.assert(paymentMeta3.equals(paymentMeta4));
        System.assert(paymentMeta4.equals(paymentMeta3));
        System.assert(paymentMeta3.equals(paymentMeta3));
    }

    @isTest
    private static void equalsIdenticalInstance() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta3 = new SwagPaymentMeta();
        SwagPaymentMeta paymentMeta4 = new SwagPaymentMeta();

        System.assert(paymentMeta1.equals(paymentMeta2));
        System.assert(paymentMeta2.equals(paymentMeta1));
        System.assert(paymentMeta3.equals(paymentMeta4));
        System.assert(paymentMeta4.equals(paymentMeta3));
    }

    @isTest
    private static void notEqualsDifferentType() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = new SwagPaymentMeta();

        System.assertEquals(false, paymentMeta1.equals('foo'));
        System.assertEquals(false, paymentMeta2.equals('foo'));
    }

    @isTest
    private static void notEqualsNull() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = new SwagPaymentMeta();
        SwagPaymentMeta paymentMeta3;

        System.assertEquals(false, paymentMeta1.equals(paymentMeta3));
        System.assertEquals(false, paymentMeta2.equals(paymentMeta3));
    }

    @isTest
    private static void consistentHashCodeValue() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = new SwagPaymentMeta();

        System.assertEquals(paymentMeta1.hashCode(), paymentMeta1.hashCode());
        System.assertEquals(paymentMeta2.hashCode(), paymentMeta2.hashCode());
    }

    @isTest
    private static void equalInstancesHaveSameHashCode() {
        SwagPaymentMeta paymentMeta1 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta2 = SwagPaymentMeta.getExample();
        SwagPaymentMeta paymentMeta3 = new SwagPaymentMeta();
        SwagPaymentMeta paymentMeta4 = new SwagPaymentMeta();

        System.assert(paymentMeta1.equals(paymentMeta2));
        System.assert(paymentMeta3.equals(paymentMeta4));
        System.assertEquals(paymentMeta1.hashCode(), paymentMeta2.hashCode());
        System.assertEquals(paymentMeta3.hashCode(), paymentMeta4.hashCode());
    }

    @isTest
    private static void maintainRenamedProperties() {
        SwagPaymentMeta paymentMeta = new SwagPaymentMeta();
        Map<String, String> propertyMappings = paymentMeta.getPropertyMappings();
        System.assertEquals('givePaymentCurrency', propertyMappings.get('_give_payment_currency'));
        System.assertEquals('giveDonorBillingFirstName', propertyMappings.get('_give_donor_billing_first_name'));
        System.assertEquals('giveDonorBillingLastName', propertyMappings.get('_give_donor_billing_last_name'));
        System.assertEquals('giveDonorBillingAddress1', propertyMappings.get('_give_donor_billing_address1'));
        System.assertEquals('giveDonorBillingAddress2', propertyMappings.get('_give_donor_billing_address2'));
        System.assertEquals('giveDonorBillingCity', propertyMappings.get('_give_donor_billing_city'));
        System.assertEquals('giveDonorBillingState', propertyMappings.get('_give_donor_billing_state'));
        System.assertEquals('giveDonorBillingZip', propertyMappings.get('_give_donor_billing_zip'));
        System.assertEquals('giveDonorBillingCountry', propertyMappings.get('_give_donor_billing_country'));
        System.assertEquals('givePaymentGateway', propertyMappings.get('_give_payment_gateway'));
        System.assertEquals('givePaymentDonorEmail', propertyMappings.get('_give_payment_donor_email'));
        System.assertEquals('givePaymentDonorTitlePrefix', propertyMappings.get('_give_payment_donor_title_prefix'));
        System.assertEquals('givePaymentDonorIp', propertyMappings.get('_give_payment_donor_ip'));
        System.assertEquals('givePaymentMode', propertyMappings.get('_give_payment_mode'));
        System.assertEquals('givePaymentDonorId', propertyMappings.get('_give_payment_donor_id'));
        System.assertEquals('giveIsDonationRecurring', propertyMappings.get('_give_is_donation_recurring'));
        System.assertEquals('giveCurrentUrl', propertyMappings.get('_give_current_url'));
        System.assertEquals('giveCurrentPageId', propertyMappings.get('_give_current_page_id'));
        System.assertEquals('giveAnonymousDonation', propertyMappings.get('_give_anonymous_donation'));
        System.assertEquals('giveStripeAccountSlug', propertyMappings.get('_give_stripe_account_slug'));
        System.assertEquals('giveFeeDonationAmount', propertyMappings.get('_give_fee_donation_amount'));
        System.assertEquals('giveFeeAmount', propertyMappings.get('_give_fee_amount'));
        System.assertEquals('artsOrganizationIfApplicable', propertyMappings.get('arts_organization_if_applicable'));
        System.assertEquals('giveFormFieldsId', propertyMappings.get('_give-form-fields_id'));
        System.assertEquals('giveStripeCustomerId', propertyMappings.get('_give_stripe_customer_id'));
        System.assertEquals('giveStripeSourceId', propertyMappings.get('_give_stripe_source_id'));
        System.assertEquals('giveStripeDonationSummary', propertyMappings.get('_give_stripe_donation_summary'));
        System.assertEquals('giveStripePaymentIntentClientSecret', propertyMappings.get('_give_stripe_payment_intent_client_secret'));
        System.assertEquals('givePaymentTransactionId', propertyMappings.get('_give_payment_transaction_id'));
        System.assertEquals('giveCompletedDate', propertyMappings.get('_give_completed_date'));
    }
}
