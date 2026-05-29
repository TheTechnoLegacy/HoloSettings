package com.jellybyn.settings.users;

import android.content.Context;
import android.content.RestrictionEntry;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Switch;
import com.jellybyn.settings.users.AppRestrictionsFragment.SelectableAppInfo;
import java.util.ArrayList;
import java.util.List;

class AppRestrictionsFragment$AppRestrictionsPreference extends SwitchPreference {
    private SelectableAppInfo appInfo;
    List<Preference> childPreferences = new ArrayList();
    private final ColorFilter grayscaleFilter;
    private boolean hasSettings;
    private boolean immutable;
    private OnClickListener listener;
    boolean panelOpen;
    private ArrayList<RestrictionEntry> restrictions;

    protected void onBindView(View view) {
        int i = 8;
        boolean z = true;
        super.onBindView(view);
        View appRestrictionsSettings = view.findViewById(2131230927);
        appRestrictionsSettings.setVisibility(this.hasSettings ? 0 : 8);
        View findViewById = view.findViewById(2131230928);
        if (this.hasSettings) {
            i = 0;
        }
        findViewById.setVisibility(i);
        appRestrictionsSettings.setOnClickListener(this.listener);
        appRestrictionsSettings.setTag(this);
        View appRestrictionsPref = view.findViewById(2131230926);
        appRestrictionsPref.setOnClickListener(this.listener);
        appRestrictionsPref.setTag(this);
        ViewGroup widget = (ViewGroup) view.findViewById(16908312);
        widget.setEnabled(!isImmutable());
        if (widget.getChildCount() > 0) {
            Switch switchView = (Switch) widget.getChildAt(0);
            if (isImmutable()) {
                z = false;
            }
            switchView.setEnabled(z);
            switchView.setTag(this);
            switchView.setOnCheckedChangeListener(new 1(this, switchView));
        }
    }

    AppRestrictionsFragment$AppRestrictionsPreference(Context context, OnClickListener onClickListener) {
        super(context);
        setLayoutResource(2130968658);
        this.listener = onClickListener;
        ColorMatrix colorMatrix = new ColorMatrix();
        colorMatrix.setSaturation(0.0f);
        colorMatrix.getArray()[18] = 0.5f;
        this.grayscaleFilter = new ColorMatrixColorFilter(colorMatrix);
    }

    public void setChecked(boolean z) {
        if (z) {
            getIcon().setColorFilter(null);
        } else {
            getIcon().setColorFilter(this.grayscaleFilter);
        }
        super.setChecked(z);
    }

    private void setSettingsEnabled(boolean z) {
        this.hasSettings = z;
    }

    void setImmutable(boolean z) {
        this.immutable = z;
    }

    void setRestrictions(ArrayList<RestrictionEntry> restrictions) {
        this.restrictions = restrictions;
    }

    void setSelectableAppInfo(SelectableAppInfo selectableAppInfo) {
        this.appInfo = selectableAppInfo;
    }

    ArrayList<RestrictionEntry> getRestrictions() {
        return this.restrictions;
    }

    boolean isImmutable() {
        return this.immutable;
    }
}