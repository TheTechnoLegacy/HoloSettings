package com.jellybyn.settings;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class MasterClearConfirm extends Fragment {
    private View mContentView;
    private boolean mEraseSdCard;
    private Button mFinalButton;
    private OnClickListener mFinalClickListener = new 1(this);

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle args = getArguments();
        this.mEraseSdCard = args != null ? args.getBoolean("erase_sd") : false;
    }

    private void establishFinalConfirmationState() {
        this.mFinalButton = (Button) this.mContentView.findViewById(2131230907);
        this.mFinalButton.setOnClickListener(this.mFinalClickListener);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(2130968644, null);
        establishFinalConfirmationState();
        return this.mContentView;
    }
}