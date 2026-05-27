package com.jellybyn.settings.applications;

import android.app.AppOpsManager;
import android.app.AppOpsManager.OpEntry;
import android.app.Fragment;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PermissionGroupInfo;
import android.content.pm.PermissionInfo;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.applications.AppOpsState.AppOpEntry;
import com.jellybyn.settings.applications.AppOpsState.OpsTemplate;

public class AppOpsDetails extends Fragment {
    private AppOpsManager mAppOps;
    private TextView mAppVersion;
    private LayoutInflater mInflater;
    private LinearLayout mOperationsSection;
    private PackageInfo mPackageInfo;
    private PackageManager mPm;
    private View mRootView;
    private AppOpsState mState;

    private boolean refreshUi() {
        if (this.mPackageInfo == null) {
            return false;
        }
        setAppLabelAndIcon(this.mPackageInfo);
        Resources res = getActivity().getResources();
        this.mOperationsSection.removeAllViews();
        String lastPermGroup = "";
        for (OpsTemplate tpl : AppOpsState.ALL_TEMPLATES) {
            for (AppOpEntry entry : this.mState.buildState(tpl, this.mPackageInfo.applicationInfo.uid, this.mPackageInfo.packageName)) {
                OpEntry firstOp = entry.getOpEntry(0);
                View view = this.mInflater.inflate(2130968583, this.mOperationsSection, false);
                this.mOperationsSection.addView(view);
                String perm = AppOpsManager.opToPermission(firstOp.getOp());
                if (perm != null) {
                    try {
                        PermissionInfo permissionInfo = this.mPm.getPermissionInfo(perm, 0);
                        if (!(permissionInfo.group == null || lastPermGroup.equals(permissionInfo.group))) {
                            lastPermGroup = permissionInfo.group;
                            PermissionGroupInfo permissionGroupInfo = this.mPm.getPermissionGroupInfo(permissionInfo.group, 0);
                            if (permissionGroupInfo.icon != 0) {
                                ((ImageView) view.findViewById(2131230731)).setImageDrawable(permissionGroupInfo.loadIcon(this.mPm));
                            }
                        }
                    } catch (NameNotFoundException e) {
                    }
                }
                ((TextView) view.findViewById(2131230732)).setText(entry.getSwitchText(this.mState));
                ((TextView) view.findViewById(2131230733)).setText(entry.getTimeText(res, true));
                Switch switchR = (Switch) view.findViewById(2131230734);
                int opToSwitch = AppOpsManager.opToSwitch(firstOp.getOp());
                switchR.setChecked(this.mAppOps.checkOp(opToSwitch, entry.getPackageOps().getUid(), entry.getPackageOps().getPackageName()) == 0);
                switchR.setOnCheckedChangeListener(new 1(this, opToSwitch, entry));
            }
        }
        return true;
    }

    private String retrieveAppEntry() {
        Bundle args = getArguments();
        String packageName = args != null ? args.getString("package") : null;
        if (packageName == null) {
            Intent intent = args == null ? getActivity().getIntent() : (Intent) args.getParcelable("intent");
            if (intent != null) {
                packageName = intent.getData().getSchemeSpecificPart();
            }
        }
        try {
            this.mPackageInfo = this.mPm.getPackageInfo(packageName, 8704);
        } catch (NameNotFoundException e) {
            Log.e("AppOpsDetails", "Exception when retrieving package:" + packageName, e);
            this.mPackageInfo = null;
        }
        return packageName;
    }

    private void setAppLabelAndIcon(PackageInfo packageInfo) {
        View appSnippet = this.mRootView.findViewById(2131230729);
        appSnippet.setPaddingRelative(0, appSnippet.getPaddingTop(), 0, appSnippet.getPaddingBottom());
        ((ImageView) appSnippet.findViewById(2131230735)).setImageDrawable(this.mPm.getApplicationIcon(packageInfo.applicationInfo));
        ((TextView) appSnippet.findViewById(2131230736)).setText(this.mPm.getApplicationLabel(packageInfo.applicationInfo));
        this.mAppVersion = (TextView) appSnippet.findViewById(2131230897);
        if (packageInfo.versionName != null) {
            this.mAppVersion.setVisibility(0);
            this.mAppVersion.setText(getActivity().getString(2131428409, new Object[]{String.valueOf(packageInfo.versionName)}));
            return;
        }
        this.mAppVersion.setVisibility(4);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mState = new AppOpsState(getActivity());
        this.mPm = getActivity().getPackageManager();
        this.mInflater = (LayoutInflater) getActivity().getSystemService("layout_inflater");
        this.mAppOps = (AppOpsManager) getActivity().getSystemService("appops");
        retrieveAppEntry();
        setHasOptionsMenu(true);
    }

    private void setIntentAndFinish(boolean z, boolean z2) {
        Intent intent = new Intent();
        intent.putExtra("chg", z2);
        ((PreferenceActivity) getActivity()).finishPreferencePanel(this, -1, intent);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968582, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, view, false);
        this.mRootView = view;
        this.mOperationsSection = (LinearLayout) view.findViewById(2131230730);
        return view;
    }

    public void onResume() {
        super.onResume();
        if (!refreshUi()) {
            setIntentAndFinish(true, true);
        }
    }
}