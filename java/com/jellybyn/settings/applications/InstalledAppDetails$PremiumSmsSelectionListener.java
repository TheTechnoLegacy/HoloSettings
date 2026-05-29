package com.jellybyn.settings.applications;

import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.android.internal.telephony.ISms;

class InstalledAppDetails$PremiumSmsSelectionListener implements OnItemSelectedListener {
    private final String mPackageName;
    private final ISms mSmsManager;

    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
        if (i < 0 || i >= 3) {
            Log.e("InstalledAppDetails", "Error: unknown premium SMS policy " + i);
            return;
        }
        Log.d("InstalledAppDetails", "Selected premium SMS policy " + i);
        setPremiumSmsPermission(this.mPackageName, i + 1);
    }

    InstalledAppDetails$PremiumSmsSelectionListener(String str, ISms iSms) {
        this.mPackageName = str;
        this.mSmsManager = iSms;
    }

    private void setPremiumSmsPermission(String str, int i) {
        try {
            if (this.mSmsManager != null) {
                this.mSmsManager.setPremiumSmsPermission(str, i);
            }
        } catch (RemoteException e) {
        }
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
    }
}