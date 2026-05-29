package com.jellybyn.settings;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.accessibilityservice.AccessibilityServiceInfo.CapabilityInfo;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.jellybyn.settings.AccessibilitySettings.SettingsContentObserver;
import com.jellybyn.settings.AccessibilitySettings.ToggleFeaturePreferenceFragment;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch.OnBeforeCheckedChangeListener;
import java.util.List;
import java.util.Set;

public class AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment extends ToggleFeaturePreferenceFragment implements OnClickListener {
    private ComponentName mComponentName;
    private final SettingsContentObserver mSettingsContentObserver = new SettingsContentObserver(new Handler()) {
        public void onChange(boolean z, Uri uri) {
            AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.mToggleSwitch.setCheckedInternal(Secure.getString(AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.getContentResolver(), "enabled_accessibility_services").contains(AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.mComponentName.flattenToString()));
        }
    };
    private int mShownDialogId;

    private View createEnableDialogContentView(AccessibilityServiceInfo accessibilityServiceInfo) {
        LayoutInflater inflater = (LayoutInflater) getSystemService("layout_inflater");
        View content = inflater.inflate(2130968630, null);
        ((TextView) content.findViewById(2131230845)).setText(getString(2131428611, new Object[]{accessibilityServiceInfo.getResolveInfo().loadLabel(getPackageManager())}));
        LinearLayout capabilitiesView = (LinearLayout) content.findViewById(2131230846);
        View capabilityView = inflater.inflate(17367085, null);
        ((ImageView) capabilityView.findViewById(16908919)).setImageDrawable(getResources().getDrawable(17302366));
        ((TextView) capabilityView.findViewById(16908923)).setText(getString(2131428612));
        ((TextView) capabilityView.findViewById(16908924)).setText(getString(2131428613));
        List<CapabilityInfo> capabilities = accessibilityServiceInfo.getCapabilityInfos();
        capabilitiesView.addView(capabilityView);
        int capabilityCount = capabilities.size();
        for (int i = 0; i < capabilityCount; i++) {
            CapabilityInfo capabilityInfo = (CapabilityInfo) capabilities.get(i);
            capabilityView = inflater.inflate(17367085, null);
            ((ImageView) capabilityView.findViewById(16908919)).setImageDrawable(getResources().getDrawable(17302366));
            ((TextView) capabilityView.findViewById(16908923)).setText(getString(capabilityInfo.titleResId));
            ((TextView) capabilityView.findViewById(16908924)).setText(getString(capabilityInfo.descResId));
            capabilitiesView.addView(capabilityView);
        }
        return content;
    }

    public void onPreferenceToggled(String str, boolean z) {
        Set<ComponentName> enabledServices = AccessibilitySettings.access$600(getActivity());
        ComponentName toggledService = ComponentName.unflattenFromString(str);
        boolean accessibilityEnabled = false;
        if (!z) {
            enabledServices.remove(toggledService);
            Set access$700 = AccessibilitySettings.access$700();
            for (ComponentName contains : enabledServices) {
                if (access$700.contains(contains)) {
                    accessibilityEnabled = true;
                    break;
                }
            }
        }
        enabledServices.add(toggledService);
        accessibilityEnabled = true;
        StringBuilder enabledServicesBuilder = new StringBuilder();
        for (ComponentName contains2 : enabledServices) {
            enabledServicesBuilder.append(contains2.flattenToString());
            enabledServicesBuilder.append(':');
        }
        int enabledServicesBuilderLength = enabledServicesBuilder.length();
        if (enabledServicesBuilderLength > 0) {
            enabledServicesBuilder.deleteCharAt(enabledServicesBuilderLength - 1);
        }
        Secure.putString(getContentResolver(), "enabled_accessibility_services", enabledServicesBuilder.toString());
        Secure.putInt(getContentResolver(), "accessibility_enabled", accessibilityEnabled ? 1 : 0);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        boolean z = true;
        switch (i) {
            case -2:
                if (this.mShownDialogId != 2) {
                    z = false;
                }
                this.mToggleSwitch.setCheckedInternal(z);
                getArguments().putBoolean("checked", z);
                onPreferenceToggled(this.mPreferenceKey, z);
                return;
            case -1:
                if (this.mShownDialogId != 1) {
                    z = false;
                }
                this.mToggleSwitch.setCheckedInternal(z);
                getArguments().putBoolean("checked", z);
                onPreferenceToggled(this.mPreferenceKey, z);
                return;
            default:
                throw new IllegalArgumentException();
        }
    }

