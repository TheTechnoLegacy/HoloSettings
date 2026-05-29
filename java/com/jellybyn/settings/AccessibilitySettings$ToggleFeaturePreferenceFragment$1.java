package com.jellybyn.settings;

import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;
import com.jellybyn.settings.AccessibilitySettings.ToggleFeaturePreferenceFragment;

class AccessibilitySettings$ToggleFeaturePreferenceFragment$1 extends Preference {
    final /* synthetic */ ToggleFeaturePreferenceFragment this$0;

    private void sendAccessibilityEvent(View view) {
        AccessibilityManager accessibilityManager = AccessibilityManager.getInstance(this.this$0.getActivity());
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

    AccessibilitySettings$ToggleFeaturePreferenceFragment$1(ToggleFeaturePreferenceFragment toggleFeaturePreferenceFragment, Context context) {
        this.this$0 = toggleFeaturePreferenceFragment;
        super(context);
    }
}