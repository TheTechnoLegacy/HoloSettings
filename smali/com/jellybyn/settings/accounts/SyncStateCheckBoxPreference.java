package com.jellybyn.settings.accounts;

import android.accounts.Account;
import android.app.ActivityManager;
import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import com.jellybyn.settings.widget.AnimatedImageView;

public class SyncStateCheckBoxPreference extends CheckBoxPreference {
    private Account mAccount;
    private String mAuthority;
    private boolean mFailed = false;
    private boolean mIsActive = false;
    private boolean mIsPending = false;
    private boolean mOneTimeSyncMode = false;

    public void onBindView(View view) {
        super.onBindView(view);
        AnimatedImageView syncActiveView = (AnimatedImageView) view.findViewById(2131230964);
        View syncFailedView = view.findViewById(2131230963);
        boolean activeVisible = this.mIsActive || this.mIsPending;
        syncActiveView.setVisibility(activeVisible ? 0 : 8);
        syncActiveView.setAnimating(this.mIsActive);
        boolean failedVisible = this.mFailed && !activeVisible;
        syncFailedView.setVisibility(failedVisible ? 0 : 8);
        View checkBox = view.findViewById(16908289);
        if (this.mOneTimeSyncMode) {
            checkBox.setVisibility(8);
            ((TextView) view.findViewById(16908304)).setText(getContext().getString(2131428867, new Object[]{getSummary()}));
            return;
        }
        checkBox.setVisibility(0);
    }

    public SyncStateCheckBoxPreference(Context context, Account account, String str) {
        this(context, null);
        this.mAccount = account;
        this.mAuthority = str;
        setWidgetLayoutResource(2130968677);
    }

    public SyncStateCheckBoxPreference(Context context, AttributeSet attributeSet) {
        setWidgetLayoutResource(2130968677);
        this.mAccount = null;
        this.mAuthority = null;
    }

    protected void onClick() {
        if (!this.mOneTimeSyncMode) {
            if (ActivityManager.isUserAMonkey()) {
                Log.d("SyncState", "ignoring monkey's attempt to flip sync state");
            } else {
                super.onClick();
            }
        }
    }

    public void setActive(boolean z) {
        this.mIsActive = z;
        notifyChanged();
    }

    public void setFailed(boolean z) {
        this.mFailed = z;
        notifyChanged();
    }

    public void setOneTimeSyncMode(boolean z) {
        this.mOneTimeSyncMode = z;
        notifyChanged();
    }

    public void setPending(boolean z) {
        this.mIsPending = z;
        notifyChanged();
    }

    public Account getAccount() {
        return this.mAccount;
    }

    public String getAuthority() {
        return this.mAuthority;
    }

    public boolean isOneTimeSyncMode() {
        return this.mOneTimeSyncMode;
    }
}