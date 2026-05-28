package com.jellybyn.settings.vpn2;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.os.Bundle;
import android.security.KeyStore;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;
import com.android.internal.net.VpnProfile;
import com.google.android.collect.Lists;
import java.util.List;

public class VpnSettings$LockdownConfigFragment extends DialogFragment {
    private int mCurrentIndex;
    private List<VpnProfile> mProfiles;
    private List<CharSequence> mTitles;

    private static class TitleAdapter extends ArrayAdapter<CharSequence> {
        public TitleAdapter(Context context, List<CharSequence> objects) {
            super(context, 17367225, 16908308, objects);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        final Context context = getActivity();
        final KeyStore keyStore = KeyStore.getInstance();
        initProfiles(keyStore, context.getResources());
        Builder builder = new Builder(context);
        LayoutInflater dialogInflater = LayoutInflater.from(builder.getContext());
        builder.setTitle(2131429043);
        View view = dialogInflater.inflate(2130968712, null, false);
        final ListView listView = (ListView) view.findViewById(16908298);
        listView.setChoiceMode(1);
        listView.setAdapter(new TitleAdapter(context, this.mTitles));
        listView.setItemChecked(this.mCurrentIndex, true);
        builder.setView(view);
        builder.setPositiveButton(17039370, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                int newIndex = listView.getCheckedItemPosition();
                if (VpnSettings$LockdownConfigFragment.this.mCurrentIndex != newIndex) {
                    if (newIndex == 0) {
                        keyStore.delete("LOCKDOWN_VPN");
                    } else {
                        VpnProfile profile = (VpnProfile) VpnSettings$LockdownConfigFragment.this.mProfiles.get(newIndex - 1);
                        if (profile.isValidLockdownProfile()) {
                            keyStore.put("LOCKDOWN_VPN", profile.key.getBytes(), -1, 1);
                        } else {
                            Toast.makeText(context, 2131429046, 1).show();
                            return;
                        }
                    }
                    LayoutInflater.from(VpnSettings$LockdownConfigFragment.this.getActivity()).updateLockdownVpn();
                }
            }
        });
        return builder.create();
    }

    private void initProfiles(KeyStore keyStore, Resources resources) {
        String lockdownKey = getStringOrNull(keyStore, "LOCKDOWN_VPN");
        this.mProfiles = VpnSettings.access$000(keyStore, new int[]{0});
        this.mTitles = Lists.newArrayList();
        this.mTitles.add(resources.getText(2131429045));
        this.mCurrentIndex = 0;
        for (VpnProfile vpnProfile : this.mProfiles) {
            if (TextUtils.equals(vpnProfile.key, lockdownKey)) {
                this.mCurrentIndex = this.mTitles.size();
            }
            this.mTitles.add(vpnProfile.name);
        }
    }

    public static void show(VpnSettings vpnSettings) {
        if (vpnSettings.isAdded()) {
            new VpnSettings$LockdownConfigFragment().show(vpnSettings.getFragmentManager(), "lockdown");
        }
    }

    private static String getStringOrNull(KeyStore keyStore, String str) {
        byte[] value = keyStore.get("LOCKDOWN_VPN");
        return value == null ? null : new String(value);
    }
}