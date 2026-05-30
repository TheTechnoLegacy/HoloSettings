package com.jellybyn.settings;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.app.AlertDialog.Builder;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Environment;
import android.os.SystemProperties;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

public class MasterClear extends Fragment {
    private View mContentView;
    private CheckBox mExternalStorage;
    private View mExternalStorageContainer;
    private Button mInitiateButton;
    private final OnClickListener mInitiateListener = new 1(this);

    private void loadAccountList() {
        View accountsLabel = this.mContentView.findViewById(2131230901);
        LinearLayout contents = (LinearLayout) this.mContentView.findViewById(2131230902);
        contents.removeAllViews();
        Context context = getActivity();
        if (N == 0) {
            accountsLabel.setVisibility(8);
            contents.setVisibility(8);
            return;
        }
        LayoutInflater inflater = (LayoutInflater) context.getSystemService("layout_inflater");
        AuthenticatorDescription[] descs = AccountManager.get(context).getAuthenticatorTypes();
        int M = descs.length;
        for (Account account : AccountManager.get(context).getAccounts()) {
            AuthenticatorDescription authenticatorDescription = null;
            for (int i = 0; i < M; i++) {
                if (account.type.equals(descs[i].type)) {
                    authenticatorDescription = descs[i];
                    break;
                }
            }
            if (authenticatorDescription == null) {
                Log.w("MasterClear", "No descriptor for account name=" + account.name + " type=" + account.type);
            } else {
                Drawable drawable = null;
                try {
                    if (authenticatorDescription.iconId != 0) {
                        drawable = context.createPackageContext(authenticatorDescription.packageName, 0).getResources().getDrawable(authenticatorDescription.iconId);
                    }
                } catch (NameNotFoundException e) {
                    Log.w("MasterClear", "No icon for account type " + authenticatorDescription.type);
                }
                TextView textView = (TextView) inflater.inflate(2130968643, contents, false);
                textView.setText(account.name);
                if (drawable != null) {
                    textView.setCompoundDrawablesWithIntrinsicBounds(drawable, null, null, null);
                }
                contents.addView(textView);
            }
        }
        accountsLabel.setVisibility(0);
        contents.setVisibility(0);
    }

    private void establishInitialState() {
        this.mInitiateButton = (Button) this.mContentView.findViewById(2131230906);
        this.mInitiateButton.setOnClickListener(this.mInitiateListener);
        this.mExternalStorageContainer = this.mContentView.findViewById(2131230904);
        this.mExternalStorage = (CheckBox) this.mContentView.findViewById(2131230905);
        boolean isExtStorageEmulated = Environment.isExternalStorageEmulated();
        if (isExtStorageEmulated || (!Environment.isExternalStorageRemovable() && isExtStorageEncrypted())) {
            this.mExternalStorageContainer.setVisibility(8);
            this.mContentView.findViewById(2131230903).setVisibility(8);
            this.mContentView.findViewById(2131230900).setVisibility(0);
            this.mExternalStorage.setChecked(!isExtStorageEmulated);
        } else {
            this.mExternalStorageContainer.setOnClickListener(new 2(this));
        }
        loadAccountList();
    }

    private void showFinalConfirmation() {
        Preference preference = new Preference(getActivity());
        preference.setFragment(MasterClearConfirm.class.getName());
        preference.setTitle(2131428212);
        preference.getExtras().putBoolean("erase_sd", this.mExternalStorage.isChecked());
        ((PreferenceActivity) getActivity()).onPreferenceStartFragment(null, preference);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 55) {
            if (i2 == -1) {
                showFinalConfirmation();
            } else {
                establishInitialState();
            }
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        new Builder(getActivity()).setTitle(17039380).setIconAttribute(16843605).setMessage(2131428213).setPositiveButton(17039370, null).show();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContentView = layoutInflater.inflate(2130968642, null);
        establishInitialState();
        return this.mContentView;
    }

    private boolean isExtStorageEncrypted() {
        return !"".equals(SystemProperties.get("vold.decrypt"));
    }

    private boolean runKeyguardConfirmation(int i) {
        Resources res = getActivity().getResources();
        return new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(i, res.getText(2131428209), res.getText(2131428210));
    }
}