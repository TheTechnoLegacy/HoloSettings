package com.jellybyn.settings;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;
import com.jellybyn.settings.DreamBackend.DreamInfo;

class DreamSettings$DreamInfoAdapter extends ArrayAdapter<DreamInfo> {
    private final LayoutInflater mInflater;
    final /* synthetic */ DreamSettings this$0;

    public View getView(int i, View view, ViewGroup viewGroup) {
        boolean showSettings = true;
        int i2 = 0;
        DreamInfo dreamInfo = (DreamInfo) getItem(i);
        DreamSettings.access$400("getView(%s)", new Object[]{dreamInfo.caption});
        View row = view != null ? view : createDreamInfoRow(viewGroup);
        row.setTag(dreamInfo);
        ((ImageView) row.findViewById(16908294)).setImageDrawable(dreamInfo.icon);
        ((TextView) row.findViewById(16908310)).setText(dreamInfo.caption);
        RadioButton radioButton = (RadioButton) row.findViewById(16908313);
        radioButton.setChecked(dreamInfo.isActive);
        radioButton.setOnTouchListener(new 1(this, row));
        if (dreamInfo.settingsComponentName == null) {
            showSettings = false;
        }
        row.findViewById(2131230842).setVisibility(showSettings ? 0 : 4);
        ImageView settingsButton = (ImageView) row.findViewById(16908314);
        if (!showSettings) {
            i2 = 4;
        }
        settingsButton.setVisibility(i2);
        settingsButton.setAlpha(dreamInfo.isActive ? 1.0f : 0.4f);
        settingsButton.setEnabled(dreamInfo.isActive);
        settingsButton.setFocusable(dreamInfo.isActive);
        settingsButton.setOnClickListener(new 2(this, row));
        return row;
    }

    private void activate(DreamInfo dreamInfo) {
        if (!dreamInfo.equals(getCurrentSelection())) {
            for (int i = 0; i < getCount(); i++) {
                ((DreamInfo) getItem(i)).isActive = false;
            }
            dreamInfo.isActive = true;
            DreamSettings.access$200(this.this$0).setActiveDream(dreamInfo.componentName);
            notifyDataSetChanged();
        }
    }

    private DreamInfo getCurrentSelection() {
        for (int i = 0; i < getCount(); i++) {
            DreamInfo dreamInfo = (DreamInfo) getItem(i);
            if (dreamInfo.isActive) {
                return dreamInfo;
            }
        }
        return null;
    }

    public DreamSettings$DreamInfoAdapter(DreamSettings dreamSettings, Context context) {
        this.this$0 = dreamSettings;
        super(context, 0);
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    private View createDreamInfoRow(ViewGroup viewGroup) {
        View row = this.mInflater.inflate(2130968627, viewGroup, false);
        row.findViewById(16908312).setOnClickListener(new 3(this, row));
        return row;
    }
}