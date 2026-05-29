package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SyncAdapterType;
import android.content.SyncInfo;
import android.content.SyncStatusInfo;
import android.content.pm.ProviderInfo;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.google.android.collect.Lists;
import com.google.android.collect.Maps;
import com.jellybyn.settings.Utils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class AccountSyncSettings extends AccountPreferenceBase {
    private Account mAccount;
    private Account[] mAccounts;
    private ArrayList<SyncStateCheckBoxPreference> mCheckBoxes = new ArrayList();
    private TextView mErrorInfoView;
    private ArrayList<SyncAdapterType> mInvisibleAdapters = Lists.newArrayList();
    private ImageView mProviderIcon;
    private TextView mProviderId;
    private TextView mUserId;

    private void setFeedsState() {
        Date date = new Date();
        List<SyncInfo> currentSyncs = ContentResolver.getCurrentSyncs();
        boolean syncIsFailing = false;
        updateAccountCheckboxes(this.mAccounts);
        int count = getPreferenceScreen().getPreferenceCount();
        for (int i = 0; i < count; i++) {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (preference instanceof SyncStateCheckBoxPreference) {
                SyncStateCheckBoxPreference syncStateCheckBoxPreference = (SyncStateCheckBoxPreference) preference;
                String authority = syncStateCheckBoxPreference.getAuthority();
                Account account = syncStateCheckBoxPreference.getAccount();
                SyncStatusInfo syncStatus = ContentResolver.getSyncStatus(account, authority);
                boolean syncAutomatically = ContentResolver.getSyncAutomatically(account, authority);
                boolean z = syncStatus == null ? false : syncStatus.pending;
                boolean z2 = syncStatus == null ? false : syncStatus.initialize;
                boolean isSyncing = isSyncing(currentSyncs, account, authority);
                boolean z3 = (syncStatus == null || syncStatus.lastFailureTime == 0 || syncStatus.getLastFailureMesgAsInt(0) == 1) ? false : true;
                if (!syncAutomatically) {
                    z3 = false;
                }
                if (!(!z3 || isSyncing || z)) {
                    syncIsFailing = true;
                }
                if (Log.isLoggable("AccountSettings", 2)) {
                    Log.d("AccountSettings", "Update sync status: " + account + " " + authority + " active = " + isSyncing + " pend =" + z);
                }
                long j = syncStatus == null ? 0 : syncStatus.lastSuccessTime;
                if (!syncAutomatically) {
                    syncStateCheckBoxPreference.setSummary(2131428859);
                } else if (isSyncing) {
                    syncStateCheckBoxPreference.setSummary(2131428862);
                } else if (j != 0) {
                    date.setTime(j);
                    String formatSyncDate = formatSyncDate(date);
                    syncStateCheckBoxPreference.setSummary(getResources().getString(2131428861, new Object[]{formatSyncDate}));
                } else {
                    syncStateCheckBoxPreference.setSummary("");
                }
                int isSyncable = ContentResolver.getIsSyncable(account, authority);
                boolean z4 = isSyncing && isSyncable >= 0 && !z2;
                syncStateCheckBoxPreference.setActive(z4);
                z4 = z && isSyncable >= 0 && !z2;
                syncStateCheckBoxPreference.setPending(z4);
                syncStateCheckBoxPreference.setFailed(z3);
                boolean z5 = (ContentResolver.getMasterSyncAutomatically() && ((ConnectivityManager) getSystemService("connectivity")).getBackgroundDataSetting()) ? false : true;
                syncStateCheckBoxPreference.setOneTimeSyncMode(z5);
                z4 = z5 || syncAutomatically;
                syncStateCheckBoxPreference.setChecked(z4);
            }
        }
        this.mErrorInfoView.setVisibility(syncIsFailing ? 0 : 8);
        getActivity().invalidateOptionsMenu();
    }

    private void updateAccountCheckboxes(Account[] accountArr) {
        int i;
        ArrayList arrayList;
        this.mInvisibleAdapters.clear();
        SyncAdapterType[] syncAdapters = ContentResolver.getSyncAdapterTypes();
        HashMap<String, ArrayList<String>> accountTypeToAuthorities = Maps.newHashMap();
        for (SyncAdapterType syncAdapterType : syncAdapters) {
            if (syncAdapterType.isUserVisible()) {
                arrayList = (ArrayList) accountTypeToAuthorities.get(syncAdapterType.accountType);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    accountTypeToAuthorities.put(syncAdapterType.accountType, arrayList);
                }
                if (Log.isLoggable("AccountSettings", 2)) {
                    Log.d("AccountSettings", "onAccountUpdated: added authority " + syncAdapterType.authority + " to accountType " + syncAdapterType.accountType);
                }
                arrayList.add(syncAdapterType.authority);
            } else {
                this.mInvisibleAdapters.add(syncAdapterType);
            }
        }
        int n = this.mCheckBoxes.size();
        for (i = 0; i < n; i++) {
            getPreferenceScreen().removePreference((Preference) this.mCheckBoxes.get(i));
        }
        this.mCheckBoxes.clear();
        for (Object obj : accountArr) {
            if (Log.isLoggable("AccountSettings", 2)) {
                Log.d("AccountSettings", "looking for sync adapters that match account " + obj);
            }
            arrayList = (ArrayList) accountTypeToAuthorities.get(obj.type);
            if (arrayList != null && (this.mAccount == null || this.mAccount.equals(obj))) {
                int size = arrayList.size();
                for (int i2 = 0; i2 < size; i2++) {
                    String str = (String) arrayList.get(i2);
                    int isSyncable = ContentResolver.getIsSyncable(obj, str);
                    if (Log.isLoggable("AccountSettings", 2)) {
                        Log.d("AccountSettings", "  found authority " + str + " " + isSyncable);
                    }
                    if (isSyncable > 0) {
                        addSyncStateCheckBox(obj, str);
                    }
                }
            }
        }
        Collections.sort(this.mCheckBoxes);
        n = this.mCheckBoxes.size();
        for (i = 0; i < n; i++) {
            getPreferenceScreen().addPreference((Preference) this.mCheckBoxes.get(i));
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (!(preference instanceof SyncStateCheckBoxPreference)) {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        }
        SyncStateCheckBoxPreference syncStateCheckBoxPreference = (SyncStateCheckBoxPreference) preference;
        String authority = syncStateCheckBoxPreference.getAuthority();
        Account account = syncStateCheckBoxPreference.getAccount();
        boolean syncAutomatically = ContentResolver.getSyncAutomatically(account, authority);
        if (syncStateCheckBoxPreference.isOneTimeSyncMode()) {
            requestOrCancelSync(account, authority, true);
            return true;
        }
        boolean isChecked = syncStateCheckBoxPreference.isChecked();
        if (isChecked == syncAutomatically) {
            return true;
        }
        ContentResolver.setSyncAutomatically(account, authority, isChecked);
        if (ContentResolver.getMasterSyncAutomatically() && isChecked) {
            return true;
        }
        requestOrCancelSync(account, authority, isChecked);
        return true;
    }

    private void requestOrCancelSyncForEnabledProviders(boolean z) {
        int count = getPreferenceScreen().getPreferenceCount();
        for (int i = 0; i < count; i++) {
            Preference preference = getPreferenceScreen().getPreference(i);
            if (preference instanceof SyncStateCheckBoxPreference) {
                SyncStateCheckBoxPreference syncStateCheckBoxPreference = (SyncStateCheckBoxPreference) preference;
                if (syncStateCheckBoxPreference.isChecked()) {
                    requestOrCancelSync(syncStateCheckBoxPreference.getAccount(), syncStateCheckBoxPreference.getAuthority(), z);
                }
            }
        }
        if (this.mAccount != null) {
            Iterator it = this.mInvisibleAdapters.iterator();
            while (it.hasNext()) {
                SyncAdapterType syncAdapterType = (SyncAdapterType) it.next();
                if (syncAdapterType.accountType.equals(this.mAccount.type)) {
                    requestOrCancelSync(this.mAccount, syncAdapterType.authority, z);
                }
            }
        }
    }

    private void addSyncStateCheckBox(Account account, String str) {
        SyncStateCheckBoxPreference item = new SyncStateCheckBoxPreference(getActivity(), account, str);
        item.setPersistent(false);
        ProviderInfo providerInfo = getPackageManager().resolveContentProvider(str, 0);
        if (providerInfo != null) {
            if (TextUtils.isEmpty(providerInfo.loadLabel(getPackageManager()))) {
                Log.e("AccountSettings", "Provider needs a label for authority '" + str + "'");
                return;
            }
            item.setTitle(getString(2131428883, new Object[]{providerInfo.loadLabel(getPackageManager())}));
            item.setKey(str);
            this.mCheckBoxes.add(item);
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Bundle arguments = getArguments();
        if (arguments == null) {
            Log.e("AccountSettings", "No arguments provided when starting intent. ACCOUNT_KEY needed.");
            return;
        }
        this.mAccount = (Account) arguments.getParcelable("account");
        if (this.mAccount != null) {
            if (Log.isLoggable("AccountSettings", 2)) {
                Log.v("AccountSettings", "Got account: " + this.mAccount);
            }
            this.mUserId.setText(this.mAccount.name);
            this.mProviderId.setText(this.mAccount.type);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        MenuItem syncNow = menu.add(0, 1, 0, getString(2131428865)).setIcon(2130837588);
        MenuItem syncCancel = menu.add(0, 2, 0, getString(2131428866)).setIcon(17301560);
        if (!((UserManager) getSystemService("user")).hasUserRestriction("no_modify_accounts")) {
            menu.add(0, 3, 0, getString(2131428876)).setIcon(2130837587).setShowAsAction(4);
        }
        syncNow.setShowAsAction(4);
        syncCancel.setShowAsAction(4);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public Dialog onCreateDialog(int i) {
        if (i == 100) {
            return new Builder(getActivity()).setTitle(2131428879).setMessage(2131428880).setNegativeButton(17039360, null).setPositiveButton(2131428876, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    AccountManager.get(AccountSyncSettings.this.getActivity()).removeAccount(AccountSyncSettings.this.mAccount, new AccountManagerCallback<Boolean>() {
                        public void run(AccountManagerFuture<Boolean> future) {
                            if (AccountSyncSettings.this.isResumed()) {
                                boolean failed = true;
                                try {
                                    if (((Boolean) future.getResult()).booleanValue()) {
                                        failed = false;
                                    }
                                } catch (OperationCanceledException e) {
                                } catch (IOException e2) {
                                } catch (AuthenticatorException e3) {
                                }
                                if (failed) {
                                    AccountSyncSettings.this.showDialog(101);
                                } else {
                                    AccountSyncSettings.this.finish();
                                }
                            }
                        }
                    }, null);
                }
            }).create();
        }
        if (i == 101) {
            return new Builder(getActivity()).setTitle(2131428879).setPositiveButton(17039370, null).setMessage(2131428881).create();
        }
        return i == 102 ? new Builder(getActivity()).setTitle(2131428884).setMessage(2131428885).setPositiveButton(17039370, null).create() : null;
    }

    protected void initializeUi(View view) {
        addPreferencesFromResource(2131034113);
        this.mErrorInfoView = (TextView) view.findViewById(2131230723);
        this.mErrorInfoView.setVisibility(8);
        this.mUserId = (TextView) view.findViewById(2131231043);
        this.mProviderId = (TextView) view.findViewById(2131231044);
        this.mProviderIcon = (ImageView) view.findViewById(2131231042);
    }

    protected void onAuthDescriptionsUpdated() {
        super.onAuthDescriptionsUpdated();
        getPreferenceScreen().removeAll();
        if (this.mAccount != null) {
            this.mProviderIcon.setImageDrawable(getDrawableForType(this.mAccount.type));
            this.mProviderId.setText(getLabelForType(this.mAccount.type));
        }
        addPreferencesFromResource(2131034113);
    }

    public void onPrepareOptionsMenu(Menu menu) {
        boolean z = true;
        super.onPrepareOptionsMenu(menu);
        boolean syncActive = ContentResolver.getCurrentSync() != null;
        MenuItem findItem = menu.findItem(1);
        if (syncActive) {
            z = false;
        }
        findItem.setVisible(z);
        menu.findItem(2).setVisible(syncActive);
    }

    private void requestOrCancelSync(Account account, String str, boolean z) {
        if (z) {
            Bundle bundle = new Bundle();
            bundle.putBoolean("force", true);
            ContentResolver.requestSync(account, str, bundle);
            return;
        }
        ContentResolver.cancelSync(account, str);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                startSyncForEnabledProviders();
                return true;
            case 2:
                cancelSyncForEnabledProviders();
                return true;
            case 3:
                showDialog(100);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    public void onResume() {
        Activity activity = getActivity();
        AccountManager.get(activity).addOnAccountsUpdatedListener(this, null, false);
        updateAuthDescriptions();
        onAccountsUpdated(AccountManager.get(activity).getAccounts());
        super.onResume();
    }

    public void onAccountsUpdated(Account[] accountArr) {
        super.onAccountsUpdated(accountArr);
        this.mAccounts = accountArr;
        updateAccountCheckboxes(accountArr);
        onSyncStateUpdated();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968578, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, (ListView) view.findViewById(16908298), false);
        initializeUi(view);
        return view;
    }

    private boolean isSyncing(List<SyncInfo> currentSyncs, Account account, String str) {
        for (SyncInfo syncInfo : currentSyncs) {
            if (syncInfo.account.equals(account) && syncInfo.authority.equals(str)) {
                return true;
            }
        }
        return false;
    }

    private void cancelSyncForEnabledProviders() {
        requestOrCancelSyncForEnabledProviders(false);
        getActivity().invalidateOptionsMenu();
    }

    private void startSyncForEnabledProviders() {
        requestOrCancelSyncForEnabledProviders(true);
        getActivity().invalidateOptionsMenu();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    public void onPause() {
        super.onPause();
        AccountManager.get(getActivity()).removeOnAccountsUpdatedListener(this);
    }

    protected void onSyncStateUpdated() {
        if (isResumed()) {
            setFeedsState();
        }
    }

    protected int getHelpResource() {
        return 2131429121;
    }
}