package com.jellybyn.settings.deviceinfo;

import android.view.View;
import android.view.View.OnLongClickListener;
import android.widget.ListView;
import com.jellybyn.settings.deviceinfo.MiscFilesHandler.MemoryMearurementAdapter;

class MiscFilesHandler$MemoryMearurementAdapter$2 implements OnLongClickListener {
    final /* synthetic */ MemoryMearurementAdapter this$1;
    final /* synthetic */ int val$listPosition;
    final /* synthetic */ ListView val$listView;
    final /* synthetic */ FileItemInfoLayout val$view;

    public boolean onLongClick(View view) {
        boolean z = false;
        if (this.val$listView.getCheckedItemCount() > 0) {
            return false;
        }
        ListView listView = this.val$listView;
        int i = this.val$listPosition;
        if (!this.val$view.isChecked()) {
            z = true;
        }
        listView.setItemChecked(i, z);
        return true;
    }

    MiscFilesHandler$MemoryMearurementAdapter$2(MemoryMearurementAdapter memoryMearurementAdapter, ListView listView, int i, FileItemInfoLayout fileItemInfoLayout) {
        this.this$1 = memoryMearurementAdapter;
        this.val$listView = listView;
        this.val$listPosition = i;
        this.val$view = fileItemInfoLayout;
    }
}