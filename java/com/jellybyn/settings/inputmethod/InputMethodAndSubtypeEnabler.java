package com.jellybyn.settings.inputmethod;

public class InputMethodAndSubtypeEnabler extends com.jellybyn.settings.SettingsPreferenceFragment {
    private static final java.lang.String TAG = null;
    private java.text.Collator mCollator;
    private android.app.AlertDialog mDialog;
    private boolean mHaveHardKeyboard;
    private android.view.inputmethod.InputMethodManager mImm;
    private final java.util.HashMap<java.lang.String, java.util.List<android.preference.Preference>> mInputMethodAndSubtypePrefsMap;
    private java.lang.String mInputMethodId;
    private java.util.List<android.view.inputmethod.InputMethodInfo> mInputMethodProperties;
    private final java.util.HashMap<java.lang.String, android.preference.CheckBoxPreference> mSubtypeAutoSelectionCBMap;
    private java.lang.String mSystemLocale;
    private java.lang.String mTitle;

    static {
        r0 = com.jellybyn.settings.inputmethod.InputMethodAndSubtypeEnabler.class;
        r0 = r0.getSimpleName();
        TAG = r0;
        return;
    }

    public InputMethodAndSubtypeEnabler() {
        r1 = this;
        r1.<init>();
        r0 = 0;
        r1.mDialog = r0;
        r0 = new java.util.HashMap;
        r0.<init>();
        r1.mInputMethodAndSubtypePrefsMap = r0;
        r0 = new java.util.HashMap;
        r0.<init>();
        r1.mSubtypeAutoSelectionCBMap = r0;
        r0 = "";
        r1.mSystemLocale = r0;
        r0 = java.text.Collator.getInstance();
        r1.mCollator = r0;
        return;
    }

    static /* synthetic */ java.util.List access$000(com.jellybyn.settings.inputmethod.InputMethodAndSubtypeEnabler r1) {
        r0 = r1.mInputMethodProperties;
        return r0;
    }

    static /* synthetic */ java.lang.String access$100() {
        r0 = TAG;
        return r0;
    }

    private void clearImplicitlyEnabledSubtypes(java.lang.String r2) {
        r1 = this;
        r0 = 0;
        r1.updateImplicitlyEnabledSubtypes(r2, r0);
        return;
    }

