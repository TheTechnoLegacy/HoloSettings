package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.admin.DeviceAdminInfo;
import android.app.admin.DeviceAdminInfo.PolicyInfo;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.res.Resources.NotFoundException;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils.TruncateAt;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AppSecurityPermissions;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

public class DeviceAdminAdd extends Activity {
    Button mActionButton;
    final ArrayList<View> mActivePolicies = new ArrayList();
    TextView mAddMsg;
    boolean mAddMsgEllipsized = true;
    ImageView mAddMsgExpander;
    CharSequence mAddMsgText;
    boolean mAdding;
    final ArrayList<View> mAddingPolicies = new ArrayList();
    TextView mAdminDescription;
    ImageView mAdminIcon;
    TextView mAdminName;
    ViewGroup mAdminPolicies;
    TextView mAdminWarning;
    Button mCancelButton;
    DevicePolicyManager mDPM;
    DeviceAdminInfo mDeviceAdmin;
    Handler mHandler;
    boolean mRefreshing;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mHandler = new Handler(getMainLooper());
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        if ((getIntent().getFlags() & 268435456) != 0) {
            Log.w("DeviceAdminAdd", "Cannot start ADD_DEVICE_ADMIN as a new task");
            finish();
            return;
        }
        ComponentName cn = (ComponentName) getIntent().getParcelableExtra("android.app.extra.DEVICE_ADMIN");
        if (cn == null) {
            Log.w("DeviceAdminAdd", "No component specified in " + getIntent().getAction());
            finish();
            return;
        }
        try {
            int i;
            ResolveInfo ri;
            ActivityInfo ai = getPackageManager().getReceiverInfo(cn, 128);
            if (!this.mDPM.isAdminActive(cn)) {
                List queryBroadcastReceivers = getPackageManager().queryBroadcastReceivers(new Intent("android.app.action.DEVICE_ADMIN_ENABLED"), 32768);
                int size = queryBroadcastReceivers == null ? 0 : queryBroadcastReceivers.size();
                Object obj = null;
                i = 0;
                while (i < size) {
                    ri = (ResolveInfo) queryBroadcastReceivers.get(i);
                    if (ai.packageName.equals(ri.activityInfo.packageName) && ai.name.equals(ri.activityInfo.name)) {
                        try {
                            ri.activityInfo = ai;
                            DeviceAdminInfo deviceAdminInfo = new DeviceAdminInfo(this, ri);
                            obj = 1;
                            break;
                        } catch (XmlPullParserException e) {
                            Log.w("DeviceAdminAdd", "Bad " + ri.activityInfo, e);
                        } catch (IOException e2) {
                            Log.w("DeviceAdminAdd", "Bad " + ri.activityInfo, e2);
                        }
                    } else {
                        i++;
                    }
                }
                if (obj == null) {
                    Log.w("DeviceAdminAdd", "Request to add invalid device admin: " + cn);
                    finish();
                    return;
                }
            }
            ri = new ResolveInfo();
            ri.activityInfo = ai;
            try {
                this.mDeviceAdmin = new DeviceAdminInfo(this, ri);
                if ("android.app.action.ADD_DEVICE_ADMIN".equals(getIntent().getAction())) {
                    this.mRefreshing = false;
                    if (this.mDPM.isAdminActive(cn)) {
                        ArrayList usedPolicies = this.mDeviceAdmin.getUsedPolicies();
                        for (i = 0; i < usedPolicies.size(); i++) {
                            if (!this.mDPM.hasGrantedPolicy(cn, ((PolicyInfo) usedPolicies.get(i)).ident)) {
                                this.mRefreshing = true;
                                break;
                            }
                        }
                        if (!this.mRefreshing) {
                            setResult(-1);
                            finish();
                            return;
                        }
                    }
                }
                this.mAddMsgText = getIntent().getCharSequenceExtra("android.app.extra.ADD_EXPLANATION");
                setContentView(2130968621);
                this.mAdminIcon = (ImageView) findViewById(2131230823);
                this.mAdminName = (TextView) findViewById(2131230824);
                this.mAdminDescription = (TextView) findViewById(2131230825);
                this.mAddMsg = (TextView) findViewById(2131230827);
                this.mAddMsgExpander = (ImageView) findViewById(2131230826);
                this.mAddMsg.setOnClickListener(new 1(this));
                toggleMessageEllipsis(this.mAddMsg);
                this.mAdminWarning = (TextView) findViewById(2131230828);
                this.mAdminPolicies = (ViewGroup) findViewById(2131230829);
                this.mCancelButton = (Button) findViewById(2131230761);
                this.mCancelButton.setOnClickListener(new 1(this));
                this.mActionButton = (Button) findViewById(2131230832);
                this.mActionButton.setOnClickListener(new 1(this));
            } catch (XmlPullParserException e3) {
                Log.w("DeviceAdminAdd", "Unable to retrieve device policy " + cn, e3);
                finish();
            } catch (IOException e22) {
                Log.w("DeviceAdminAdd", "Unable to retrieve device policy " + cn, e22);
                finish();
            }
        } catch (NameNotFoundException e4) {
            Log.w("DeviceAdminAdd", "Unable to retrieve device policy " + cn, e4);
            finish();
        }
    }

    void updateInterface() {
        this.mAdminIcon.setImageDrawable(this.mDeviceAdmin.loadIcon(getPackageManager()));
        this.mAdminName.setText(this.mDeviceAdmin.loadLabel(getPackageManager()));
        try {
            this.mAdminDescription.setText(this.mDeviceAdmin.loadDescription(getPackageManager()));
            this.mAdminDescription.setVisibility(0);
        } catch (NotFoundException e) {
            this.mAdminDescription.setVisibility(8);
        }
        if (this.mAddMsgText != null) {
            this.mAddMsg.setText(this.mAddMsgText);
            this.mAddMsg.setVisibility(0);
        } else {
            this.mAddMsg.setVisibility(8);
            this.mAddMsgExpander.setVisibility(8);
        }
        ArrayList usedPolicies;
        int i;
        View permissionItemView;
        if (this.mRefreshing || !this.mDPM.isAdminActive(this.mDeviceAdmin.getComponent())) {
            if (this.mAddingPolicies.size() == 0) {
                usedPolicies = this.mDeviceAdmin.getUsedPolicies();
                for (i = 0; i < usedPolicies.size(); i++) {
                    PolicyInfo policyInfo = (PolicyInfo) usedPolicies.get(i);
                    permissionItemView = AppSecurityPermissions.getPermissionItemView(this, getText(policyInfo.label), getText(policyInfo.description), true);
                    this.mAddingPolicies.add(permissionItemView);
                    this.mAdminPolicies.addView(permissionItemView);
                }
            }
            setViewVisibility(this.mAddingPolicies, 0);
            setViewVisibility(this.mActivePolicies, 8);
            this.mAdminWarning.setText(getString(2131428809, new Object[]{this.mDeviceAdmin.getActivityInfo().applicationInfo.loadLabel(getPackageManager())}));
            setTitle(getText(2131428806));
            this.mActionButton.setText(getText(2131428807));
            this.mAdding = true;
            return;
        }
        if (this.mActivePolicies.size() == 0) {
            usedPolicies = this.mDeviceAdmin.getUsedPolicies();
            for (i = 0; i < usedPolicies.size(); i++) {
                permissionItemView = AppSecurityPermissions.getPermissionItemView(this, getText(((PolicyInfo) usedPolicies.get(i)).label), "", true);
                this.mActivePolicies.add(permissionItemView);
                this.mAdminPolicies.addView(permissionItemView);
            }
        }
        setViewVisibility(this.mActivePolicies, 0);
        setViewVisibility(this.mAddingPolicies, 8);
        this.mAdminWarning.setText(getString(2131428810, new Object[]{this.mDeviceAdmin.getActivityInfo().applicationInfo.loadLabel(getPackageManager())}));
        setTitle(getText(2131428802));
        this.mActionButton.setText(getText(2131428803));
        this.mAdding = false;
    }

    void toggleMessageEllipsis(View view) {
        TextView tv = (TextView) view;
        this.mAddMsgEllipsized = !this.mAddMsgEllipsized;
        tv.setEllipsize(this.mAddMsgEllipsized ? TruncateAt.END : null);
        tv.setMaxLines(this.mAddMsgEllipsized ? getEllipsizedLines() : 15);
        this.mAddMsgExpander.setImageResource(this.mAddMsgEllipsized ? 17302129 : 17302128);
    }

    protected Dialog onCreateDialog(int i, Bundle bundle) {
        switch (i) {
            case 1:
                CharSequence msg = bundle.getCharSequence("android.app.extra.DISABLE_WARNING");
                Builder builder = new Builder(this);
                builder.setMessage(msg);
                builder.setPositiveButton(2131428389, new 1(this));
                builder.setNegativeButton(2131428390, null);
                return builder.create();
            default:
                return super.onCreateDialog(i, bundle);
        }
    }

    static void setViewVisibility(ArrayList<View> views, int i) {
        int N = views.size();
        for (int i2 = 0; i2 < N; i2++) {
            ((View) views.get(i2)).setVisibility(i);
        }
    }

    protected void onResume() {
        super.onResume();
        updateInterface();
    }

    int getEllipsizedLines() {
        Display d = ((WindowManager) getSystemService("window")).getDefaultDisplay();
        return d.getHeight() > d.getWidth() ? 5 : 2;
    }
}