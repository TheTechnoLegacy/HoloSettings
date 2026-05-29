package com.jellybyn.settings.inputmethod;

import android.content.Context;
import android.hardware.input.InputManager;
import android.hardware.input.InputManager.InputDeviceListener;
import android.hardware.input.KeyboardLayout;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.InputDevice;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map.Entry;

public class KeyboardLayoutPickerFragment extends SettingsPreferenceFragment implements InputDeviceListener {
    private InputManager mIm;
    private String mInputDeviceDescriptor;
    private int mInputDeviceId = -1;
    private KeyboardLayout[] mKeyboardLayouts;
    private HashMap<CheckBoxPreference, KeyboardLayout> mPreferenceMap = new HashMap();

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference instanceof CheckBoxPreference) {
            CheckBoxPreference checkBoxPreference = (CheckBoxPreference) preference;
            KeyboardLayout keyboardLayout = (KeyboardLayout) this.mPreferenceMap.get(checkBoxPreference);
            if (keyboardLayout != null) {
                if (checkBoxPreference.isChecked()) {
                    this.mIm.addKeyboardLayoutForInputDevice(this.mInputDeviceDescriptor, keyboardLayout.getDescriptor());
                } else {
                    this.mIm.removeKeyboardLayoutForInputDevice(this.mInputDeviceDescriptor, keyboardLayout.getDescriptor());
                }
                return true;
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    private PreferenceScreen createPreferenceHierarchy() {
        PreferenceScreen root = getPreferenceManager().createPreferenceScreen(getActivity());
        Context context = getActivity();
        for (KeyboardLayout keyboardLayout : this.mKeyboardLayouts) {
            CheckBoxPreference checkBoxPreference = new CheckBoxPreference(context);
            checkBoxPreference.setTitle(keyboardLayout.getLabel());
            checkBoxPreference.setSummary(keyboardLayout.getCollection());
            root.addPreference(checkBoxPreference);
            this.mPreferenceMap.put(checkBoxPreference, keyboardLayout);
        }
        return root;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mInputDeviceDescriptor = getActivity().getIntent().getStringExtra("input_device_descriptor");
        if (this.mInputDeviceDescriptor == null) {
            getActivity().finish();
        }
        this.mIm = (InputManager) getSystemService("input");
        this.mKeyboardLayouts = this.mIm.getKeyboardLayouts();
        Arrays.sort(this.mKeyboardLayouts);
        setPreferenceScreen(createPreferenceHierarchy());
    }

    public void onResume() {
        super.onResume();
        this.mIm.registerInputDeviceListener(this, null);
        InputDevice inputDevice = this.mIm.getInputDeviceByDescriptor(this.mInputDeviceDescriptor);
        if (inputDevice == null) {
            getActivity().finish();
            return;
        }
        this.mInputDeviceId = inputDevice.getId();
        updateCheckedState();
    }

    private void updateCheckedState() {
        String[] enabledKeyboardLayouts = this.mIm.getKeyboardLayoutsForInputDevice(this.mInputDeviceDescriptor);
        Arrays.sort(enabledKeyboardLayouts);
        for (Entry entry : this.mPreferenceMap.entrySet()) {
            ((CheckBoxPreference) entry.getKey()).setChecked(Arrays.binarySearch(enabledKeyboardLayouts, ((KeyboardLayout) entry.getValue()).getDescriptor()) >= 0);
        }
    }

    public void onPause() {
        this.mIm.unregisterInputDeviceListener(this);
        this.mInputDeviceId = -1;
        super.onPause();
    }

    public void onInputDeviceChanged(int i) {
        if (this.mInputDeviceId >= 0 && i == this.mInputDeviceId) {
            updateCheckedState();
        }
    }

    public void onInputDeviceRemoved(int i) {
        if (this.mInputDeviceId >= 0 && i == this.mInputDeviceId) {
            getActivity().finish();
        }
    }

    public void onInputDeviceAdded(int i) {
    }
}