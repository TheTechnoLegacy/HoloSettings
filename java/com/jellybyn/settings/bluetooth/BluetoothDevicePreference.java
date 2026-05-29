package com.jellybyn.settings.bluetooth;

import android.app.AlertDialog;
import android.bluetooth.BluetoothClass;
import android.content.Context;
import android.os.UserManager;
import android.preference.Preference;
import android.text.Html;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import com.jellybyn.settings.bluetooth.CachedBluetoothDevice.Callback;

public final class BluetoothDevicePreference extends Preference implements OnClickListener, Callback {
    private static int sDimAlpha = Integer.MIN_VALUE;
    private final CachedBluetoothDevice mCachedDevice;
    private AlertDialog mDisconnectDialog;
    private OnClickListener mOnSettingsClickListener;

    private int getConnectionSummary() {
        CachedBluetoothDevice cachedDevice = this.mCachedDevice;
        boolean profileConnected = false;
        boolean a2dpNotConnected = false;
        boolean headsetNotConnected = false;
        for (LocalBluetoothProfile localBluetoothProfile : cachedDevice.getProfiles()) {
            int profileConnectionState = cachedDevice.getProfileConnectionState(localBluetoothProfile);
            switch (profileConnectionState) {
                case 0:
                    if (localBluetoothProfile.isProfileReady() && localBluetoothProfile.isPreferred(cachedDevice.getDevice())) {
                        if (!(localBluetoothProfile instanceof A2dpProfile)) {
                            if (!(localBluetoothProfile instanceof HeadsetProfile)) {
                                break;
                            }
                            headsetNotConnected = true;
                            break;
                        }
                        a2dpNotConnected = true;
                        break;
                    }
                case 1:
                case 3:
                    return Utils.getConnectionStateSummary(profileConnectionState);
                case 2:
                    profileConnected = true;
                    break;
                default:
                    break;
            }
        }
        if (!profileConnected) {
            switch (cachedDevice.getBondState()) {
                case 11:
                    return 2131427449;
                default:
                    return 0;
            }
        } else if (a2dpNotConnected && headsetNotConnected) {
            return 2131427444;
        } else {
            if (a2dpNotConnected) {
                return 2131427443;
            }
            return headsetNotConnected ? 2131427442 : 2131427441;
        }
    }

    private int getBtClassDrawable() {
        BluetoothClass btClass = this.mCachedDevice.getBtClass();
        if (btClass != null) {
            switch (btClass.getMajorDeviceClass()) {
                case 256:
                    return 2130837575;
                case 512:
                    return 2130837569;
                case 1280:
                    return HidProfile.getHidClassDrawable(btClass);
                case 1536:
                    return 2130837573;
            }
        }
        Log.w("BluetoothDevicePreference", "mBtClass is null");
        for (LocalBluetoothProfile drawableResource : this.mCachedDevice.getProfiles()) {
            int drawableResource2 = drawableResource.getDrawableResource(btClass);
            if (drawableResource2 != 0) {
                return drawableResource2;
            }
        }
        if (btClass != null) {
            if (btClass.doesClassMatch(1)) {
                return 2130837571;
            }
            if (btClass.doesClassMatch(0)) {
                return 2130837572;
            }
        }
        return 0;
    }

    public BluetoothDevicePreference(Context context, CachedBluetoothDevice cachedBluetoothDevice) {
        super(context);
        if (sDimAlpha == Integer.MIN_VALUE) {
            TypedValue typedValue = new TypedValue();
            context.getTheme().resolveAttribute(16842803, typedValue, true);
            sDimAlpha = (int) (typedValue.getFloat() * 255.0f);
        }
        this.mCachedDevice = cachedBluetoothDevice;
        if (cachedBluetoothDevice.getBondState() == 12 && !((UserManager) context.getSystemService("user")).hasUserRestriction("no_config_bluetooth")) {
            setWidgetLayoutResource(2130968660);
        }
        this.mCachedDevice.registerCallback(this);
        onDeviceAttributesChanged();
    }

    public void onDeviceAttributesChanged() {
        setTitle(this.mCachedDevice.getName());
        int summaryResId = getConnectionSummary();
        if (summaryResId != 0) {
            setSummary(summaryResId);
        } else {
            setSummary(null);
        }
        int iconResId = getBtClassDrawable();
        if (iconResId != 0) {
            setIcon(iconResId);
        }
        setEnabled(!this.mCachedDevice.isBusy());
        notifyHierarchyChanged();
    }

    protected void onBindView(View view) {
        if (findPreferenceInHierarchy("bt_checkbox") != null) {
            setDependency("bt_checkbox");
        }
        if (this.mCachedDevice.getBondState() == 12) {
            ImageView deviceDetails = (ImageView) view.findViewById(2131230929);
            if (deviceDetails != null) {
                deviceDetails.setOnClickListener(this);
                deviceDetails.setTag(this.mCachedDevice);
                deviceDetails.setAlpha(isEnabled() ? 255 : sDimAlpha);
            }
        }
        super.onBindView(view);
    }

    private void askDisconnect() {
        Context context = getContext();
        String name = this.mCachedDevice.getName();
        if (TextUtils.isEmpty(name)) {
            name = context.getString(2131427450);
        }
        String message = context.getString(2131427438, new Object[]{name});
        String title = context.getString(2131427437);
        this.mDisconnectDialog = Utils.showDisconnectDialog(context, this.mDisconnectDialog, new 1(this), title, Html.fromHtml(message));
    }

    void onClicked() {
        int bondState = this.mCachedDevice.getBondState();
        if (this.mCachedDevice.isConnected()) {
            askDisconnect();
        } else if (bondState == 12) {
            this.mCachedDevice.connect(true);
        } else if (bondState == 10) {
            pair();
        }
    }

    protected void onPrepareForRemoval() {
        super.onPrepareForRemoval();
        this.mCachedDevice.unregisterCallback(this);
        if (this.mDisconnectDialog != null) {
            this.mDisconnectDialog.dismiss();
            this.mDisconnectDialog = null;
        }
    }

    private void pair() {
        if (!this.mCachedDevice.startPairing()) {
            Utils.showError(getContext(), this.mCachedDevice.getName(), 2131427712);
        }
    }

    public int compareTo(Preference preference) {
        return !(preference instanceof BluetoothDevicePreference) ? super.compareTo(preference) : this.mCachedDevice.compareTo(((BluetoothDevicePreference) preference).mCachedDevice);
    }

    public boolean equals(Object obj) {
        return (obj == null || !(obj instanceof BluetoothDevicePreference)) ? false : this.mCachedDevice.equals(((BluetoothDevicePreference) obj).mCachedDevice);
    }

    public void onClick(View view) {
        if (this.mOnSettingsClickListener != null) {
            this.mOnSettingsClickListener.onClick(view);
        }
    }

    public void setOnSettingsClickListener(OnClickListener onClickListener) {
        this.mOnSettingsClickListener = onClickListener;
    }

    CachedBluetoothDevice getCachedDevice() {
        return this.mCachedDevice;
    }

    public int hashCode() {
        return this.mCachedDevice.hashCode();
    }
}