package com.jellybyn.settings.wfd;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.hardware.display.DisplayManager;
import android.hardware.display.WifiDisplay;
import android.hardware.display.WifiDisplayStatus;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.Secure;
import android.text.Html;
import android.util.TypedValue;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.TextView;
import com.jellybyn.settings.ProgressCategory;
import com.jellybyn.settings.SettingsPreferenceFragment;

public final class WifiDisplaySettings extends SettingsPreferenceFragment {
    private Switch mActionBarSwitch;
    private ProgressCategory mAvailableDevicesCategory;
    private DisplayManager mDisplayManager;
    private TextView mEmptyView;
    private PreferenceGroup mPairedDevicesCategory;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED")) {
                WifiDisplaySettings.this.mWifiDisplayStatus = (WifiDisplayStatus) intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS");
                WifiDisplaySettings.this.applyState();
            }
        }
    };
    private final ContentObserver mSettingsObserver = new ContentObserver(new Handler()) {
        public void onChange(boolean z, Uri uri) {
            WifiDisplaySettings.this.update();
        }
    };
    private final OnCheckedChangeListener mSwitchOnCheckedChangedListener = new OnCheckedChangeListener() {
        public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
            WifiDisplaySettings.this.mWifiDisplayOnSetting = z;
            Global.putInt(WifiDisplaySettings.this.getContentResolver(), "wifi_display_on", z ? 1 : 0);
        }
    };
    private boolean mWifiDisplayOnSetting;
    private WifiDisplayStatus mWifiDisplayStatus;

    private final class WifiDisplayPreference extends Preference implements OnClickListener {
        private final WifiDisplay mDisplay;

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

        public WifiDisplayPreference(Context context, WifiDisplay wifiDisplay) {
            super(context);
            this.mDisplay = wifiDisplay;
            setTitle(wifiDisplay.getFriendlyDisplayName());
        }

        public void onClick(View view) {
            WifiDisplaySettings.this.showOptionsDialog(this.mDisplay);
        }

        public WifiDisplay getDisplay() {
            return this.mDisplay;
        }
    }

    private void applyState() {
        int featureState = this.mWifiDisplayStatus.getFeatureState();
        this.mActionBarSwitch.setEnabled(featureState != 1);
        this.mActionBarSwitch.setChecked(this.mWifiDisplayOnSetting);
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        preferenceScreen.removeAll();
        if (featureState == 3) {
            WifiDisplay[] rememberedDisplays = this.mWifiDisplayStatus.getRememberedDisplays();
            WifiDisplay[] availableDisplays = this.mWifiDisplayStatus.getAvailableDisplays();
            if (this.mPairedDevicesCategory == null) {
                this.mPairedDevicesCategory = new PreferenceCategory(getActivity());
                this.mPairedDevicesCategory.setTitle(2131427773);
            } else {
                this.mPairedDevicesCategory.removeAll();
            }
            preferenceScreen.addPreference(this.mPairedDevicesCategory);
            for (WifiDisplay createWifiDisplayPreference : rememberedDisplays) {
                this.mPairedDevicesCategory.addPreference(createWifiDisplayPreference(createWifiDisplayPreference, true));
            }
            if (this.mPairedDevicesCategory.getPreferenceCount() == 0) {
                preferenceScreen.removePreference(this.mPairedDevicesCategory);
            }
            if (this.mAvailableDevicesCategory == null) {
                this.mAvailableDevicesCategory = new ProgressCategory(getActivity(), null, 2131427772);
                this.mAvailableDevicesCategory.setTitle(2131427774);
            } else {
                this.mAvailableDevicesCategory.removeAll();
            }
            preferenceScreen.addPreference(this.mAvailableDevicesCategory);
            for (WifiDisplay createWifiDisplayPreference2 : availableDisplays) {
                if (!contains(rememberedDisplays, createWifiDisplayPreference2.getDeviceAddress())) {
                    this.mAvailableDevicesCategory.addPreference(createWifiDisplayPreference(createWifiDisplayPreference2, false));
                }
            }
            if (this.mWifiDisplayStatus.getScanState() == 1) {
                this.mAvailableDevicesCategory.setProgress(true);
            } else {
                this.mAvailableDevicesCategory.setProgress(false);
            }
        } else {
            this.mEmptyView.setText(featureState == 2 ? 2131427768 : 2131427769);
        }
        getActivity().invalidateOptionsMenu();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mActionBarSwitch = new Switch(activity);
        this.mActionBarSwitch.setOnCheckedChangeListener(this.mSwitchOnCheckedChangedListener);
        this.mActionBarSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(this.mActionBarSwitch, new LayoutParams(-2, -2, 8388629));
        this.mEmptyView = (TextView) getView().findViewById(16908292);
        getListView().setEmptyView(this.mEmptyView);
        update();
        if (this.mWifiDisplayStatus.getFeatureState() == 0) {
            activity.finish();
        }
    }

    private Preference createWifiDisplayPreference(WifiDisplay wifiDisplay, boolean z) {
        WifiDisplayPreference p = new WifiDisplayPreference(getActivity(), wifiDisplay);
        if (wifiDisplay.equals(this.mWifiDisplayStatus.getActiveDisplay())) {
            switch (this.mWifiDisplayStatus.getActiveDisplayState()) {
                case 1:
                    p.setSummary(2131427775);
                    break;
                case 2:
                    p.setSummary(2131427776);
                    break;
            }
        } else if (z && contains(this.mWifiDisplayStatus.getAvailableDisplays(), wifiDisplay.getDeviceAddress())) {
            p.setSummary(2131427777);
        }
        if (z) {
            p.setWidgetLayoutResource(2130968722);
        }
        return p;
    }

    public void onResume() {
        super.onResume();
        Context context = getActivity();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED");
        context.registerReceiver(this.mReceiver, filter);
        getContentResolver().registerContentObserver(Secure.getUriFor("wifi_display_on"), false, this.mSettingsObserver);
        this.mDisplayManager.scanWifiDisplays();
        update();
    }

    private void showOptionsDialog(final WifiDisplay wifiDisplay) {
        View view = getActivity().getLayoutInflater().inflate(2130968721, null);
        final EditText nameEditText = (EditText) view.findViewById(2131230834);
        nameEditText.setText(wifiDisplay.getFriendlyDisplayName());
        DialogInterface.OnClickListener done = new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                String name = nameEditText.getText().toString().trim();
                if (name.isEmpty() || name.equals(wifiDisplay.getDeviceName())) {
                    name = null;
                }
                WifiDisplaySettings.this.mDisplayManager.renameWifiDisplay(wifiDisplay.getDeviceAddress(), name);
            }
        };
        new Builder(getActivity()).setCancelable(true).setTitle(2131427781).setView(view).setPositiveButton(2131427783, done).setNegativeButton(2131427782, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                WifiDisplaySettings.this.mDisplayManager.forgetWifiDisplay(wifiDisplay.getDeviceAddress());
            }
        }).create().show();
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        MenuItem item = menu.add(0, 1, 0, this.mWifiDisplayStatus.getScanState() == 1 ? 2131427771 : 2131427770);
        boolean z = this.mWifiDisplayStatus.getFeatureState() == 3 && this.mWifiDisplayStatus.getScanState() == 0;
        item.setEnabled(z);
        item.setShowAsAction(1);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference instanceof WifiDisplayPreference) {
            WifiDisplay display = ((WifiDisplayPreference) preference).getDisplay();
            if (display.equals(this.mWifiDisplayStatus.getActiveDisplay())) {
                showDisconnectDialog(display);
            } else {
                this.mDisplayManager.connectWifiDisplay(display.getDeviceAddress());
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    private static boolean contains(WifiDisplay[] wifiDisplayArr, String str) {
        for (WifiDisplay deviceAddress : wifiDisplayArr) {
            if (deviceAddress.getDeviceAddress().equals(str)) {
                return true;
            }
        }
        return false;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                if (this.mWifiDisplayStatus.getFeatureState() == 3) {
                    this.mDisplayManager.scanWifiDisplays();
                }
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mDisplayManager = (DisplayManager) getActivity().getSystemService("display");
        addPreferencesFromResource(2131034166);
        setHasOptionsMenu(true);
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mReceiver);
        getContentResolver().unregisterContentObserver(this.mSettingsObserver);
    }

    private void showDisconnectDialog(final WifiDisplay wifiDisplay) {
        new Builder(getActivity()).setCancelable(true).setTitle(2131427779).setMessage(Html.fromHtml(getResources().getString(2131427780, new Object[]{wifiDisplay.getFriendlyDisplayName()}))).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (wifiDisplay.equals(WifiDisplaySettings.this.mWifiDisplayStatus.getActiveDisplay())) {
                    WifiDisplaySettings.this.mDisplayManager.disconnectWifiDisplay();
                }
            }
        }).setNegativeButton(17039360, null).create().show();
    }

    private void update() {
        boolean z = false;
        if (Global.getInt(getContentResolver(), "wifi_display_on", 0) != 0) {
            z = true;
        }
        this.mWifiDisplayOnSetting = z;
        this.mWifiDisplayStatus = this.mDisplayManager.getWifiDisplayStatus();
        applyState();
    }

    public void onDestroyView() {
        getActivity().getActionBar().setCustomView(null);
        super.onDestroyView();
    }
}