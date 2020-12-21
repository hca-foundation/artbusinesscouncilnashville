/**
 * Created by lydon.bergin on 12/9/20.
 */

public class GiveWPDonationLoader {
    @Future(callout=true)
    public static void loadGiveWPDonations(String dateParam, String numberParam) {
        Give_API_Token__mdt tokens = MappingMetadataSelector.getGiveApiMetadata();
        List<List<DonationParameter>> params = new List<List<DonationParameter>>();
        DonationParameter dp = new DonationParameter();
        dp.key = tokens.Public_Key__c;
        dp.token = tokens.Token__c;
        dp.dateParam = dateParam;
        dp.numberParam = numberParam;

        params.add(new List<DonationParameter>{dp});

        List<List<Donation>> donations = GiveWPDonationService.getDonations(params);
        List<List<Opportunity>> opps = DonationCreationService.buildOpportunities(donations);
    }
}