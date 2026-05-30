package com.jellybyn.settings;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.SystemProperties;
import android.view.KeyEvent;
import android.webkit.WebView;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;

public class SettingsSafetyLegalActivity extends AlertActivity implements OnCancelListener, OnClickListener {
    private AlertDialog mErrorDialog = null;
    private WebView mWebView;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String userSafetylegalUrl = SystemProperties.get("ro.url.safetylegal");
        Configuration configuration = getResources().getConfiguration();
        String language = configuration.locale.getLanguage();
        String country = configuration.locale.getCountry();
        String loc = String.format("locale=%s-%s", new Object[]{language, country});
        userSafetylegalUrl = String.format("%s&%s", new Object[]{userSafetylegalUrl, loc});
        this.mWebView = new WebView(this);
        this.mWebView.getSettings().setJavaScriptEnabled(true);
        if (bundle == null) {
            this.mWebView.loadUrl(userSafetylegalUrl);
        } else {
            this.mWebView.restoreState(bundle);
        }
        this.mWebView.setWebViewClient(new 1(this));
        AlertParams alertParams = this.mAlertParams;
        alertParams.mTitle = getString(2131428279);
        alertParams.mView = this.mWebView;
        alertParams.mForceInverseBackground = true;
        setupAlert();
    }

    private void showErrorAndFinish(String str) {
        if (this.mErrorDialog == null) {
            this.mErrorDialog = new Builder(this).setTitle(2131428277).setPositiveButton(17039370, this).setOnCancelListener(this).setCancelable(true).create();
        } else if (this.mErrorDialog.isShowing()) {
            this.mErrorDialog.dismiss();
        }
        this.mErrorDialog.setMessage(getResources().getString(2131428278, new Object[]{str}));
        this.mErrorDialog.show();
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() != 4 || keyEvent.getAction() != 0 || !this.mWebView.canGoBack()) {
            return super.dispatchKeyEvent(keyEvent);
        }
        this.mWebView.goBack();
        return true;
    }

    protected void onDestroy() {
        super.onDestroy();
        if (this.mErrorDialog != null) {
            this.mErrorDialog.dismiss();
            this.mErrorDialog = null;
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        this.mWebView.saveState(bundle);
        super.onSaveInstanceState(bundle);
    }

    public void onCancel(DialogInterface dialogInterface) {
        finish();
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        finish();
    }
}