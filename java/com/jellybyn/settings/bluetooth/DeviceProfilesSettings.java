package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.app.Dialog;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.EditTextPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.text.Html;
import android.text.TextUtils;
import android.util.Log;
import android.widget.EditText;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.bluetooth.CachedBluetoothDevice.Callback;
import java.util.HashMap;

public final class DeviceProfilesSettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener, Callback {
    private final HashMap<LocalBluetoothProfile, CheckBoxPreference> mAutoConnectPrefs = new HashMap();
    private CachedBluetoothDevice mCachedDevice;
    private EditTextPreference mDeviceNamePref;
    private AlertDialog mDisconnectDialog;
    private LocalBluetoothManager mManager;
    private PreferenceGroup mProfileContainer;
    private boolean mProfileGroupIsRemoved;
    private LocalBluetoothProfileManager mProfileManager;
    private RenameEditTextPreference mRenameDeviceNamePref;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        BluetoothDevice device = bundle != null ? (BluetoothDevice) bundle.getParcelable("device") : (BluetoothDevice) getArguments().getParcelable("device");
        addPreferencesFromResource(2131034120);
        getPreferenceScreen().setOrderingAsAdded(false);
        this.mProfileContainer = (PreferenceGroup) findPreference("profile_container");
        this.mDeviceNamePref = (EditTextPreference) findPreference("rename_device");
        if (device == null) {
            Log.w("DeviceProfilesSettings", "Activity started without a remote Bluetooth device");
            finish();
            return;
        }
        this.mRenameDeviceNamePref = new RenameEditTextPreference(this, null);
        this.mManager = LocalBluetoothManager.getInstance(getActivity());
        CachedBluetoothDeviceManager deviceManager = this.mManager.getCachedDeviceManager();
        this.mProfileManager = this.mManager.getProfileManager();
        this.mCachedDevice = deviceManager.findDevice(device);
        if (this.mCachedDevice == null) {
            Log.w("DeviceProfilesSettings", "Device not found, cannot connect to it");
            finish();
            return;
        }
        String deviceName = this.mCachedDevice.getName();
        this.mDeviceNamePref.setSummary(deviceName);
        this.mDeviceNamePref.setText(deviceName);
        this.mDeviceNamePref.setOnPreferenceChangeListener(this);
        addPreferencesForProfiles();
    }

    public void onResume() {
        super.onResume();
        this.mManager.setForegroundActivity(getActivity());
        this.mCachedDevice.registerCallback(this);
        if (this.mCachedDevice.getBondState() == 10) {
            finish();
        }
        refresh();
        EditText et = this.mDeviceNamePref.getEditText();
        if (et != null) {
            et.addTextChangedListener(this.mRenameDeviceNamePref);
            Dialog dialog = this.mDeviceNamePref.getDialog();
            if (dialog instanceof AlertDialog) {
                ((AlertDialog) dialog).getButton(-1).setEnabled(et.getText().length() > 0);
            }
        }
    }

    private void refreshProfiles() {
        for (LocalBluetoothProfile localBluetoothProfile : this.mCachedDevice.getConnectableProfiles()) {
            CheckBoxPreference checkBoxPreference = (CheckBoxPreference) findPreference(localBluetoothProfile.toString());
            if (checkBoxPreference == null) {
                this.mProfileContainer.addPreference(createProfilePreference(localBluetoothProfile));
            } else {
                refreshProfilePreference(checkBoxPreference, localBluetoothProfile);
            }
        }
        for (LocalBluetoothProfile localBluetoothProfile2 : this.mCachedDevice.getRemovedProfiles()) {
            Preference findPreference = findPreference(localBluetoothProfile2.toString());
            if (findPreference != null) {
                Log.d("DeviceProfilesSettings", "Removing " + localBluetoothProfile2.toString() + " from profile list");
                this.mProfileContainer.removePreference(findPreference);
            }
        }
        showOrHideProfileGroup();
    }

    private CheckBoxPreference createProfilePreference(LocalBluetoothProfile localBluetoothProfile) {
        boolean z = false;
        CheckBoxPreference pref = new CheckBoxPreference(getActivity());
        pref.setKey(localBluetoothProfile.toString());
        pref.setTitle(localBluetoothProfile.getNameResource(this.mCachedDevice.getDevice()));
        pref.setPersistent(false);
        pref.setOrder(getProfilePreferenceIndex(localBluetoothProfile.getOrdinal()));
        pref.setOnPreferenceChangeListener(this);
        int iconResource = localBluetoothProfile.getDrawableResource(this.mCachedDevice.getBtClass());
        if (iconResource != 0) {
            pref.setIcon(getResources().getDrawable(iconResource));
        }
        if (!this.mCachedDevice.isBusy()) {
            z = true;
        }
        pref.setEnabled(z);
        refreshProfilePreference(pref, localBluetoothProfile);
        return pref;
    }

    private void onProfileClicked(LocalBluetoothProfile localBluetoothProfile, CheckBoxPreference checkBoxPreference) {
        BluetoothDevice device = this.mCachedDevice.getDevice();
        if (localBluetoothProfile.getConnectionStatus(device) == 2) {
            askDisconnect(getActivity(), localBluetoothProfile);
        } else if (localBluetoothProfile.isPreferred(device)) {
            localBluetoothProfile.setPreferred(device, false);
            refreshProfilePreference(checkBoxPreference, localBluetoothProfile);
        } else {
            localBluetoothProfile.setPreferred(device, true);
            this.mCachedDevice.connectProfile(localBluetoothProfile);
        }
    }

    private void askDisconnect(Context context, LocalBluetoothProfile localBluetoothProfile) {
        CachedBluetoothDevice device = this.mCachedDevice;
        String name = device.getName();
        if (TextUtils.isEmpty(name)) {
            name = context.getString(2131427450);
        }
        String profileName = context.getString(localBluetoothProfile.getNameResource(device.getDevice()));
        String title = context.getString(2131427439);
        String message = context.getString(2131427440, new Object[]{profileName, name});
        this.mDisconnectDialog = Utils.showDisconnectDialog(context, this.mDisconnectDialog, new 1(this, device, localBluetoothProfile), title, Html.fromHtml(message));
    }

    private void showOrHideProfileGroup() {
        int numProfiles = this.mProfileContainer.getPreferenceCount();
        if (!this.mProfileGroupIsRemoved && numProfiles == 0) {
            getPreferenceScreen().removePreference(this.mProfileContainer);
            this.mProfileGroupIsRemoved = true;
        } else if (this.mProfileGroupIsRemoved && numProfiles != 0) {
            getPreferenceScreen().addPreference(this.mProfileContainer);
            this.mProfileGroupIsRemoved = false;
        }
    }

    private LocalBluetoothProfile getProfileOf(Preference preference) {
        LocalBluetoothProfile localBluetoothProfile = null;
        if (!(preference instanceof CheckBoxPreference) || TextUtils.isEmpty(preference.getKey())) {
            return localBluetoothProfile;
        }
        try {
            return this.mProfileManager.getProfileByName(preference.getKey());
        } catch (IllegalArgumentException e) {
            return localBluetoothProfile;
        }
    }

    private void refreshProfilePreference(CheckBoxPreference checkBoxPreference, LocalBluetoothProfile localBluetoothProfile) {
        BluetoothDevice device = this.mCachedDevice.getDevice();
        checkBoxPreference.setEnabled(!this.mCachedDevice.isBusy());
        checkBoxPreference.setChecked(localBluetoothProfile.isPreferred(device));
        checkBoxPreference.setSummary(localBluetoothProfile.getSummaryResourceForDevice(device));
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference == this.mDeviceNamePref) {
            this.mCachedDevice.setName((String) obj);
            return true;
        } else if (!(preference instanceof CheckBoxPreference)) {
            return false;
        } else {
            onProfileClicked(getProfileOf(preference), (CheckBoxPreference) preference);
            return false;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!preference.getKey().equals("unpair")) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        }
        unpairDevice();
        finish();
        return true;
    }

    private void addPreferencesForProfiles() {
        for (LocalBluetoothProfile createProfilePreference : this.mCachedDevice.getConnectableProfiles()) {
            this.mProfileContainer.addPreference(createProfilePreference(createProfilePreference));
        }
        showOrHideProfileGroup();
    }

    private void refresh() {
        String deviceName = this.mCachedDevice.getName();
        this.mDeviceNamePref.setSummary(deviceName);
        this.mDeviceNamePref.setText(deviceName);
        refreshProfiles();
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mDisconnectDialog != null) {
            this.mDisconnectDialog.dismiss();
            this.mDisconnectDialog = null;
        }
    }

    public void onPause() {
        super.onPause();
        this.mCachedDevice.unregisterCallback(this);
        this.mManager.setForegroundActivity(null);
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("device", this.mCachedDevice.getDevice());
    }

    private void unpairDevice() {
        this.mCachedDevice.unpair();
    }

    public void onDeviceAttributesChanged() {
        refresh();
    }

    private int getProfilePreferenceIndex(int i) {
        return this.mProfileContainer.getOrder() + (i * 10);
    }
}