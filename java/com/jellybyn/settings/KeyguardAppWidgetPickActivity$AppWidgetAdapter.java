package com.jellybyn.settings;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item;
import java.util.List;

protected class KeyguardAppWidgetPickActivity$AppWidgetAdapter extends BaseAdapter {
    private final LayoutInflater mInflater;
    private final List<Item> mItems;

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.mInflater.inflate(2130968634, viewGroup, false);
        }
        Item item = (Item) getItem(i);
        ((TextView) view.findViewById(2131230887)).setText(item.label);
        ImageView iconView = (ImageView) view.findViewById(2131230756);
        iconView.setImageDrawable(null);
        item.loadWidgetPreview(iconView);
        return view;
    }

    public KeyguardAppWidgetPickActivity$AppWidgetAdapter(Context context, List<Item> items) {
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mItems = items;
    }

    public void cancelAllWidgetPreviewLoaders() {
        for (int i = 0; i < this.mItems.size(); i++) {
            ((Item) this.mItems.get(i)).cancelLoadingWidgetPreview();
        }
    }

    public int getCount() {
        return this.mItems.size();
    }

    public Object getItem(int i) {
        return this.mItems.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }
}