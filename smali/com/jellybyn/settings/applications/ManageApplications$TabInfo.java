package com.jellybyn.settings.applications;

import android.os.Bundle;
import android.os.Environment;
import android.os.RemoteException;
import android.text.format.Formatter;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.TextView;
import com.android.internal.app.IMediaContainerService;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import com.jellybyn.settings.applications.ManageApplications.ApplicationsAdapter;

public class ManageApplications$TabInfo implements OnItemClickListener {
    private long mAppStorage = 0;
    public ApplicationsAdapter mApplications;
    public final ApplicationsState mApplicationsState;
    public final AppClickListener mClickListener;
    private LinearColorBar mColorBar;
    public final CharSequence mComputingSizeStr;
    private IMediaContainerService mContainerService;
    public final int mFilter;
    private long mFreeStorage = 0;
    private TextView mFreeStorageText;
    public LayoutInflater mInflater;
    public final CharSequence mInvalidSizeStr;
    public final CharSequence mLabel;
    private long mLastFreeStorage;
    private long mLastUsedStorage;
    private View mListContainer;
    public final int mListType;
    private ListView mListView;
    private View mLoadingContainer;
    public final ManageApplications mOwner;
    public View mRootView;
    final Runnable mRunningProcessesAvail = new 1(this);
    private RunningProcessesView mRunningProcessesView;
    private final Bundle mSavedInstanceState;
    private TextView mStorageChartLabel;
    private long mTotalStorage = 0;
    private TextView mUsedStorageText;

    void updateStorageUsage() {
        if (this.mOwner.getActivity() != null && this.mApplications != null) {
            this.mFreeStorage = 0;
            this.mAppStorage = 0;
            this.mTotalStorage = 0;
            long[] fileSystemStats;
            int count;
            int i;
            AppEntry appEntry;
            if (this.mFilter == 2) {
                if (this.mContainerService != null) {
                    try {
                        fileSystemStats = this.mContainerService.getFileSystemStats(Environment.getExternalStorageDirectory().getPath());
                        this.mTotalStorage = fileSystemStats[0];
                        this.mFreeStorage = fileSystemStats[1];
                    } catch (RemoteException e) {
                        Log.w("ManageApplications", "Problem in container service", e);
                    }
                }
                if (this.mApplications != null) {
                    count = this.mApplications.getCount();
                    for (i = 0; i < count; i++) {
                        appEntry = this.mApplications.getAppEntry(i);
                        this.mAppStorage += (appEntry.externalCodeSize + appEntry.externalDataSize) + appEntry.externalCacheSize;
                    }
                }
            } else {
                if (this.mContainerService != null) {
                    try {
                        fileSystemStats = this.mContainerService.getFileSystemStats(Environment.getDataDirectory().getPath());
                        this.mTotalStorage = fileSystemStats[0];
                        this.mFreeStorage = fileSystemStats[1];
                    } catch (RemoteException e2) {
                        Log.w("ManageApplications", "Problem in container service", e2);
                    }
                }
                boolean isExternalStorageEmulated = Environment.isExternalStorageEmulated();
                if (this.mApplications != null) {
                    count = this.mApplications.getCount();
                    for (i = 0; i < count; i++) {
                        appEntry = this.mApplications.getAppEntry(i);
                        this.mAppStorage += appEntry.codeSize + appEntry.dataSize;
                        if (isExternalStorageEmulated) {
                            this.mAppStorage += appEntry.externalCodeSize + appEntry.externalDataSize;
                        }
                    }
                }
                this.mFreeStorage += this.mApplicationsState.sumCacheSizes();
            }
            applyCurrentStorage();
        }
    }

    public View build(LayoutInflater layoutInflater, ViewGroup viewGroup, View view) {
        if (this.mRootView != null) {
            return this.mRootView;
        }
        this.mInflater = layoutInflater;
        this.mRootView = layoutInflater.inflate(this.mListType == 1 ? 2130968641 : 2130968638, null);
        this.mLoadingContainer = this.mRootView.findViewById(2131230895);
        this.mLoadingContainer.setVisibility(0);
        this.mListContainer = this.mRootView.findViewById(2131230890);
        if (this.mListContainer != null) {
            View emptyView = this.mListContainer.findViewById(16908292);
            ListView lv = (ListView) this.mListContainer.findViewById(16908298);
            if (emptyView != null) {
                lv.setEmptyView(emptyView);
            }
            lv.setOnItemClickListener(this);
            lv.setSaveEnabled(true);
            lv.setItemsCanFocus(true);
            lv.setTextFilterEnabled(true);
            this.mListView = lv;
            this.mApplications = new ApplicationsAdapter(this.mApplicationsState, this, this.mFilter);
            this.mListView.setAdapter(this.mApplications);
            this.mListView.setRecyclerListener(this.mApplications);
            this.mColorBar = (LinearColorBar) this.mListContainer.findViewById(2131230891);
            this.mStorageChartLabel = (TextView) this.mListContainer.findViewById(2131230893);
            this.mUsedStorageText = (TextView) this.mListContainer.findViewById(2131230892);
            this.mFreeStorageText = (TextView) this.mListContainer.findViewById(2131230894);
            Utils.prepareCustomPreferencesList(viewGroup, view, this.mListView, false);
            if (this.mFilter == 2) {
                this.mStorageChartLabel.setText(this.mOwner.getActivity().getText(2131428385));
            } else {
                this.mStorageChartLabel.setText(this.mOwner.getActivity().getText(2131428384));
            }
            applyCurrentStorage();
        }
        this.mRunningProcessesView = (RunningProcessesView) this.mRootView.findViewById(2131230899);
        if (this.mRunningProcessesView != null) {
            this.mRunningProcessesView.doCreate(this.mSavedInstanceState);
        }
        return this.mRootView;
    }