    private android.preference.PreferenceScreen createPreferenceHierarchy() {
        r25 = this;
        r22 = r25.getPreferenceManager();
        r23 = r25.getActivity();
        r17 = r22.createPreferenceScreen(r23);
        r8 = r25.getActivity();
        r0 = r25;
        r0 = r0.mInputMethodProperties;
        r22 = r0;
        if (r22 != 0) goto L_0x0039;
    L_0x0018:
        r3 = 0;
    L_0x0019:
        r9 = 0;
    L_0x001a:
        if (r9 >= r3) goto L_0x016b;
    L_0x001c:
        r0 = r25;
        r0 = r0.mInputMethodProperties;
        r22 = r0;
        r0 = r22;
        r10 = r0.get(r9);
        r10 = (android.view.inputmethod.InputMethodInfo) r10;
        r19 = r10.getSubtypeCount();
        r22 = 1;
        r0 = r19;
        r1 = r22;
        if (r0 > r1) goto L_0x0044;
    L_0x0036:
        r9 = r9 + 1;
        goto L_0x001a;
    L_0x0039:
        r0 = r25;
        r0 = r0.mInputMethodProperties;
        r22 = r0;
        r3 = r22.size();
        goto L_0x0019;
    L_0x0044:
        r11 = r10.getId();
        r0 = r25;
        r0 = r0.mInputMethodId;
        r22 = r0;
        r22 = android.text.TextUtils.isEmpty(r22);
        if (r22 != 0) goto L_0x0062;
    L_0x0054:
        r0 = r25;
        r0 = r0.mInputMethodId;
        r22 = r0;
        r0 = r22;
        r22 = r0.equals(r11);
        if (r22 == 0) goto L_0x0036;
    L_0x0062:
        r14 = new android.preference.PreferenceCategory;
        r14.<init>(r8);
        r0 = r17;
        r0.addPreference(r14);
        r16 = r25.getPackageManager();
        r0 = r16;
        r15 = r10.loadLabel(r0);
        r14.setTitle(r15);
        r14.setKey(r11);
        r5 = new android.preference.CheckBoxPreference;
        r5.<init>(r8);
        r0 = r25;
        r0 = r0.mSubtypeAutoSelectionCBMap;
        r22 = r0;
        r0 = r22;
        r0.put(r11, r5);
        r14.addPreference(r5);
        r4 = new android.preference.PreferenceCategory;
        r4.<init>(r8);
        r22 = 2131428543; // 0x7f0b04bf float:1.8478733E38 double:1.0530656197E-314;
        r0 = r22;
        r4.setTitle(r0);
        r0 = r17;
        r0.addPreference(r4);
        r12 = 0;
        r6 = 0;
        r21 = new java.util.ArrayList;
        r21.<init>();
        if (r19 <= 0) goto L_0x0144;
    L_0x00aa:
        r13 = 0;
    L_0x00ab:
        r0 = r19;
        if (r13 >= r0) goto L_0x011b;
    L_0x00af:
        r18 = r10.getSubtypeAt(r13);
        r22 = r10.getPackageName();
        r23 = r10.getServiceInfo();
        r0 = r23;
        r0 = r0.applicationInfo;
        r23 = r0;
        r0 = r18;
        r1 = r22;
        r2 = r23;
        r20 = r0.getDisplayName(r8, r1, r2);
        r22 = r18.overridesImplicitlyEnabledSubtype();
        if (r22 == 0) goto L_0x00d9;
    L_0x00d1:
        if (r12 != 0) goto L_0x00d6;
    L_0x00d3:
        r12 = 1;
        r6 = r20;
    L_0x00d6:
        r13 = r13 + 1;
        goto L_0x00ab;
    L_0x00d9:
        r7 = new com.jellybyn.settings.inputmethod.InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
        r22 = r18.getLocale();
        r0 = r25;
        r0 = r0.mSystemLocale;
        r23 = r0;
        r0 = r25;
        r0 = r0.mCollator;
        r24 = r0;
        r0 = r22;
        r1 = r23;
        r2 = r24;
        r7.<init>(r8, r0, r1, r2);
        r22 = new java.lang.StringBuilder;
        r22.<init>();
        r0 = r22;
        r22 = r0.append(r11);
        r23 = r18.hashCode();
        r22 = r22.append(r23);
        r22 = r22.toString();
        r0 = r22;
        r7.setKey(r0);
        r0 = r20;
        r7.setTitle(r0);
        r0 = r21;
        r0.add(r7);
        goto L_0x00d6;
    L_0x011b:
        java.util.Collections.sort(r21);
        r13 = 0;
    L_0x011f:
        r22 = r21.size();
        r0 = r22;
        if (r13 >= r0) goto L_0x0137;
    L_0x0127:
        r0 = r21;
        r22 = r0.get(r13);
        r22 = (android.preference.Preference) r22;
        r0 = r22;
        r4.addPreference(r0);
        r13 = r13 + 1;
        goto L_0x011f;
    L_0x0137:
        r0 = r25;
        r0 = r0.mInputMethodAndSubtypePrefsMap;
        r22 = r0;
        r0 = r22;
        r1 = r21;
        r0.put(r11, r1);
    L_0x0144:
        if (r12 == 0) goto L_0x0161;
    L_0x0146:
        r22 = android.text.TextUtils.isEmpty(r6);
        if (r22 == 0) goto L_0x015c;
    L_0x014c:
        r22 = TAG;
        r23 = "Title for auto subtype is empty.";
        android.util.Log.w(r22, r23);
        r22 = "---";
        r0 = r22;
        r5.setTitle(r0);
        goto L_0x0036;
    L_0x015c:
        r5.setTitle(r6);
        goto L_0x0036;
    L_0x0161:
        r22 = 2131428544; // 0x7f0b04c0 float:1.8478735E38 double:1.05306562E-314;
        r0 = r22;
        r5.setTitle(r0);
        goto L_0x0036;
    L_0x016b:
        return r17;
    }

