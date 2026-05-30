package com.jellybyn.settings;

import android.app.Dialog;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import com.android.internal.app.LocalePicker.LocaleSelectionListener;
import com.jellybyn.settings.SettingsPreferenceFragment.SettingsDialogFragment;
import java.util.Locale;

public class LocalePicker extends com.android.internal.app.LocalePicker implements LocaleSelectionListener, DialogCreatable {
    private SettingsDialogFragment mDialogFragment;
    private Locale mTargetLocale;

    public void onLocaleSelected(Locale locale) {
        if (Utils.hasMultipleUsers(getActivity())) {
            this.mTargetLocale = locale;
            showDialog(1);
            return;
        }
        getActivity().onBackPressed();
        updateLocale(locale);
    }

    protected void showDialog(int i) {
        if (this.mDialogFragment != null) {
            Log.e("LocalePicker", "Old dialog fragment not null!");
        }
        this.mDialogFragment = new SettingsDialogFragment(this, i);
        this.mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null && bundle.containsKey("locale")) {
            this.mTargetLocale = new Locale(bundle.getString("locale"));
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = super.onCreateView(layoutInflater, viewGroup, bundle);
        Utils.forcePrepareCustomPreferencesList(viewGroup, view, (ListView) view.findViewById(16908298), false);
        return view;
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mTargetLocale != null) {
            bundle.putString("locale", this.mTargetLocale.toString());
        }
    }

    protected void removeDialog(int i) {
        if (this.mDialogFragment != null && this.mDialogFragment.getDialogId() == i) {
            this.mDialogFragment.dismiss();
        }
        this.mDialogFragment = null;
    }

    public LocalePicker() {
        setLocaleSelectionListener(this);
    }

    protected boolean isInDeveloperMode() {
        return getActivity().getSharedPreferences("development", 0).getBoolean("show", Build.TYPE.equals("eng"));
    }

    public Dialog onCreateDialog(int i) {
        return Utils.buildGlobalChangeWarningDialog(getActivity(), 2131429110, new 1(this, i));
    }
}