package com.jellybyn.settings;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.accessibilityservice.AccessibilityServiceInfo.CapabilityInfo;
import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.ActivityManagerNative;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Configuration;
import android.database.ContentObserver;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.provider.Settings.Secure;
import android.text.TextUtils;
import android.text.TextUtils.SimpleStringSplitter;
import android.view.KeyCharacterMap;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import com.android.internal.content.PackageMonitor;
import com.android.internal.view.RotationPolicy;
import com.android.internal.view.RotationPolicy.RotationPolicyListener;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AccessibilitySettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener, DialogCreatable {
    private static final Set<ComponentName> sInstalledServices = new HashSet();
    private static final SimpleStringSplitter sStringColonSplitter = new SimpleStringSplitter(':');
    private final Configuration mCurConfig = new Configuration();
    private PreferenceScreen mDisplayMagnificationPreferenceScreen;
    private PreferenceScreen mGlobalGesturePreferenceScreen;
    private final Handler mHandler = new Handler() {
        public void dispatchMessage(Message message) {
            super.dispatchMessage(message);
            AccessibilitySettings.this.loadInstalledServices();
            AccessibilitySettings.this.updateServicesPreferences();
        }
    };
    private int mLongPressTimeoutDefault;
    private final Map<String, String> mLongPressTimeoutValuetoTitleMap = new HashMap();
    private Preference mNoServicesMessagePreference;
    private final RotationPolicyListener mRotationPolicyListener = /* anonymous class already generated */;
    private ListPreference mSelectLongPressTimeoutPreference;
    private PreferenceCategory mServicesCategory;
    private final SettingsContentObserver mSettingsContentObserver = new SettingsContentObserver(this.mHandler) {
        public void onChange(boolean z, Uri uri) {
            AccessibilitySettings.this.loadInstalledServices();
            AccessibilitySettings.this.updateServicesPreferences();
        }
    };
    private final PackageMonitor mSettingsPackageMonitor = new SettingsPackageMonitor(this, null);
    private PreferenceCategory mSystemsCategory;
    private CheckBoxPreference mToggleLargeTextPreference;
    private CheckBoxPreference mToggleLockScreenRotationPreference;
    private CheckBoxPreference mTogglePowerButtonEndsCallPreference;
    private CheckBoxPreference mToggleSpeakPasswordPreference;

    private static abstract class SettingsContentObserver extends ContentObserver {
        public void register(ContentResolver contentResolver) {
            contentResolver.registerContentObserver(Secure.getUriFor("accessibility_enabled"), false, this);
            contentResolver.registerContentObserver(Secure.getUriFor("enabled_accessibility_services"), false, this);
        }

        public SettingsContentObserver(Handler handler) {
        }

        public void unregister(ContentResolver contentResolver) {
            contentResolver.unregisterContentObserver(this);
        }
    }

    private class SettingsPackageMonitor extends PackageMonitor {
        public void onPackageAdded(String str, int i) {
            AccessibilitySettings.this.mHandler.sendMessageDelayed(AccessibilitySettings.this.mHandler.obtainMessage(), 1000);
        }

        public void onPackageAppeared(String str, int i) {
            AccessibilitySettings.this.mHandler.sendMessageDelayed(AccessibilitySettings.this.mHandler.obtainMessage(), 1000);
        }

        public void onPackageDisappeared(String str, int i) {
            AccessibilitySettings.this.mHandler.sendMessageDelayed(AccessibilitySettings.this.mHandler.obtainMessage(), 1000);
        }

        public void onPackageRemoved(String str, int i) {
            AccessibilitySettings.this.mHandler.sendMessageDelayed(AccessibilitySettings.this.mHandler.obtainMessage(), 1000);
        }

        private SettingsPackageMonitor() {
        }

        /* synthetic */ SettingsPackageMonitor(AccessibilitySettings accessibilitySettings, AnonymousClass1 anonymousClass1) {
            /* anonymous class already generated */;
        }
    }

    public static abstract class ToggleFeaturePreferenceFragment extends SettingsPreferenceFragment {
        private CharSequence mOldActivityTitle;
        protected String mPreferenceKey;
        protected Intent mSettingsIntent;
        protected CharSequence mSettingsTitle;
        protected Preference mSummaryPreference;
        protected ToggleSwitch mToggleSwitch;

        protected void onProcessArguments(Bundle bundle) {
            this.mPreferenceKey = bundle.getString("preference_key");
            this.mToggleSwitch.setCheckedInternal(bundle.getBoolean("checked"));
            PreferenceActivity activity = (PreferenceActivity) getActivity();
            if (!activity.onIsMultiPane() || activity.onIsHidingHeaders()) {
                this.mOldActivityTitle = getActivity().getTitle();
                getActivity().getActionBar().setTitle(bundle.getString("title"));
            }
            this.mSummaryPreference.setSummary(bundle.getCharSequence("summary"));
        }

        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            PreferenceScreen preferenceScreen = getPreferenceManager().createPreferenceScreen(getActivity());
            setPreferenceScreen(preferenceScreen);
            this.mSummaryPreference = new Preference(getActivity()) {
                private void sendAccessibilityEvent(View view) {
                    AccessibilityManager accessibilityManager = AccessibilityManager.getInstance(ToggleFeaturePreferenceFragment.this.getActivity());
                    if (accessibilityManager.isEnabled()) {
                        AccessibilityEvent obtain = AccessibilityEvent.obtain();
                        obtain.setEventType(8);
                        view.onInitializeAccessibilityEvent(obtain);
                        view.dispatchPopulateAccessibilityEvent(obtain);
                        accessibilityManager.sendAccessibilityEvent(obtain);
                    }
                }

                protected void onBindView(View view) {
                    super.onBindView(view);
                    TextView summaryView = (TextView) view.findViewById(2131230917);
                    summaryView.setText(getSummary());
                    sendAccessibilityEvent(summaryView);
                }
            };
            this.mSummaryPreference.setPersistent(false);
            this.mSummaryPreference.setLayoutResource(2130968696);
            preferenceScreen.addPreference(this.mSummaryPreference);
        }

        private ToggleSwitch createAndAddActionBarToggleSwitch(Activity activity) {
            ToggleSwitch toggleSwitch = new ToggleSwitch(activity);
            toggleSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
            activity.getActionBar().setDisplayOptions(16, 16);
            activity.getActionBar().setCustomView(toggleSwitch, new LayoutParams(-2, -2, 8388629));
            return toggleSwitch;
        }

        public void onDestroyView() {
            getActivity().getActionBar().setCustomView(null);
            if (this.mOldActivityTitle != null) {
                getActivity().getActionBar().setTitle(this.mOldActivityTitle);
            }
            this.mToggleSwitch.setOnBeforeCheckedChangeListener(null);
            super.onDestroyView();
        }

        public void onViewCreated(View view, Bundle bundle) {
            super.onViewCreated(view, bundle);
            onInstallActionBarToggleSwitch();
            onProcessArguments(getArguments());
            getListView().setSelector(new ColorDrawable(0));
            getListView().setDivider(null);
        }

        public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
            super.onCreateOptionsMenu(menu, menuInflater);
            MenuItem menuItem = menu.add(this.mSettingsTitle);
            menuItem.setShowAsAction(1);
            menuItem.setIntent(this.mSettingsIntent);
        }

        protected void onInstallActionBarToggleSwitch() {
            this.mToggleSwitch = createAndAddActionBarToggleSwitch(getActivity());
        }
    }

    public static class ToggleAccessibilityServicePreferenceFragment extends ToggleFeaturePreferenceFragment implements OnClickListener {
        private ComponentName mComponentName;
        private final SettingsContentObserver mSettingsContentObserver = new SettingsContentObserver(new Handler()) {
            public void onChange(boolean z, Uri uri) {
                ToggleAccessibilityServicePreferenceFragment.this.mToggleSwitch.setCheckedInternal(Secure.getString(ToggleAccessibilityServicePreferenceFragment.this.getContentResolver(), "enabled_accessibility_services").contains(ToggleAccessibilityServicePreferenceFragment.this.mComponentName.flattenToString()));
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
            Set<ComponentName> enabledServices = AccessibilitySettings.getEnabledServicesFromSettings(getActivity());
            ComponentName toggledService = ComponentName.unflattenFromString(str);
            boolean accessibilityEnabled = false;
            if (!z) {
                enabledServices.remove(toggledService);
                Set access$700 = AccessibilitySettings.sInstalledServices;
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
                        ToggleAccessibilityServicePreferenceFragment.this.getArguments().putBoolean("checked", false);
                        ToggleAccessibilityServicePreferenceFragment.this.showDialog(1);
                    } else {
                        toggleSwitch.setCheckedInternal(true);
                        ToggleAccessibilityServicePreferenceFragment.this.getArguments().putBoolean("checked", true);
                        ToggleAccessibilityServicePreferenceFragment.this.showDialog(2);
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

    public static class ToggleGlobalGesturePreferenceFragment extends ToggleFeaturePreferenceFragment {
        protected void onInstallActionBarToggleSwitch() {
            super.onInstallActionBarToggleSwitch();
            this.mToggleSwitch.setOnBeforeCheckedChangeListener(new OnBeforeCheckedChangeListener() {
                public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                    toggleSwitch.setCheckedInternal(z);
                    ToggleGlobalGesturePreferenceFragment.this.getArguments().putBoolean("checked", z);
                    ToggleGlobalGesturePreferenceFragment.this.onPreferenceToggled(ToggleGlobalGesturePreferenceFragment.this.mPreferenceKey, z);
                    return false;
                }
            });
        }

        protected void onPreferenceToggled(String str, boolean z) {
            Secure.putInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", z ? 1 : 0);
        }
    }

    public static class ToggleScreenMagnificationPreferenceFragment extends ToggleFeaturePreferenceFragment {
        protected void onInstallActionBarToggleSwitch() {
            super.onInstallActionBarToggleSwitch();
            this.mToggleSwitch.setOnBeforeCheckedChangeListener(new OnBeforeCheckedChangeListener() {
                public boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                    toggleSwitch.setCheckedInternal(z);
                    ToggleScreenMagnificationPreferenceFragment.this.getArguments().putBoolean("checked", z);
                    ToggleScreenMagnificationPreferenceFragment.this.onPreferenceToggled(ToggleScreenMagnificationPreferenceFragment.this.mPreferenceKey, z);
                    return false;
                }
            });
        }

        protected void onPreferenceToggled(String str, boolean z) {
            Secure.putInt(getContentResolver(), "accessibility_display_magnification_enabled", z ? 1 : 0);
        }
    }

    public static class ToggleSwitch extends Switch {
        private OnBeforeCheckedChangeListener mOnBeforeListener;

        public interface OnBeforeCheckedChangeListener {
            boolean onBeforeCheckedChanged(ToggleSwitch toggleSwitch, boolean z);
        }

        public void setChecked(boolean z) {
            if (this.mOnBeforeListener == null || !this.mOnBeforeListener.onBeforeCheckedChanged(this, z)) {
                super.setChecked(z);
            }
        }

        public ToggleSwitch(Context context) {
            super(context);
        }

        public void setCheckedInternal(boolean z) {
            super.setChecked(z);
        }

        public void setOnBeforeCheckedChangeListener(OnBeforeCheckedChangeListener onBeforeCheckedChangeListener) {
            this.mOnBeforeListener = onBeforeCheckedChangeListener;
        }
    }

    private void updateServicesPreferences() {
        this.mServicesCategory.removeAll();
        List installedAccessibilityServiceList = AccessibilityManager.getInstance(getActivity()).getInstalledAccessibilityServiceList();
        Set enabledServicesFromSettings = getEnabledServicesFromSettings(getActivity());
        boolean z = Secure.getInt(getContentResolver(), "accessibility_enabled", 0) == 1;
        int size = installedAccessibilityServiceList.size();
        for (int i = 0; i < size; i++) {
            AccessibilityServiceInfo accessibilityServiceInfo = (AccessibilityServiceInfo) installedAccessibilityServiceList.get(i);
            PreferenceScreen createPreferenceScreen = getPreferenceManager().createPreferenceScreen(getActivity());
            String obj = accessibilityServiceInfo.getResolveInfo().loadLabel(getPackageManager()).toString();
            ServiceInfo serviceInfo = accessibilityServiceInfo.getResolveInfo().serviceInfo;
            ComponentName componentName = new ComponentName(serviceInfo.packageName, serviceInfo.name);
            createPreferenceScreen.setKey(componentName.flattenToString());
            createPreferenceScreen.setTitle(obj);
            boolean z2 = z && enabledServicesFromSettings.contains(componentName);
            if (z2) {
                createPreferenceScreen.setSummary(getString(2131428608));
            } else {
                createPreferenceScreen.setSummary(getString(2131428609));
            }
            createPreferenceScreen.setOrder(i);
            createPreferenceScreen.setFragment(ToggleAccessibilityServicePreferenceFragment.class.getName());
            createPreferenceScreen.setPersistent(true);
            Bundle extras = createPreferenceScreen.getExtras();
            extras.putString("preference_key", createPreferenceScreen.getKey());
            extras.putBoolean("checked", z2);
            extras.putString("title", obj);
            String loadDescription = accessibilityServiceInfo.loadDescription(getPackageManager());
            if (TextUtils.isEmpty(loadDescription)) {
                loadDescription = getString(2131428619);
            }
            extras.putString("summary", loadDescription);
            loadDescription = accessibilityServiceInfo.getSettingsActivityName();
            if (!TextUtils.isEmpty(loadDescription)) {
                extras.putString("settings_title", getString(2131428607));
                extras.putString("settings_component_name", new ComponentName(accessibilityServiceInfo.getResolveInfo().serviceInfo.packageName, loadDescription).flattenToString());
            }
            extras.putParcelable("component_name", componentName);
            this.mServicesCategory.addPreference(createPreferenceScreen);
        }
        if (this.mServicesCategory.getPreferenceCount() == 0) {
            if (this.mNoServicesMessagePreference == null) {
                this.mNoServicesMessagePreference = new Preference(getActivity()) {
                    protected void onBindView(View view) {
                        super.onBindView(view);
                        ((TextView) view.findViewById(2131230917)).setText(AccessibilitySettings.this.getString(2131428616));
                    }
                };
                this.mNoServicesMessagePreference.setPersistent(false);
                this.mNoServicesMessagePreference.setLayoutResource(2130968696);
                this.mNoServicesMessagePreference.setSelectable(false);
            }
            this.mServicesCategory.addPreference(this.mNoServicesMessagePreference);
        }
    }

    private void updateSystemPreferences() {
        try {
            this.mCurConfig.updateFrom(ActivityManagerNative.getDefault().getConfiguration());
        } catch (RemoteException e) {
        }
        this.mToggleLargeTextPreference.setChecked(this.mCurConfig.fontScale == 1.3f);
        if (KeyCharacterMap.deviceHasKey(26) && Utils.isVoiceCapable(getActivity())) {
            this.mTogglePowerButtonEndsCallPreference.setChecked(Secure.getInt(getContentResolver(), "incall_power_button_behavior", 1) == 2);
        }
        updateLockScreenRotationCheckbox();
        this.mToggleSpeakPasswordPreference.setChecked(Secure.getInt(getContentResolver(), "speak_password", 0) != 0);
        String valueOf = String.valueOf(Secure.getInt(getContentResolver(), "long_press_timeout", this.mLongPressTimeoutDefault));
        this.mSelectLongPressTimeoutPreference.setValue(valueOf);
        this.mSelectLongPressTimeoutPreference.setSummary((CharSequence) this.mLongPressTimeoutValuetoTitleMap.get(valueOf));
        if ((Secure.getInt(getContentResolver(), "accessibility_display_magnification_enabled", 0) == 1 ? 1 : 0) != 0) {
            this.mDisplayMagnificationPreferenceScreen.setSummary(2131428608);
        } else {
            this.mDisplayMagnificationPreferenceScreen.setSummary(2131428609);
        }
        if ((Secure.getInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) == 1 ? 1 : 0) != 0) {
            this.mGlobalGesturePreferenceScreen.setSummary(2131428597);
        } else {
            this.mGlobalGesturePreferenceScreen.setSummary(2131428598);
        }
    }

    private void initializeAllPreferences() {
        this.mServicesCategory = (PreferenceCategory) findPreference("services_category");
        this.mSystemsCategory = (PreferenceCategory) findPreference("system_category");
        this.mToggleLargeTextPreference = (CheckBoxPreference) findPreference("toggle_large_text_preference");
        this.mTogglePowerButtonEndsCallPreference = (CheckBoxPreference) findPreference("toggle_power_button_ends_call_preference");
        if (!(KeyCharacterMap.deviceHasKey(26) && Utils.isVoiceCapable(getActivity()))) {
            this.mSystemsCategory.removePreference(this.mTogglePowerButtonEndsCallPreference);
        }
        this.mToggleLockScreenRotationPreference = (CheckBoxPreference) findPreference("toggle_lock_screen_rotation_preference");
        this.mToggleSpeakPasswordPreference = (CheckBoxPreference) findPreference("toggle_speak_password_preference");
        this.mSelectLongPressTimeoutPreference = (ListPreference) findPreference("select_long_press_timeout_preference");
        this.mSelectLongPressTimeoutPreference.setOnPreferenceChangeListener(this);
        if (this.mLongPressTimeoutValuetoTitleMap.size() == 0) {
            String[] stringArray = getResources().getStringArray(2131165239);
            this.mLongPressTimeoutDefault = Integer.parseInt(stringArray[0]);
            String[] stringArray2 = getResources().getStringArray(2131165238);
            int length = stringArray.length;
            for (int i = 0; i < length; i++) {
                this.mLongPressTimeoutValuetoTitleMap.put(stringArray[i], stringArray2[i]);
            }
        }
        this.mDisplayMagnificationPreferenceScreen = (PreferenceScreen) findPreference("screen_magnification_preference_screen");
        this.mGlobalGesturePreferenceScreen = (PreferenceScreen) findPreference("enable_global_gesture_preference_screen");
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (this.mToggleLargeTextPreference == preference) {
            handleToggleLargeTextPreferenceClick();
            return true;
        } else if (this.mTogglePowerButtonEndsCallPreference == preference) {
            handleTogglePowerButtonEndsCallPreferenceClick();
            return true;
        } else if (this.mToggleLockScreenRotationPreference == preference) {
            handleLockScreenRotationPreferenceClick();
            return true;
        } else if (this.mToggleSpeakPasswordPreference == preference) {
            handleToggleSpeakPasswordPreferenceClick();
            return true;
        } else if (this.mGlobalGesturePreferenceScreen == preference) {
            handleTogglEnableAccessibilityGesturePreferenceClick();
            return true;
        } else if (this.mDisplayMagnificationPreferenceScreen != preference) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        } else {
            handleDisplayMagnificationPreferenceScreenClick();
            return true;
        }
    }

    private static Set<ComponentName> getEnabledServicesFromSettings(Context context) {
        String enabledServicesSetting = Secure.getString(context.getContentResolver(), "enabled_accessibility_services");
        if (enabledServicesSetting == null) {
            enabledServicesSetting = "";
        }
        Set<ComponentName> enabledServices = new HashSet();
        SimpleStringSplitter colonSplitter = sStringColonSplitter;
        colonSplitter.setString(enabledServicesSetting);
        while (colonSplitter.hasNext()) {
            ComponentName unflattenFromString = ComponentName.unflattenFromString(colonSplitter.next());
            if (unflattenFromString != null) {
                enabledServices.add(unflattenFromString);
            }
        }
        return enabledServices;
    }

    private void offerInstallAccessibilitySerivceOnce() {
        if (this.mServicesCategory.getPreference(0) == this.mNoServicesMessagePreference) {
            SharedPreferences preferences = getActivity().getPreferences(0);
            if (!preferences.getBoolean("key_install_accessibility_service_offered_once", false)) {
                if (getPackageManager().resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse(SystemProperties.get("ro.screenreader.market", "market://search?q=pname:com.google.android.marvin.talkback"))), 0) != null) {
                    preferences.edit().putBoolean("key_install_accessibility_service_offered_once", true).commit();
                    showDialog(1);
                }
            }
        }
    }

    private void loadInstalledServices() {
        Set<ComponentName> installedServices = sInstalledServices;
        installedServices.clear();
        List<AccessibilityServiceInfo> installedServiceInfos = AccessibilityManager.getInstance(getActivity()).getInstalledAccessibilityServiceList();
        if (installedServiceInfos != null) {
            int installedServiceInfoCount = installedServiceInfos.size();
            for (int i = 0; i < installedServiceInfoCount; i++) {
                ResolveInfo resolveInfo = ((AccessibilityServiceInfo) installedServiceInfos.get(i)).getResolveInfo();
                installedServices.add(new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name));
            }
        }
    }

    public void onResume() {
        super.onResume();
        loadInstalledServices();
        updateAllPreferences();
        offerInstallAccessibilitySerivceOnce();
        this.mSettingsPackageMonitor.register(getActivity(), getActivity().getMainLooper(), false);
        this.mSettingsContentObserver.register(getContentResolver());
        RotationPolicy.registerRotationPolicyListener(getActivity(), this.mRotationPolicyListener);
    }

    private void handleDisplayMagnificationPreferenceScreenClick() {
        boolean z = true;
        Bundle extras = this.mDisplayMagnificationPreferenceScreen.getExtras();
        extras.putString("title", getString(2131428594));
        extras.putCharSequence("summary", getActivity().getResources().getText(2131428595));
        String str = "checked";
        if (Secure.getInt(getContentResolver(), "accessibility_display_magnification_enabled", 0) != 1) {
            z = false;
        }
        extras.putBoolean(str, z);
        super.onPreferenceTreeClick(this.mDisplayMagnificationPreferenceScreen, this.mDisplayMagnificationPreferenceScreen);
    }

    private void handleTogglEnableAccessibilityGesturePreferenceClick() {
        boolean z = true;
        Bundle extras = this.mGlobalGesturePreferenceScreen.getExtras();
        extras.putString("title", getString(2131428596));
        extras.putString("summary", getString(2131428599));
        String str = "checked";
        if (Secure.getInt(getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) != 1) {
            z = false;
        }
        extras.putBoolean(str, z);
        super.onPreferenceTreeClick(this.mGlobalGesturePreferenceScreen, this.mGlobalGesturePreferenceScreen);
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference != this.mSelectLongPressTimeoutPreference) {
            return false;
        }
        String str = (String) obj;
        Secure.putInt(getContentResolver(), "long_press_timeout", Integer.parseInt(str));
        this.mSelectLongPressTimeoutPreference.setSummary((CharSequence) this.mLongPressTimeoutValuetoTitleMap.get(str));
        return true;
    }

    private void handleToggleLargeTextPreferenceClick() {
        try {
            this.mCurConfig.fontScale = this.mToggleLargeTextPreference.isChecked() ? 1.3f : 1.0f;
            ActivityManagerNative.getDefault().updatePersistentConfiguration(this.mCurConfig);
        } catch (RemoteException e) {
        }
    }

    private void updateLockScreenRotationCheckbox() {
        Context context = getActivity();
        if (context != null) {
            this.mToggleLockScreenRotationPreference.setChecked(!RotationPolicy.isRotationLocked(context));
        }
    }

    public void onPause() {
        this.mSettingsPackageMonitor.unregister();
        RotationPolicy.unregisterRotationPolicyListener(getActivity(), this.mRotationPolicyListener);
        this.mSettingsContentObserver.unregister(getContentResolver());
        super.onPause();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034112);
        initializeAllPreferences();
    }

    public Dialog onCreateDialog(int i) {
        switch (i) {
            case 1:
                return new Builder(getActivity()).setTitle(2131428617).setMessage(2131428618).setPositiveButton(17039370, /* anonymous class already generated */).setNegativeButton(17039360, null).create();
            default:
                return null;
        }
    }

    private void handleLockScreenRotationPreferenceClick() {
        RotationPolicy.setRotationLockForAccessibility(getActivity(), !this.mToggleLockScreenRotationPreference.isChecked());
    }

    private void handleTogglePowerButtonEndsCallPreferenceClick() {
        Secure.putInt(getContentResolver(), "incall_power_button_behavior", this.mTogglePowerButtonEndsCallPreference.isChecked() ? 2 : 1);
    }

    private void handleToggleSpeakPasswordPreferenceClick() {
        Secure.putInt(getContentResolver(), "speak_password", this.mToggleSpeakPasswordPreference.isChecked() ? 1 : 0);
    }

    private void updateAllPreferences() {
        updateServicesPreferences();
        updateSystemPreferences();
    }
}