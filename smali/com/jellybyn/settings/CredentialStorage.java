package com.jellybyn.settings;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.security.KeyStore;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.widget.LockPatternUtils;

public final class CredentialStorage extends Activity {
    private Bundle mInstallBundle;
    private final KeyStore mKeyStore = KeyStore.getInstance();
    private int mRetriesRemaining = -1;

    private void installIfAvailable() {
        if (this.mInstallBundle != null && !this.mInstallBundle.isEmpty()) {
            Bundle bundle = this.mInstallBundle;
            this.mInstallBundle = null;
            int uid = bundle.getInt("install_as_uid", -1);
            if (bundle.containsKey("user_private_key_name")) {
                String string = bundle.getString("user_private_key_name");
                if (!this.mKeyStore.importKey(string, bundle.getByteArray("user_private_key_data"), uid, 1)) {
                    Log.e("CredentialStorage", "Failed to install " + string + " as user " + uid);
                    return;
                }
            }
            if (bundle.containsKey("user_certificate_name")) {
                String string2 = bundle.getString("user_certificate_name");
                if (!this.mKeyStore.put(string2, bundle.getByteArray("user_certificate_data"), uid, 1)) {
                    Log.e("CredentialStorage", "Failed to install " + string2 + " as user " + uid);
                    return;
                }
            }
            if (bundle.containsKey("ca_certificates_name")) {
                String string3 = bundle.getString("ca_certificates_name");
                if (!this.mKeyStore.put(string3, bundle.getByteArray("ca_certificates_data"), uid, 1)) {
                    Log.e("CredentialStorage", "Failed to install " + string3 + " as user " + uid);
                    return;
                }
            }
            setResult(-1);
        }
    }

    private void handleUnlockOrInstall() {
        if (!isFinishing()) {
            switch (1.$SwitchMap$android$security$KeyStore$State[this.mKeyStore.state().ordinal()]) {
                case 1:
                    ensureKeyGuard();
                    return;
                case 2:
                    UnlockDialog configureKeyGuardDialog = new ConfigureKeyGuardDialog(this, null);
                    return;
                case 3:
                    if (checkKeyGuardQuality()) {
                        installIfAvailable();
                        finish();
                        return;
                    }
                    ConfigureKeyGuardDialog configureKeyGuardDialog2 = new ConfigureKeyGuardDialog(this, null);
                    return;
                default:
                    return;
            }
        }
    }

    protected void onResume() {
        super.onResume();
        Intent intent = getIntent();
        String action = intent.getAction();
        if ("com.android.credentials.RESET".equals(action)) {
            ResetDialog configureKeyGuardDialog = new ConfigureKeyGuardDialog(this, null);
            return;
        }
        if ("com.android.credentials.INSTALL".equals(action) && "com.android.certinstaller".equals(getCallingPackage())) {
            this.mInstallBundle = intent.getExtras();
        }
        handleUnlockOrInstall();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 1) {
            if (i2 == -1) {
                String stringExtra = intent.getStringExtra("password");
                if (!TextUtils.isEmpty(stringExtra)) {
                    this.mKeyStore.password(stringExtra);
                    return;
                }
            }
            finish();
        }
    }

    private void ensureKeyGuard() {
        if (!checkKeyGuardQuality()) {
            ConfigureKeyGuardDialog configureKeyGuardDialog = new ConfigureKeyGuardDialog(this, null);
        } else if (!confirmKeyGuard()) {
            finish();
        }
    }

    private boolean confirmKeyGuard() {
        Resources res = getResources();
        return new ChooseLockSettingsHelper(this).launchConfirmationActivity(1, res.getText(2131428767), res.getText(2131428768));
    }

    private boolean checkKeyGuardQuality() {
        return new LockPatternUtils(this).getActivePasswordQuality() >= 65536;
    }
}