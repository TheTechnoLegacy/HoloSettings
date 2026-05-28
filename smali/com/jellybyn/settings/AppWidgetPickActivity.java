package com.jellybyn.settings;

public class AppWidgetPickActivity extends com.jellybyn.settings.ActivityPicker implements com.jellybyn.settings.AppWidgetLoader.ItemConstructor<com.jellybyn.settings.ActivityPicker.PickAdapter.Item> {
    private int mAppWidgetId;
    private com.jellybyn.settings.AppWidgetLoader<com.jellybyn.settings.ActivityPicker.PickAdapter.Item> mAppWidgetLoader;
    private android.appwidget.AppWidgetManager mAppWidgetManager;
    java.util.List<com.jellybyn.settings.ActivityPicker.PickAdapter.Item> mItems;
    private android.content.pm.PackageManager mPackageManager;

    public AppWidgetPickActivity() {
        r0 = this;
        r0.<init>();
        return;
    }

    public com.jellybyn.settings.ActivityPicker.PickAdapter.Item createItem(android.content.Context r12, android.appwidget.AppWidgetProviderInfo r13, android.os.Bundle r14) {
        r11 = this;
        r5 = r13.label;
        r2 = 0;
        r8 = r13.icon;
        if (r8 == 0) goto L_0x005a;
    L_0x0007:
        r7 = r12.getResources();	 Catch:{ NameNotFoundException -> 0x007d }
        r8 = r7.getDisplayMetrics();	 Catch:{ NameNotFoundException -> 0x007d }
        r0 = r8.densityDpi;	 Catch:{ NameNotFoundException -> 0x007d }
        switch(r0) {
            case 160: goto L_0x0072;
            case 213: goto L_0x0074;
            case 240: goto L_0x0076;
            case 320: goto L_0x0078;
            case 480: goto L_0x007a;
            default: goto L_0x0014;
        };	 Catch:{ NameNotFoundException -> 0x007d }
    L_0x0014:
        r8 = (float) r0;	 Catch:{ NameNotFoundException -> 0x007d }
        r9 = 1061158912; // 0x3f400000 float:0.75 double:5.24282163E-315;
        r8 = r8 * r9;
        r9 = 1056964608; // 0x3f000000 float:0.5 double:5.222099017E-315;
        r8 = r8 + r9;
        r3 = (int) r8;	 Catch:{ NameNotFoundException -> 0x007d }
        r8 = r11.mPackageManager;	 Catch:{ NameNotFoundException -> 0x007d }
        r9 = r13.provider;	 Catch:{ NameNotFoundException -> 0x007d }
        r9 = r9.getPackageName();	 Catch:{ NameNotFoundException -> 0x007d }
        r6 = r8.getResourcesForApplication(r9);	 Catch:{ NameNotFoundException -> 0x007d }
        r8 = r13.icon;	 Catch:{ NameNotFoundException -> 0x007d }
        r2 = r6.getDrawableForDensity(r8, r3);	 Catch:{ NameNotFoundException -> 0x007d }
    L_0x002e:
        if (r2 != 0) goto L_0x005a;
    L_0x0030:
        r8 = "AppWidgetPickActivity";
        r9 = new java.lang.StringBuilder;
        r9.<init>();
        r10 = "Can't load icon drawable 0x";
        r9 = r9.append(r10);
        r10 = r13.icon;
        r10 = java.lang.Integer.toHexString(r10);
        r9 = r9.append(r10);
        r10 = " for provider: ";
        r9 = r9.append(r10);
        r10 = r13.provider;
        r9 = r9.append(r10);
        r9 = r9.toString();
        android.util.Log.w(r8, r9);
    L_0x005a:
        r4 = new com.jellybyn.settings.ActivityPicker$PickAdapter$Item;
        r4.<init>(r12, r5, r2);
        r8 = r13.provider;
        r8 = r8.getPackageName();
        r4.packageName = r8;
        r8 = r13.provider;
        r8 = r8.getClassName();
        r4.className = r8;
        r4.extras = r14;
        return r4;
    L_0x0072:
        r3 = 120; // 0x78 float:1.68E-43 double:5.93E-322;
    L_0x0074:
        r3 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
    L_0x0076:
        r3 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
    L_0x0078:
        r3 = 240; // 0xf0 float:3.36E-43 double:1.186E-321;
    L_0x007a:
        r3 = 320; // 0x140 float:4.48E-43 double:1.58E-321;
        goto L_0x0014;
    L_0x007d:
        r1 = move-exception;
        r8 = "AppWidgetPickActivity";
        r9 = new java.lang.StringBuilder;
        r9.<init>();
        r10 = "Can't load icon drawable 0x";
        r9 = r9.append(r10);
        r10 = r13.icon;
        r10 = java.lang.Integer.toHexString(r10);
        r9 = r9.append(r10);
        r10 = " for provider: ";
        r9 = r9.append(r10);
        r10 = r13.provider;
        r9 = r9.append(r10);
        r9 = r9.toString();
        android.util.Log.w(r8, r9);
        goto L_0x002e;
    }

