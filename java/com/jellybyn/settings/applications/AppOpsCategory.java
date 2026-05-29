package com.jellybyn.settings.applications;

import android.app.ListFragment;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Loader;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.View;
import android.widget.ListView;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import com.jellybyn.settings.applications.AppOpsState.OpsTemplate;
import java.util.List;

public class AppOpsCategory extends ListFragment implements LoaderCallbacks<List<AppOpEntry>> {
    AppListAdapter mAdapter;
    String mCurrentPkgName;
    AppOpsState mState;

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        setEmptyText("No applications");
        setHasOptionsMenu(true);
        this.mAdapter = new AppListAdapter(getActivity(), this.mState);
        setListAdapter(this.mAdapter);
        setListShown(false);
        getLoaderManager().initLoader(0, null, this);
    }

    public AppOpsCategory(OpsTemplate opsTemplate) {
        Bundle args = new Bundle();
        args.putParcelable("template", opsTemplate);
        setArguments(args);
    }

    private void startApplicationDetailsActivity() {
        Bundle bundle = new Bundle();
        bundle.putString("package", this.mCurrentPkgName);
        ((PreferenceActivity) getActivity()).startPreferencePanel(AppOpsDetails.class.getName(), bundle, 2131428431, null, this, 1);
    }

    public Loader<List<AppOpEntry>> onCreateLoader(int i, Bundle bundle) {
        Bundle fargs = getArguments();
        OpsTemplate template = null;
        if (fargs != null) {
            template = (OpsTemplate) fargs.getParcelable("template");
        }
        return new AppListLoader(getActivity(), this.mState, template);
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        AppOpEntry entry = this.mAdapter.getItem(i);
        if (entry != null) {
            this.mCurrentPkgName = entry.getAppEntry().getApplicationInfo().packageName;
            startApplicationDetailsActivity();
        }
    }

    public void onLoadFinished(Loader<List<AppOpEntry>> loader, List<AppOpEntry> data) {
        this.mAdapter.setData(data);
        if (isResumed()) {
            setListShown(true);
        } else {
            setListShownNoAnimation(true);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mState = new AppOpsState(getActivity());
    }

    public void onLoaderReset(Loader<List<AppOpEntry>> loader) {
        this.mAdapter.setData(null);
    }
}