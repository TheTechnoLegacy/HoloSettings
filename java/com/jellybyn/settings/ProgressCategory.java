package com.jellybyn.settings;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;

public class ProgressCategory extends ProgressCategoryBase {
    private final int mEmptyTextRes;
    private boolean mNoDeviceFoundAdded;
    private Preference mNoDeviceFoundPreference;
    private boolean mProgress = false;

    public void onBindView(View view) {
        super.onBindView(view);
        View progressBar = view.findViewById(2131230946);
        boolean noDeviceFound = getPreferenceCount() == 0 || (getPreferenceCount() == 1 && getPreference(0) == this.mNoDeviceFoundPreference);
        progressBar.setVisibility(this.mProgress ? 0 : 8);
        if (this.mProgress || !noDeviceFound) {
            if (this.mNoDeviceFoundAdded) {
                removePreference(this.mNoDeviceFoundPreference);
                this.mNoDeviceFoundAdded = false;
            }
        } else if (!this.mNoDeviceFoundAdded) {
            if (this.mNoDeviceFoundPreference == null) {
                this.mNoDeviceFoundPreference = new Preference(getContext());
                this.mNoDeviceFoundPreference.setLayoutResource(2130968663);
                this.mNoDeviceFoundPreference.setTitle(this.mEmptyTextRes);
                this.mNoDeviceFoundPreference.setSelectable(false);
            }
            addPreference(this.mNoDeviceFoundPreference);
            this.mNoDeviceFoundAdded = true;
        }
    }

    public ProgressCategory(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet);
        setLayoutResource(2130968670);
        this.mEmptyTextRes = i;
    }

    public void setProgress(boolean z) {
        this.mProgress = z;
        notifyChanged();
    }
}