    public /* bridge */ /* synthetic */ com.jellybyn.settings.ActivityPicker.PickAdapter.Item createItem(android.content.Context r2, android.appwidget.AppWidgetProviderInfo r3, android.os.Bundle r4) {
        r1 = this;
        r0 = r1.createItem(r2, r3, r4);
        return r0;
    }

    protected java.util.List<com.jellybyn.settings.ActivityPicker.PickAdapter.Item> getItems() {
        r2 = this;
        r0 = r2.mAppWidgetLoader;
        r1 = r2.getIntent();
        r0 = r0.getItems(r1);
        r2.mItems = r0;
        r0 = r2.mItems;
        return r0;
    }

    public void onClick(android.content.DialogInterface r9, int r10) {
        r8 = this;
        r1 = r8.getIntentForPosition(r10);
        r5 = r8.mItems;
        r2 = r5.get(r10);
        r2 = (com.jellybyn.settings.ActivityPicker.PickAdapter.Item) r2;
        r5 = r2.extras;
        if (r5 == 0) goto L_0x0018;
    L_0x0010:
        r5 = -1;
        r8.setResultData(r5, r1);
    L_0x0014:
        r8.finish();
        return;
    L_0x0018:
        r3 = 0;
        r5 = r1.getExtras();	 Catch:{ IllegalArgumentException -> 0x003a }
        if (r5 == 0) goto L_0x0029;
    L_0x001f:
        r5 = r1.getExtras();	 Catch:{ IllegalArgumentException -> 0x003a }
        r6 = "appWidgetOptions";
        r3 = r5.getBundle(r6);	 Catch:{ IllegalArgumentException -> 0x003a }
    L_0x0029:
        r5 = r8.mAppWidgetManager;	 Catch:{ IllegalArgumentException -> 0x003a }
        r6 = r8.mAppWidgetId;	 Catch:{ IllegalArgumentException -> 0x003a }
        r7 = r1.getComponent();	 Catch:{ IllegalArgumentException -> 0x003a }
        r5.bindAppWidgetId(r6, r7, r3);	 Catch:{ IllegalArgumentException -> 0x003a }
        r4 = -1;
    L_0x0035:
        r5 = 0;
        r8.setResultData(r4, r5);
        goto L_0x0014;
    L_0x003a:
        r0 = move-exception;
        r4 = 0;
        goto L_0x0035;
    }

    public void onCreate(android.os.Bundle r5) {
        r4 = this;
        r3 = 0;
        r1 = r4.getPackageManager();
        r4.mPackageManager = r1;
        r1 = android.appwidget.AppWidgetManager.getInstance(r4);
        r4.mAppWidgetManager = r1;
        r1 = new com.jellybyn.settings.AppWidgetLoader;
        r2 = r4.mAppWidgetManager;
        r1.<init>(r4, r2, r4);
        r4.mAppWidgetLoader = r1;
        super.onCreate(r5);
        r1 = 0;
        r4.setResultData(r3, r1);
        r0 = r4.getIntent();
        r1 = "appWidgetId";
        r1 = r0.hasExtra(r1);
        if (r1 == 0) goto L_0x0032;
    L_0x0029:
        r1 = "appWidgetId";
        r1 = r0.getIntExtra(r1, r3);
        r4.mAppWidgetId = r1;
    L_0x0031:
        return;
    L_0x0032:
        r4.finish();
        goto L_0x0031;
    }

    void setResultData(int r4, android.content.Intent r5) {
        r3 = this;
        if (r5 == 0) goto L_0x000e;
    L_0x0002:
        r0 = r5;
    L_0x0003:
        r1 = "appWidgetId";
        r2 = r3.mAppWidgetId;
        r0.putExtra(r1, r2);
        r3.setResult(r4, r0);
        return;
    L_0x000e:
        r0 = new android.content.Intent;
        r0.<init>();
        goto L_0x0003;
    }
}