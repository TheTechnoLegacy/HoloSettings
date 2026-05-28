package com.jellybyn.settings.fuelgauge;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;

public class PowerGaugePreference extends Preference {
    private BatterySipper mInfo;
    private int mProgress;
    private CharSequence mProgressText;

    public PowerGaugePreference(Context context, Drawable drawable, BatterySipper batterySipper) {
        super(context);
        setLayoutResource(2130968586);
        if (drawable == null) {
            drawable = new ColorDrawable(0);
        }
        setIcon(drawable);
        this.mInfo = batterySipper;
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        ((ProgressBar) view.findViewById(16908301)).setProgress(this.mProgress);
        ((TextView) view.findViewById(16908308)).setText(this.mProgressText);
    }

    public void setPercent(double d, double d2) {
        this.mProgress = (int) Math.ceil(d);
        this.mProgressText = getContext().getResources().getString(2131429063, new Object[]{Integer.valueOf((int) Math.ceil(d2))});
        notifyChanged();
    }

    BatterySipper getInfo() {
        return this.mInfo;
    }
}