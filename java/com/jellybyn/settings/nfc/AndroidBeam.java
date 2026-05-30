package com.jellybyn.settings.nfc;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.app.Fragment;
import android.nfc.NfcAdapter;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Switch;

public class AndroidBeam extends Fragment implements OnCheckedChangeListener {
    private Switch mActionBarSwitch;
    private NfcAdapter mNfcAdapter;
    private CharSequence mOldActivityTitle;
    private View mView;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Activity activity = getActivity();
        this.mActionBarSwitch = new Switch(activity);
        if (activity instanceof PreferenceActivity) {
            this.mActionBarSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
            activity.getActionBar().setDisplayOptions(16, 16);
            activity.getActionBar().setCustomView(this.mActionBarSwitch, new LayoutParams(-2, -2, 8388629));
            this.mOldActivityTitle = activity.getActionBar().getTitle();
            activity.getActionBar().setTitle(2131427790);
        }
        this.mActionBarSwitch.setOnCheckedChangeListener(this);
        this.mNfcAdapter = NfcAdapter.getDefaultAdapter(getActivity());
        this.mActionBarSwitch.setChecked(this.mNfcAdapter.isNdefPushEnabled());
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        this.mActionBarSwitch.setEnabled(false);
        if (z ? this.mNfcAdapter.enableNdefPush() : this.mNfcAdapter.disableNdefPush()) {
            this.mActionBarSwitch.setChecked(z);
        }
        this.mActionBarSwitch.setEnabled(true);
    }

    public void onDestroyView() {
        super.onDestroyView();
        getActivity().getActionBar().setCustomView(null);
        if (this.mOldActivityTitle != null) {
            getActivity().getActionBar().setTitle(this.mOldActivityTitle);
        }
    }

    private void initView(View view) {
        this.mActionBarSwitch.setOnCheckedChangeListener(this);
        this.mActionBarSwitch.setChecked(this.mNfcAdapter.isNdefPushEnabled());
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mView = layoutInflater.inflate(2130968580, viewGroup, false);
        initView(this.mView);
        return this.mView;
    }
}