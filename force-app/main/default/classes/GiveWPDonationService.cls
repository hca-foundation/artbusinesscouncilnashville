/**
 * Created by lydon.bergin on 10/29/20.
 */

global class GiveWPDonationService {
    @InvocableMethod(Label='Get Donations' Description='Pulls donations from the GiveWP WordPress extension' Category='Custom')
    global static List<List<Donation>> getDonations(List<List<DonationParameter>> parameters) {
        System.debug('Invoke get donations');
        SwagDefaultApi api = new SwagDefaultApi();

        Map<String, Object> params = new Map<String, Object>{
            'key' => parameters[0][0].key,
            'token' => parameters[0][0].token,
            'r_date' => 'yesterday'
            //'r_number' => 'yesterday'
        };

        SwagModel0 result = api.giveApiDonationsGet(params);

        List<Donation> donations = new List<Donation>();
        for (SwagDonations swagDontation : result.donations) {
            if(swagDontation.status == 'Complete') {
                donations.add(buildDonationFromSwagDonation(swagDontation));
            }
        }
        List<List<Donation>> returnList = new List<List<Donation>>();
        returnList.add(donations);
        return returnList;
    }

    @TestVisible
    private static Donation buildDonationFromSwagDonation(SwagDonations swagDonation) {
        Donation donation = new Donation();
        donation.giveId = swagDonation.ID;
        donation.status = swagDonation.status;
        donation.name = swagDonation.name;
        donation.firstName = swagDonation.fname;
        donation.lastName = swagDonation.lname;
        donation.email = swagDonation.email;
        donation.giveDate = Datetime.valueOf(swagDonation.r_date);
        donation.billingFirstName = swagDonation.payment_meta ?.giveDonorBillingFirstName;
        donation.billingLastName = swagDonation.payment_meta ?.giveDonorBillingLastName;
        donation.billingAddress1 = swagDonation.payment_meta ?.giveDonorBillingAddress1;
        donation.billingAddress2 = swagDonation.payment_meta ?.giveDonorBillingAddress2;
        donation.billingCity = swagDonation.payment_meta ?.giveDonorBillingCity;
        donation.billingState = swagDonation.payment_meta ?.giveDonorBillingState;
        donation.billingZip = swagDonation.payment_meta ?.giveDonorBillingZip;
        donation.billingCountry = swagDonation.payment_meta ?.giveDonorBillingCountry;
        donation.donorId = swagDonation.payment_meta ?.givePaymentDonorId;
        donation.isDonationRecurring = swagDonation.payment_meta ?.giveIsDonationRecurring == '0' ? false : true;
        donation.totalAmount = swagDonation.total;
        donation.donationAmount = swagDonation.payment_meta ?.giveFeeDonationAmount;
        donation.feeAmount = swagDonation.payment_meta ?.giveFeeAmount;
        donation.artsOrganizationIfApplicable = swagDonation.payment_meta?.artsOrganizationIfApplicable;
        donation.giveCurrentUrl = swagDonation.payment_meta?.giveCurrentUrl;
        donation.formId = swagDonation.form?.id;
        donation.formName = swagDonation.form?.name;
        donation.formPrice = swagDonation.form?.price;
        donation.formPriceName = swagDonation.form?.price_name;
        donation.formPriceId = swagDonation.form?.price_id;
        return donation;
    }
}