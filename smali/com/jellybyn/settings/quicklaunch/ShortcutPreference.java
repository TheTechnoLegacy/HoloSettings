package com.jellybyn.settings.quicklaunch;

import android.content.Context;
import android.content.res.ColorStateList;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.View;
import android.widget.TextView;

public class ShortcutPreference extends Preference implements Comparable<Preference> {
    private static String STRING_ASSIGN_APPLICATION;
    private static String STRING_NO_SHORTCUT;
    private static int sDimAlpha;
    private static ColorStateList sDimSummaryColor;
    private static ColorStateList sDimTitleColor;
    private static ColorStateList sRegularSummaryColor;
    private static ColorStateList sRegularTitleColor;
    private static Object sStaticVarsLock = new Object();
    private boolean mHasBookmark;
    private char mShortcut;

    protected void onBindView(View view) {
        super.onBindView(view);
        TextView shortcutView = (TextView) view.findViewById(2131230962);
        if (shortcutView != null) {
            shortcutView.setText(String.valueOf(this.mShortcut));
        }
        TextView titleView = (TextView) view.findViewById(16908310);
        synchronized (sStaticVarsLock) {
            if (sRegularTitleColor == null) {
                sRegularTitleColor = titleView.getTextColors();
                sDimTitleColor = sRegularTitleColor.withAlpha(sDimAlpha);
            }
        }
        ColorStateList color = this.mHasBookmark ? sRegularTitleColor : sDimTitleColor;
        if (color != null) {
            titleView.setTextColor(color);
        }
        TextView summaryView = (TextView) view.findViewById(16908304);
        synchronized (sStaticVarsLock) {
            if (sRegularSummaryColor == null) {
                sRegularSummaryColor = summaryView.getTextColors();
                sDimSummaryColor = sRegularSummaryColor.withAlpha(sDimAlpha);
            }
        }
        color = this.mHasBookmark ? sRegularSummaryColor : sDimSummaryColor;
        if (color != null) {
            summaryView.setTextColor(color);
        }
    }

    public ShortcutPreference(Context context, char c) {
        super(context);
        synchronized (sStaticVarsLock) {
            if (STRING_ASSIGN_APPLICATION == null) {
                STRING_ASSIGN_APPLICATION = context.getString(2131428524);
                STRING_NO_SHORTCUT = context.getString(2131428525);
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16842803, typedValue, true);
                sDimAlpha = (int) (typedValue.getFloat() * 255.0f);
            }
        }
        this.mShortcut = c;
        setWidgetLayoutResource(2130968676);
    }

    public int compareTo(Preference preference) {
        if (!(preference instanceof ShortcutPreference)) {
            return super.compareTo(preference);
        }
        char other = ((ShortcutPreference) preference).mShortcut;
        if (Character.isDigit(this.mShortcut) && Character.isLetter(other)) {
            return 1;
        }
        return (Character.isDigit(other) && Character.isLetter(this.mShortcut)) ? -1 : this.mShortcut - other;
    }

    public void setHasBookmark(boolean z) {
        if (z != this.mHasBookmark) {
            this.mHasBookmark = z;
            notifyChanged();
        }
    }

    public char getShortcut() {
        return this.mShortcut;
    }

    public CharSequence getSummary() {
        return this.mHasBookmark ? super.getSummary() : STRING_NO_SHORTCUT;
    }

    public CharSequence getTitle() {
        return this.mHasBookmark ? super.getTitle() : STRING_ASSIGN_APPLICATION;
    }

    public boolean hasBookmark() {
        return this.mHasBookmark;
    }
}