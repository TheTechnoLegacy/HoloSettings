package com.jellybyn.settings;

import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Bundle;
import com.jellybyn.settings.DataUsageSummary.AppItem;

public class DataUsageSummary$AppDetailsFragment extends Fragment {
    public static void show(DataUsageSummary dataUsageSummary, AppItem appItem, CharSequence charSequence) {
        if (dataUsageSummary.isAdded()) {
            Bundle args = new Bundle();
            args.putParcelable("app", appItem);
            DataUsageSummary$AppDetailsFragment fragment = new DataUsageSummary$AppDetailsFragment();
            fragment.setArguments(args);
            fragment.setTargetFragment(dataUsageSummary, 0);
            FragmentTransaction ft = dataUsageSummary.getFragmentManager().beginTransaction();
            ft.add(fragment, "appDetails");
            ft.addToBackStack("appDetails");
            ft.setBreadCrumbTitle(charSequence);
            ft.commitAllowingStateLoss();
        }
    }

    public void onStart() {
        super.onStart();
        DataUsageSummary target = (DataUsageSummary) getTargetFragment();
        DataUsageSummary.access$2502(target, (AppItem) getArguments().getParcelable("app"));
        DataUsageSummary.access$100(target);
    }

    public void onStop() {
        super.onStop();
        DataUsageSummary target = (DataUsageSummary) getTargetFragment();
        DataUsageSummary.access$2502(target, null);
        DataUsageSummary.access$100(target);
    }
}