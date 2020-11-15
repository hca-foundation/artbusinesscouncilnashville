/**
 * Created by lydon.bergin on 11/15/20.
 */

@IsTest
private class GiveWPDonationServiceTest {

    @IsTest
    static void testBuildDonationFromSwagDonation() {
        SwagDonations swagDonation = SwagDonations.getExample();
        swagDonation.key = '1';
        swagDonation.r_date = '2020-11-14 23:19:54';
        Donation donation = GiveWPDonationService.buildDonationFromSwagDonation(swagDonation);
        System.assert(true);
    }

    @IsTest
    static void testGiveWPDonationService() {
        HttpResponse res = new HttpResponse();
        SwaggerResponseMock mock = new SwaggerResponseMock(res);
        Test.setMock(HttpCalloutMock.class, mock);

        res.setStatus('OK');
        res.setStatusCode(200);
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{\n' +
                '    "donations": [\n' +
                '        {\n' +
                '            "ID": 8036,\n' +
                '            "number": 8036,\n' +
                '            "transaction_id": "pi_1HndeVFICEY5Gg0cyObJcYGu",\n' +
                '            "key": "c6f2b8c5e03f87c814a5926ea96741ee",\n' +
                '            "total": "50",\n' +
                '            "status": "Complete",\n' +
                '            "gateway": "stripe",\n' +
                '            "name": "Cameron Mitchell",\n' +
                '            "fname": "Cameron",\n' +
                '            "lname": "Mitchell",\n' +
                '            "email": "bookcmitch@gmail.com",\n' +
                '            "date": "2020-11-14 23:19:51",\n' +
                '            "payment_meta": {\n' +
                '                "_give_payment_currency": "USD",\n' +
                '                "_give_donor_billing_first_name": "Cameron",\n' +
                '                "_give_donor_billing_last_name": "Mitchell",\n' +
                '                "_give_donor_billing_address1": "5000 Mountain Springs rd #602",\n' +
                '                "_give_donor_billing_address2": "",\n' +
                '                "_give_donor_billing_city": "Antioch",\n' +
                '                "_give_donor_billing_state": "TN",\n' +
                '                "_give_donor_billing_zip": "37013",\n' +
                '                "_give_donor_billing_country": "US",\n' +
                '                "_give_payment_gateway": "stripe",\n' +
                '                "_give_payment_donor_email": "bookcmitch@gmail.com",\n' +
                '                "_give_payment_donor_title_prefix": "",\n' +
                '                "_give_payment_donor_ip": "98.240.15.72",\n' +
                '                "_give_payment_mode": "live",\n' +
                '                "_give_payment_donor_id": "689",\n' +
                '                "_give_current_url": "https:\\/\\/abcnashville.org\\/donations\\/fiscal-sponsorship-application-fees\\/",\n' +
                '                "_give_current_page_id": "2668",\n' +
                '                "_give_anonymous_donation": "0",\n' +
                '                "_give_stripe_account_slug": "acct_17zotSFICEY5Gg0c",\n' +
                '                "_give_fee_status": "rejected",\n' +
                '                "_give-form-fields_id": "2668",\n' +
                '                "_give_stripe_customer_id": "cus_GvhsRKCQT4uBzF",\n' +
                '                "_give_stripe_source_id": "pm_1HndeSFICEY5Gg0czKUHlSvM",\n' +
                '                "_give_stripe_donation_summary": "Fiscal Sponsorship Application Fees",\n' +
                '                "_give_stripe_payment_intent_client_secret": "pi_1HndeVFICEY5Gg0cyObJcYGu_secret_QmMw5l1ds0o3hUIrwyvpBJKue",\n' +
                '                "_give_payment_transaction_id": "pi_1HndeVFICEY5Gg0cyObJcYGu",\n' +
                '                "_give_completed_date": "2020-11-14 23:19:54"\n' +
                '            },\n' +
                '            "form": {\n' +
                '                "id": "2668",\n' +
                '                "name": "Fiscal Sponsorship Application Fees",\n' +
                '                "price": "50",\n' +
                '                "price_name": "Application Fee - Member",\n' +
                '                "price_id": "0"\n' +
                '            }\n' +
                '        },\n' +
                '        {\n' +
                '            "ID": 8035,\n' +
                '            "number": 8035,\n' +
                '            "transaction_id": "pi_1HnVSZFICEY5Gg0conYk6IUt",\n' +
                '            "key": "cd6d39fd8ab0462d71728cc1285396bb",\n' +
                '            "total": "52",\n' +
                '            "status": "Complete",\n' +
                '            "gateway": "stripe",\n' +
                '            "name": "Jillian Frame",\n' +
                '            "fname": "Jillian",\n' +
                '            "lname": "Frame",\n' +
                '            "email": "jillian@gardentheatrecompany.org",\n' +
                '            "date": "2020-11-14 14:34:58",\n' +
                '            "payment_meta": {\n' +
                '                "_give_payment_currency": "USD",\n' +
                '                "_give_donor_billing_first_name": "Jillian",\n' +
                '                "_give_donor_billing_last_name": "Frame",\n' +
                '                "_give_donor_billing_address1": "5518 Meadowcrest Lane",\n' +
                '                "_give_donor_billing_address2": "",\n' +
                '                "_give_donor_billing_city": "Nashville",\n' +
                '                "_give_donor_billing_state": "TN",\n' +
                '                "_give_donor_billing_zip": "37209",\n' +
                '                "_give_donor_billing_country": "US",\n' +
                '                "_give_payment_gateway": "stripe",\n' +
                '                "_give_payment_donor_email": "jillian@gardentheatrecompany.org",\n' +
                '                "_give_payment_donor_title_prefix": "",\n' +
                '                "_give_payment_donor_ip": "174.195.13.47",\n' +
                '                "_give_payment_mode": "live",\n' +
                '                "_give_payment_donor_id": "870",\n' +
                '                "_give_current_url": "https:\\/\\/abcnashville.org\\/donations\\/fiscal-sponsorship-application-fees\\/",\n' +
                '                "_give_current_page_id": "2668",\n' +
                '                "_give_anonymous_donation": "0",\n' +
                '                "_give_stripe_account_slug": "acct_17zotSFICEY5Gg0c",\n' +
                '                "_give_fee_donation_amount": "50",\n' +
                '                "_give_fee_amount": "2",\n' +
                '                "_give-form-fields_id": "2668",\n' +
                '                "_give_stripe_customer_id": "cus_IOI2dkbdrAki2M",\n' +
                '                "_give_stripe_source_id": "pm_1HnVSUFICEY5Gg0c1gEx3aCj",\n' +
                '                "_give_stripe_donation_summary": "Fiscal Sponsorship Application Fees",\n' +
                '                "_give_stripe_payment_intent_client_secret": "pi_1HnVSZFICEY5Gg0conYk6IUt_secret_r3bPS44CfWHrl5cjpnCeVClVx",\n' +
                '                "_give_payment_transaction_id": "pi_1HnVSZFICEY5Gg0conYk6IUt",\n' +
                '                "_give_completed_date": "2020-11-14 14:35:01"\n' +
                '            },\n' +
                '            "form": {\n' +
                '                "id": "2668",\n' +
                '                "name": "Fiscal Sponsorship Application Fees",\n' +
                '                "price": "50",\n' +
                '                "price_name": "Application Fee - Member",\n' +
                '                "price_id": "0"\n' +
                '            }\n' +
                '        }\n' +
                '    ],\n' +
                '    "request_speed": 0.0601909160614013671875\n' +
                '}');

        DonationParameter param = new DonationParameter();
        param.key = 'key';
        param.token = 'token';
        List<List<DonationParameter>> params = new List<List<DonationParameter>>();
        params.add(new List<DonationParameter>{param});
        Test.startTest();
        List<List<Donation>> donations = GiveWPDonationService.getDonations(params);
        Test.stopTest();
    }
}