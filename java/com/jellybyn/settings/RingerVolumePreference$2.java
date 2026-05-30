package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class RingerVolumePreference$2 extends BroadcastReceiver {
    final /* synthetic */ RingerVolumePreference this$0;

    public void onReceive(Context context, Intent intent) {
        if ("android.media.RINGER_MODE_CHANGED".equals(intent.getAction())) {
            RingerVolumePreference.access$100(this.this$0).sendMessage(RingerVolumePreference.access$100(this.this$0).obtainMessage(101, intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1), 0));
        }
    }

    RingerVolumePreference$2(RingerVolumePreference ringerVolumePreference) {
        this.this$0 = ringerVolumePreference;
    }
}