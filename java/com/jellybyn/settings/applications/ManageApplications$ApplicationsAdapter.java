package com.jellybyn.settings.applications;

import android.content.Context;
import android.os.Environment;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.AbsListView.RecyclerListener;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.Filter;
import android.widget.Filterable;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import com.jellybyn.settings.applications.ApplicationsState.AppFilter;
import com.jellybyn.settings.applications.ApplicationsState.Callbacks;
import com.jellybyn.settings.applications.ApplicationsState.Session;
import com.jellybyn.settings.applications.ManageApplications.TabInfo;
import java.util.ArrayList;
import java.util.Comparator;

class ManageApplications$ApplicationsAdapter extends BaseAdapter implements RecyclerListener, Filterable, Callbacks {
    private final ArrayList<View> mActive = new ArrayList();
    private ArrayList<AppEntry> mBaseEntries;
    private final Context mContext;
    CharSequence mCurFilterPrefix;
    private ArrayList<AppEntry> mEntries;
    private Filter mFilter = new 1(this);
    private final int mFilterMode;
    private int mLastSortMode = -1;
    private boolean mResumed;
    private final Session mSession;
    private final ApplicationsState mState;
    private final TabInfo mTab;
    private boolean mWaitingForData;
    private int mWhichSize = 0;

    public void rebuild(boolean z) {
        AppFilter filterObj;
        Comparator<AppEntry> comparatorObj;
        boolean emulated = Environment.isExternalStorageEmulated();
        if (emulated) {
            this.mWhichSize = 0;
        } else {
            this.mWhichSize = 1;
        }
        switch (this.mFilterMode) {
            case 1:
                filterObj = ApplicationsState.THIRD_PARTY_FILTER;
                break;
            case 2:
                filterObj = ApplicationsState.ON_SD_CARD_FILTER;
                if (!emulated) {
                    this.mWhichSize = 2;
                    break;
                }
                break;
            case 3:
                filterObj = ApplicationsState.DISABLED_FILTER;
                break;
            default:
                filterObj = ApplicationsState.ALL_ENABLED_FILTER;
                break;
        }
        switch (this.mLastSortMode) {
            case 5:
                switch (this.mWhichSize) {
                    case 1:
                        comparatorObj = ApplicationsState.INTERNAL_SIZE_COMPARATOR;
                        break;
                    case 2:
                        comparatorObj = ApplicationsState.EXTERNAL_SIZE_COMPARATOR;
                        break;
                    default:
                        comparatorObj = ApplicationsState.SIZE_COMPARATOR;
                        break;
                }
            default:
                comparatorObj = ApplicationsState.ALPHA_COMPARATOR;
                break;
        }
        ArrayList<AppEntry> entries = this.mSession.rebuild(filterObj, comparatorObj);
        if (entries != null || z) {
            this.mBaseEntries = entries;
            if (this.mBaseEntries != null) {
                this.mEntries = applyPrefixFilter(this.mCurFilterPrefix, this.mBaseEntries);
            } else {
                this.mEntries = null;
            }
            notifyDataSetChanged();
            this.mTab.updateStorageUsage();
            if (entries == null) {
                this.mWaitingForData = true;
                TabInfo.access$800(this.mTab).setVisibility(4);
                TabInfo.access$900(this.mTab).setVisibility(0);
                return;
            }
            TabInfo.access$800(this.mTab).setVisibility(0);
            TabInfo.access$900(this.mTab).setVisibility(8);
        }
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        boolean z = false;
        AppViewHolder holder = AppViewHolder.createOrRecycle(this.mTab.mInflater, view);
        view = holder.rootView;
        AppEntry entry = (AppEntry) this.mEntries.get(i);
        synchronized (entry) {
            holder.entry = entry;
            if (entry.label != null) {
                holder.appName.setText(entry.label);
            }
            this.mState.ensureIcon(entry);
            if (entry.icon != null) {
                holder.appIcon.setImageDrawable(entry.icon);
            }
            holder.updateSizeText(this.mTab.mInvalidSizeStr, this.mWhichSize);
            if ((entry.info.flags & 8388608) == 0) {
                holder.disabled.setVisibility(0);
                holder.disabled.setText(2131428382);
            } else if (entry.info.enabled) {
                holder.disabled.setVisibility(8);
            } else {
                holder.disabled.setVisibility(0);
                holder.disabled.setText(2131428381);
            }
            if (this.mFilterMode == 2) {
                holder.checkBox.setVisibility(0);
                CheckBox checkBox = holder.checkBox;
                if ((entry.info.flags & 262144) != 0) {
                    z = true;
                }
                checkBox.setChecked(z);
            } else {
                holder.checkBox.setVisibility(8);
            }
        }
        this.mActive.remove(view);
        this.mActive.add(view);
        return view;
    }

