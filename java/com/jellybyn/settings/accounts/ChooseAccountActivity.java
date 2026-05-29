package com.jellybyn.settings.accounts;

import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SyncAdapterType;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.util.Log;
import com.android.internal.util.CharSequences;
import com.google.android.collect.Maps;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class ChooseAccountActivity extends PreferenceActivity {
    private HashMap<String, ArrayList<String>> mAccountTypeToAuthorities = null;
    public HashSet<String> mAccountTypesFilter;
    private PreferenceGroup mAddAccountGroup;
    private AuthenticatorDescription[] mAuthDescs;
    private String[] mAuthorities;
    private final ArrayList<ProviderEntry> mProviderList = new ArrayList();
    private Map<String, AuthenticatorDescription> mTypeToAuthDescription = new HashMap();

    private static class ProviderEntry implements Comparable<ProviderEntry> {
        private final CharSequence name;
        private final String type;

        public int compareTo(ProviderEntry providerEntry) {
            if (this.name == null) {
                return -1;
            }
            return providerEntry.name == null ? 1 : CharSequences.compareToIgnoreCase(this.name, providerEntry.name);
        }

        ProviderEntry(CharSequence charSequence, String str) {
            this.name = charSequence;
            this.type = str;
        }
    }

    private void onAuthDescriptionsUpdated() {
        for (AuthenticatorDescription authenticatorDescription : this.mAuthDescs) {
            String str = authenticatorDescription.type;
            CharSequence labelForType = getLabelForType(str);
            ArrayList authoritiesForAccountType = getAuthoritiesForAccountType(str);
            Object obj = 1;
            if (this.mAuthorities != null && this.mAuthorities.length > 0 && authoritiesForAccountType != null) {
                obj = null;
                for (String contains : this.mAuthorities) {
                    if (authoritiesForAccountType.contains(contains)) {
                        obj = 1;
                        break;
                    }
                }
            }
            if (!(obj == null || this.mAccountTypesFilter == null || this.mAccountTypesFilter.contains(str))) {
                obj = null;
            }
            if (obj != null) {
                this.mProviderList.add(new ProviderEntry(labelForType, str));
            } else if (Log.isLoggable("ChooseAccountActivity", 2)) {
                Log.v("ChooseAccountActivity", "Skipped pref " + labelForType + ": has no authority we need");
            }
        }
        if (this.mProviderList.size() == 1) {
            finishWithAccountType(((ProviderEntry) this.mProviderList.get(0)).type);
        } else if (this.mProviderList.size() > 0) {
            Collections.sort(this.mProviderList);
            this.mAddAccountGroup.removeAll();
            Iterator it = this.mProviderList.iterator();
            while (it.hasNext()) {
                ProviderEntry providerEntry = (ProviderEntry) it.next();
                this.mAddAccountGroup.addPreference(new ProviderPreference(this, providerEntry.type, getDrawableForType(providerEntry.type), providerEntry.name));
            }
        } else {
            if (Log.isLoggable("ChooseAccountActivity", 2)) {
                StringBuilder stringBuilder = new StringBuilder();
                for (String append : this.mAuthorities) {
                    stringBuilder.append(append);
                    stringBuilder.append(' ');
                }
                Log.v("ChooseAccountActivity", "No providers found for authorities: " + stringBuilder);
            }
            setResult(0);
            finish();
        }
    }

    public ArrayList<String> getAuthoritiesForAccountType(String str) {
        if (this.mAccountTypeToAuthorities == null) {
            this.mAccountTypeToAuthorities = Maps.newHashMap();
            for (SyncAdapterType syncAdapterType : ContentResolver.getSyncAdapterTypes()) {
                ArrayList arrayList = (ArrayList) this.mAccountTypeToAuthorities.get(syncAdapterType.accountType);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    this.mAccountTypeToAuthorities.put(syncAdapterType.accountType, arrayList);
                }
                if (Log.isLoggable("ChooseAccountActivity", 2)) {
                    Log.d("ChooseAccountActivity", "added authority " + syncAdapterType.authority + " to accountType " + syncAdapterType.accountType);
                }
                arrayList.add(syncAdapterType.authority);
            }
        }
        return (ArrayList) this.mAccountTypeToAuthorities.get(str);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968579);
        addPreferencesFromResource(2131034114);
        this.mAuthorities = getIntent().getStringArrayExtra("authorities");
        String[] accountTypesFilter = getIntent().getStringArrayExtra("account_types");
        if (accountTypesFilter != null) {
            this.mAccountTypesFilter = new HashSet();
            for (Object add : accountTypesFilter) {
                this.mAccountTypesFilter.add(add);
            }
        }
        this.mAddAccountGroup = getPreferenceScreen();
        updateAuthDescriptions();
    }

    protected Drawable getDrawableForType(String str) {
        Drawable icon = null;
        if (!this.mTypeToAuthDescription.containsKey(str)) {
            return icon;
        }
        try {
            AuthenticatorDescription authenticatorDescription = (AuthenticatorDescription) this.mTypeToAuthDescription.get(str);
            return createPackageContext(authenticatorDescription.packageName, 0).getResources().getDrawable(authenticatorDescription.iconId);
        } catch (NameNotFoundException e) {
            Log.w("ChooseAccountActivity", "No icon name for account type " + str);
            return icon;
        } catch (NotFoundException e2) {
            Log.w("ChooseAccountActivity", "No icon resource for account type " + str);
            return icon;
        }
    }

    protected CharSequence getLabelForType(String str) {
        CharSequence label = null;
        if (!this.mTypeToAuthDescription.containsKey(str)) {
            return label;
        }
        try {
            AuthenticatorDescription authenticatorDescription = (AuthenticatorDescription) this.mTypeToAuthDescription.get(str);
            return createPackageContext(authenticatorDescription.packageName, 0).getResources().getText(authenticatorDescription.labelId);
        } catch (NameNotFoundException e) {
            Log.w("ChooseAccountActivity", "No label name for account type " + str);
            return label;
        } catch (NotFoundException e2) {
            Log.w("ChooseAccountActivity", "No label resource for account type " + str);
            return label;
        }
    }

    private void updateAuthDescriptions() {
        this.mAuthDescs = AccountManager.get(this).getAuthenticatorTypes();
        for (int i = 0; i < this.mAuthDescs.length; i++) {
            this.mTypeToAuthDescription.put(this.mAuthDescs[i].type, this.mAuthDescs[i]);
        }
        onAuthDescriptionsUpdated();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference instanceof ProviderPreference) {
            ProviderPreference providerPreference = (ProviderPreference) preference;
            if (Log.isLoggable("ChooseAccountActivity", 2)) {
                Log.v("ChooseAccountActivity", "Attempting to add account of type " + providerPreference.getAccountType());
            }
            finishWithAccountType(providerPreference.getAccountType());
        }
        return true;
    }

    private void finishWithAccountType(String str) {
        Intent intent = new Intent();
        intent.putExtra("selected_account", str);
        setResult(-1, intent);
        finish();
    }
}