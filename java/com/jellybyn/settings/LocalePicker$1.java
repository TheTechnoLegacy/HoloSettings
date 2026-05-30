package com.jellybyn.settings;

class LocalePicker$1 implements Runnable {
    final /* synthetic */ LocalePicker this$0;
    final /* synthetic */ int val$dialogId;

    public void run() {
        this.this$0.removeDialog(this.val$dialogId);
        this.this$0.getActivity().onBackPressed();
        LocalePicker.updateLocale(LocalePicker.access$000(this.this$0));
    }

    LocalePicker$1(LocalePicker localePicker, int i) {
        this.this$0 = localePicker;
        this.val$dialogId = i;
    }
}