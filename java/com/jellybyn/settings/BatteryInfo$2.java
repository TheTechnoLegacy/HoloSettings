package com.jellybyn.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BatteryInfo$2 extends BroadcastReceiver {
    final /* synthetic */ BatteryInfo this$0;

    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.BATTERY_CHANGED")) {
            int plugType = intent.getIntExtra("plugged", 0);
            BatteryInfo.access$100(this.this$0).setText("" + intent.getIntExtra("level", 0));
            BatteryInfo.access$200(this.this$0).setText("" + intent.getIntExtra("scale", 0));
            BatteryInfo.access$300(this.this$0).setText("" + intent.getIntExtra("voltage", 0) + " " + this.this$0.getString(2131427393));
            BatteryInfo.access$500(this.this$0).setText("" + BatteryInfo.access$400(this.this$0, intent.getIntExtra("temperature", 0)) + this.this$0.getString(2131427395));
            BatteryInfo.access$600(this.this$0).setText("" + intent.getStringExtra("technology"));
            BatteryInfo.access$700(this.this$0).setText(Utils.getBatteryStatus(this.this$0.getResources(), intent));
            switch (plugType) {
                case 0:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427408));
                    break;
                case 1:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427409));
                    break;
                case 2:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427410));
                    break;
                case 3:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427412));
                    break;
                case 4:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427411));
                    break;
                default:
                    BatteryInfo.access$800(this.this$0).setText(this.this$0.getString(2131427413));
                    break;
            }
            int health = intent.getIntExtra("health", 1);
            String healthString = health == 2 ? this.this$0.getString(2131427415) : health == 3 ? this.this$0.getString(2131427416) : health == 4 ? this.this$0.getString(2131427417) : health == 5 ? this.this$0.getString(2131427418) : health == 6 ? this.this$0.getString(2131427419) : health == 7 ? this.this$0.getString(2131427420) : this.this$0.getString(2131427414);
            BatteryInfo.access$900(this.this$0).setText(healthString);
        }
    }

    BatteryInfo$2(BatteryInfo batteryInfo) {
        this.this$0 = batteryInfo;
    }
}