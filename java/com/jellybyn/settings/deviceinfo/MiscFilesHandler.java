package com.jellybyn.settings.deviceinfo;

import android.app.ListActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.widget.ListView;

public class MiscFilesHandler extends ListActivity {
    private MemoryMearurementAdapter mAdapter;
    private LayoutInflater mInflater;
    private String mNumBytesSelectedFormat;
    private String mNumSelectedFormat;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setFinishOnTouchOutside(true);
        setTitle(2131428892);
        this.mNumSelectedFormat = getString(2131428893);
        this.mNumBytesSelectedFormat = getString(2131428894);
        this.mAdapter = new MemoryMearurementAdapter(this, this);
        this.mInflater = (LayoutInflater) getSystemService("layout_inflater");
        setContentView(2130968692);
        ListView lv = getListView();
        lv.setItemsCanFocus(true);
        lv.setChoiceMode(3);
        lv.setMultiChoiceModeListener(new ModeCallback(this, this));
        setListAdapter(this.mAdapter);
    }
}