    void applyCurrentStorage() {
        if (this.mRootView != null) {
            if (this.mTotalStorage > 0) {
                String formatShortFileSize;
                this.mColorBar.setRatios(((float) ((this.mTotalStorage - this.mFreeStorage) - this.mAppStorage)) / ((float) this.mTotalStorage), ((float) this.mAppStorage) / ((float) this.mTotalStorage), ((float) this.mFreeStorage) / ((float) this.mTotalStorage));
                long j = this.mTotalStorage - this.mFreeStorage;
                if (this.mLastUsedStorage != j) {
                    this.mLastUsedStorage = j;
                    formatShortFileSize = Formatter.formatShortFileSize(this.mOwner.getActivity(), j);
                    this.mUsedStorageText.setText(this.mOwner.getActivity().getResources().getString(2131428444, new Object[]{formatShortFileSize}));
                }
                if (this.mLastFreeStorage != this.mFreeStorage) {
                    this.mLastFreeStorage = this.mFreeStorage;
                    formatShortFileSize = Formatter.formatShortFileSize(this.mOwner.getActivity(), this.mFreeStorage);
                    this.mFreeStorageText.setText(this.mOwner.getActivity().getResources().getString(2131428443, new Object[]{formatShortFileSize}));
                    return;
                }
                return;
            }
            this.mColorBar.setRatios(0.0f, 0.0f, 0.0f);
            if (this.mLastUsedStorage != -1) {
                this.mLastUsedStorage = -1;
                this.mUsedStorageText.setText("");
            }
            if (this.mLastFreeStorage != -1) {
                this.mLastFreeStorage = -1;
                this.mFreeStorageText.setText("");
            }
        }
    }

    public ManageApplications$TabInfo(ManageApplications manageApplications, ApplicationsState applicationsState, CharSequence charSequence, int i, AppClickListener appClickListener, Bundle bundle) {
        this.mOwner = manageApplications;
        this.mApplicationsState = applicationsState;
        this.mLabel = charSequence;
        this.mListType = i;
        switch (i) {
            case 0:
                this.mFilter = 1;
                break;
            case 2:
                this.mFilter = 2;
                break;
            case 4:
                this.mFilter = 3;
                break;
            default:
                this.mFilter = 0;
                break;
        }
        this.mClickListener = appClickListener;
        this.mInvalidSizeStr = manageApplications.getActivity().getText(2131428407);
        this.mComputingSizeStr = manageApplications.getActivity().getText(2131428406);
        this.mSavedInstanceState = bundle;
    }

    public void resume(int i) {
        if (this.mApplications != null) {
            this.mApplications.resume(i);
        }
        if (this.mRunningProcessesView == null) {
            return;
        }
        if (this.mRunningProcessesView.doResume(this.mOwner, this.mRunningProcessesAvail)) {
            this.mRunningProcessesView.setVisibility(0);
            this.mLoadingContainer.setVisibility(4);
            return;
        }
        this.mLoadingContainer.setVisibility(0);
    }

    public void detachView() {
        if (this.mRootView != null) {
            ViewGroup viewGroup = (ViewGroup) this.mRootView.getParent();
            if (viewGroup != null) {
                viewGroup.removeView(this.mRootView);
            }
        }
    }

    void handleRunningProcessesAvail() {
        this.mLoadingContainer.startAnimation(AnimationUtils.loadAnimation(this.mOwner.getActivity(), 17432577));
        this.mRunningProcessesView.startAnimation(AnimationUtils.loadAnimation(this.mOwner.getActivity(), 17432576));
        this.mRunningProcessesView.setVisibility(0);
        this.mLoadingContainer.setVisibility(8);
    }

    public void pause() {
        if (this.mApplications != null) {
            this.mApplications.pause();
        }
        if (this.mRunningProcessesView != null) {
            this.mRunningProcessesView.doPause();
        }
    }

    public void setContainerService(IMediaContainerService iMediaContainerService) {
        this.mContainerService = iMediaContainerService;
        updateStorageUsage();
    }

    public void onItemClick(AdapterView<?> parent, View view, int i, long j) {
        this.mClickListener.onItemClick(this, parent, view, i, j);
    }
}