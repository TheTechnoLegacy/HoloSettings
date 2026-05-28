package com.jellybyn.settings.inputmethod;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.text.Collator;

public class InputMethodPreference extends CheckBoxPreference {
    private static final String TAG = InputMethodPreference.class.getSimpleName();
    private final boolean mAlwaysChecked;
    private final Collator mCollator;
    private AlertDialog mDialog = null;
    private final SettingsPreferenceFragment mFragment;
    private final InputMethodInfo mImi;
    private final InputMethodManager mImm;
    private View mInputMethodPref;
    private ImageView mInputMethodSettingsButton;
    private final boolean mIsSystemIme;
    private final OnClickListener mPrefOnclickListener = new 1(this);
    private final Intent mSettingsIntent;
    private TextView mSummaryText;
    private TextView mTitleText;

    private void updatePreferenceViews() {
        boolean checked = isChecked();
        if (this.mInputMethodSettingsButton != null) {
            this.mInputMethodSettingsButton.setEnabled(checked);
            this.mInputMethodSettingsButton.setClickable(checked);
            this.mInputMethodSettingsButton.setFocusable(checked);
            if (!checked) {
                this.mInputMethodSettingsButton.setAlpha(0.4f);
            }
        }
        if (this.mTitleText != null) {
            this.mTitleText.setEnabled(true);
        }
        if (this.mSummaryText != null) {
            this.mSummaryText.setEnabled(checked);
        }
        if (this.mInputMethodPref != null) {
            this.mInputMethodPref.setEnabled(true);
            this.mInputMethodPref.setLongClickable(checked);
            boolean enabled = isEnabled();
            this.mInputMethodPref.setOnClickListener(enabled ? this.mPrefOnclickListener : null);
            if (!enabled) {
                this.mInputMethodPref.setBackgroundColor(0);
            }
        }
    }

    protected void onBindView(View view) {
        boolean hasSubtypes = true;
        super.onBindView(view);
        this.mInputMethodPref = view.findViewById(2131230943);
        this.mInputMethodPref.setOnClickListener(this.mPrefOnclickListener);
        this.mInputMethodSettingsButton = (ImageView) view.findViewById(2131230944);
        this.mTitleText = (TextView) view.findViewById(16908310);
        this.mSummaryText = (TextView) view.findViewById(16908304);
        if (this.mImi.getSubtypeCount() <= 1) {
            hasSubtypes = false;
        }
        String imiId = this.mImi.getId();
        if (hasSubtypes) {
            this.mInputMethodPref.setOnLongClickListener(new 2(this, imiId));
        }
        if (this.mSettingsIntent != null) {
            this.mInputMethodSettingsButton.setOnClickListener(new 3(this));
        }
        if (hasSubtypes) {
            this.mInputMethodSettingsButton.setOnLongClickListener(new 4(this, imiId));
        }
        if (this.mSettingsIntent == null) {
            this.mInputMethodSettingsButton.setVisibility(8);
        } else {
            updatePreferenceViews();
        }
    }

    public InputMethodPreference(SettingsPreferenceFragment settingsPreferenceFragment, Intent intent, InputMethodManager inputMethodManager, InputMethodInfo inputMethodInfo, int i) {
        super(settingsPreferenceFragment.getActivity(), null, 2131689499);
        setLayoutResource(2130968667);
        setWidgetLayoutResource(2130968668);
        this.mFragment = settingsPreferenceFragment;
        this.mSettingsIntent = intent;
        this.mImm = inputMethodManager;
        this.mImi = inputMethodInfo;
        updateSummary();
        this.mAlwaysChecked = InputMethodAndSubtypeUtil.isAlwaysCheckedIme(inputMethodInfo, settingsPreferenceFragment.getActivity(), i);
        this.mIsSystemIme = InputMethodAndSubtypeUtil.isSystemIme(inputMethodInfo);
        if (this.mAlwaysChecked) {
            setEnabled(false);
        }
        this.mCollator = Collator.getInstance(settingsPreferenceFragment.getResources().getConfiguration().locale);
    }

    public int compareTo(Preference preference) {
        if (!(preference instanceof InputMethodPreference)) {
            return super.compareTo(preference);
        }
        InputMethodPreference imp = (InputMethodPreference) preference;
        boolean priority0 = this.mIsSystemIme && this.mAlwaysChecked;
        boolean priority1 = imp.mIsSystemIme && imp.mAlwaysChecked;
        if (priority0 != priority1) {
            return priority0 ? -1 : 1;
        } else {
            CharSequence title = getTitle();
            CharSequence title2 = imp.getTitle();
            if (TextUtils.isEmpty(title)) {
                return 1;
            }
            return TextUtils.isEmpty(title2) ? -1 : this.mCollator.compare(title.toString(), title2.toString());
        }
    }

    public String getSummaryString() {
        StringBuilder builder = new StringBuilder();
        for (InputMethodSubtype inputMethodSubtype : this.mImm.getEnabledInputMethodSubtypeList(this.mImi, true)) {
            if (builder.length() > 0) {
                builder.append(", ");
            }
            builder.append(inputMethodSubtype.getDisplayName(this.mFragment.getActivity(), this.mImi.getPackageName(), this.mImi.getServiceInfo().applicationInfo));
        }
        return builder.toString();
    }

    private void showSecurityWarnDialog(InputMethodInfo inputMethodInfo, InputMethodPreference inputMethodPreference) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
        this.mDialog = new Builder(this.mFragment.getActivity()).setTitle(17039380).setIconAttribute(16843605).setCancelable(true).setPositiveButton(17039370, new 6(this, inputMethodPreference)).setNegativeButton(17039360, new 5(this)).create();
        this.mDialog.setMessage(this.mFragment.getResources().getString(2131428482, new Object[]{inputMethodInfo.getServiceInfo().applicationInfo.loadLabel(this.mFragment.getActivity().getPackageManager())}));
        this.mDialog.show();
    }

    public static boolean startFragment(Fragment fragment, String str, int i, Bundle bundle) {
        if (fragment.getActivity() instanceof PreferenceActivity) {
            ((PreferenceActivity) fragment.getActivity()).startPreferencePanel(str, bundle, 0, null, fragment, i);
            return true;
        }
        Log.w(TAG, "Parent isn't PreferenceActivity, thus there's no way to launch the given Fragment (name: " + str + ", requestCode: " + i + ")");
        return false;
    }

    public void setChecked(boolean z, boolean z2) {
        super.setChecked(z);
        if (z2) {
            saveImeSettings();
        }
        updateSummary();
    }

    public void updateSummary() {
        String summary = getSummaryString();
        if (!TextUtils.isEmpty(summary)) {
            setSummary(summary);
        }
    }

    private void saveImeSettings() {
        InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(this.mFragment, this.mFragment.getActivity().getContentResolver(), this.mImm.getInputMethodList(), this.mFragment.getResources().getConfiguration().keyboard == 2);
    }

    public void setEnabled(boolean z) {
        super.setEnabled(z);
        updatePreferenceViews();
    }

    public void setChecked(boolean z) {
        setChecked(z, false);
    }
}