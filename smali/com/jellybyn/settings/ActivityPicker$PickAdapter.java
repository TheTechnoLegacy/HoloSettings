package com.jellybyn.settings;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.List;

protected class ActivityPicker$PickAdapter extends BaseAdapter {
    private final LayoutInflater mInflater;
    private final List<Item> mItems;

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.mInflater.inflate(2130968652, viewGroup, false);
        }
        Item item = (Item) getItem(i);
        TextView textView = (TextView) view;
        textView.setText(item.label);
        textView.setCompoundDrawablesWithIntrinsicBounds(item.icon, null, null, null);
        return view;
    }

    public ActivityPicker$PickAdapter(Context context, List<Item> items) {
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mItems = items;
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