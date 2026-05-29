package com.jellybyn.settings.applications;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ApplicationErrorReport;
import android.app.DialogFragment;
import android.app.Fragment;
import android.content.ComponentName;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ProviderInfo;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.UserHandle;
import android.provider.Settings.Global;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.jellybyn.settings.Utils;
import com.jellybyn.settings.applications.RunningProcessesView.ActiveItem;
import com.jellybyn.settings.applications.RunningProcessesView.ViewHolder;
import com.jellybyn.settings.applications.RunningState.BaseItem;
import com.jellybyn.settings.applications.RunningState.MergedItem;
import com.jellybyn.settings.applications.RunningState.OnRefreshUiListener;
import com.jellybyn.settings.applications.RunningState.ProcessItem;
import com.jellybyn.settings.applications.RunningState.ServiceItem;
import java.util.ArrayList;
import java.util.Collections;

public class RunningServiceDetails extends Fragment implements OnRefreshUiListener {
    final ArrayList<ActiveDetail> mActiveDetails = new ArrayList();
    ViewGroup mAllDetails;
    ActivityManager mAm;
    StringBuilder mBuilder = new StringBuilder(128);
    boolean mHaveData;
    LayoutInflater mInflater;
    MergedItem mMergedItem;
    int mNumProcesses;
    int mNumServices;
    String mProcessName;
    TextView mProcessesHeader;
    View mRootView;
    TextView mServicesHeader;
    boolean mShowBackground;
    ViewGroup mSnippet;
    ActiveItem mSnippetActiveItem;
    ViewHolder mSnippetViewHolder;
    RunningState mState;
    int mUid;
    int mUserId;

    void addServiceDetailsView(ServiceItem serviceItem, MergedItem mergedItem, boolean z, boolean z2) {
        if (z) {
            addServicesHeader();
        } else if (mergedItem.mUserId != UserHandle.myUserId()) {
            addProcessesHeader();
        }
        BaseItem bi = serviceItem != null ? serviceItem : mergedItem;
        ActiveDetail detail = new 1(this);
        View root = this.mInflater.inflate(2130968688, this.mAllDetails, false);
        this.mAllDetails.addView(root);
        detail.mRootView = root;
        detail.mServiceItem = serviceItem;
        detail.mViewHolder = new ViewHolder(root);
        detail.mActiveItem = detail.mViewHolder.bind(this.mState, bi, this.mBuilder);
        if (!z2) {
            root.findViewById(2131231016).setVisibility(8);
        }
        if (!(serviceItem == null || serviceItem.mRunningService.clientLabel == 0)) {
            detail.mManageIntent = this.mAm.getRunningServiceControlPanel(serviceItem.mRunningService.service);
        }
        TextView description = (TextView) root.findViewById(2131231017);
        detail.mStopButton = (Button) root.findViewById(2131231067);
        detail.mReportButton = (Button) root.findViewById(2131231068);
        if (!z || mergedItem.mUserId == UserHandle.myUserId()) {
            if (serviceItem != null && serviceItem.mServiceInfo.descriptionRes != 0) {
                description.setText(getActivity().getPackageManager().getText(serviceItem.mServiceInfo.packageName, serviceItem.mServiceInfo.descriptionRes, serviceItem.mServiceInfo.applicationInfo));
            } else if (mergedItem.mBackground) {
                description.setText(2131428461);
            } else if (detail.mManageIntent != null) {
                try {
                    String string = getActivity().getPackageManager().getResourcesForApplication(serviceItem.mRunningService.clientPackage).getString(serviceItem.mRunningService.clientLabel);
                    description.setText(getActivity().getString(2131428462, new Object[]{string}));
                } catch (NameNotFoundException e) {
                }
            } else {
                description.setText(getActivity().getText(serviceItem != null ? 2131428459 : 2131428460));
            }
            detail.mStopButton.setOnClickListener(detail);
            detail.mStopButton.setText(getActivity().getText(detail.mManageIntent != null ? 2131428458 : 2131428457));
            detail.mReportButton.setOnClickListener(detail);
            detail.mReportButton.setText(17040388);
            if (Global.getInt(getActivity().getContentResolver(), "send_action_app_error", 0) == 0 || serviceItem == null) {
                detail.mReportButton.setEnabled(false);
            } else {
                detail.mInstaller = ApplicationErrorReport.getErrorReportReceiver(getActivity(), serviceItem.mServiceInfo.packageName, serviceItem.mServiceInfo.applicationInfo.flags);
                detail.mReportButton.setEnabled(detail.mInstaller != null);
            }
        } else {
            description.setVisibility(8);
            root.findViewById(2131230847).setVisibility(8);
        }
        this.mActiveDetails.add(detail);
    }

