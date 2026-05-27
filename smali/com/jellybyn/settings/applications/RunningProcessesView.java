package com.jellybyn.settings.applications;

import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.os.UserHandle;
import android.preference.PreferenceActivity;
import android.text.format.Formatter;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AbsListView.RecyclerListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.TextView;
import com.android.internal.util.MemInfoReader;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import com.jellybyn.settings.applications.RunningState.OnRefreshUiListener;
import java.util.HashMap;
import java.util.Iterator;

public class RunningProcessesView extends FrameLayout implements RecyclerListener, OnItemClickListener, OnRefreshUiListener {
    long SECONDARY_SERVER_MEM;
    final HashMap<View, ActiveItem> mActiveItems = new HashMap();
    ServiceListAdapter mAdapter;
    ActivityManager mAm;
    TextView mBackgroundProcessText;
    StringBuilder mBuilder = new StringBuilder(128);
    LinearColorBar mColorBar;
    BaseItem mCurSelected;
    Runnable mDataAvail;
    TextView mForegroundProcessText;
    long mLastAvailMemory = -1;
    long mLastBackgroundProcessMemory = -1;
    long mLastForegroundProcessMemory = -1;
    int mLastNumBackgroundProcesses = -1;
    int mLastNumForegroundProcesses = -1;
    int mLastNumServiceProcesses = -1;
    long mLastServiceProcessMemory = -1;
    ListView mListView;
    MemInfoReader mMemInfoReader = new MemInfoReader();
    final int mMyUserId = UserHandle.myUserId();
    Fragment mOwner;
    RunningState mState;

    void refreshUi(boolean z) {
        if (z) {
            ServiceListAdapter serviceListAdapter = (ServiceListAdapter) this.mListView.getAdapter();
            serviceListAdapter.refreshItems();
            serviceListAdapter.notifyDataSetChanged();
        }
        if (this.mDataAvail != null) {
            this.mDataAvail.run();
            this.mDataAvail = null;
        }
        this.mMemInfoReader.readMemInfo();
        long availMem = (this.mMemInfoReader.getFreeSize() + this.mMemInfoReader.getCachedSize()) - this.SECONDARY_SERVER_MEM;
        if (availMem < 0) {
            availMem = 0;
        }
        synchronized (this.mState.mLock) {
            if (!(this.mLastNumBackgroundProcesses == this.mState.mNumBackgroundProcesses && this.mLastBackgroundProcessMemory == this.mState.mBackgroundProcessMemory && this.mLastAvailMemory == availMem)) {
                this.mLastNumBackgroundProcesses = this.mState.mNumBackgroundProcesses;
                this.mLastBackgroundProcessMemory = this.mState.mBackgroundProcessMemory;
                this.mLastAvailMemory = availMem;
                long j = this.mLastAvailMemory + this.mLastBackgroundProcessMemory;
                String formatShortFileSize = Formatter.formatShortFileSize(getContext(), j);
                this.mBackgroundProcessText.setText(getResources().getString(2131428443, new Object[]{formatShortFileSize}));
                formatShortFileSize = Formatter.formatShortFileSize(getContext(), this.mMemInfoReader.getTotalSize() - j);
                this.mForegroundProcessText.setText(getResources().getString(2131428444, new Object[]{formatShortFileSize}));
            }
            if (!(this.mLastNumForegroundProcesses == this.mState.mNumForegroundProcesses && this.mLastForegroundProcessMemory == this.mState.mForegroundProcessMemory && this.mLastNumServiceProcesses == this.mState.mNumServiceProcesses && this.mLastServiceProcessMemory == this.mState.mServiceProcessMemory)) {
                this.mLastNumForegroundProcesses = this.mState.mNumForegroundProcesses;
                this.mLastForegroundProcessMemory = this.mState.mForegroundProcessMemory;
                this.mLastNumServiceProcesses = this.mState.mNumServiceProcesses;
                this.mLastServiceProcessMemory = this.mState.mServiceProcessMemory;
            }
            float totalSize = (float) this.mMemInfoReader.getTotalSize();
            this.mColorBar.setRatios((totalSize - ((float) ((this.mLastBackgroundProcessMemory + availMem) + this.mLastServiceProcessMemory))) / totalSize, ((float) this.mLastServiceProcessMemory) / totalSize, ((float) this.mLastBackgroundProcessMemory) / totalSize);
        }
    }

