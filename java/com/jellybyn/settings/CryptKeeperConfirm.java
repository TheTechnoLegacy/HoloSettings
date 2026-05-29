package com.jellybyn.settings;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class CryptKeeperConfirm extends Fragment {
    private View mContentView;
    private Button mFinalButton;
    private OnClickListener mFinalClickListener = new 1(this);

    private void establishFinalConfirmationState() {
        this.mFinalButton = (Button) this.mContentView.findViewById(2131230774);
        this.mFinalButton.setOnClickListener(this.mFinalClickListener);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(2130968603, null);
        establishFinalConfirmationState();
        return this.mContentView;
    }
}