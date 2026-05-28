package com.jellybyn.settings;

public class ApnSettings extends android.preference.PreferenceActivity implements android.preference.Preference.OnPreferenceChangeListener {
    private static final android.net.Uri DEFAULTAPN_URI = null;
    private static final android.net.Uri PREFERAPN_URI = null;
    private static boolean mRestoreDefaultApnMode;
    private android.content.IntentFilter mMobileStateFilter;
    private final android.content.BroadcastReceiver mMobileStateReceiver;
    private com.jellybyn.settings.ApnSettings.RestoreApnProcessHandler mRestoreApnProcessHandler;
    private com.jellybyn.settings.ApnSettings.RestoreApnUiHandler mRestoreApnUiHandler;
    private android.os.HandlerThread mRestoreDefaultApnThread;
    private java.lang.String mSelectedKey;

    static {
        r0 = "content://telephony/carriers/restore";
        r0 = android.net.Uri.parse(r0);
        DEFAULTAPN_URI = r0;
        r0 = "content://telephony/carriers/preferapn";
        r0 = android.net.Uri.parse(r0);
        PREFERAPN_URI = r0;
        return;
    }

    public ApnSettings() {
        r1 = this;
        r1.<init>();
        r0 = new com.jellybyn.settings.ApnSettings$1;
        r0.<init>(r1);
        r1.mMobileStateReceiver = r0;
        return;
    }

    static /* synthetic */ com.android.internal.telephony.PhoneConstants.DataState access$000(android.content.Intent r1) {
        r0 = getMobileDataState(r1);
        return r0;
    }

    static /* synthetic */ boolean access$100() {
        r0 = mRestoreDefaultApnMode;
        return r0;
    }

    static /* synthetic */ boolean access$102(boolean r0) {
        mRestoreDefaultApnMode = r0;
        return r0;
    }

    static /* synthetic */ void access$200(com.jellybyn.settings.ApnSettings r0) {
        r0.fillList();
        return;
    }

    static /* synthetic */ android.net.Uri access$400() {
        r0 = DEFAULTAPN_URI;
        return r0;
    }

    private void addNewApn() {
        r3 = this;
        r0 = new android.content.Intent;
        r1 = "android.intent.action.INSERT";
        r2 = android.provider.Telephony.Carriers.CONTENT_URI;
        r0.<init>(r1, r2);
        r3.startActivity(r0);
        return;
    }

