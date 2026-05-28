package com.jellybyn.settings.vpn2;

import android.content.Context;
import android.preference.Preference;
import com.android.internal.net.VpnProfile;

class VpnSettings$VpnPreference extends Preference {
    private VpnProfile mProfile;
    private int mState = -1;

    void update() {
        if (this.mState < 0) {
            setSummary(getContext().getResources().getStringArray(2131165260)[this.mProfile.type]);
        } else {
            setSummary(getContext().getResources().getStringArray(2131165261)[this.mState]);
        }
        setTitle(this.mProfile.name);
        notifyHierarchyChanged();
    }

    VpnSettings$VpnPreference(Context context, VpnProfile vpnProfile) {
        super(context);
        setPersistent(false);
        setOrder(0);
        this.mProfile = vpnProfile;
        update();
    }

    public int compareTo(Preference preference) {
        if (!(preference instanceof VpnSettings$VpnPreference)) {
            return -1;
        }
        VpnSettings$VpnPreference vpnSettings$VpnPreference = (VpnSettings$VpnPreference) preference;
        int result = vpnSettings$VpnPreference.mState - this.mState;
        if (result != 0) {
            return result;
        }
        result = this.mProfile.name.compareTo(vpnSettings$VpnPreference.mProfile.name);
        if (result != 0) {
            return result;
        }
        result = this.mProfile.type - vpnSettings$VpnPreference.mProfile.type;
        return result == 0 ? this.mProfile.key.compareTo(vpnSettings$VpnPreference.mProfile.key) : result;
    }

    void update(int i) {
        this.mState = i;
        update();
    }

    void update(VpnProfile vpnProfile) {
        this.mProfile = vpnProfile;
        update();
    }

    VpnProfile getProfile() {
        return this.mProfile;
    }
}