    private boolean isNoSubtypesExplicitlySelected(java.lang.String r6) {
        r5 = this;
        r0 = 1;
        r4 = r5.mInputMethodAndSubtypePrefsMap;
        r3 = r4.get(r6);
        r3 = (java.util.List) r3;
        r1 = r3.iterator();
    L_0x000d:
        r4 = r1.hasNext();
        if (r4 == 0) goto L_0x0026;
    L_0x0013:
        r2 = r1.next();
        r2 = (android.preference.Preference) r2;
        r4 = r2 instanceof android.preference.CheckBoxPreference;
        if (r4 == 0) goto L_0x000d;
    L_0x001d:
        r2 = (android.preference.CheckBoxPreference) r2;
        r4 = r2.isChecked();
        if (r4 == 0) goto L_0x000d;
    L_0x0025:
        r0 = 0;
    L_0x0026:
        return r0;
    }

    private void onCreateIMM() {
        r2 = this;
        r1 = "input_method";
        r0 = r2.getSystemService(r1);
        r0 = (android.view.inputmethod.InputMethodManager) r0;
        r1 = r0.getInputMethodList();
        r2.mInputMethodProperties = r1;
        return;
    }

    private void setCheckedImplicitlyEnabledSubtypes(java.lang.String r2) {
        r1 = this;
        r0 = 1;
        r1.updateImplicitlyEnabledSubtypes(r2, r0);
        return;
    }

    private void setSubtypeAutoSelectionEnabled(java.lang.String r8, boolean r9) {
        r7 = this;
        r5 = 0;
        r4 = r7.mSubtypeAutoSelectionCBMap;
        r0 = r4.get(r8);
        r0 = (android.preference.CheckBoxPreference) r0;
        if (r0 != 0) goto L_0x000c;
    L_0x000b:
        return;
    L_0x000c:
        r0.setChecked(r9);
        r4 = r7.mInputMethodAndSubtypePrefsMap;
        r3 = r4.get(r8);
        r3 = (java.util.List) r3;
        r1 = r3.iterator();
    L_0x001b:
        r4 = r1.hasNext();
        if (r4 == 0) goto L_0x003b;
    L_0x0021:
        r2 = r1.next();
        r2 = (android.preference.Preference) r2;
        r4 = r2 instanceof android.preference.CheckBoxPreference;
        if (r4 == 0) goto L_0x001b;
    L_0x002b:
        if (r9 != 0) goto L_0x0039;
    L_0x002d:
        r4 = 1;
    L_0x002e:
        r2.setEnabled(r4);
        if (r9 == 0) goto L_0x001b;
    L_0x0033:
        r2 = (android.preference.CheckBoxPreference) r2;
        r2.setChecked(r5);
        goto L_0x001b;
    L_0x0039:
        r4 = r5;
        goto L_0x002e;
    L_0x003b:
        if (r9 == 0) goto L_0x000b;
    L_0x003d:
        r4 = r7.getContentResolver();
        r5 = r7.mInputMethodProperties;
        r6 = r7.mHaveHardKeyboard;
        com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(r7, r4, r5, r6);
        r7.setCheckedImplicitlyEnabledSubtypes(r8);
        goto L_0x000b;
    }

    private void updateAutoSelectionCB() {
        r3 = this;
        r2 = r3.mInputMethodAndSubtypePrefsMap;
        r2 = r2.keySet();
        r0 = r2.iterator();
    L_0x000a:
        r2 = r0.hasNext();
        if (r2 == 0) goto L_0x001e;
    L_0x0010:
        r1 = r0.next();
        r1 = (java.lang.String) r1;
        r2 = r3.isNoSubtypesExplicitlySelected(r1);
        r3.setSubtypeAutoSelectionEnabled(r1, r2);
        goto L_0x000a;
    L_0x001e:
        r2 = 0;
        r3.setCheckedImplicitlyEnabledSubtypes(r2);
        return;
    }

