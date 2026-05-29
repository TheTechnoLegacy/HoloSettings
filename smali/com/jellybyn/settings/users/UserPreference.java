package com.jellybyn.settings.users;

import android.content.Context;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;

public class UserPreference extends Preference {
    private OnClickListener mDeleteClickListener;
    private int mSerialNumber;
    private OnClickListener mSettingsClickListener;
    private int mUserId;

    protected void onBindView(View view) {
        View deleteDividerView = view.findViewById(2131230960);
        View manageDividerView = view.findViewById(2131230958);
        View deleteView = view.findViewById(2131230961);
        if (deleteView != null) {
            if (this.mDeleteClickListener != null) {
                deleteView.setOnClickListener(this.mDeleteClickListener);
                deleteView.setTag(this);
            } else {
                deleteView.setVisibility(8);
                deleteDividerView.setVisibility(8);
            }
        }
        View manageView = view.findViewById(2131230959);
        if (manageView != null) {
            if (this.mSettingsClickListener != null) {
                manageView.setOnClickListener(this.mSettingsClickListener);
                manageView.setTag(this);
                if (this.mDeleteClickListener != null) {
                    manageDividerView.setVisibility(8);
                }
            } else {
                manageView.setVisibility(8);
                manageDividerView.setVisibility(8);
            }
        }
        super.onBindView(view);
    }

    UserPreference(Context context, AttributeSet attributeSet, int i, OnClickListener onClickListener, OnClickListener onClickListener2) {
        this(context, attributeSet);
        this.mSerialNumber = -1;
        this.mUserId = -10;
        if (!(onClickListener2 == null && onClickListener == null)) {
            setWidgetLayoutResource(2130968675);
        }
        this.mDeleteClickListener = onClickListener2;
        this.mSettingsClickListener = onClickListener;
        this.mUserId = i;
    }

    private int getSerialNumber() {
        if (this.mUserId == UserHandle.myUserId()) {
            return Integer.MIN_VALUE;
        }
        if (this.mSerialNumber < 0) {
            if (this.mUserId == -10) {
                return Integer.MAX_VALUE;
            }
            this.mSerialNumber = ((UserManager) getContext().getSystemService("user")).getUserSerialNumber(this.mUserId);
            if (this.mSerialNumber < 0) {
                return this.mUserId;
            }
        }
        return this.mSerialNumber;
    }

    public int compareTo(Preference preference) {
        return (!(preference instanceof UserPreference) || getSerialNumber() > ((UserPreference) preference).getSerialNumber()) ? 1 : -1;
    }

    public UserPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, -10, null, null);
    }

    public int getUserId() {
        return this.mUserId;
    }
}