    void addProcessDetailsView(ProcessItem processItem, boolean z) {
        addProcessesHeader();
        ActiveDetail detail = new 1(this);
        View root = this.mInflater.inflate(2130968687, this.mAllDetails, false);
        this.mAllDetails.addView(root);
        detail.mRootView = root;
        detail.mViewHolder = new ViewHolder(root);
        detail.mActiveItem = detail.mViewHolder.bind(this.mState, processItem, this.mBuilder);
        TextView description = (TextView) root.findViewById(2131231017);
        if (processItem.mUserId != UserHandle.myUserId()) {
            description.setVisibility(8);
        } else if (z) {
            description.setText(2131428463);
        } else {
            int textid = 0;
            CharSequence label = null;
            RunningAppProcessInfo rpi = processItem.mRunningProcessInfo;
            ComponentName comp = rpi.importanceReasonComponent;
            switch (rpi.importanceReasonCode) {
                case 1:
                    textid = 2131428465;
                    if (rpi.importanceReasonComponent != null) {
                        try {
                            ProviderInfo providerInfo = getActivity().getPackageManager().getProviderInfo(rpi.importanceReasonComponent, 0);
                            label = RunningState.makeLabel(getActivity().getPackageManager(), providerInfo.name, providerInfo);
                            break;
                        } catch (NameNotFoundException e) {
                            break;
                        }
                    }
                    break;
                case 2:
                    textid = 2131428464;
                    if (rpi.importanceReasonComponent != null) {
                        try {
                            ServiceInfo serviceInfo = getActivity().getPackageManager().getServiceInfo(rpi.importanceReasonComponent, 0);
                            label = RunningState.makeLabel(getActivity().getPackageManager(), serviceInfo.name, serviceInfo);
                            break;
                        } catch (NameNotFoundException e2) {
                            break;
                        }
                    }
                    break;
            }
            if (!(textid == 0 || label == null)) {
                description.setText(getActivity().getString(textid, new Object[]{label}));
            }
        }
        this.mActiveDetails.add(detail);
    }

    void addDetailViews() {
        int i;
        for (i = this.mActiveDetails.size() - 1; i >= 0; i--) {
            this.mAllDetails.removeView(((ActiveDetail) this.mActiveDetails.get(i)).mRootView);
        }
        this.mActiveDetails.clear();
        if (this.mServicesHeader != null) {
            this.mAllDetails.removeView(this.mServicesHeader);
            this.mServicesHeader = null;
        }
        if (this.mProcessesHeader != null) {
            this.mAllDetails.removeView(this.mProcessesHeader);
            this.mProcessesHeader = null;
        }
        this.mNumProcesses = 0;
        this.mNumServices = 0;
        if (this.mMergedItem == null) {
            return;
        }
        if (this.mMergedItem.mUser != null) {
            ArrayList arrayList;
            if (this.mShowBackground) {
                arrayList = new ArrayList(this.mMergedItem.mChildren);
                Collections.sort(arrayList, this.mState.mBackgroundComparator);
            } else {
                arrayList = this.mMergedItem.mChildren;
            }
            for (i = 0; i < arrayList.size(); i++) {
                addDetailsViews((MergedItem) arrayList.get(i), true, false);
            }
            for (i = 0; i < arrayList.size(); i++) {
                addDetailsViews((MergedItem) arrayList.get(i), false, true);
            }
            return;
        }
        addDetailsViews(this.mMergedItem, true, true);
    }

    void addDetailsViews(MergedItem mergedItem, boolean z, boolean z2) {
        if (mergedItem != null) {
            int i;
            if (z) {
                for (i = 0; i < mergedItem.mServices.size(); i++) {
                    addServiceDetailsView((ServiceItem) mergedItem.mServices.get(i), mergedItem, true, true);
                }
            }
            if (!z2) {
                return;
            }
            if (mergedItem.mServices.size() <= 0) {
                addServiceDetailsView(null, mergedItem, false, mergedItem.mUserId != UserHandle.myUserId());
                return;
            }
            i = -1;
            while (i < mergedItem.mOtherProcesses.size()) {
                ProcessItem pi = i < 0 ? mergedItem.mProcess : (ProcessItem) mergedItem.mOtherProcesses.get(i);
                if (pi == null || pi.mPid > 0) {
                    addProcessDetailsView(pi, i < 0);
                }
                i++;
            }
        }
    }