    private void updateImplicitlyEnabledSubtypes(java.lang.String r15, boolean r16) {
        r14 = this;
        r12 = r14.mInputMethodProperties;
        r2 = r12.iterator();
    L_0x0006:
        r12 = r2.hasNext();
        if (r12 == 0) goto L_0x0092;
    L_0x000c:
        r5 = r2.next();
        r5 = (android.view.inputmethod.InputMethodInfo) r5;
        r6 = r5.getId();
        if (r15 == 0) goto L_0x001e;
    L_0x0018:
        r12 = r15.equals(r6);
        if (r12 == 0) goto L_0x0006;
    L_0x001e:
        r12 = r14.mSubtypeAutoSelectionCBMap;
        r0 = r12.get(r6);
        r0 = (android.preference.CheckBoxPreference) r0;
        if (r0 == 0) goto L_0x0006;
    L_0x0028:
        r12 = r0.isChecked();
        if (r12 == 0) goto L_0x0006;
    L_0x002e:
        r12 = r14.mInputMethodAndSubtypePrefsMap;
        r11 = r12.get(r6);
        r11 = (java.util.List) r11;
        r12 = r14.mImm;
        r13 = 1;
        r8 = r12.getEnabledInputMethodSubtypeList(r5, r13);
        if (r11 == 0) goto L_0x0006;
    L_0x003f:
        if (r8 == 0) goto L_0x0006;
    L_0x0041:
        r3 = r11.iterator();
    L_0x0045:
        r12 = r3.hasNext();
        if (r12 == 0) goto L_0x0006;
    L_0x004b:
        r10 = r3.next();
        r10 = (android.preference.Preference) r10;
        r12 = r10 instanceof android.preference.CheckBoxPreference;
        if (r12 == 0) goto L_0x0045;
    L_0x0055:
        r1 = r10;
        r1 = (android.preference.CheckBoxPreference) r1;
        r12 = 0;
        r1.setChecked(r12);
        if (r16 == 0) goto L_0x0045;
    L_0x005e:
        r4 = r8.iterator();
    L_0x0062:
        r12 = r4.hasNext();
        if (r12 == 0) goto L_0x0045;
    L_0x0068:
        r9 = r4.next();
        r9 = (android.view.inputmethod.InputMethodSubtype) r9;
        r12 = new java.lang.StringBuilder;
        r12.<init>();
        r12 = r12.append(r6);
        r13 = r9.hashCode();
        r12 = r12.append(r13);
        r7 = r12.toString();
        r12 = r1.getKey();
        r12 = r12.equals(r7);
        if (r12 == 0) goto L_0x0062;
    L_0x008d:
        r12 = 1;
        r1.setChecked(r12);
        goto L_0x0045;
    L_0x0092:
        return;
    }

    public void onActivityCreated(android.os.Bundle r3) {
        r2 = this;
        super.onActivityCreated(r3);
        r0 = r2.mTitle;
        r0 = android.text.TextUtils.isEmpty(r0);
        if (r0 != 0) goto L_0x0014;
    L_0x000b:
        r0 = r2.getActivity();
        r1 = r2.mTitle;
        r0.setTitle(r1);
    L_0x0014:
        return;
    }

