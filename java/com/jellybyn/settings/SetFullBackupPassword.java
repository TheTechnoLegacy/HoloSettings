package com.jellybyn.settings;

import android.app.Activity;
import android.app.backup.IBackupManager;
import android.app.backup.IBackupManager.Stub;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class SetFullBackupPassword extends Activity {
    IBackupManager mBackupManager;
    OnClickListener mButtonListener = new 1(this);
    Button mCancel;
    TextView mConfirmNewPw;
    TextView mCurrentPw;
    TextView mNewPw;
    Button mSet;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mBackupManager = Stub.asInterface(ServiceManager.getService("backup"));
        setContentView(2130968690);
        this.mCurrentPw = (TextView) findViewById(2131231019);
        this.mNewPw = (TextView) findViewById(2131231021);
        this.mConfirmNewPw = (TextView) findViewById(2131231023);
        this.mCancel = (Button) findViewById(2131231024);
        this.mSet = (Button) findViewById(2131231025);
        this.mCancel.setOnClickListener(this.mButtonListener);
        this.mSet.setOnClickListener(this.mButtonListener);
    }

    private boolean setBackupPassword(String str, String str2) {
        try {
            return this.mBackupManager.setBackupPassword(str, str2);
        } catch (RemoteException e) {
            Log.e("SetFullBackupPassword", "Unable to communicate with backup manager");
            return false;
        }
    }
}