    private void fillList() {
        r18 = this;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "numeric=\"";
        r1 = r1.append(r2);
        r2 = "gsm.sim.operator.numeric";
        r3 = "";
        r2 = android.os.SystemProperties.get(r2, r3);
        r1 = r1.append(r2);
        r2 = "\"";
        r1 = r1.append(r2);
        r4 = r1.toString();
        r1 = r18.getContentResolver();
        r2 = android.provider.Telephony.Carriers.CONTENT_URI;
        r3 = 4;
        r3 = new java.lang.String[r3];
        r5 = 0;
        r6 = "_id";
        r3[r5] = r6;
        r5 = 1;
        r6 = "name";
        r3[r5] = r6;
        r5 = 2;
        r6 = "apn";
        r3[r5] = r6;
        r5 = 3;
        r6 = "type";
        r3[r5] = r6;
        r5 = 0;
        r6 = "name ASC";
        r9 = r1.query(r2, r3, r4, r5, r6);
        if (r9 == 0) goto L_0x00e4;
    L_0x0047:
        r1 = "apn_list";
        r0 = r18;
        r8 = r0.findPreference(r1);
        r8 = (android.preference.PreferenceGroup) r8;
        r8.removeAll();
        r12 = new java.util.ArrayList;
        r12.<init>();
        r1 = r18.getSelectedApnKey();
        r0 = r18;
        r0.mSelectedKey = r1;
        r9.moveToFirst();
    L_0x0064:
        r1 = r9.isAfterLast();
        if (r1 != 0) goto L_0x00cd;
    L_0x006a:
        r1 = 1;
        r13 = r9.getString(r1);
        r1 = 2;
        r7 = r9.getString(r1);
        r1 = 0;
        r11 = r9.getString(r1);
        r1 = 3;
        r17 = r9.getString(r1);
        r14 = new com.jellybyn.settings.ApnPreference;
        r0 = r18;
        r14.<init>(r0);
        r14.setKey(r11);
        r14.setTitle(r13);
        r14.setSummary(r7);
        r1 = 0;
        r14.setPersistent(r1);
        r0 = r18;
        r14.setOnPreferenceChangeListener(r0);
        if (r17 == 0) goto L_0x00a3;
    L_0x0099:
        r1 = "mms";
        r0 = r17;
        r1 = r0.equals(r1);
        if (r1 != 0) goto L_0x00c6;
    L_0x00a3:
        r16 = 1;
    L_0x00a5:
        r0 = r16;
        r14.setSelectable(r0);
        if (r16 == 0) goto L_0x00c9;
    L_0x00ac:
        r0 = r18;
        r1 = r0.mSelectedKey;
        if (r1 == 0) goto L_0x00bf;
    L_0x00b2:
        r0 = r18;
        r1 = r0.mSelectedKey;
        r1 = r1.equals(r11);
        if (r1 == 0) goto L_0x00bf;
    L_0x00bc:
        r14.setChecked();
    L_0x00bf:
        r8.addPreference(r14);
    L_0x00c2:
        r9.moveToNext();
        goto L_0x0064;
    L_0x00c6:
        r16 = 0;
        goto L_0x00a5;
    L_0x00c9:
        r12.add(r14);
        goto L_0x00c2;
    L_0x00cd:
        r9.close();
        r10 = r12.iterator();
    L_0x00d4:
        r1 = r10.hasNext();
        if (r1 == 0) goto L_0x00e4;
    L_0x00da:
        r15 = r10.next();
        r15 = (android.preference.Preference) r15;
        r8.addPreference(r15);
        goto L_0x00d4;
    L_0x00e4:
        return;
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(android.content.Intent r2) {
        r0 = "state";
        r0 = r2.getStringExtra(r0);
        if (r0 == 0) goto L_0x0011;
    L_0x0008:
        r1 = com.android.internal.telephony.PhoneConstants.DataState.class;
        r0 = java.lang.Enum.valueOf(r1, r0);
        r0 = (com.android.internal.telephony.PhoneConstants.DataState) r0;
    L_0x0010:
        return r0;
    L_0x0011:
        r0 = com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
        goto L_0x0010;
    }

    private java.lang.String getSelectedApnKey() {
        r9 = this;
        r3 = 0;
        r8 = 0;
        r7 = 0;
        r0 = r9.getContentResolver();
        r1 = PREFERAPN_URI;
        r2 = 1;
        r2 = new java.lang.String[r2];
        r4 = "_id";
        r2[r8] = r4;
        r5 = "name ASC";
        r4 = r3;
        r6 = r0.query(r1, r2, r3, r4, r5);
        r0 = r6.getCount();
        if (r0 <= 0) goto L_0x0024;
    L_0x001d:
        r6.moveToFirst();
        r7 = r6.getString(r8);
    L_0x0024:
        r6.close();
        return r7;
    }

    private boolean restoreDefaultApn() {
        r4 = this;
        r3 = 1;
        r0 = 1001; // 0x3e9 float:1.403E-42 double:4.946E-321;
        r4.showDialog(r0);
        mRestoreDefaultApnMode = r3;
        r0 = r4.mRestoreApnUiHandler;
        if (r0 != 0) goto L_0x0014;
    L_0x000c:
        r0 = new com.jellybyn.settings.ApnSettings$RestoreApnUiHandler;
        r1 = 0;
        r0.<init>(r4, r1);
        r4.mRestoreApnUiHandler = r0;
    L_0x0014:
        r0 = r4.mRestoreApnProcessHandler;
        if (r0 == 0) goto L_0x001c;
    L_0x0018:
        r0 = r4.mRestoreDefaultApnThread;
        if (r0 != 0) goto L_0x0039;
    L_0x001c:
        r0 = new android.os.HandlerThread;
        r1 = "Restore default APN Handler: Process Thread";
        r0.<init>(r1);
        r4.mRestoreDefaultApnThread = r0;
        r0 = r4.mRestoreDefaultApnThread;
        r0.start();
        r0 = new com.jellybyn.settings.ApnSettings$RestoreApnProcessHandler;
        r1 = r4.mRestoreDefaultApnThread;
        r1 = r1.getLooper();
        r2 = r4.mRestoreApnUiHandler;
        r0.<init>(r4, r1, r2);
        r4.mRestoreApnProcessHandler = r0;
    L_0x0039:
        r0 = r4.mRestoreApnProcessHandler;
        r0.sendEmptyMessage(r3);
        return r3;
    }

    private void setSelectedApnKey(java.lang.String r6) {
        r5 = this;
        r4 = 0;
        r5.mSelectedKey = r6;
        r0 = r5.getContentResolver();
        r1 = new android.content.ContentValues;
        r1.<init>();
        r2 = "apn_id";
        r3 = r5.mSelectedKey;
        r1.put(r2, r3);
        r2 = PREFERAPN_URI;
        r0.update(r2, r1, r4, r4);
        return;
    }

    protected void onCreate(android.os.Bundle r3) {
        r2 = this;
        super.onCreate(r3);
        r0 = 2131034116; // 0x7f050004 float:1.767874E38 double:1.052870747E-314;
        r2.addPreferencesFromResource(r0);
        r0 = r2.getListView();
        r1 = 1;
        r0.setItemsCanFocus(r1);
        r0 = new android.content.IntentFilter;
        r1 = "android.intent.action.ANY_DATA_STATE";
        r0.<init>(r1);
        r2.mMobileStateFilter = r0;
        return;
    }

    protected android.app.Dialog onCreateDialog(int r4) {
        r3 = this;
        r1 = 1001; // 0x3e9 float:1.403E-42 double:4.946E-321;
        if (r4 != r1) goto L_0x001c;
    L_0x0004:
        r0 = new android.app.ProgressDialog;
        r0.<init>(r3);
        r1 = r3.getResources();
        r2 = 2131428195; // 0x7f0b0363 float:1.8478028E38 double:1.0530654477E-314;
        r1 = r1.getString(r2);
        r0.setMessage(r1);
        r1 = 0;
        r0.setCancelable(r1);
    L_0x001b:
        return r0;
    L_0x001c:
        r0 = 0;
        goto L_0x001b;
    }

    public boolean onCreateOptionsMenu(android.view.Menu r6) {
        r5 = this;
        r4 = 1;
        r3 = 0;
        super.onCreateOptionsMenu(r6);
        r0 = r5.getResources();
        r1 = 2131428187; // 0x7f0b035b float:1.8478011E38 double:1.053065444E-314;
        r0 = r0.getString(r1);
        r0 = r6.add(r3, r4, r3, r0);
        r1 = 17301555; // 0x1080033 float:2.4979398E-38 double:8.548104E-317;
        r0 = r0.setIcon(r1);
        r0.setShowAsAction(r4);
        r0 = 2;
        r1 = r5.getResources();
        r2 = 2131428196; // 0x7f0b0364 float:1.847803E38 double:1.053065448E-314;
        r1 = r1.getString(r2);
        r0 = r6.add(r3, r0, r3, r1);
        r1 = 17301589; // 0x1080055 float:2.4979493E-38 double:8.5481207E-317;
        r0.setIcon(r1);
        return r4;
    }

    protected void onDestroy() {
        r1 = this;
        super.onDestroy();
        r0 = r1.mRestoreDefaultApnThread;
        if (r0 == 0) goto L_0x000c;
    L_0x0007:
        r0 = r1.mRestoreDefaultApnThread;
        r0.quit();
    L_0x000c:
        return;
    }

    public boolean onOptionsItemSelected(android.view.MenuItem r3) {
        r2 = this;
        r0 = 1;
        r1 = r3.getItemId();
        switch(r1) {
            case 1: goto L_0x000d;
            case 2: goto L_0x0011;
            default: goto L_0x0008;
        };
    L_0x0008:
        r0 = super.onOptionsItemSelected(r3);
    L_0x000c:
        return r0;
    L_0x000d:
        r2.addNewApn();
        goto L_0x000c;
    L_0x0011:
        r2.restoreDefaultApn();
        goto L_0x000c;
    }

    protected void onPause() {
        r1 = this;
        super.onPause();
        r0 = r1.mMobileStateReceiver;
        r1.unregisterReceiver(r0);
        return;
    }

    public boolean onPreferenceChange(android.preference.Preference r4, java.lang.Object r5) {
        r3 = this;
        r0 = "ApnSettings";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "onPreferenceChange(): Preference - ";
        r1 = r1.append(r2);
        r1 = r1.append(r4);
        r2 = ", newValue - ";
        r1 = r1.append(r2);
        r1 = r1.append(r5);
        r2 = ", newValue type - ";
        r1 = r1.append(r2);
        r2 = r5.getClass();
        r1 = r1.append(r2);
        r1 = r1.toString();
        android.util.Log.d(r0, r1);
        r0 = r5 instanceof java.lang.String;
        if (r0 == 0) goto L_0x0039;
    L_0x0034:
        r5 = (java.lang.String) r5;
        r3.setSelectedApnKey(r5);
    L_0x0039:
        r0 = 1;
        return r0;
    }

    public boolean onPreferenceTreeClick(android.preference.PreferenceScreen r6, android.preference.Preference r7) {
        r5 = this;
        r2 = r7.getKey();
        r0 = java.lang.Integer.parseInt(r2);
        r2 = android.provider.Telephony.Carriers.CONTENT_URI;
        r3 = (long) r0;
        r1 = android.content.ContentUris.withAppendedId(r2, r3);
        r2 = new android.content.Intent;
        r3 = "android.intent.action.EDIT";
        r2.<init>(r3, r1);
        r5.startActivity(r2);
        r2 = 1;
        return r2;
    }

    protected void onPrepareDialog(int r3, android.app.Dialog r4) {
        r2 = this;
        r0 = 1001; // 0x3e9 float:1.403E-42 double:4.946E-321;
        if (r3 != r0) goto L_0x000c;
    L_0x0004:
        r0 = r2.getPreferenceScreen();
        r1 = 0;
        r0.setEnabled(r1);
    L_0x000c:
        return;
    }

    protected void onResume() {
        r2 = this;
        super.onResume();
        r0 = r2.mMobileStateReceiver;
        r1 = r2.mMobileStateFilter;
        r2.registerReceiver(r0, r1);
        r0 = mRestoreDefaultApnMode;
        if (r0 != 0) goto L_0x0012;
    L_0x000e:
        r2.fillList();
    L_0x0011:
        return;
    L_0x0012:
        r0 = 1001; // 0x3e9 float:1.403E-42 double:4.946E-321;
        r2.showDialog(r0);
        goto L_0x0011;
    }
}