    public void onCreate(android.os.Bundle r8) {
        r7 = this;
        super.onCreate(r8);
        r5 = "input_method";
        r5 = r7.getSystemService(r5);
        r5 = (android.view.inputmethod.InputMethodManager) r5;
        r7.mImm = r5;
        r5 = r7.getResources();
        r1 = r5.getConfiguration();
        r5 = r1.keyboard;
        r6 = 2;
        if (r5 != r6) goto L_0x007a;
    L_0x001a:
        r5 = 1;
    L_0x001b:
        r7.mHaveHardKeyboard = r5;
        r0 = r7.getArguments();
        r5 = r7.getActivity();
        r5 = r5.getIntent();
        r6 = "input_method_id";
        r5 = r5.getStringExtra(r6);
        r7.mInputMethodId = r5;
        r5 = r7.mInputMethodId;
        if (r5 != 0) goto L_0x0041;
    L_0x0035:
        if (r0 == 0) goto L_0x0041;
    L_0x0037:
        r5 = "input_method_id";
        r2 = r0.getString(r5);
        if (r2 == 0) goto L_0x0041;
    L_0x003f:
        r7.mInputMethodId = r2;
    L_0x0041:
        r5 = r7.getActivity();
        r5 = r5.getIntent();
        r6 = "android.intent.extra.TITLE";
        r5 = r5.getStringExtra(r6);
        r7.mTitle = r5;
        r5 = r7.mTitle;
        if (r5 != 0) goto L_0x0061;
    L_0x0055:
        if (r0 == 0) goto L_0x0061;
    L_0x0057:
        r5 = "android.intent.extra.TITLE";
        r4 = r0.getString(r5);
        if (r4 == 0) goto L_0x0061;
    L_0x005f:
        r7.mTitle = r4;
    L_0x0061:
        r3 = r1.locale;
        r5 = r3.toString();
        r7.mSystemLocale = r5;
        r5 = java.text.Collator.getInstance(r3);
        r7.mCollator = r5;
        r7.onCreateIMM();
        r5 = r7.createPreferenceHierarchy();
        r7.setPreferenceScreen(r5);
        return;
    L_0x007a:
        r5 = 0;
        goto L_0x001b;
    }

    public void onDestroy() {
        r1 = this;
        super.onDestroy();
        r0 = r1.mDialog;
        if (r0 == 0) goto L_0x000f;
    L_0x0007:
        r0 = r1.mDialog;
        r0.dismiss();
        r0 = 0;
        r1.mDialog = r0;
    L_0x000f:
        return;
    }

    public void onPause() {
        r3 = this;
        super.onPause();
        r0 = 0;
        r3.clearImplicitlyEnabledSubtypes(r0);
        r0 = r3.getContentResolver();
        r1 = r3.mInputMethodProperties;
        r2 = r3.mHaveHardKeyboard;
        com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.saveInputMethodSubtypeList(r3, r0, r1, r2);
        return;
    }

