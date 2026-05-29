package com.jellybyn.settings.wifi;

import com.jellybyn.settings.wifi.WpsDialog.5;
import com.jellybyn.settings.wifi.WpsDialog.DialogState;

class WpsDialog$4 implements Runnable {
    final /* synthetic */ WpsDialog this$0;
    final /* synthetic */ String val$msg;
    final /* synthetic */ DialogState val$state;

    public void run() {
        switch (5.$SwitchMap$com$android$settings$wifi$WpsDialog$DialogState[this.val$state.ordinal()]) {
            case 1:
                WpsDialog.access$300(this.this$0).setVisibility(8);
                WpsDialog.access$500(this.this$0).setVisibility(0);
                break;
            case 2:
            case 3:
                WpsDialog.access$600(this.this$0).setText(WpsDialog.access$000(this.this$0).getString(2131428389));
                WpsDialog.access$300(this.this$0).setVisibility(8);
                WpsDialog.access$500(this.this$0).setVisibility(8);
                if (WpsDialog.access$700(this.this$0) != null) {
                    WpsDialog.access$000(this.this$0).unregisterReceiver(WpsDialog.access$700(this.this$0));
                    WpsDialog.access$702(this.this$0, null);
                    break;
                }
                break;
        }
        WpsDialog.access$800(this.this$0).setText(this.val$msg);
    }

    WpsDialog$4(WpsDialog wpsDialog, DialogState dialogState, String str) {
        this.this$0 = wpsDialog;
        this.val$state = dialogState;
        this.val$msg = str;
    }
}