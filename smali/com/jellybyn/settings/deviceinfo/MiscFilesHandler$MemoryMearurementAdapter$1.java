package com.jellybyn.settings.deviceinfo;

import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ListView;
import com.jellybyn.settings.deviceinfo.MiscFilesHandler.MemoryMearurementAdapter;

class MiscFilesHandler$MemoryMearurementAdapter$1 implements OnCheckedChangeListener {
    final /* synthetic */ MemoryMearurementAdapter this$1;
    final /* synthetic */ int val$listPosition;
    final /* synthetic */ ListView val$listView;

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        this.val$listView.setItemChecked(this.val$listPosition, z);
    }

    MiscFilesHandler$MemoryMearurementAdapter$1(MemoryMearurementAdapter memoryMearurementAdapter, ListView listView, int i) {
        this.this$1 = memoryMearurementAdapter;
        this.val$listView = listView;
        this.val$listPosition = i;
    }
}