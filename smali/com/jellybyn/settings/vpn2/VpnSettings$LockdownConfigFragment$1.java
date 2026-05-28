package com.jellybyn.settings.vpn2;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.ConnectivityManager;
import android.security.KeyStore;
import android.widget.ListView;
import android.widget.Toast;
import com.android.internal.net.VpnProfile;
import com.jellybyn.settings.vpn2.VpnSettings.LockdownConfigFragment;

class VpnSettings$LockdownConfigFragment$1 implements OnClickListener {
    final /* synthetic */ LockdownConfigFragment this$0;
    final /* synthetic */ Context val$context;
    final /* synthetic */ KeyStore val$keyStore;
    final /* synthetic */ ListView val$listView;

    public void onClick(DialogInterface dialogInterface, int i) {
        int newIndex = this.val$listView.getCheckedItemPosition();
        if (LockdownConfigFragment.access$100(this.this$0) != newIndex) {
            if (newIndex == 0) {
                this.val$keyStore.delete("LOCKDOWN_VPN");
            } else {
                VpnProfile profile = (VpnProfile) LockdownConfigFragment.access$200(this.this$0).get(newIndex - 1);
                if (profile.isValidLockdownProfile()) {
                    this.val$keyStore.put("LOCKDOWN_VPN", profile.key.getBytes(), -1, 1);
                } else {
                    Toast.makeText(this.val$context, 2131429046, 1).show();
                    return;
                }
            }
            ConnectivityManager.from(this.this$0.getActivity()).updateLockdownVpn();
        }
    }

    VpnSettings$LockdownConfigFragment$1(LockdownConfigFragment lockdownConfigFragment, ListView listView, KeyStore keyStore, Context context) {
        this.this$0 = lockdownConfigFragment;
        this.val$listView = listView;
        this.val$keyStore = keyStore;
        this.val$context = context;
    }
}