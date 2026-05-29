package com.jellybyn.settings.wifi;

import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;
import android.widget.PopupMenu;

class WifiSettings$3 implements OnClickListener {
    final /* synthetic */ WifiSettings this$0;
    final /* synthetic */ ImageButton val$b;
    final /* synthetic */ LayoutInflater val$inflater;

    public void onClick(View view) {
        if (WifiSettings.access$200(this.this$0).isWifiEnabled()) {
            PopupMenu popupMenu = new PopupMenu(this.val$inflater.getContext(), this.val$b);
            popupMenu.inflate(2131755012);
            popupMenu.setOnMenuItemClickListener(new 1(this));
            popupMenu.show();
        }
    }

    WifiSettings$3(WifiSettings wifiSettings, LayoutInflater layoutInflater, ImageButton imageButton) {
        this.this$0 = wifiSettings;
        this.val$inflater = layoutInflater;
        this.val$b = imageButton;
    }
}