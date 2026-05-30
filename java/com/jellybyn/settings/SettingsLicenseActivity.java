package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;

public class SettingsLicenseActivity extends Activity {
    private Handler mHandler = null;
    private ProgressDialog mSpinnerDlg = null;
    private AlertDialog mTextDlg = null;
    private WebView mWebView = null;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String fileName = SystemProperties.get("ro.config.license_path", "/system/etc/NOTICE.html.gz");
        if (TextUtils.isEmpty(fileName)) {
            Log.e("SettingsLicenseActivity", "The system property for the license file is empty.");
            showErrorAndFinish();
            return;
        }
        setVisible(false);
        this.mWebView = new WebView(this);
        this.mHandler = new 2(this);
        ProgressDialog pd = ProgressDialog.show(this, getText(2131428273), getText(2131428275), true, false);
        pd.setProgressStyle(0);
        this.mSpinnerDlg = pd;
        new Thread(new LicenseFileLoader(this, fileName, this.mHandler)).start();
    }

    private void showPageOfText(String str) {
        Builder builder = new Builder(this);
        builder.setCancelable(true).setView(this.mWebView).setTitle(2131428273);
        this.mTextDlg = builder.create();
        this.mTextDlg.setOnDismissListener(new 2(this));
        this.mWebView.loadDataWithBaseURL(null, str, "text/html", "utf-8", null);
        this.mWebView.setWebViewClient(new 2(this));
        this.mWebView = null;
    }

    protected void onDestroy() {
        if (this.mTextDlg != null && this.mTextDlg.isShowing()) {
            this.mTextDlg.dismiss();
        }
        if (this.mSpinnerDlg != null && this.mSpinnerDlg.isShowing()) {
            this.mSpinnerDlg.dismiss();
        }
        super.onDestroy();
    }

    private void showErrorAndFinish() {
        this.mSpinnerDlg.dismiss();
        this.mSpinnerDlg = null;
        Toast.makeText(this, 2131428274, 1).show();
        finish();
    }
}