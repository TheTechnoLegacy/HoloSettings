package com.jellybyn.settings.net;

import android.content.Context;
import android.net.NetworkPolicy;
import android.net.NetworkTemplate;
import android.preference.CheckBoxPreference;

class DataUsageMeteredSettings$MeteredPreference extends CheckBoxPreference {
    private boolean mBinding = true;
    private final NetworkTemplate mTemplate;
    final /* synthetic */ DataUsageMeteredSettings this$0;

    public DataUsageMeteredSettings$MeteredPreference(DataUsageMeteredSettings dataUsageMeteredSettings, Context context, NetworkTemplate networkTemplate) {
        this.this$0 = dataUsageMeteredSettings;
        super(context);
        this.mTemplate = networkTemplate;
        setPersistent(false);
        NetworkPolicy policy = DataUsageMeteredSettings.access$000(dataUsageMeteredSettings).getPolicyMaybeUnquoted(networkTemplate);
        if (policy == null) {
            setChecked(false);
        } else if (policy.limitBytes != -1) {
            setChecked(true);
            setEnabled(false);
        } else {
            setChecked(policy.metered);
        }
        this.mBinding = false;
    }

    protected void notifyChanged() {
        super.notifyChanged();
        if (!this.mBinding) {
            DataUsageMeteredSettings.access$000(this.this$0).setPolicyMetered(this.mTemplate, isChecked());
        }
    }
}