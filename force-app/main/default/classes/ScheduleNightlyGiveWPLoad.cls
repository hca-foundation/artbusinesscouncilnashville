/**
 * Created by lydon.bergin on 12/2/20.
 */

global class ScheduleNightlyGiveWPLoad implements Schedulable {
    global void execute(SchedulableContext sc) {
        GiveWPDonationLoader.loadGiveWPDonations('yesterday', null);
    }
}