package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.OnAccountsUpdateListener;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SyncAdapterType;
import android.content.SyncInfo;
import android.content.SyncStatusInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.TextView;
import com.jellybyn.settings.AccountPreference;
import com.jellybyn.settings.Utils;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;

public class ManageAccountsSettings extends AccountPreferenceBase implements OnAccountsUpdateListener {
    private String mAccountType;
    private String[] mAuthorities;
    private TextView mErrorInfoView;
    private Account mFirstAccount;

    protected void onSyncStateUpdated() {
        if (getActivity() != null) {
            SyncInfo currentSync = ContentResolver.getCurrentSync();
            boolean anySyncFailed = false;
            Date date = new Date();
            SyncAdapterType[] syncAdapters = ContentResolver.getSyncAdapterTypes();
            AbstractCollection userFacing = new HashSet();
            for (SyncAdapterType syncAdapterType : syncAdapters) {
                if (syncAdapterType.isUserVisible()) {
                    userFacing.add(syncAdapterType.authority);
                }
            }
            int count = getPreferenceScreen().getPreferenceCount();
            for (int i = 0; i < count; i++) {
                Preference preference = getPreferenceScreen().getPreference(i);
                if (preference instanceof AccountPreference) {
                    AccountPreference accountPreference = (AccountPreference) preference;
                    Account account = accountPreference.getAccount();
                    int i2 = 0;
                    long j = 0;
                    Object obj = null;
                    ArrayList authorities = accountPreference.getAuthorities();
                    int i3 = 0;
                    if (authorities != null) {
                        Iterator it = authorities.iterator();
                        while (it.hasNext()) {
                            String str = (String) it.next();
                            SyncStatusInfo syncStatus = ContentResolver.getSyncStatus(account, str);
                            Object obj2 = (ContentResolver.getSyncAutomatically(account, str) && ContentResolver.getMasterSyncAutomatically() && ContentResolver.getIsSyncable(account, str) > 0) ? 1 : null;
                            boolean isSyncPending = ContentResolver.isSyncPending(account, str);
                            int i4 = (currentSync != null && currentSync.authority.equals(str) && new Account(currentSync.account.name, currentSync.account.type).equals(account)) ? 1 : 0;
                            Object obj3 = (syncStatus == null || obj2 == null || syncStatus.lastFailureTime == 0 || syncStatus.getLastFailureMesgAsInt(0) == 1) ? null : 1;
                            if (!(obj3 == null || i4 != 0 || isSyncPending)) {
                                obj = 1;
                                anySyncFailed = true;
                            }
                            i3 |= i4;
                            if (syncStatus != null && j < syncStatus.lastSuccessTime) {
                                j = syncStatus.lastSuccessTime;
                            }
                            int i5 = (obj2 == null || !userFacing.contains(str)) ? 0 : 1;
                            i2 += i5;
                        }
                    } else if (Log.isLoggable("AccountSettings", 2)) {
                        Log.v("AccountSettings", "no syncadapters found for " + account);
                    }
                    if (obj != null) {
                        accountPreference.setSyncStatus(2, true);
                    } else if (i2 == 0) {
                        accountPreference.setSyncStatus(1, true);
                    } else if (i2 <= 0) {
                        accountPreference.setSyncStatus(1, true);
                    } else if (i3 != 0) {
                        accountPreference.setSyncStatus(3, true);
                    } else {
                        accountPreference.setSyncStatus(0, true);
                        if (j > 0) {
                            accountPreference.setSyncStatus(0, false);
                            date.setTime(j);
                            String formatSyncDate = formatSyncDate(date);
                            accountPreference.setSummary(getResources().getString(2131428861, new Object[]{formatSyncDate}));
                        }
                    }
                }
            }
            this.mErrorInfoView.setVisibility(anySyncFailed ? 0 : 8);
        }
    }

