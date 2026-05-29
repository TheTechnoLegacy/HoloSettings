package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.OnAccountsUpdateListener;
import android.app.Activity;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Intent;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.jellybyn.settings.AccountPreference;
import com.jellybyn.settings.DialogCreatable;
import com.jellybyn.settings.SettingsPreferenceFragment.SettingsDialogFragment;
import java.util.ArrayList;

public class SyncSettings extends AccountPreferenceBase implements OnAccountsUpdateListener, DialogCreatable {
    private String[] mAuthorities;
    private CheckBoxPreference mAutoSyncPreference;
    private SettingsDialogFragment mDialogFragment;

    public void onAccountsUpdated(Account[] accountArr) {
        if (getActivity() != null) {
            removeAccountPreferences();
            for (Account account : accountArr) {
                ArrayList authoritiesForAccountType = getAuthoritiesForAccountType(account.type);
                Object obj = 1;
                if (this.mAuthorities != null && authoritiesForAccountType != null) {
                    obj = null;
                    for (Object contains : this.mAuthorities) {
                        if (authoritiesForAccountType.contains(contains)) {
                            obj = 1;
                            break;
                        }
                    }
                }
                if (obj != null) {
                    AccountPreference accountPreference = new AccountPreference(getActivity(), account, getDrawableForType(account.type), authoritiesForAccountType, true);
                    getPreferenceScreen().addPreference(accountPreference);
                    accountPreference.setSummary(getLabelForType(account.type));
                }
            }
            onSyncStateUpdated();
        }
    }

    protected void onAuthDescriptionsUpdated() {
        for (int i = 0; i < getPreferenceScreen().getPreferenceCount(); i++) {
            if (getPreferenceScreen().getPreference(i) instanceof AccountPreference) {
                AccountPreference accountPreference = (AccountPreference) getPreferenceScreen().getPreference(i);
                accountPreference.setIcon(getDrawableForType(accountPreference.getAccount().type));
                accountPreference.setSummary(getLabelForType(accountPreference.getAccount().type));
            }
        }
    }

    private void removeAccountPreferences() {
        PreferenceScreen parent = getPreferenceScreen();
        int i = 0;
        while (i < parent.getPreferenceCount()) {
            if (parent.getPreference(i) instanceof AccountPreference) {
                parent.removePreference(parent.getPreference(i));
            } else {
                i++;
            }
        }
    }

    private void startAccountSettings(AccountPreference accountPreference) {
        Intent intent = new Intent("jellybyn.settings.ACCOUNT_SYNC_SETTINGS");
        intent.putExtra("account", accountPreference.getAccount());
        intent.setFlags(268435456);
        startActivity(intent);
        finish();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mAutoSyncPreference.setChecked(ContentResolver.getMasterSyncAutomatically());
        this.mAuthorities = activity.getIntent().getStringArrayExtra("authorities");
        updateAuthDescriptions();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034152);
        this.mAutoSyncPreference = (CheckBoxPreference) getPreferenceScreen().findPreference("sync_switch");
        this.mAutoSyncPreference.setOnPreferenceChangeListener(new OnPreferenceChangeListener() {
            public boolean onPreferenceChange(Preference preference, Object obj) {
                if (ActivityManager.isUserAMonkey()) {
                    Log.d("SyncSettings", "ignoring monkey's attempt to flip sync state");
                } else {
                    ContentResolver.setMasterSyncAutomatically(((Boolean) obj).booleanValue());
                }
                return true;
            }
        });
        setHasOptionsMenu(true);
    }

    public void showDialog(int i) {
        if (this.mDialogFragment != null) {
            Log.e("AccountSettings", "Old dialog fragment not null!");
        }
        this.mDialogFragment = new SettingsDialogFragment(this, i);
        this.mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!(preference instanceof AccountPreference)) {
            return false;
        }
        startAccountSettings((AccountPreference) preference);
        return true;
    }

    public void onStart() {
        super.onStart();
        AccountManager.get(getActivity()).addOnAccountsUpdatedListener(this, null, true);
    }

    public void onStop() {
        super.onStop();
        AccountManager.get(getActivity()).removeOnAccountsUpdatedListener(this);
    }

    public /* bridge */ /* synthetic */ void onPause() {
        super.onPause();
    }
}