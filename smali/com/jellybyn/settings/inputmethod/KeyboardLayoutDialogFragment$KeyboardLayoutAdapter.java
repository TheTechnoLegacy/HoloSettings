package com.jellybyn.settings.inputmethod;

import android.content.Context;
import android.hardware.input.KeyboardLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;
import android.widget.RadioButton;
import android.widget.TextView;

final class KeyboardLayoutDialogFragment$KeyboardLayoutAdapter extends ArrayAdapter<KeyboardLayout> {
    private int mCheckedItem = -1;
    private final LayoutInflater mInflater;

    public View getView(int i, View view, ViewGroup viewGroup) {
        String label;
        String collection;
        KeyboardLayout item = (KeyboardLayout) getItem(i);
        if (item != null) {
            label = item.getLabel();
            collection = item.getCollection();
        } else {
            label = getContext().getString(2131428495);
            collection = "";
        }
        boolean checked = i == this.mCheckedItem;
        return collection.isEmpty() ? inflateOneLine(view, viewGroup, label, checked) : inflateTwoLine(view, viewGroup, label, collection, checked);
    }

    private View inflateTwoLine(View view, ViewGroup viewGroup, String str, String str2, boolean z) {
        View view2 = view;
        if (view2 == null || !isTwoLine(view2)) {
            view2 = this.mInflater.inflate(17367228, viewGroup, false);
            setTwoLine(view2, true);
        }
        TextView subText = (TextView) view2.findViewById(16908309);
        RadioButton radioButton = (RadioButton) view2.findViewById(16909045);
        ((TextView) view2.findViewById(16908308)).setText(str);
        subText.setText(str2);
        radioButton.setChecked(z);
        return view2;
    }

    private View inflateOneLine(View view, ViewGroup viewGroup, String str, boolean z) {
        View view2 = view;
        if (view2 == null || isTwoLine(view2)) {
            view2 = this.mInflater.inflate(17367055, viewGroup, false);
            setTwoLine(view2, false);
        }
        CheckedTextView headline = (CheckedTextView) view2.findViewById(16908308);
        headline.setText(str);
        headline.setChecked(z);
        return view2;
    }

    public KeyboardLayoutDialogFragment$KeyboardLayoutAdapter(Context context) {
        super(context, 17367228);
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    private static void setTwoLine(View view, boolean z) {
        view.setTag(Boolean.valueOf(z));
    }

    public void setCheckedItem(int i) {
        this.mCheckedItem = i;
    }

    private static boolean isTwoLine(View view) {
        return view.getTag() == Boolean.TRUE;
    }
}