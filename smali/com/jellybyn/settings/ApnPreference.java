package com.jellybyn.settings;

import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.preference.Preference;
import android.provider.Telephony.Carriers;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;
import android.widget.RelativeLayout;

public class ApnPreference extends Preference implements OnClickListener, OnCheckedChangeListener {
    private static CompoundButton mCurrentChecked = null;
    private static String mSelectedKey = null;
    private boolean mProtectFromCheckedChange = false;
    private boolean mSelectable = true;

    public View getView(View view, ViewGroup viewGroup) {
        View view2 = super.getView(view, viewGroup);
        View widget = view2.findViewById(16842753);
        if (widget != null && (widget instanceof RadioButton)) {
            RadioButton rb = (RadioButton) widget;
            if (this.mSelectable) {
                rb.setOnCheckedChangeListener(this);
                boolean equals = getKey().equals(mSelectedKey);
                if (equals) {
                    mCurrentChecked = rb;
                    mSelectedKey = getKey();
                }
                this.mProtectFromCheckedChange = true;
                rb.setChecked(equals);
                this.mProtectFromCheckedChange = false;
            } else {
                rb.setVisibility(8);
            }
        }
        View findViewById = view2.findViewById(16842752);
        if (findViewById != null && (findViewById instanceof RelativeLayout)) {
            findViewById.setOnClickListener(this);
        }
        return view2;
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        Log.i("ApnPreference", "ID: " + getKey() + " :" + z);
        if (!this.mProtectFromCheckedChange) {
            if (z) {
                if (mCurrentChecked != null) {
                    mCurrentChecked.setChecked(false);
                }
                mCurrentChecked = compoundButton;
                mSelectedKey = getKey();
                callChangeListener(mSelectedKey);
                return;
            }
            mCurrentChecked = null;
            mSelectedKey = null;
        }
    }

    public void onClick(View view) {
        if (view != null && 16842752 == view.getId()) {
            Context context = getContext();
            if (context != null) {
                context.startActivity(new Intent("android.intent.action.EDIT", ContentUris.withAppendedId(Carriers.CONTENT_URI, (long) Integer.parseInt(getKey()))));
            }
        }
    }

    public ApnPreference(Context context) {
        super(context);
        init();
    }

    public ApnPreference(Context context, AttributeSet attributeSet) {
        init();
    }

    public ApnPreference(Context context, AttributeSet attributeSet, int i) {
        init();
    }

    private void init() {
        setLayoutResource(2130968581);
    }

    public void setChecked() {
        mSelectedKey = getKey();
    }

    public void setSelectable(boolean z) {
        this.mSelectable = z;
    }
}