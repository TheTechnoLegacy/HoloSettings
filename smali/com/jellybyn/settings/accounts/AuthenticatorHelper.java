package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.content.Context;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AuthenticatorHelper {
    private Map<String, Drawable> mAccTypeIconCache = new HashMap();
    private AuthenticatorDescription[] mAuthDescs;
    private ArrayList<String> mEnabledAccountTypes = new ArrayList();
    private Map<String, AuthenticatorDescription> mTypeToAuthDescription = new HashMap();

    public Drawable getDrawableForType(Context context, String str) {
        Drawable icon = null;
        if (this.mAccTypeIconCache.containsKey(str)) {
            return (Drawable) this.mAccTypeIconCache.get(str);
        }
        if (this.mTypeToAuthDescription.containsKey(str)) {
            try {
                AuthenticatorDescription authenticatorDescription = (AuthenticatorDescription) this.mTypeToAuthDescription.get(str);
                icon = context.createPackageContext(authenticatorDescription.packageName, 0).getResources().getDrawable(authenticatorDescription.iconId);
                this.mAccTypeIconCache.put(str, icon);
            } catch (NameNotFoundException e) {
            } catch (NotFoundException e2) {
            }
        }
        if (icon == null) {
            icon = context.getPackageManager().getDefaultActivityIcon();
        }
        return icon;
    }

    public CharSequence getLabelForType(Context context, String str) {
        CharSequence label = null;
        if (!this.mTypeToAuthDescription.containsKey(str)) {
            return label;
        }
        try {
            AuthenticatorDescription authenticatorDescription = (AuthenticatorDescription) this.mTypeToAuthDescription.get(str);
            return context.createPackageContext(authenticatorDescription.packageName, 0).getResources().getText(authenticatorDescription.labelId);
        } catch (NameNotFoundException e) {
            Log.w("AuthenticatorHelper", "No label name for account type " + str);
            return label;
        } catch (NotFoundException e2) {
            Log.w("AuthenticatorHelper", "No label icon for account type " + str);
            return label;
        }
    }

    public void onAccountsUpdated(Context context, Account[] accountArr) {
        if (accountArr == null) {
            accountArr = AccountManager.get(context).getAccounts();
        }
        this.mEnabledAccountTypes.clear();
        this.mAccTypeIconCache.clear();
        for (Account account : accountArr) {
            if (!this.mEnabledAccountTypes.contains(account.type)) {
                this.mEnabledAccountTypes.add(account.type);
            }
        }
    }

    public boolean hasAccountPreferences(String str) {
        if (containsAccountType(str)) {
            AuthenticatorDescription accountTypeDescription = getAccountTypeDescription(str);
            if (!(accountTypeDescription == null || accountTypeDescription.accountPreferencesId == 0)) {
                return true;
            }
        }
        return false;
    }

    public void updateAuthDescriptions(Context context) {
        this.mAuthDescs = AccountManager.get(context).getAuthenticatorTypes();
        for (int i = 0; i < this.mAuthDescs.length; i++) {
            this.mTypeToAuthDescription.put(this.mAuthDescs[i].type, this.mAuthDescs[i]);
        }
    }

    public boolean containsAccountType(String str) {
        return this.mTypeToAuthDescription.containsKey(str);
    }

    public AuthenticatorDescription getAccountTypeDescription(String str) {
        return (AuthenticatorDescription) this.mTypeToAuthDescription.get(str);
    }

    public String[] getEnabledAccountTypes() {
        return (String[]) this.mEnabledAccountTypes.toArray(new String[this.mEnabledAccountTypes.size()]);
    }
}