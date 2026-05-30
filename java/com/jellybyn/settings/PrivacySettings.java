package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.backup.IBackupManager;
import android.app.backup.IBackupManager.Stub;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings.Secure;

public class PrivacySettings extends SettingsPreferenceFragment implements OnClickListener {
    private CheckBoxPreference mAutoRestore;
    private CheckBoxPreference mBackup;
    private IBackupManager mBackupManager;
    private PreferenceScreen mConfigure;
    private Dialog mConfirmDialog;
    private int mDialogType;

    private void updateToggles() {
        ContentResolver res = getContentResolver();
        boolean backupEnabled = false;
        Intent configIntent = null;
        String configSummary = null;
        try {
            backupEnabled = this.mBackupManager.isBackupEnabled();
            String currentTransport = this.mBackupManager.getCurrentTransport();
            configIntent = this.mBackupManager.getConfigurationIntent(currentTransport);
            configSummary = this.mBackupManager.getDestinationString(currentTransport);
        } catch (RemoteException e) {
            this.mBackup.setEnabled(false);
        }
        this.mBackup.setChecked(backupEnabled);
        this.mAutoRestore.setChecked(Secure.getInt(res, "backup_auto_restore", 1) == 1);
        this.mAutoRestore.setEnabled(backupEnabled);
        boolean z = configIntent != null && backupEnabled;
        this.mConfigure.setEnabled(z);
        this.mConfigure.setIntent(configIntent);
        setConfigureSummary(configSummary);
    }

    private void setBackupEnabled(boolean z) {
        boolean z2 = true;
        if (this.mBackupManager != null) {
            try {
                this.mBackupManager.setBackupEnabled(z);
            } catch (RemoteException e) {
                this.mBackup.setChecked(!z);
                CheckBoxPreference checkBoxPreference = this.mAutoRestore;
                if (z) {
                    z2 = false;
                }
                checkBoxPreference.setEnabled(z2);
                return;
            }
        }
        this.mBackup.setChecked(z);
        this.mAutoRestore.setEnabled(z);
        this.mConfigure.setEnabled(z);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034135);
        PreferenceScreen screen = getPreferenceScreen();
        this.mBackupManager = Stub.asInterface(ServiceManager.getService("backup"));
        this.mBackup = (CheckBoxPreference) screen.findPreference("backup_data");
        this.mAutoRestore = (CheckBoxPreference) screen.findPreference("auto_restore");
        this.mConfigure = (PreferenceScreen) screen.findPreference("configure_account");
        if (getActivity().getPackageManager().resolveContentProvider("com.google.settings", 0) == null) {
            screen.removePreference(findPreference("backup_category"));
        }
        updateToggles();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        boolean z = true;
        if (preference == this.mBackup) {
            if (this.mBackup.isChecked()) {
                setBackupEnabled(true);
            } else {
                showEraseBackupDialog();
            }
        } else if (preference == this.mAutoRestore) {
            boolean curState = this.mAutoRestore.isChecked();
            try {
                this.mBackupManager.setAutoRestore(curState);
            } catch (RemoteException e) {
                CheckBoxPreference checkBoxPreference = this.mAutoRestore;
                if (curState) {
                    z = false;
                }
                checkBoxPreference.setChecked(z);
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (i == -1 && this.mDialogType == 2) {
            setBackupEnabled(false);
            updateConfigureSummary();
        }
        this.mDialogType = 0;
    }

    public void onStop() {
        if (this.mConfirmDialog != null && this.mConfirmDialog.isShowing()) {
            this.mConfirmDialog.dismiss();
        }
        this.mConfirmDialog = null;
        this.mDialogType = 0;
        super.onStop();
    }

    private void showEraseBackupDialog() {
        this.mBackup.setChecked(true);
        this.mDialogType = 2;
        this.mConfirmDialog = new Builder(getActivity()).setMessage(getResources().getText(2131428800)).setTitle(2131428799).setIconAttribute(16843605).setPositiveButton(17039370, this).setNegativeButton(17039360, this).show();
    }

    private void updateConfigureSummary() {
        try {
            setConfigureSummary(this.mBackupManager.getDestinationString(this.mBackupManager.getCurrentTransport()));
        } catch (RemoteException e) {
        }
    }

    private void setConfigureSummary(String str) {
        if (str != null) {
            this.mConfigure.setSummary(str);
        } else {
            this.mConfigure.setSummary(2131428790);
        }
    }

    public void onResume() {
        super.onResume();
        updateToggles();
    }

    protected int getHelpResource() {
        return 2131429123;
    }
}