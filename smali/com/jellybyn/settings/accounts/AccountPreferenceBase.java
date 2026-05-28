package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.accounts.AuthenticatorDescription;
import android.accounts.OnAccountsUpdateListener;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.SyncAdapterType;
import android.content.SyncStatusObserver;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.google.android.collect.Maps;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

class AccountPreferenceBase extends SettingsPreferenceFragment implements OnAccountsUpdateListener {
    private HashMap<String, ArrayList<String>> mAccountTypeToAuthorities = null;
    private AuthenticatorHelper mAuthenticatorHelper = new AuthenticatorHelper();
    private DateFormat mDateFormat;
    private final Handler mHandler = new Handler();
    private Object mStatusChangeListenerHandle;
    private SyncStatusObserver mSyncStatusObserver = new SyncStatusObserver() {
        public void onStatusChanged(int i) {
            AccountPreferenceBase.this.mHandler.post(new Runnable() {
                public void run() {
                    AccountPreferenceBase.this.onSyncStateUpdated();
                }
            });
        }
    };
    private DateFormat mTimeFormat;

    public ArrayList<String> getAuthoritiesForAccountType(String str) {
        if (this.mAccountTypeToAuthorities == null) {
            this.mAccountTypeToAuthorities = Maps.newHashMap();
            for (SyncAdapterType syncAdapterType : ContentResolver.getSyncAdapterTypes()) {
                ArrayList arrayList = (ArrayList) this.mAccountTypeToAuthorities.get(syncAdapterType.accountType);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    this.mAccountTypeToAuthorities.put(syncAdapterType.accountType, arrayList);
                }
                if (Log.isLoggable("AccountSettings", 2)) {
                    Log.d("AccountSettings", "added authority " + syncAdapterType.authority + " to accountType " + syncAdapterType.accountType);
                }
                arrayList.add(syncAdapterType.authority);
            }
        }
        return (ArrayList) this.mAccountTypeToAuthorities.get(str);
    }

    public PreferenceScreen addPreferencesForType(String str, PreferenceScreen preferenceScreen) {
        if (!this.mAuthenticatorHelper.containsAccountType(str)) {
            return null;
        }
        try {
            AuthenticatorDescription desc = this.mAuthenticatorHelper.getAccountTypeDescription(str);
            if (desc == null || desc.accountPreferencesId == 0) {
                return null;
            }
            return getPreferenceManager().inflateFromResource(getActivity().createPackageContext(desc.packageName, 0), desc.accountPreferencesId, preferenceScreen);
        } catch (NameNotFoundException e) {
            Log.w("AccountSettings", "Couldn't load preferences.xml file from " + null.packageName);
            return null;
        } catch (NotFoundException e2) {
            Log.w("AccountSettings", "Couldn't load preferences.xml file from " + null.packageName);
            return null;
        }
    }

    AccountPreferenceBase() {
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mDateFormat = android.text.format.DateFormat.getDateFormat(activity);
        this.mTimeFormat = android.text.format.DateFormat.getTimeFormat(activity);
    }

    public void onResume() {
        super.onResume();
        this.mStatusChangeListenerHandle = ContentResolver.addStatusChangeListener(13, this.mSyncStatusObserver);
        onSyncStateUpdated();
    }

    public void onPause() {
        super.onPause();
        ContentResolver.removeStatusChangeListener(this.mStatusChangeListenerHandle);
    }

    public void updateAuthDescriptions() {
        this.mAuthenticatorHelper.updateAuthDescriptions(getActivity());
        onAuthDescriptionsUpdated();
    }

    protected String formatSyncDate(Date date) {
        return this.mDateFormat.format(date) + " " + this.mTimeFormat.format(date);
    }

    protected Drawable getDrawableForType(String str) {
        return this.mAuthenticatorHelper.getDrawableForType(getActivity(), str);
    }

    protected CharSequence getLabelForType(String str) {
        return this.mAuthenticatorHelper.getLabelForType(getActivity(), str);
    }

    public void onAccountsUpdated(Account[] accountArr) {
    }

    protected void onAuthDescriptionsUpdated() {
    }

    protected void onSyncStateUpdated() {
    }
}