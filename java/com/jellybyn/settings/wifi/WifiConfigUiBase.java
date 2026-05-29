package com.jellybyn.settings.wifi;

import android.content.Context;
import android.view.LayoutInflater;
import android.widget.Button;

public interface WifiConfigUiBase {
    Context getContext();

    LayoutInflater getLayoutInflater();

    Button getSubmitButton();

    void setCancelButton(CharSequence charSequence);

    void setForgetButton(CharSequence charSequence);

    void setSubmitButton(CharSequence charSequence);

    void setTitle(int i);

    void setTitle(CharSequence charSequence);
}