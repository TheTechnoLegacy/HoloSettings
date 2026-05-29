package com.jellybyn.settings.applications;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.jellybyn.settings.applications.RunningProcessesView.ViewHolder;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import java.util.ArrayList;
import java.util.Collections;

class RunningProcessesView$ServiceListAdapter extends BaseAdapter {
    final LayoutInflater mInflater;
    final ArrayList<MergedItem> mItems = new ArrayList();
    ArrayList<MergedItem> mOrigItems;
    boolean mShowBackground;
    final RunningState mState;
    final /* synthetic */ RunningProcessesView this$0;

    void refreshItems() {
        ArrayList<MergedItem> newItems = this.mShowBackground ? this.mState.getCurrentBackgroundItems() : this.mState.getCurrentMergedItems();
        if (this.mOrigItems != newItems) {
            this.mOrigItems = newItems;
            if (newItems == null) {
                this.mItems.clear();
                return;
            }
            this.mItems.clear();
            this.mItems.addAll(newItems);
            if (this.mShowBackground) {
                Collections.sort(this.mItems, this.mState.mBackgroundComparator);
            }
        }
    }

    public void bindView(View view, int i) {
        synchronized (this.mState.mLock) {
            if (i >= this.mItems.size()) {
                return;
            }
            this.this$0.mActiveItems.put(view, ((ViewHolder) view.getTag()).bind(this.mState, (MergedItem) this.mItems.get(i), this.this$0.mBuilder));
        }
    }

    void setShowBackground(boolean z) {
        if (this.mShowBackground != z) {
            this.mShowBackground = z;
            this.mState.setWatchingBackgroundItems(z);
            refreshItems();
            notifyDataSetChanged();
            this.this$0.mColorBar.setShowingGreen(this.mShowBackground);
        }
    }

    RunningProcessesView$ServiceListAdapter(RunningProcessesView runningProcessesView, RunningState runningState) {
        this.this$0 = runningProcessesView;
        this.mState = runningState;
        this.mInflater = (LayoutInflater) runningProcessesView.getContext().getSystemService("layout_inflater");
        refreshItems();
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = view == null ? newView(viewGroup) : view;
        bindView(v, i);
        return v;
    }

    public View newView(ViewGroup viewGroup) {
        View v = this.mInflater.inflate(2130968684, viewGroup, false);
        ViewHolder viewHolder = new ViewHolder(v);
        return v;
    }

    public boolean areAllItemsEnabled() {
        return false;
    }

    public int getCount() {
        return this.mItems.size();
    }

    public Object getItem(int i) {
        return this.mItems.get(i);
    }

    public long getItemId(int i) {
        return (long) ((MergedItem) this.mItems.get(i)).hashCode();
    }

    boolean getShowBackground() {
        return this.mShowBackground;
    }

    public boolean hasStableIds() {
        return true;
    }

    public boolean isEmpty() {
        return this.mState.hasData() && this.mItems.size() == 0;
    }

    public boolean isEnabled(int i) {
        return !((MergedItem) this.mItems.get(i)).mIsProcess;
    }
}