package com.jellybyn.settings.inputmethod;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceScreen;
import android.view.textservice.SpellCheckerInfo;
import android.view.textservice.TextServicesManager;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.ArrayList;
import java.util.Iterator;

public class SpellCheckersSettings extends SettingsPreferenceFragment implements OnPreferenceClickListener {
    private static final String TAG = SpellCheckersSettings.class.getSimpleName();
    private SpellCheckerInfo mCurrentSci;
    private AlertDialog mDialog = null;
    private SpellCheckerInfo[] mEnabledScis;
    private final ArrayList<SingleSpellCheckerPreference> mSpellCheckers = new ArrayList();
    private TextServicesManager mTsm;

    private void updateEnabledSpellCheckers() {
        PackageManager pm = getPackageManager();
        this.mCurrentSci = SpellCheckerUtils.getCurrentSpellChecker(this.mTsm);
        this.mEnabledScis = SpellCheckerUtils.getEnabledSpellCheckers(this.mTsm);
        if (this.mCurrentSci != null && this.mEnabledScis != null) {
            this.mSpellCheckers.clear();
            for (SpellCheckerInfo sci : this.mEnabledScis) {
                SingleSpellCheckerPreference scPref = new SingleSpellCheckerPreference(this, null, sci, this.mTsm);
                this.mSpellCheckers.add(scPref);
                scPref.setTitle(sci.loadLabel(pm));
                boolean z = this.mCurrentSci != null && this.mCurrentSci.getId().equals(sci.getId());
                scPref.setSelected(z);
                getPreferenceScreen().addPreference(scPref);
            }
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        SingleSpellCheckerPreference targetScp = null;
        Iterator i$ = this.mSpellCheckers.iterator();
        while (i$.hasNext()) {
            SingleSpellCheckerPreference singleSpellCheckerPreference = (SingleSpellCheckerPreference) i$.next();
            if (preference.equals(singleSpellCheckerPreference)) {
                targetScp = singleSpellCheckerPreference;
            }
        }
        if (targetScp != null) {
            if (isSystemApp(targetScp.getSpellCheckerInfo())) {
                changeCurrentSpellChecker(targetScp);
            } else {
                showSecurityWarnDialog(targetScp);
            }
        }
        return true;
    }

    private void showSecurityWarnDialog(SingleSpellCheckerPreference singleSpellCheckerPreference) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
        this.mDialog = new Builder(getActivity()).setTitle(17039380).setIconAttribute(16843605).setCancelable(true).setPositiveButton(17039370, new 2(this, singleSpellCheckerPreference)).setNegativeButton(17039360, new 1(this)).create();
        this.mDialog.setMessage(getResources().getString(2131428483, new Object[]{singleSpellCheckerPreference.getSpellCheckerInfo().getServiceInfo().applicationInfo.loadLabel(getActivity().getPackageManager())}));
        this.mDialog.show();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mTsm = (TextServicesManager) getSystemService("textservices");
        addPreferencesFromResource(2131034151);
        updateScreen();
    }

    private void changeCurrentSpellChecker(SingleSpellCheckerPreference singleSpellCheckerPreference) {
        this.mTsm.setCurrentSpellChecker(singleSpellCheckerPreference.getSpellCheckerInfo());
        updateScreen();
    }

    private void updateScreen() {
        getPreferenceScreen().removeAll();
        updateEnabledSpellCheckers();
    }

    public void onPause() {
        super.onPause();
        saveState();
    }

    public void onResume() {
        super.onResume();
        updateScreen();
    }

    private void saveState() {
        SpellCheckerUtils.setCurrentSpellChecker(this.mTsm, this.mCurrentSci);
    }

    private static boolean isSystemApp(SpellCheckerInfo spellCheckerInfo) {
        return (spellCheckerInfo.getServiceInfo().applicationInfo.flags & 1) != 0;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        return false;
    }
}