package com.jellybyn.settings;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.widget.CheckBox;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;

public class AllowBindAppWidgetActivity extends AlertActivity implements OnClickListener {
    private CheckBox mAlwaysUse;
    private int mAppWidgetId;
    private AppWidgetManager mAppWidgetManager;
    private String mCallingPackage;
    private boolean mClicked;
    private ComponentName mComponentName;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        CharSequence label = "";
        if (intent != null) {
            try {
                this.mAppWidgetId = intent.getIntExtra("appWidgetId", -1);
                this.mComponentName = (ComponentName) intent.getParcelableExtra("appWidgetProvider");
                this.mCallingPackage = getCallingPackage();
                PackageManager packageManager = getPackageManager();
                label = packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.mCallingPackage, 0));
            } catch (Exception e) {
                this.mAppWidgetId = -1;
                this.mComponentName = null;
                this.mCallingPackage = null;
                Log.v("BIND_APPWIDGET", "Error getting parameters");
                setResult(0);
                finish();
                return;
            }
        }
        AlertParams alertParams = this.mAlertParams;
        alertParams.mTitle = getString(2131428577);
        alertParams.mMessage = getString(2131428578, new Object[]{label});
        alertParams.mPositiveButtonText = getString(2131427336);
        alertParams.mNegativeButtonText = getString(17039360);
        alertParams.mPositiveButtonListener = this;
        alertParams.mNegativeButtonListener = this;
        alertParams.mView = ((LayoutInflater) getSystemService("layout_inflater")).inflate(17367080, null);
        this.mAlwaysUse = (CheckBox) alertParams.mView.findViewById(16908912);
        this.mAlwaysUse.setText(getString(2131428579, new Object[]{label}));
        this.mAlwaysUse.setPadding(this.mAlwaysUse.getPaddingLeft(), this.mAlwaysUse.getPaddingTop(), this.mAlwaysUse.getPaddingRight(), (int) (((float) this.mAlwaysUse.getPaddingBottom()) + getResources().getDimension(2131558410)));
        this.mAppWidgetManager = AppWidgetManager.getInstance(this);
        this.mAlwaysUse.setChecked(this.mAppWidgetManager.hasBindAppWidgetPermission(this.mCallingPackage));
        setupAlert();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1) {
            setResult(0);
            if (!(this.mAppWidgetId == -1 || this.mComponentName == null || this.mCallingPackage == null)) {
                try {
                    this.mAppWidgetManager.bindAppWidgetId(this.mAppWidgetId, this.mComponentName);
                    Intent intent = new Intent();
                    intent.putExtra("appWidgetId", this.mAppWidgetId);
                    setResult(-1, intent);
                } catch (Exception e) {
                    Log.v("BIND_APPWIDGET", "Error binding widget with id " + this.mAppWidgetId + " and component " + this.mComponentName);
                }
            }
            boolean isChecked = this.mAlwaysUse.isChecked();
            if (isChecked != this.mAppWidgetManager.hasBindAppWidgetPermission(this.mCallingPackage)) {
                this.mAppWidgetManager.setBindAppWidgetPermission(this.mCallingPackage, isChecked);
            }
        }
        finish();
    }

    protected void onDestroy() {
        if (!this.mClicked) {
            setResult(0);
            finish();
        }
        super.onDestroy();
    }
}