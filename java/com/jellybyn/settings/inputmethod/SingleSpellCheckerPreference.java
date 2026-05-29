package com.jellybyn.settings.inputmethod;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Resources;
import android.preference.Preference;
import android.text.TextUtils;
import android.view.View;
import android.view.textservice.SpellCheckerInfo;
import android.view.textservice.SpellCheckerSubtype;
import android.view.textservice.TextServicesManager;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class SingleSpellCheckerPreference extends Preference {
    private static final String TAG = SingleSpellCheckerPreference.class.getSimpleName();
    private AlertDialog mDialog = null;
    private final SpellCheckersSettings mFragment;
    private View mPrefAll;
    private View mPrefLeftButton;
    private RadioButton mRadioButton;
    private final Resources mRes;
    private boolean mSelected;
    private View mSettingsButton;
    private Intent mSettingsIntent;
    private final SpellCheckerInfo mSpellCheckerInfo;
    private ImageView mSubtypeButton;
    private TextView mSummaryText;
    private TextView mTitleText;
    private final TextServicesManager mTsm;

    private void onSubtypeButtonClicked(View view) {
        int i;
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
        Builder builder = new Builder(this.mFragment.getActivity());
        builder.setTitle(2131428472);
        int size = this.mSpellCheckerInfo.getSubtypeCount();
        CharSequence[] items = new CharSequence[(size + 1)];
        items[0] = this.mRes.getString(2131428544);
        for (i = 0; i < size; i++) {
            items[i + 1] = this.mSpellCheckerInfo.getSubtypeAt(i).getDisplayName(this.mFragment.getActivity(), this.mSpellCheckerInfo.getPackageName(), this.mSpellCheckerInfo.getServiceInfo().applicationInfo);
        }
        int checkedItem = 0;
        SpellCheckerSubtype currentScs = this.mTsm.getCurrentSpellCheckerSubtype(false);
        if (currentScs != null) {
            for (i = 0; i < size; i++) {
                if (this.mSpellCheckerInfo.getSubtypeAt(i).equals(currentScs)) {
                    checkedItem = i + 1;
                    break;
                }
            }
        }
        builder.setSingleChoiceItems(items, checkedItem, new 4(this));
        this.mDialog = builder.create();
        this.mDialog.show();
    }

    private void enableButtons(boolean z) {
        if (this.mSettingsButton != null) {
            if (this.mSettingsIntent == null) {
                this.mSettingsButton.setVisibility(8);
            } else {
                this.mSettingsButton.setEnabled(z);
                this.mSettingsButton.setClickable(z);
                this.mSettingsButton.setFocusable(z);
                if (!z) {
                    this.mSettingsButton.setAlpha(0.4f);
                }
            }
        }
        if (this.mSubtypeButton == null) {
            return;
        }
        if (this.mSpellCheckerInfo.getSubtypeCount() <= 0) {
            this.mSubtypeButton.setVisibility(8);
            return;
        }
        this.mSubtypeButton.setEnabled(z);
        this.mSubtypeButton.setClickable(z);
        this.mSubtypeButton.setFocusable(z);
        if (!z) {
            this.mSubtypeButton.setAlpha(0.4f);
        }
    }

    public SingleSpellCheckerPreference(SpellCheckersSettings spellCheckersSettings, Intent intent, SpellCheckerInfo spellCheckerInfo, TextServicesManager textServicesManager) {
        super(spellCheckersSettings.getActivity(), null, 0);
        this.mFragment = spellCheckersSettings;
        this.mRes = spellCheckersSettings.getActivity().getResources();
        this.mTsm = textServicesManager;
        setLayoutResource(2130968673);
        this.mSpellCheckerInfo = spellCheckerInfo;
        this.mSelected = false;
        String settingsActivity = this.mSpellCheckerInfo.getSettingsActivity();
        if (TextUtils.isEmpty(settingsActivity)) {
            this.mSettingsIntent = null;
            return;
        }
        this.mSettingsIntent = new Intent("android.intent.action.MAIN");
        this.mSettingsIntent.setClassName(this.mSpellCheckerInfo.getPackageName(), settingsActivity);
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        this.mPrefAll = view.findViewById(2131230948);
        this.mRadioButton = (RadioButton) view.findViewById(2131230950);
        this.mPrefLeftButton = view.findViewById(2131230949);
        this.mPrefLeftButton.setOnClickListener(new 1(this));
        this.mTitleText = (TextView) view.findViewById(16908310);
        this.mSummaryText = (TextView) view.findViewById(16908304);
        this.mSubtypeButton = (ImageView) view.findViewById(2131230953);
        this.mSubtypeButton.setOnClickListener(new 2(this));
        this.mSettingsButton = view.findViewById(2131230951);
        this.mSettingsButton.setOnClickListener(new 3(this));
        updateSelectedState(this.mSelected);
    }

    private void onSettingsButtonClicked(View view) {
        if (this.mFragment != null && this.mSettingsIntent != null) {
            try {
                this.mFragment.startActivity(this.mSettingsIntent);
            } catch (ActivityNotFoundException e) {
                Toast.makeText(this.mFragment.getActivity(), this.mFragment.getString(2131428486, new Object[]{this.mSpellCheckerInfo.loadLabel(this.mFragment.getActivity().getPackageManager())}), 1).show();
            }
        }
    }

    private void updateSelectedState(boolean z) {
        if (this.mPrefAll != null) {
            this.mRadioButton.setChecked(z);
            enableButtons(z);
        }
    }

    public void setSelected(boolean z) {
        this.mSelected = z;
        updateSelectedState(z);
    }

    private void onLeftButtonClicked(View view) {
        this.mFragment.onPreferenceClick(this);
    }

    public SpellCheckerInfo getSpellCheckerInfo() {
        return this.mSpellCheckerInfo;
    }
}