    boolean findMergedItem() {
        MergedItem item = null;
        ArrayList<MergedItem> newItems = this.mShowBackground ? this.mState.getCurrentBackgroundItems() : this.mState.getCurrentMergedItems();
        if (newItems != null) {
            for (int i = 0; i < newItems.size(); i++) {
                MergedItem mergedItem = (MergedItem) newItems.get(i);
                if (mergedItem.mUserId == this.mUserId && ((this.mUid < 0 || mergedItem.mProcess == null || mergedItem.mProcess.mUid == this.mUid) && (this.mProcessName == null || (mergedItem.mProcess != null && this.mProcessName.equals(mergedItem.mProcess.mProcessName))))) {
                    item = mergedItem;
                    break;
                }
            }
        }
        if (this.mMergedItem == item) {
            return false;
        }
        this.mMergedItem = item;
        return true;
    }

    void refreshUi(boolean z) {
        if (findMergedItem()) {
            z = true;
        }
        if (z) {
            if (this.mMergedItem != null) {
                this.mSnippetActiveItem = this.mSnippetViewHolder.bind(this.mState, this.mMergedItem, this.mBuilder);
            } else if (this.mSnippetActiveItem != null) {
                this.mSnippetActiveItem.mHolder.size.setText("");
                this.mSnippetActiveItem.mHolder.uptime.setText("");
                this.mSnippetActiveItem.mHolder.description.setText(2131428454);
            } else {
                finish();
                return;
            }
            addDetailViews();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mUid = getArguments().getInt("uid", -1);
        this.mUserId = getArguments().getInt("user_id", 0);
        this.mProcessName = getArguments().getString("process", null);
        this.mShowBackground = getArguments().getBoolean("background", false);
        this.mAm = (ActivityManager) getActivity().getSystemService("activity");
        this.mInflater = (LayoutInflater) getActivity().getSystemService("layout_inflater");
        this.mState = RunningState.getInstance(getActivity());
    }

    public void onRefreshUi(int i) {
        if (getActivity() != null) {
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
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = layoutInflater.inflate(2130968686, viewGroup, false);
        Utils.prepareCustomPreferencesList(viewGroup, view, view, false);
        this.mRootView = view;
        this.mAllDetails = (ViewGroup) view.findViewById(2131230728);
        this.mSnippet = (ViewGroup) view.findViewById(2131231015);
        this.mSnippetViewHolder = new ViewHolder(this.mSnippet);
        ensureData();
        return view;
    }

    ActiveDetail activeDetailForService(ComponentName componentName) {
        for (int i = 0; i < this.mActiveDetails.size(); i++) {
            ActiveDetail activeDetail = (ActiveDetail) this.mActiveDetails.get(i);
            if (activeDetail.mServiceItem != null && activeDetail.mServiceItem.mRunningService != null && componentName.equals(activeDetail.mServiceItem.mRunningService.service)) {
                return activeDetail;
            }
        }
        return null;
    }

    void addProcessesHeader() {
        if (this.mNumProcesses == 0) {
            this.mProcessesHeader = (TextView) this.mInflater.inflate(2130968689, this.mAllDetails, false);
            this.mProcessesHeader.setText(2131428456);
            this.mAllDetails.addView(this.mProcessesHeader);
        }
        this.mNumProcesses++;
    }

    void addServicesHeader() {
        if (this.mNumServices == 0) {
            this.mServicesHeader = (TextView) this.mInflater.inflate(2130968689, this.mAllDetails, false);
            this.mServicesHeader.setText(2131428455);
            this.mAllDetails.addView(this.mServicesHeader);
        }
        this.mNumServices++;
    }

    void ensureData() {
        if (!this.mHaveData) {
            this.mHaveData = true;
            this.mState.resume(this);
            this.mState.waitForData();
            refreshUi(true);
        }
    }

    void updateTimes() {
        if (this.mSnippetActiveItem != null) {
            this.mSnippetActiveItem.updateTime(getActivity(), this.mBuilder);
        }
        for (int i = 0; i < this.mActiveDetails.size(); i++) {
            ((ActiveDetail) this.mActiveDetails.get(i)).mActiveItem.updateTime(getActivity(), this.mBuilder);
        }
    }

    private void showConfirmStopDialog(ComponentName componentName) {
        DialogFragment newFragment = MyAlertDialogFragment.newConfirmStop(1, componentName);
        newFragment.setTargetFragment(this, 0);
        newFragment.show(getFragmentManager(), "confirmstop");
    }

    public void onPause() {
        super.onPause();
        this.mHaveData = false;
        this.mState.pause();
    }

    public void onResume() {
        super.onResume();
        ensureData();
    }

    private void finish() {
        new Handler().post(new 1(this));
    }
}