    public void onAccountsUpdated(Account[] accountArr) {
        if (getActivity() != null) {
            getPreferenceScreen().removeAll();
            this.mFirstAccount = null;
            addPreferencesFromResource(2131034133);
            for (Account account : accountArr) {
                if (this.mAccountType == null || account.type.equals(this.mAccountType)) {
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
                        getPreferenceScreen().addPreference(new AccountPreference(getActivity(), account, getDrawableForType(account.type), authoritiesForAccountType, false));
                        if (this.mFirstAccount == null) {
                            this.mFirstAccount = account;
                            getActivity().invalidateOptionsMenu();
                        }
                    }
                }
            }
            if (this.mAccountType == null || this.mFirstAccount == null) {
                Intent settingsTop = new Intent("jellybyn.settings.SETTINGS");
                settingsTop.setFlags(67108864);
                getActivity().startActivity(settingsTop);
            } else {
                addAuthenticatorSettings();
            }
            onSyncStateUpdated();
        }
    }

    private void requestOrCancelSyncForAccounts(boolean z) {
        SyncAdapterType[] syncAdapters = ContentResolver.getSyncAdapterTypes();
        Bundle extras = new Bundle();
        extras.putBoolean("force", true);
        int count = getPreferenceScreen().getPreferenceCount();
        for (int i = 0; i < count; i++) {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (preference instanceof AccountPreference) {
                Account account = ((AccountPreference) preference).getAccount();
                for (int i2 = 0; i2 < syncAdapters.length; i2++) {
                    SyncAdapterType syncAdapterType = syncAdapters[i2];
                    if (syncAdapters[i2].accountType.equals(this.mAccountType) && ContentResolver.getSyncAutomatically(account, syncAdapterType.authority)) {
                        if (z) {
                            ContentResolver.requestSync(account, syncAdapterType.authority, extras);
                        } else {
                            ContentResolver.cancelSync(account, syncAdapterType.authority);
                        }
                    }
                }
            }
        }
    }

    private void updatePreferenceIntents(PreferenceScreen preferenceScreen) {
        PackageManager pm = getActivity().getPackageManager();
        int i = 0;
        while (i < preferenceScreen.getPreferenceCount()) {
            Intent intent = preferenceScreen.getPreference(i).getIntent();
            if (intent != null) {
                if (pm.resolveActivity(intent, 65536) == null) {
                    preferenceScreen.removePreference(preferenceScreen.getPreference(i));
                } else {
                    intent.putExtra("account", this.mFirstAccount);
                    intent.setFlags(intent.getFlags() | 268435456);
                }
            }
            i++;
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mErrorInfoView = (TextView) getView().findViewById(2131230723);
        this.mErrorInfoView.setVisibility(8);
        this.mAuthorities = activity.getIntent().getStringArrayExtra("authorities");
        Bundle args = getArguments();
        if (args != null && args.containsKey("account_label")) {
            getActivity().setTitle(args.getString("account_label"));
        }
        updateAuthDescriptions();
    }

    public void onPrepareOptionsMenu(Menu menu) {
        boolean z = true;
        super.onPrepareOptionsMenu(menu);
        boolean syncActive = ContentResolver.getCurrentSync() != null;
        MenuItem findItem = menu.findItem(1);
        boolean z2 = (syncActive || this.mFirstAccount == null) ? false : true;
        findItem.setVisible(z2);
        MenuItem findItem2 = menu.findItem(2);
        if (!syncActive || this.mFirstAccount == null) {
            z = false;
        }
        findItem2.setVisible(z);
    }

    protected void onAuthDescriptionsUpdated() {
        for (int i = 0; i < getPreferenceScreen().getPreferenceCount(); i++) {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (preference instanceof AccountPreference) {
                AccountPreference accountPreference = (AccountPreference) preference;
                accountPreference.setSummary(getLabelForType(accountPreference.getAccount().type));
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle args = getArguments();
        if (args != null && args.containsKey("account_type")) {
            this.mAccountType = args.getString("account_type");
        }
        addPreferencesFromResource(2131034133);
        setHasOptionsMenu(true);
    }

    public void onStop() {
        super.onStop();
        Activity activity = getActivity();
        AccountManager.get(activity).removeOnAccountsUpdatedListener(this);
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                requestOrCancelSyncForAccounts(true);
                return true;
            case 2:
                requestOrCancelSyncForAccounts(false);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    private void addAuthenticatorSettings() {
        PreferenceScreen prefs = addPreferencesForType(this.mAccountType, getPreferenceScreen());
        if (prefs != null) {
            updatePreferenceIntents(prefs);
        }
    }

    private void startAccountSettings(AccountPreference accountPreference) {
        Bundle bundle = new Bundle();
        bundle.putParcelable("account", accountPreference.getAccount());
        ((PreferenceActivity) getActivity()).startPreferencePanel(AccountSyncSettings.class.getCanonicalName(), bundle, 2131428850, accountPreference.getAccount().name, this, 1);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        MenuItem syncNow = menu.add(0, 1, 0, getString(2131428865)).setIcon(2130837588);
        MenuItem syncCancel = menu.add(0, 2, 0, getString(2131428866)).setIcon(17301560);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968637, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, (ListView) view.findViewById(16908298), false);
        return view;
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

    public /* bridge */ /* synthetic */ void onPause() {
        super.onPause();
    }
}