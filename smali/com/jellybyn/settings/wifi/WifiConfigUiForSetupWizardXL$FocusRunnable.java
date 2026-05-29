package com.jellybyn.settings.wifi;

import android.util.Log;
import android.view.View;

class WifiConfigUiForSetupWizardXL$FocusRunnable implements Runnable {
    final View mViewToBeFocused;
    final /* synthetic */ WifiConfigUiForSetupWizardXL this$0;

    public void run() {
        if (WifiConfigUiForSetupWizardXL.access$000(this.this$0).showSoftInput(this.mViewToBeFocused, 0)) {
            WifiConfigUiForSetupWizardXL.access$100(this.this$0).setPaddingVisibility(8);
        } else {
            Log.w("SetupWizard", "Failed to show software keyboard ");
        }
    }

    public WifiConfigUiForSetupWizardXL$FocusRunnable(WifiConfigUiForSetupWizardXL wifiConfigUiForSetupWizardXL, View view) {
        this.this$0 = wifiConfigUiForSetupWizardXL;
        this.mViewToBeFocused = view;
    }
}