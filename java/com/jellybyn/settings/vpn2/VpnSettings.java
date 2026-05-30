package com.jellybyn.settings.vpn2;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.res.Resources;
import android.net.IConnectivityManager;
import android.net.IConnectivityManager.Stub;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceScreen;
import android.security.Credentials;
import android.security.KeyStore;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;
import com.android.internal.net.LegacyVpnInfo;
import com.android.internal.net.VpnProfile;
import com.android.internal.util.ArrayUtils;
import com.google.android.collect.Lists;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class VpnSettings extends SettingsPreferenceFragment implements OnClickListener, OnDismissListener, Callback, OnPreferenceClickListener {
    private VpnDialog mDialog;
    private LegacyVpnInfo mInfo;
    private final KeyStore mKeyStore = KeyStore.getInstance();
    private HashMap<String, VpnPreference> mPreferences = new HashMap();
    private String mSelectedKey;
    private final IConnectivityManager mService = Stub.asInterface(ServiceManager.getService("connectivity"));
    private boolean mUnlocking = false;
    private Handler mUpdater;

    public static class LockdownConfigFragment extends DialogFragment {
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
                    if (LockdownConfigFragment.this.mCurrentIndex != newIndex) {
                        if (newIndex == 0) {
                            keyStore.delete("LOCKDOWN_VPN");
                        } else {
                            VpnProfile profile = (VpnProfile) LockdownConfigFragment.this.mProfiles.get(newIndex - 1);
                            if (profile.isValidLockdownProfile()) {
                                keyStore.put("LOCKDOWN_VPN", profile.key.getBytes(), -1, 1);
                            } else {
                                Toast.makeText(context, 2131429046, 1).show();
                                return;
                            }
                        }
                        LayoutInflater.from(LockdownConfigFragment.this.getActivity()).updateLockdownVpn();
                    }
                }
            });
            return builder.create();
        }

        private void initProfiles(KeyStore keyStore, Resources resources) {
            String lockdownKey = getStringOrNull(keyStore, "LOCKDOWN_VPN");
            this.mProfiles = VpnSettings.loadVpnProfiles(keyStore, 0);
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
                new LockdownConfigFragment().show(vpnSettings.getFragmentManager(), "lockdown");
            }
        }

        private static String getStringOrNull(KeyStore keyStore, String str) {
            byte[] value = keyStore.get("LOCKDOWN_VPN");
            return value == null ? null : new String(value);
        }
    }

    private static class VpnPreference extends Preference {
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

        VpnPreference(Context context, VpnProfile vpnProfile) {
            super(context);
            setPersistent(false);
            setOrder(0);
            this.mProfile = vpnProfile;
            update();
        }

        public int compareTo(Preference preference) {
            if (!(preference instanceof VpnPreference)) {
                return -1;
            }
            VpnPreference vpnPreference = (VpnPreference) preference;
            int result = vpnPreference.mState - this.mState;
            if (result != 0) {
                return result;
            }
            result = this.mProfile.name.compareTo(vpnPreference.mProfile.name);
            if (result != 0) {
                return result;
            }
            result = this.mProfile.type - vpnPreference.mProfile.type;
            return result == 0 ? this.mProfile.key.compareTo(vpnPreference.mProfile.key) : result;
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

    public void onResume() {
        boolean z = false;
        super.onResume();
        if (getActivity().getIntent().getBooleanExtra("android.net.vpn.PICK_LOCKDOWN", false)) {
            LockdownConfigFragment.show(this);
        }
        if (this.mKeyStore.isUnlocked()) {
            this.mUnlocking = false;
            if (this.mPreferences.size() == 0) {
                PreferenceScreen preferenceScreen = getPreferenceScreen();
                Activity activity = getActivity();
                for (VpnProfile vpnProfile : loadVpnProfiles(this.mKeyStore, new int[0])) {
                    VpnPreference vpnPreference = new VpnPreference(activity, vpnProfile);
                    vpnPreference.setOnPreferenceClickListener(this);
                    this.mPreferences.put(vpnProfile.key, vpnPreference);
                    preferenceScreen.addPreference(vpnPreference);
                }
            }
            if (this.mDialog != null) {
                this.mDialog.setOnDismissListener(this);
                this.mDialog.show();
            }
            if (this.mUpdater == null) {
                this.mUpdater = new Handler(this);
            }
            this.mUpdater.sendEmptyMessage(0);
            registerForContextMenu(getListView());
            return;
        }
        if (this.mUnlocking) {
            finishFragment();
        } else {
            Credentials.getInstance().unlock(getActivity());
        }
        if (!this.mUnlocking) {
            z = true;
        }
        this.mUnlocking = z;
    }

    public boolean onContextItemSelected(MenuItem menuItem) {
        if (this.mDialog != null) {
            Log.v("VpnSettings", "onContextItemSelected() is called when mDialog != null");
            return false;
        }
        VpnPreference preference = (VpnPreference) this.mPreferences.get(this.mSelectedKey);
        if (preference == null) {
            Log.v("VpnSettings", "onContextItemSelected() is called but no preference is found");
            return false;
        }
        switch (menuItem.getItemId()) {
            case 2131429041:
                this.mDialog = new VpnDialog(getActivity(), this, preference.getProfile(), true);
                this.mDialog.setOnDismissListener(this);
                this.mDialog.show();
                return true;
            case 2131429042:
                disconnect(this.mSelectedKey);
                getPreferenceScreen().removePreference(preference);
                this.mPreferences.remove(this.mSelectedKey);
                this.mKeyStore.delete("VPN_" + this.mSelectedKey);
                return true;
            default:
                return false;
        }
    }

    public boolean handleMessage(Message message) {
        this.mUpdater.removeMessages(0);
        if (isResumed()) {
            try {
                VpnPreference vpnPreference;
                LegacyVpnInfo legacyVpnInfo = this.mService.getLegacyVpnInfo();
                if (this.mInfo != null) {
                    vpnPreference = (VpnPreference) this.mPreferences.get(this.mInfo.key);
                    if (vpnPreference != null) {
                        vpnPreference.update(-1);
                    }
                    this.mInfo = null;
                }
                if (legacyVpnInfo != null) {
                    vpnPreference = (VpnPreference) this.mPreferences.get(legacyVpnInfo.key);
                    if (vpnPreference != null) {
                        vpnPreference.update(legacyVpnInfo.state);
                        this.mInfo = legacyVpnInfo;
                    }
                }
            } catch (Exception e) {
            }
            this.mUpdater.sendEmptyMessageDelayed(0, 1000);
        }
        return true;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1) {
            VpnProfile profile = this.mDialog.getProfile();
            this.mKeyStore.put("VPN_" + profile.key, profile.encode(), -1, 1);
            VpnPreference preference = (VpnPreference) this.mPreferences.get(profile.key);
            if (preference != null) {
                disconnect(profile.key);
                preference.update(profile);
            } else {
                preference = new VpnPreference(getActivity(), profile);
                preference.setOnPreferenceClickListener(this);
                this.mPreferences.put(profile.key, preference);
                getPreferenceScreen().addPreference(preference);
            }
            if (!this.mDialog.isEditing()) {
                try {
                    connect(profile);
                } catch (Exception e) {
                    Log.e("VpnSettings", "connect", e);
                }
            }
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        if (this.mDialog != null) {
            Log.v("VpnSettings", "onPreferenceClick() is called when mDialog != null");
        } else {
            if (preference instanceof VpnPreference) {
                VpnProfile profile = ((VpnPreference) preference).getProfile();
                if (this.mInfo != null && profile.key.equals(this.mInfo.key) && this.mInfo.state == 3) {
                    try {
                        this.mInfo.intent.send();
                    } catch (Exception e) {
                    }
                }
                this.mDialog = new VpnDialog(getActivity(), this, profile, false);
            } else {
                long millis = System.currentTimeMillis();
                while (this.mPreferences.containsKey(Long.toHexString(millis))) {
                    millis++;
                }
                this.mDialog = new VpnDialog(getActivity(), this, new VpnProfile(Long.toHexString(millis)), true);
            }
            this.mDialog.setOnDismissListener(this);
            this.mDialog.show();
        }
        return true;
    }

    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenuInfo contextMenuInfo) {
        if (this.mDialog != null) {
            Log.v("VpnSettings", "onCreateContextMenu() is called when mDialog != null");
        } else if (contextMenuInfo instanceof AdapterContextMenuInfo) {
            Preference preference = (Preference) getListView().getItemAtPosition(((AdapterContextMenuInfo) contextMenuInfo).position);
            if (preference instanceof VpnPreference) {
                VpnProfile profile = ((VpnPreference) preference).getProfile();
                this.mSelectedKey = profile.key;
                contextMenu.setHeaderTitle(profile.name);
                contextMenu.add(0, 2131429041, 0, 2131429041);
                contextMenu.add(0, 2131429042, 0, 2131429042);
            }
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 2131231244:
                long currentTimeMillis = System.currentTimeMillis();
                while (this.mPreferences.containsKey(Long.toHexString(currentTimeMillis))) {
                    currentTimeMillis++;
                }
                this.mDialog = new VpnDialog(getActivity(), this, new VpnProfile(Long.toHexString(currentTimeMillis)), true);
                this.mDialog.setOnDismissListener(this);
                this.mDialog.show();
                return true;
            case 2131231245:
                LockdownConfigFragment.show(this);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    private static List<VpnProfile> loadVpnProfiles(KeyStore keyStore, int... iArr) {
        ArrayList<VpnProfile> result = Lists.newArrayList();
        String[] keys = keyStore.saw("VPN_");
        if (keys != null) {
            for (String str : keys) {
                VpnProfile decode = VpnProfile.decode(str, keyStore.get("VPN_" + str));
                if (!(decode == null || ArrayUtils.contains(iArr, decode.type))) {
                    result.add(decode);
                }
            }
        }
        return result;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        addPreferencesFromResource(2131034161);
        if (bundle != null) {
            VpnProfile decode = VpnProfile.decode(bundle.getString("VpnKey"), bundle.getByteArray("VpnProfile"));
            if (decode != null) {
                this.mDialog = new VpnDialog(getActivity(), this, decode, bundle.getBoolean("VpnEditing"));
            }
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mDialog != null) {
            this.mDialog.setOnDismissListener(null);
            this.mDialog.dismiss();
        }
        if (getView() != null) {
            unregisterForContextMenu(getListView());
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        if (this.mDialog != null) {
            VpnProfile profile = this.mDialog.getProfile();
            bundle.putString("VpnKey", profile.key);
            bundle.putByteArray("VpnProfile", profile.encode());
            bundle.putBoolean("VpnEditing", this.mDialog.isEditing());
        }
    }

    private void connect(VpnProfile vpnProfile) throws Exception {
        try {
            this.mService.startLegacyVpn(vpnProfile);
        } catch (IllegalStateException e) {
            Toast.makeText(getActivity(), 2131429047, 1).show();
        }
    }

    private void disconnect(String str) {
        if (this.mInfo != null && str.equals(this.mInfo.key)) {
            try {
                this.mService.prepareVpn("[Legacy VPN]", "[Legacy VPN]");
            } catch (Exception e) {
            }
        }
    }

    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        if (SystemProperties.getBoolean("persist.radio.imsregrequired", false)) {
            menu.findItem(2131231245).setVisible(false);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        menuInflater.inflate(2131755011, menu);
    }

    public void onDismiss(DialogInterface dialogInterface) {
        this.mDialog = null;
    }

    protected int getHelpResource() {
        return 2131429118;
    }
}