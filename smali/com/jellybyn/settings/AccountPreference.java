package com.jellybyn.settings;

import android.accounts.Account;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import java.util.ArrayList;

public class AccountPreference extends Preference {
    private Account mAccount;
    private ArrayList<String> mAuthorities;
    private boolean mShowTypeIcon;
    private int mStatus;
    private ImageView mSyncStatusIcon;

    private int getSyncStatusIcon(int i) {
        switch (i) {
            case 0:
                return 2130837624;
            case 1:
                return 2130837626;
            case 2:
                return 2130837628;
            case 3:
                return 2130837624;
            default:
                Log.e("AccountPreference", "Unknown sync status: " + i);
                return 2130837628;
        }
    }

    private int getSyncStatusMessage(int i) {
        switch (i) {
            case 0:
                return 2131428858;
            case 1:
                return 2131428859;
            case 2:
                return 2131428860;
            case 3:
                return 2131428862;
            default:
                Log.e("AccountPreference", "Unknown sync status: " + i);
                return 2131428860;
        }
    }

    public AccountPreference(Context context, Account account, Drawable drawable, ArrayList<String> authorities, boolean z) {
        super(context);
        this.mAccount = account;
        this.mAuthorities = authorities;
        this.mShowTypeIcon = z;
        if (z) {
            setIcon(drawable);
        } else {
            setIcon(getSyncStatusIcon(1));
        }
        setTitle(this.mAccount.name);
        setSummary("");
        setPersistent(false);
        setSyncStatus(1, false);
    }

    private String getSyncContentDescription(int i) {
        switch (i) {
            case 0:
                return getContext().getString(2131428845);
            case 1:
                return getContext().getString(2131428846);
            case 2:
                return getContext().getString(2131428847);
            default:
                Log.e("AccountPreference", "Unknown sync status: " + i);
                return getContext().getString(2131428847);
        }
    }

    public void setSyncStatus(int i, boolean z) {
        this.mStatus = i;
        if (!(this.mShowTypeIcon || this.mSyncStatusIcon == null)) {
            this.mSyncStatusIcon.setImageResource(getSyncStatusIcon(i));
            this.mSyncStatusIcon.setContentDescription(getSyncContentDescription(this.mStatus));
        }
        if (z) {
            setSummary(getSyncStatusMessage(i));
        }
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        if (!this.mShowTypeIcon) {
            this.mSyncStatusIcon = (ImageView) view.findViewById(16908294);
            this.mSyncStatusIcon.setImageResource(getSyncStatusIcon(this.mStatus));
            this.mSyncStatusIcon.setContentDescription(getSyncContentDescription(this.mStatus));
        }
    }

    public Account getAccount() {
        return this.mAccount;
    }

    public ArrayList<String> getAuthorities() {
        return this.mAuthorities;
    }
}