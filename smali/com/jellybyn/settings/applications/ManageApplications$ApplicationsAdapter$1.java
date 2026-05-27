package com.jellybyn.settings.applications;

import android.widget.Filter;
import android.widget.Filter.FilterResults;
import com.jellybyn.settings.applications.ApplicationsState.AppEntry;
import com.jellybyn.settings.applications.ManageApplications.ApplicationsAdapter;
import java.util.ArrayList;

class ManageApplications$ApplicationsAdapter$1 extends Filter {
    final /* synthetic */ ApplicationsAdapter this$0;

    protected FilterResults performFiltering(CharSequence charSequence) {
        ArrayList<AppEntry> entries = this.this$0.applyPrefixFilter(charSequence, ApplicationsAdapter.access$500(this.this$0));
        FilterResults fr = new FilterResults();
        fr.values = entries;
        fr.count = entries.size();
        return fr;
    }

    protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
        this.this$0.mCurFilterPrefix = charSequence;
        ApplicationsAdapter.access$602(this.this$0, (ArrayList) filterResults.values);
        this.this$0.notifyDataSetChanged();
        ApplicationsAdapter.access$700(this.this$0).updateStorageUsage();
    }

    ManageApplications$ApplicationsAdapter$1(ApplicationsAdapter applicationsAdapter) {
        this.this$0 = applicationsAdapter;
    }
}