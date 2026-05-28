package com.jellybyn.settings.deviceinfo;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListView;
import com.jellybyn.settings.deviceinfo.MiscFilesHandler.MemoryMearurementAdapter;

class MiscFilesHandler$MemoryMearurementAdapter$3 implements OnClickListener {
    final /* synthetic */ MemoryMearurementAdapter this$1;
    final /* synthetic */ int val$listPosition;
    final /* synthetic */ ListView val$listView;
    final /* synthetic */ FileItemInfoLayout val$view;

    public void onClick(View view) {
        if (this.val$listView.getCheckedItemCount() > 0) {
            this.val$listView.setItemChecked(this.val$listPosition, !this.val$view.isChecked());
        }
    }

    MiscFilesHandler$MemoryMearurementAdapter$3(MemoryMearurementAdapter memoryMearurementAdapter, ListView listView, int i, FileItemInfoLayout fileItemInfoLayout) {
        this.this$1 = memoryMearurementAdapter;
        this.val$listView = listView;
        this.val$listPosition = i;
        this.val$view = fileItemInfoLayout;
    }
}