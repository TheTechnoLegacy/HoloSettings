package com.jellybyn.settings;

import android.app.Dialog;
import android.app.Fragment;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface.OnDismissListener;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.widget.Button;

public class SettingsPreferenceFragment extends PreferenceFragment implements DialogCreatable {
    private ContentResolver mContentResolver;
    private SettingsDialogFragment mDialogFragment;
    private String mHelpUrl;

    public boolean startFragment(Fragment fragment, String str, int i, Bundle bundle) {
        if (getActivity() instanceof PreferenceActivity) {
            ((PreferenceActivity) getActivity()).startPreferencePanel(str, bundle, 2131427635, null, fragment, i);
            return true;
        }
        Log.w("SettingsPreferenceFragment", "Parent isn't PreferenceActivity, thus there's no way to launch the given Fragment (name: " + str + ", requestCode: " + i + ")");
        return false;
    }

    public void onDetach() {
        if (isRemoving() && this.mDialogFragment != null) {
            this.mDialogFragment.dismiss();
            this.mDialogFragment = null;
        }
        super.onDetach();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        int helpResource = getHelpResource();
        if (helpResource != 0) {
            this.mHelpUrl = getResources().getString(helpResource);
        }
    }

    protected void showDialog(int i) {
        if (this.mDialogFragment != null) {
            Log.e("SettingsPreferenceFragment", "Old dialog fragment not null!");
        }
        this.mDialogFragment = new SettingsDialogFragment(this, i);
        this.mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    protected ContentResolver getContentResolver() {
        Context context = getActivity();
        if (context != null) {
            this.mContentResolver = context.getContentResolver();
        }
        return this.mContentResolver;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        if (!TextUtils.isEmpty(this.mHelpUrl)) {
            setHasOptionsMenu(true);
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        if (this.mHelpUrl != null && getActivity() != null) {
            HelpUtils.prepareHelpMenuItem(getActivity(), menu.add(0, 101, 0, 2131429113), this.mHelpUrl);
        }
    }

    protected void removeDialog(int i) {
        if (this.mDialogFragment != null && this.mDialogFragment.getDialogId() == i) {
            this.mDialogFragment.dismiss();
        }
        this.mDialogFragment = null;
    }

    protected void removePreference(String str) {
        Preference pref = findPreference(str);
        if (pref != null) {
            getPreferenceScreen().removePreference(pref);
        }
    }

    protected void setOnDismissListener(OnDismissListener onDismissListener) {
        if (this.mDialogFragment != null) {
            SettingsDialogFragment.access$102(this.mDialogFragment, onDismissListener);
        }
    }

    public void finish() {
        getActivity().onBackPressed();
    }

    public final void finishFragment() {
        getActivity().onBackPressed();
    }

    protected int getHelpResource() {
        return 0;
    }

    protected Button getNextButton() {
        return ((ButtonBarHandler) getActivity()).getNextButton();
    }

    protected PackageManager getPackageManager() {
        return getActivity().getPackageManager();
    }

    protected Object getSystemService(String str) {
        return getActivity().getSystemService(str);
    }

    protected boolean hasNextButton() {
        return ((ButtonBarHandler) getActivity()).hasNextButton();
    }

    public Dialog onCreateDialog(int i) {
        return null;
    }

    public void onDialogShowing() {
    }
}