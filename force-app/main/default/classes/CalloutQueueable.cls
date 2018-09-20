public class CalloutQueueable implements Queueable, Database.AllowsCallouts {
    private List<CalloutHandler> calloutHandlerList;

    public CalloutQueueable(List<CalloutHandler> calloutHandlerList){
        this.calloutHandlerList = calloutHandlerList;
    }

    public void execute(QueueableContext context) {
        if (calloutHandlerList != null && !calloutHandlerList.isEmpty()) {
            CalloutHandler calloutHandler = calloutHandlerList.get(0);
            calloutHandler.callout();
            if (calloutHandlerList.size() > 1) {
                calloutHandlerList.remove(0);
                CalloutQueueable chainCalloutQueueable = new CalloutQueueable(calloutHandlerList);
                System.enqueueJob(chainCalloutQueueable);
            }
        }
    }
}