    public void onPackageSizeChanged(String str) {
        for (int i = 0; i < this.mActive.size(); i++) {
            AppViewHolder holder = (AppViewHolder) ((View) this.mActive.get(i)).getTag();
            if (holder.entry.info.packageName.equals(str)) {
                synchronized (holder.entry) {
                    holder.updateSizeText(this.mTab.mInvalidSizeStr, this.mWhichSize);
                }
                if (holder.entry.info.packageName.equals(ManageApplications.access$1000(this.mTab.mOwner)) && this.mLastSortMode == 5) {
                    rebuild(false);
                }
                this.mTab.updateStorageUsage();
                return;
            }
        }
    }

    public ManageApplications$ApplicationsAdapter(ApplicationsState applicationsState, TabInfo tabInfo, int i) {
        this.mState = applicationsState;
        this.mSession = applicationsState.newSession(this);
        this.mTab = tabInfo;
        this.mContext = tabInfo.mOwner.getActivity();
        this.mFilterMode = i;
    }

    ArrayList<AppEntry> applyPrefixFilter(CharSequence charSequence, ArrayList<AppEntry> origEntries) {
        if (charSequence == null || charSequence.length() == 0) {
            return origEntries;
        }
        String prefixStr = ApplicationsState.normalize(charSequence.toString());
        String spacePrefixStr = " " + prefixStr;
        ArrayList<AppEntry> newEntries = new ArrayList();
        for (int i = 0; i < origEntries.size(); i++) {
            AppEntry entry = (AppEntry) origEntries.get(i);
            String nlabel = entry.getNormalizedLabel();
            if (nlabel.startsWith(prefixStr) || nlabel.indexOf(spacePrefixStr) != -1) {
                newEntries.add(entry);
            }
        }
        return newEntries;
    }

    public void onRebuildComplete(ArrayList<AppEntry> apps) {
        if (TabInfo.access$900(this.mTab).getVisibility() == 0) {
            TabInfo.access$900(this.mTab).startAnimation(AnimationUtils.loadAnimation(this.mContext, 17432577));
            TabInfo.access$800(this.mTab).startAnimation(AnimationUtils.loadAnimation(this.mContext, 17432576));
        }
        TabInfo.access$800(this.mTab).setVisibility(0);
        TabInfo.access$900(this.mTab).setVisibility(8);
        this.mWaitingForData = false;
        this.mBaseEntries = apps;
        this.mEntries = applyPrefixFilter(this.mCurFilterPrefix, this.mBaseEntries);
        notifyDataSetChanged();
        this.mTab.updateStorageUsage();
    }

    public void resume(int i) {
        if (this.mResumed) {
            rebuild(i);
            return;
        }
        this.mResumed = true;
        this.mSession.resume();
        this.mLastSortMode = i;
        rebuild(true);
    }

    public void onAllSizesComputed() {
        if (this.mLastSortMode == 5) {
            rebuild(false);
        }
        this.mTab.updateStorageUsage();
    }

    public void pause() {
        if (this.mResumed) {
            this.mResumed = false;
            this.mSession.pause();
        }
    }

    public void rebuild(int i) {
        if (i != this.mLastSortMode) {
            this.mLastSortMode = i;
            rebuild(true);
        }
    }

    public void onMovedToScrapHeap(View view) {
        this.mActive.remove(view);
    }

    public void onPackageListChanged() {
        rebuild(false);
    }

    public void onRunningStateChanged(boolean z) {
        this.mTab.mOwner.getActivity().setProgressBarIndeterminateVisibility(z);
    }

    public AppEntry getAppEntry(int i) {
        return (AppEntry) this.mEntries.get(i);
    }

    public int getCount() {
        return this.mEntries != null ? this.mEntries.size() : 0;
    }

    public Filter getFilter() {
        return this.mFilter;
    }

    public Object getItem(int i) {
        return this.mEntries.get(i);
    }

    public long getItemId(int i) {
        return ((AppEntry) this.mEntries.get(i)).id;
    }

    public void onPackageIconChanged() {
    }
}