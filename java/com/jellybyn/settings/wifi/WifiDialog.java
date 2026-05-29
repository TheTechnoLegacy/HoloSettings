package com.jellybyn.settings.wifi;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

class WifiDialog extends AlertDialog implements WifiConfigUiBase {
    private final AccessPoint mAccessPoint;
    private WifiConfigController mController;
    private final boolean mEdit;
    private final OnClickListener mListener;
    private View mView;

    protected void onCreate(Bundle bundle) {
        this.mView = getLayoutInflater().inflate(2130968719, null);
        setView(this.mView);
        setInverseBackgroundForced(true);
        this.mController = new WifiConfigController(this, this.mView, this.mAccessPoint, this.mEdit);
        super.onCreate(bundle);
        this.mController.enableSubmitIfAppropriate();
    }

    public WifiDialog(Context context, OnClickListener onClickListener, AccessPoint accessPoint, boolean z) {
        super(context, 2131689503);
        this.mEdit = z;
        this.mListener = onClickListener;
        this.mAccessPoint = accessPoint;
    }

    public void setCancelButton(CharSequence charSequence) {
        setButton(-2, charSequence, this.mListener);
    }

    public void setForgetButton(CharSequence charSequence) {
        setButton(-3, charSequence, this.mListener);
    }

    public void setSubmitButton(CharSequence charSequence) {
        setButton(-1, charSequence, this.mListener);
    }

    public WifiConfigController getController() {
        return this.mController;
    }

    public Button getSubmitButton() {
        return getButton(-1);
    }
}