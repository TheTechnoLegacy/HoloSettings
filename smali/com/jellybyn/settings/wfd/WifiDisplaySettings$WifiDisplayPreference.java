package com.jellybyn.settings.wfd;

import android.content.Context;
import android.hardware.display.WifiDisplay;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;

final class WifiDisplaySettings$WifiDisplayPreference extends Preference implements OnClickListener {
    private final WifiDisplay mDisplay;
    final /* synthetic */ WifiDisplaySettings this$0;

    protected void onBindView(View view) {
        super.onBindView(view);
        ImageView deviceDetails = (ImageView) view.findViewById(2131230929);
        if (deviceDetails != null) {
            deviceDetails.setOnClickListener(this);
            if (!isEnabled()) {
                TypedValue typedValue = new TypedValue();
                getContext().getTheme().resolveAttribute(16842803, typedValue, true);
                deviceDetails.setImageAlpha((int) (typedValue.getFloat() * 255.0f));
            }
        }
    }

    public WifiDisplaySettings$WifiDisplayPreference(WifiDisplaySettings wifiDisplaySettings, Context context, WifiDisplay wifiDisplay) {
        this.this$0 = wifiDisplaySettings;
        super(context);
        this.mDisplay = wifiDisplay;
        setTitle(wifiDisplay.getFriendlyDisplayName());
    }

    public void onClick(View view) {
        WifiDisplaySettings.access$600(this.this$0, this.mDisplay);
    }

    public WifiDisplay getDisplay() {
        return this.mDisplay;
    }
}