    public void doCreate(Bundle bundle) {
        this.mAm = (ActivityManager) getContext().getSystemService("activity");
        this.mState = RunningState.getInstance(getContext());
        ((LayoutInflater) getContext().getSystemService("layout_inflater")).inflate(2130968685, this);
        this.mListView = (ListView) findViewById(16908298);
        View emptyView = findViewById(16908292);
        if (emptyView != null) {
            this.mListView.setEmptyView(emptyView);
        }
        this.mListView.setOnItemClickListener(this);
        this.mListView.setRecyclerListener(this);
        this.mAdapter = new ServiceListAdapter(this, this.mState);
        this.mListView.setAdapter(this.mAdapter);
        this.mColorBar = (LinearColorBar) findViewById(2131231012);
        this.mBackgroundProcessText = (TextView) findViewById(2131231014);
        this.mBackgroundProcessText.setOnClickListener(new 1(this));
        this.mForegroundProcessText = (TextView) findViewById(2131231013);
        this.mForegroundProcessText.setOnClickListener(new 2(this));
        MemoryInfo memInfo = new MemoryInfo();
        this.mAm.getMemoryInfo(memInfo);
        this.SECONDARY_SERVER_MEM = memInfo.secondaryServerThreshold;
    }

    public RunningProcessesView(Context context, AttributeSet attributeSet) {
    }

    private void startServiceDetailsActivity(MergedItem mergedItem) {
        if (this.mOwner != null) {
            Bundle bundle = new Bundle();
            if (mergedItem.mProcess != null) {
                bundle.putInt("uid", mergedItem.mProcess.mUid);
                bundle.putString("process", mergedItem.mProcess.mProcessName);
            }
            bundle.putInt("user_id", mergedItem.mUserId);
            bundle.putBoolean("background", this.mAdapter.mShowBackground);
            ((PreferenceActivity) this.mOwner.getActivity()).startPreferencePanel(RunningServiceDetails.class.getName(), bundle, 2131428453, null, null, 0);
        }
    }

    public void onRefreshUi(int i) {
        switch (i) {
            case 0:
                updateTimes();
                return;
            case 1:
                refreshUi(false);
                updateTimes();
                return;
            case 2:
                refreshUi(true);
                updateTimes();
                return;
            default:
                return;
        }
    }

    public boolean doResume(Fragment fragment, Runnable runnable) {
        this.mOwner = fragment;
        this.mState.resume(this);
        if (this.mState.hasData()) {
            refreshUi(true);
            return true;
        }
        this.mDataAvail = runnable;
        return false;
    }

    void updateTimes() {
        Iterator<ActiveItem> it = this.mActiveItems.values().iterator();
        while (it.hasNext()) {
            ActiveItem activeItem = (ActiveItem) it.next();
            if (activeItem.mRootView.getWindowToken() == null) {
                it.remove();
            } else {
                activeItem.updateTime(getContext(), this.mBuilder);
            }
        }
    }

    public void onItemClick(AdapterView<?> parent, View view, int i, long j) {
        MergedItem mi = (MergedItem) ((ListView) parent).getAdapter().getItem(i);
        this.mCurSelected = mi;
        startServiceDetailsActivity(mi);
    }

    public void doPause() {
        this.mState.pause();
        this.mDataAvail = null;
        this.mOwner = null;
    }

    public void onMovedToScrapHeap(View view) {
        this.mActiveItems.remove(view);
    }
}