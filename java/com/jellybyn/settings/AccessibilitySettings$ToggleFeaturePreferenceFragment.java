package com.jellybyn.settings;

import android.app.ActionBar.LayoutParams;
import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;
import com.jellybyn.settings.AccessibilitySettings.ToggleSwitch;

public abstract class AccessibilitySettings$ToggleFeaturePreferenceFragment extends SettingsPreferenceFragment {
    private CharSequence mOldActivityTitle;
    protected String mPreferenceKey;
    protected Intent mSettingsIntent;
    protected CharSequence mSettingsTitle;
    protected Preference mSummaryPreference;
    protected ToggleSwitch mToggleSwitch;

    protected void onProcessArguments(Bundle bundle) {
        this.mPreferenceKey = bundle.getString("preference_key");
        this.mToggleSwitch.setCheckedInternal(bundle.getBoolean("checked"));
        PreferenceActivity activity = (PreferenceActivity) getActivity();
        if (!activity.onIsMultiPane() || activity.onIsHidingHeaders()) {
            this.mOldActivityTitle = getActivity().getTitle();
            getActivity().getActionBar().setTitle(bundle.getString("title"));
        }
        this.mSummaryPreference.setSummary(bundle.getCharSequence("summary"));
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        PreferenceScreen preferenceScreen = getPreferenceManager().createPreferenceScreen(getActivity());
        setPreferenceScreen(preferenceScreen);
        this.mSummaryPreference = new Preference(getActivity()) {
            private void sendAccessibilityEvent(View view) {
                AccessibilityManager accessibilityManager = AccessibilityManager.getInstance(AccessibilitySettings$ToggleFeaturePreferenceFragment.this.getActivity());
                if (accessibilityManager.isEnabled()) {
                    AccessibilityEvent obtain = AccessibilityEvent.obtain();
                    obtain.setEventType(8);
                    view.onInitializeAccessibilityEvent(obtain);
                    view.dispatchPopulateAccessibilityEvent(obtain);
                    accessibilityManager.sendAccessibilityEvent(obtain);
                }
            }

            protected void onBindView(View view) {
                super.onBindView(view);
                TextView summaryView = (TextView) view.findViewById(2131230917);
                summaryView.setText(getSummary());
                sendAccessibilityEvent(summaryView);
            }
        };
        this.mSummaryPreference.setPersistent(false);
        this.mSummaryPreference.setLayoutResource(2130968696);
        preferenceScreen.addPreference(this.mSummaryPreference);
    }

    private ToggleSwitch createAndAddActionBarToggleSwitch(Activity activity) {
        ToggleSwitch toggleSwitch = new ToggleSwitch(activity);
        toggleSwitch.setPaddingRelative(0, 0, activity.getResources().getDimensionPixelSize(2131558402), 0);
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(toggleSwitch, new LayoutParams(-2, -2, 8388629));
        return toggleSwitch;
    }

    public void onDestroyView() {
        getActivity().getActionBar().setCustomView(null);
        if (this.mOldActivityTitle != null) {
            getActivity().getActionBar().setTitle(this.mOldActivityTitle);
        }
        this.mToggleSwitch.setOnBeforeCheckedChangeListener(null);
        super.onDestroyView();
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        onInstallActionBarToggleSwitch();
        onProcessArguments(getArguments());
        getListView().setSelector(new ColorDrawable(0));
        getListView().setDivider(null);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        MenuItem menuItem = menu.add(this.mSettingsTitle);
        menuItem.setShowAsAction(1);
        menuItem.setIntent(this.mSettingsIntent);
    }

    protected void onInstallActionBarToggleSwitch() {
        this.mToggleSwitch = createAndAddActionBarToggleSwitch(getActivity());
    }
}