    public boolean onPreferenceTreeClick(android.preference.PreferenceScreen r17, android.preference.Preference r18) {
        r16 = this;
        r0 = r18;
        r9 = r0 instanceof android.preference.CheckBoxPreference;
        if (r9 == 0) goto L_0x00fa;
    L_0x0006:
        r2 = r18;
        r2 = (android.preference.CheckBoxPreference) r2;
        r0 = r16;
        r9 = r0.mSubtypeAutoSelectionCBMap;
        r9 = r9.keySet();
        r4 = r9.iterator();
    L_0x0016:
        r9 = r4.hasNext();
        if (r9 == 0) goto L_0x003a;
    L_0x001c:
        r7 = r4.next();
        r7 = (java.lang.String) r7;
        r0 = r16;
        r9 = r0.mSubtypeAutoSelectionCBMap;
        r9 = r9.get(r7);
        if (r9 != r2) goto L_0x0016;
    L_0x002c:
        r9 = r2.isChecked();
        r0 = r16;
        r0.setSubtypeAutoSelectionEnabled(r7, r9);
        r9 = super.onPreferenceTreeClick(r17, r18);
    L_0x0039:
        return r9;
    L_0x003a:
        r5 = r2.getKey();
        r9 = r2.isChecked();
        if (r9 == 0) goto L_0x0112;
    L_0x0044:
        r8 = 0;
        r0 = r16;
        r9 = r0.mInputMethodProperties;
        r1 = r9.size();
        r3 = 0;
    L_0x004e:
        if (r3 >= r1) goto L_0x007d;
    L_0x0050:
        r0 = r16;
        r9 = r0.mInputMethodProperties;
        r6 = r9.get(r3);
        r6 = (android.view.inputmethod.InputMethodInfo) r6;
        r9 = r6.getId();
        r9 = r5.equals(r9);
        if (r9 == 0) goto L_0x007a;
    L_0x0064:
        r8 = r6;
        r9 = com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.isSystemIme(r6);
        if (r9 == 0) goto L_0x007d;
    L_0x006b:
        r0 = r16;
        r9 = r0.mInputMethodProperties;
        r10 = 1;
        r0 = r16;
        com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(r0, r9, r5, r10);
        r9 = super.onPreferenceTreeClick(r17, r18);
        goto L_0x0039;
    L_0x007a:
        r3 = r3 + 1;
        goto L_0x004e;
    L_0x007d:
        if (r8 != 0) goto L_0x0084;
    L_0x007f:
        r9 = super.onPreferenceTreeClick(r17, r18);
        goto L_0x0039;
    L_0x0084:
        r9 = 0;
        r2.setChecked(r9);
        r0 = r16;
        r9 = r0.mDialog;
        if (r9 != 0) goto L_0x0100;
    L_0x008e:
        r9 = new android.app.AlertDialog$Builder;
        r10 = r16.getActivity();
        r9.<init>(r10);
        r10 = 17039380; // 0x1040014 float:2.4244627E-38 double:8.4185723E-317;
        r9 = r9.setTitle(r10);
        r10 = 16843605; // 0x1010355 float:2.369595E-38 double:8.3218466E-317;
        r9 = r9.setIconAttribute(r10);
        r10 = 1;
        r9 = r9.setCancelable(r10);
        r10 = 17039370; // 0x104000a float:2.42446E-38 double:8.4185673E-317;
        r11 = new com.jellybyn.settings.inputmethod.InputMethodAndSubtypeEnabler$2;
        r0 = r16;
        r11.<init>(r0, r2, r5);
        r9 = r9.setPositiveButton(r10, r11);
        r10 = 17039360; // 0x1040000 float:2.424457E-38 double:8.4185624E-317;
        r11 = new com.jellybyn.settings.inputmethod.InputMethodAndSubtypeEnabler$1;
        r0 = r16;
        r11.<init>(r0);
        r9 = r9.setNegativeButton(r10, r11);
        r9 = r9.create();
        r0 = r16;
        r0.mDialog = r9;
    L_0x00cd:
        r0 = r16;
        r9 = r0.mDialog;
        r10 = r16.getResources();
        r11 = 2131428482; // 0x7f0b0482 float:1.847861E38 double:1.0530655895E-314;
        r12 = 1;
        r12 = new java.lang.Object[r12];
        r13 = 0;
        r14 = r8.getServiceInfo();
        r14 = r14.applicationInfo;
        r15 = r16.getPackageManager();
        r14 = r14.loadLabel(r15);
        r12[r13] = r14;
        r10 = r10.getString(r11, r12);
        r9.setMessage(r10);
        r0 = r16;
        r9 = r0.mDialog;
        r9.show();
    L_0x00fa:
        r9 = super.onPreferenceTreeClick(r17, r18);
        goto L_0x0039;
    L_0x0100:
        r0 = r16;
        r9 = r0.mDialog;
        r9 = r9.isShowing();
        if (r9 == 0) goto L_0x00cd;
    L_0x010a:
        r0 = r16;
        r9 = r0.mDialog;
        r9.dismiss();
        goto L_0x00cd;
    L_0x0112:
        r0 = r16;
        r9 = r0.mInputMethodProperties;
        r10 = 0;
        r0 = r16;
        com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.setSubtypesPreferenceEnabled(r0, r9, r5, r10);
        r16.updateAutoSelectionCB();
        goto L_0x00fa;
    }

    public void onResume() {
        r3 = this;
        super.onResume();
        r0 = r3.getContentResolver();
        r1 = r3.mInputMethodProperties;
        r2 = r3.mInputMethodAndSubtypePrefsMap;
        com.jellybyn.settings.inputmethod.InputMethodAndSubtypeUtil.loadInputMethodSubtypeList(r3, r0, r1, r2);
        r3.updateAutoSelectionCB();
        return;
    }
}