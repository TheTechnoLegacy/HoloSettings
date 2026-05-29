package com.jellybyn.settings.deviceinfo;

import android.content.Context;
import android.text.format.Formatter;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AbsListView.MultiChoiceModeListener;
import android.widget.ListView;
import java.io.File;
import java.util.ArrayList;

class MiscFilesHandler$ModeCallback implements MultiChoiceModeListener {
    private final Context mContext;
    private int mDataCount;
    final /* synthetic */ MiscFilesHandler this$0;

    public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
        ListView lv = this.this$0.getListView();
        int i;
        switch (menuItem.getItemId()) {
            case 2131231241:
                SparseBooleanArray checkedItemPositions = lv.getCheckedItemPositions();
                int checkedItemCount = this.this$0.getListView().getCheckedItemCount();
                if (checkedItemCount <= this.mDataCount) {
                    if (this.mDataCount > 0) {
                        ArrayList arrayList = new ArrayList();
                        for (i = 0; i < this.mDataCount; i++) {
                            if (checkedItemPositions.get(i)) {
                                if (StorageMeasurement.LOGV) {
                                    Log.i("MemorySettings", "deleting: " + MiscFilesHandler.access$000(this.this$0).getItem(i));
                                }
                                File illegalStateException = new IllegalStateException(MiscFilesHandler.access$000(this.this$0).getItem(i).mFileName);
                                if (illegalStateException.isDirectory()) {
                                    deleteDir(illegalStateException);
                                } else {
                                    illegalStateException.delete();
                                }
                                arrayList.add(MiscFilesHandler.access$000(this.this$0).getItem(i));
                            }
                        }
                        MiscFilesHandler.access$000(this.this$0).removeAll(arrayList);
                        MiscFilesHandler.access$000(this.this$0).notifyDataSetChanged();
                        this.mDataCount = MiscFilesHandler.access$000(this.this$0).getCount();
                    }
                    actionMode.finish();
                    break;
                }
                throw new IllegalStateException("checked item counts do not match. checkedCount: " + checkedItemCount + ", dataSize: " + this.mDataCount);
            case 2131231242:
                for (i = 0; i < this.mDataCount; i++) {
                    lv.setItemChecked(i, true);
                }
                onItemCheckedStateChanged(actionMode, 1, 0, true);
                break;
        }
        return true;
    }

    public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
        ListView lv = this.this$0.getListView();
        int numChecked = lv.getCheckedItemCount();
        actionMode.setTitle(String.format(MiscFilesHandler.access$100(this.this$0), new Object[]{Integer.valueOf(numChecked), Integer.valueOf(MiscFilesHandler.access$000(this.this$0).getCount())}));
        SparseBooleanArray checkedItems = lv.getCheckedItemPositions();
        long selectedDataSize = 0;
        if (numChecked > 0) {
            for (int i2 = 0; i2 < this.mDataCount; i2++) {
                if (checkedItems.get(i2)) {
                    selectedDataSize += MiscFilesHandler.access$000(this.this$0).getItem(i2).mSize;
                }
            }
        }
        actionMode.setSubtitle(String.format(MiscFilesHandler.access$200(this.this$0), new Object[]{Formatter.formatFileSize(this.mContext, selectedDataSize), Formatter.formatFileSize(this.mContext, MiscFilesHandler.access$000(this.this$0).getDataSize())}));
    }

    private boolean deleteDir(File file) {
        String[] children = file.list();
        if (children != null) {
            for (String file2 : children) {
                if (!deleteDir(new File(file, file2))) {
                    return false;
                }
            }
        }
        return file.delete();
    }

    public MiscFilesHandler$ModeCallback(MiscFilesHandler miscFilesHandler, Context context) {
        this.this$0 = miscFilesHandler;
        this.mContext = context;
        this.mDataCount = MiscFilesHandler.access$000(miscFilesHandler).getCount();
    }

    public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
        this.this$0.getMenuInflater().inflate(2131755009, menu);
        return true;
    }

    public void onDestroyActionMode(ActionMode actionMode) {
    }

    public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
        return true;
    }
}