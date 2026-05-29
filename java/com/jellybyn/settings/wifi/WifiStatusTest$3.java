package com.jellybyn.settings.wifi;

import android.net.wifi.WifiInfo;
import android.view.View;
import android.view.View.OnClickListener;

class WifiStatusTest$3 implements OnClickListener {
    final /* synthetic */ WifiStatusTest this$0;

    public void onClick(View view) {
        WifiInfo wifiInfo = WifiStatusTest.access$600(this.this$0).getConnectionInfo();
        WifiStatusTest.access$700(this.this$0, WifiStatusTest.access$600(this.this$0).getWifiState());
        WifiStatusTest.access$800(this.this$0).setText(wifiInfo.getBSSID());
        WifiStatusTest.access$900(this.this$0).setText(String.valueOf(wifiInfo.getHiddenSSID()));
        int ipAddr = wifiInfo.getIpAddress();
        StringBuffer ipBuf = new StringBuffer();
        ipAddr >>>= 8;
        ipAddr >>>= 8;
        ipBuf.append(ipAddr & 255).append('.').append(ipAddr & 255).append('.').append(ipAddr & 255).append('.').append((ipAddr >>> 8) & 255);
        WifiStatusTest.access$1000(this.this$0).setText(ipBuf);
        WifiStatusTest.access$1100(this.this$0).setText(String.valueOf(wifiInfo.getLinkSpeed()) + " Mbps");
        WifiStatusTest.access$1200(this.this$0).setText(wifiInfo.getMacAddress());
        WifiStatusTest.access$1300(this.this$0).setText(String.valueOf(wifiInfo.getNetworkId()));
        WifiStatusTest.access$1400(this.this$0).setText(String.valueOf(wifiInfo.getRssi()));
        WifiStatusTest.access$1500(this.this$0).setText(wifiInfo.getSSID());
        WifiStatusTest.access$1600(this.this$0, wifiInfo.getSupplicantState());
    }

    WifiStatusTest$3(WifiStatusTest wifiStatusTest) {
        this.this$0 = wifiStatusTest;
    }
}