    public Dialog onCreateDialog(int i) {
        AccessibilityServiceInfo info;
        switch (i) {
            case 1:
                this.mShownDialogId = 1;
                info = getAccessibilityServiceInfo();
                if (info == null) {
                    return null;
                }
                return new Builder(getActivity()).setTitle(getString(2131428610, new Object[]{info.getResolveInfo().loadLabel(getPackageManager())})).setIconAttribute(16843605).setView(createEnableDialogContentView(info)).setCancelable(true).setPositiveButton(17039370, this).setNegativeButton(17039360, this).create();
            case 2:
                this.mShownDialogId = 2;
                if (getAccessibilityServiceInfo() == null) {
                    return null;
                }
                return new Builder(getActivity()).setTitle(getString(2131428614, new Object[]{info.getResolveInfo().loadLabel(getPackageManager())})).setIconAttribute(16843605).setMessage(getString(2131428615, new Object[]{info.getResolveInfo().loadLabel(getPackageManager())})).setCancelable(true).setPositiveButton(17039370, this).setNegativeButton(17039360, this).create();
            default:
                throw new IllegalArgumentException();
        }
    }

    protected void onProcessArguments(Bundle bundle) {
        super.onProcessArguments(bundle);
        String settingsTitle = bundle.getString("settings_title");
        String settingsComponentName = bundle.getString("settings_component_name");
        if (!(TextUtils.isEmpty(settingsTitle) || TextUtils.isEmpty(settingsComponentName))) {
            Intent component = new Intent("android.intent.action.MAIN").setComponent(ComponentName.unflattenFromString(settingsComponentName.toString()));
            if (!getPackageManager().queryIntentActivities(component, 0).isEmpty()) {
                this.mSettingsTitle = settingsTitle;
                this.mSettingsIntent = component;
                setHasOptionsMenu(true);
            }
        }
        this.mComponentName = (ComponentName) bundle.getParcelable("component_name");
    }

    private AccessibilityServiceInfo getAccessibilityServiceInfo() {
        List<AccessibilityServiceInfo> serviceInfos = AccessibilityManager.getInstance(getActivity()).getInstalledAccessibilityServiceList();
        int serviceInfoCount = serviceInfos.size();
        for (int i = 0; i < serviceInfoCount; i++) {
            AccessibilityServiceInfo accessibilityServiceInfo = (AccessibilityServiceInfo) serviceInfos.get(i);
            ResolveInfo resolveInfo = accessibilityServiceInfo.getResolveInfo();
            if (this.mComponentName.getPackageName().equals(resolveInfo.serviceInfo.packageName) && this.mComponentName.getClassName().equals(resolveInfo.serviceInfo.name)) {
                return accessibilityServiceInfo;
            }
        }
        return null;
    }

    protected void onInstallActionBarToggleSwitch() {
        super.onInstallActionBarToggleSwitch();
        this.mToggleSwitch.setOnBeforeCheckedChangeListener(new OnBeforeCheckedChangeListener() {
            public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                if (z) {
                    toggleSwitch.setCheckedInternal(false);
                    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.getArguments().putBoolean("checked", false);
                    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.showDialog(1);
                } else {
                    toggleSwitch.setCheckedInternal(true);
                    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.getArguments().putBoolean("checked", true);
                    AccessibilitySettings$ToggleAccessibilityServicePreferenceFragment.this.showDialog(2);
                }
                return true;
            }
        });
    }

    public void onPause() {
        this.mSettingsContentObserver.unregister(getContentResolver());
        super.onPause();
    }

    public void onResume() {
        this.mSettingsContentObserver.register(getContentResolver());
        super.onResume();
    }
}