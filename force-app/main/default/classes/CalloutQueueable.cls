public class CalloutQueueable implements Queueable, Database.AllowsCallouts {
    private List<Calloutable> calloutableList;

    public CalloutQueueable(List<Calloutable> calloutableList){
        this.calloutableList = calloutableList;
    }

    public void execute(QueueableContext context) {
        if (calloutableList != null && !calloutableList.isEmpty()) {
            Calloutable calloutHandler = calloutableList.get(0);
            calloutHandler.callout();
            if (calloutableList.size() > 1) {
                calloutableList.remove(0);
                CalloutQueueable chainCalloutQueueable = new CalloutQueueable(calloutableList);
                System.enqueueJob(chainCalloutQueueable);
            }
        }
    }
}
