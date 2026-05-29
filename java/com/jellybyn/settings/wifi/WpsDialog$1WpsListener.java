package com.jellybyn.settings.wifi;

import android.net.wifi.WifiManager.WpsListener;
import com.jellybyn.settings.wifi.WpsDialog.DialogState;

class WpsDialog$1WpsListener implements WpsListener {
    final /* synthetic */ WpsDialog this$0;

    public void onFailure(int i) {
        String msg;
        switch (i) {
            case 1:
                msg = WpsDialog.access$000(this.this$0).getString(2131427849);
                break;
            case 3:
                msg = WpsDialog.access$000(this.this$0).getString(2131427854);
                break;
            case 4:
                msg = WpsDialog.access$000(this.this$0).getString(2131427851);
                break;
            case 5:
                msg = WpsDialog.access$000(this.this$0).getString(2131427852);
                break;
            default:
                msg = WpsDialog.access$000(this.this$0).getString(2131427850);
                break;
        }
        WpsDialog.access$100(this.this$0, DialogState.WPS_FAILED, msg);
    }

    public void onStartSuccess(String str) {
        if (str != null) {
            WpsDialog.access$100(this.this$0, DialogState.WPS_START, String.format(WpsDialog.access$000(this.this$0).getString(2131427846), new Object[]{str}));
            return;
        }
        WpsDialog.access$100(this.this$0, DialogState.WPS_START, WpsDialog.access$000(this.this$0).getString(2131427845));
    }

    public void onCompletion() {
        WpsDialog.access$100(this.this$0, DialogState.WPS_COMPLETE, WpsDialog.access$000(this.this$0).getString(2131427847));
    }

    WpsDialog$1WpsListener(WpsDialog wpsDialog) {
        this.this$0 = wpsDialog;
    }
}