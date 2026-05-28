package com.jellybyn.settings.deviceinfo;

import android.app.Activity;
import android.content.Context;
import android.os.storage.StorageVolume;
import android.text.format.Formatter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import com.jellybyn.settings.deviceinfo.StorageMeasurement.FileInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class MiscFilesHandler$MemoryMearurementAdapter extends BaseAdapter {
    private Context mContext;
    private ArrayList<FileInfo> mData = null;
    private long mDataSize = 0;
    final /* synthetic */ MiscFilesHandler this$0;

    public MiscFilesHandler$MemoryMearurementAdapter(MiscFilesHandler miscFilesHandler, Activity activity) {
        this.this$0 = miscFilesHandler;
        this.mContext = activity;
        StorageMeasurement mMeasurement = StorageMeasurement.getInstance(activity, (StorageVolume) activity.getIntent().getParcelableExtra("storage_volume"));
        if (mMeasurement != null) {
            this.mData = (ArrayList) mMeasurement.mFileInfoForMisc;
            if (this.mData != null) {
                Iterator i$ = this.mData.iterator();
                while (i$.hasNext()) {
                    this.mDataSize += ((FileInfo) i$.next()).mSize;
                }
            }
        }
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        FileItemInfoLayout fileItemInfoLayout = view == null ? (FileItemInfoLayout) MiscFilesHandler.access$300(this.this$0).inflate(2130968691, viewGroup, false) : (FileItemInfoLayout) view;
        FileInfo item = getItem(i);
        fileItemInfoLayout.setFileName(item.mFileName);
        fileItemInfoLayout.setFileSize(Formatter.formatFileSize(this.mContext, item.mSize));
        ListView listView = (ListView) viewGroup;
        int i2 = i;
        fileItemInfoLayout.getCheckBox().setOnCheckedChangeListener(new 1(this, listView, i2));
        fileItemInfoLayout.setOnLongClickListener(new 2(this, listView, i2, fileItemInfoLayout));
        fileItemInfoLayout.setOnClickListener(new 2(this, listView, i2, fileItemInfoLayout));
        return fileItemInfoLayout;
    }

    public void removeAll(List<Object> objs) {
        if (this.mData != null) {
            for (Object next : objs) {
                this.mData.remove(next);
                this.mDataSize -= ((FileInfo) next).mSize;
            }
        }
    }

    public FileInfo getItem(int i) {
        return (this.mData == null || this.mData.size() <= i) ? null : (FileInfo) this.mData.get(i);
    }

    public long getItemId(int i) {
        return (this.mData == null || this.mData.size() <= i) ? 0 : ((FileInfo) this.mData.get(i)).mId;
    }

    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
    }

    public int getCount() {
        return this.mData == null ? 0 : this.mData.size();
    }

    public long getDataSize() {
        return this.mDataSize;
    }
}