package com.jellybyn.settings.fuelgauge;

import android.os.Handler;
import android.os.Message;

class PowerUsageSummary$2 extends Handler {
    final /* synthetic */ PowerUsageSummary this$0;

    public void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                BatterySipper bs = message.obj;
                PowerGaugePreference pgp = (PowerGaugePreference) this.this$0.findPreference(Integer.toString(bs.uidObj.getUid()));
                if (pgp != null) {
                    pgp.setIcon(bs.icon);
                    pgp.setTitle(bs.name);
                    break;
                }
                break;
        }
        super.handleMessage(message);
    }

    PowerUsageSummary$2(PowerUsageSummary powerUsageSummary) {
        this.this$0 = powerUsageSummary;
    }
}