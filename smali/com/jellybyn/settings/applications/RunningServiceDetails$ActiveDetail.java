package com.jellybyn.settings.applications;

class RunningServiceDetails$ActiveDetail implements android.view.View.OnClickListener {
    com.jellybyn.settings.applications.RunningProcessesView.ActiveItem mActiveItem;
    android.content.ComponentName mInstaller;
    android.app.PendingIntent mManageIntent;
    android.widget.Button mReportButton;
    android.view.View mRootView;
    com.jellybyn.settings.applications.RunningState.ServiceItem mServiceItem;
    android.widget.Button mStopButton;
    com.jellybyn.settings.applications.RunningProcessesView.ViewHolder mViewHolder;
    final /* synthetic */ com.jellybyn.settings.applications.RunningServiceDetails this$0;

    RunningServiceDetails$ActiveDetail(com.jellybyn.settings.applications.RunningServiceDetails r1) {
        r0 = this;
        r0.this$0 = r1;
        r0.<init>();
        return;
    }

    public void onClick(android.view.View r20) {
        r19 = this;
        r0 = r19;
        r2 = r0.mReportButton;
        r0 = r20;
        if (r0 != r2) goto L_0x018d;
    L_0x0008:
        r17 = new android.app.ApplicationErrorReport;
        r17.<init>();
        r2 = 5;
        r0 = r17;
        r0.type = r2;
        r0 = r19;
        r2 = r0.mServiceItem;
        r2 = r2.mServiceInfo;
        r2 = r2.packageName;
        r0 = r17;
        r0.packageName = r2;
        r0 = r19;
        r2 = r0.mInstaller;
        r2 = r2.getPackageName();
        r0 = r17;
        r0.installerPackageName = r2;
        r0 = r19;
        r2 = r0.mServiceItem;
        r2 = r2.mRunningService;
        r2 = r2.process;
        r0 = r17;
        r0.processName = r2;
        r2 = java.lang.System.currentTimeMillis();
        r0 = r17;
        r0.time = r2;
        r0 = r19;
        r2 = r0.mServiceItem;
        r2 = r2.mServiceInfo;
        r2 = r2.applicationInfo;
        r2 = r2.flags;
        r2 = r2 & 1;
        if (r2 == 0) goto L_0x0128;
    L_0x004c:
        r2 = 1;
    L_0x004d:
        r0 = r17;
        r0.systemApp = r2;
        r12 = new android.app.ApplicationErrorReport$RunningServiceInfo;
        r12.<init>();
        r0 = r19;
        r2 = r0.mActiveItem;
        r2 = r2.mFirstRunTime;
        r4 = 0;
        r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r2 < 0) goto L_0x012b;
    L_0x0062:
        r2 = android.os.SystemClock.elapsedRealtime();
        r0 = r19;
        r4 = r0.mActiveItem;
        r4 = r4.mFirstRunTime;
        r2 = r2 - r4;
        r12.durationMillis = r2;
    L_0x006f:
        r9 = new android.content.ComponentName;
        r0 = r19;
        r2 = r0.mServiceItem;
        r2 = r2.mServiceInfo;
        r2 = r2.packageName;
        r0 = r19;
        r3 = r0.mServiceItem;
        r3 = r3.mServiceInfo;
        r3 = r3.name;
        r9.<init>(r2, r3);
        r0 = r19;
        r2 = r0.this$0;
        r2 = r2.getActivity();
        r3 = "service_dump.txt";
        r11 = r2.getFileStreamPath(r3);
        r15 = 0;
        r16 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x0135 }
        r0 = r16;
        r0.<init>(r11);	 Catch:{ IOException -> 0x0135 }
        r2 = "activity";
        r3 = r16.getFD();	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        r4 = 3;
        r4 = new java.lang.String[r4];	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        r5 = 0;
        r6 = "-a";
        r4[r5] = r6;	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        r5 = 1;
        r6 = "service";
        r4[r5] = r6;	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        r5 = 2;
        r6 = r9.flattenToString();	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        r4[r5] = r6;	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        android.os.Debug.dumpService(r2, r3, r4);	 Catch:{ IOException -> 0x0229, all -> 0x0224 }
        if (r16 == 0) goto L_0x0231;
    L_0x00b9:
        r16.close();	 Catch:{ IOException -> 0x0131 }
        r15 = r16;
    L_0x00be:
        r13 = 0;
        r14 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x0163 }
        r14.<init>(r11);	 Catch:{ IOException -> 0x0163 }
        r2 = r11.length();	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r2 = (int) r2;	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r8 = new byte[r2];	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r14.read(r8);	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r2 = new java.lang.String;	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r2.<init>(r8);	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        r12.serviceDetails = r2;	 Catch:{ IOException -> 0x0220, all -> 0x021c }
        if (r14 == 0) goto L_0x022e;
    L_0x00d7:
        r14.close();	 Catch:{ IOException -> 0x015f }
        r13 = r14;
    L_0x00db:
        r11.delete();
        r2 = "RunningServicesDetails";
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = "Details: ";
        r3 = r3.append(r4);
        r4 = r12.serviceDetails;
        r3 = r3.append(r4);
        r3 = r3.toString();
        android.util.Log.i(r2, r3);
        r0 = r17;
        r0.runningServiceInfo = r12;
        r18 = new android.content.Intent;
        r2 = "android.intent.action.APP_ERROR";
        r0 = r18;
        r0.<init>(r2);
        r0 = r19;
        r2 = r0.mInstaller;
        r0 = r18;
        r0.setComponent(r2);
        r2 = "android.intent.extra.BUG_REPORT";
        r0 = r18;
        r1 = r17;
        r0.putExtra(r2, r1);
        r2 = 268435456; // 0x10000000 float:2.524355E-29 double:1.32624737E-315;
        r0 = r18;
        r0.addFlags(r2);
        r0 = r19;
        r2 = r0.this$0;
        r0 = r18;
        r2.startActivity(r0);
    L_0x0127:
        return;
    L_0x0128:
        r2 = 0;
        goto L_0x004d;
    L_0x012b:
        r2 = -1;
        r12.durationMillis = r2;
        goto L_0x006f;
    L_0x0131:
        r2 = move-exception;
        r15 = r16;
        goto L_0x00be;
    L_0x0135:
        r10 = move-exception;
    L_0x0136:
        r2 = "RunningServicesDetails";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0158 }
        r3.<init>();	 Catch:{ all -> 0x0158 }
        r4 = "Can't dump service: ";
        r3 = r3.append(r4);	 Catch:{ all -> 0x0158 }
        r3 = r3.append(r9);	 Catch:{ all -> 0x0158 }
        r3 = r3.toString();	 Catch:{ all -> 0x0158 }
        android.util.Log.w(r2, r3, r10);	 Catch:{ all -> 0x0158 }
        if (r15 == 0) goto L_0x00be;
    L_0x0150:
        r15.close();	 Catch:{ IOException -> 0x0155 }
        goto L_0x00be;
    L_0x0155:
        r2 = move-exception;
        goto L_0x00be;
    L_0x0158:
        r2 = move-exception;
    L_0x0159:
        if (r15 == 0) goto L_0x015e;
    L_0x015b:
        r15.close();	 Catch:{ IOException -> 0x0216 }
    L_0x015e:
        throw r2;
    L_0x015f:
        r2 = move-exception;
        r13 = r14;
        goto L_0x00db;
    L_0x0163:
        r10 = move-exception;
    L_0x0164:
        r2 = "RunningServicesDetails";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0186 }
        r3.<init>();	 Catch:{ all -> 0x0186 }
        r4 = "Can't read service dump: ";
        r3 = r3.append(r4);	 Catch:{ all -> 0x0186 }
        r3 = r3.append(r9);	 Catch:{ all -> 0x0186 }
        r3 = r3.toString();	 Catch:{ all -> 0x0186 }
        android.util.Log.w(r2, r3, r10);	 Catch:{ all -> 0x0186 }
        if (r13 == 0) goto L_0x00db;
    L_0x017e:
        r13.close();	 Catch:{ IOException -> 0x0183 }
        goto L_0x00db;
    L_0x0183:
        r2 = move-exception;
        goto L_0x00db;
    L_0x0186:
        r2 = move-exception;
    L_0x0187:
        if (r13 == 0) goto L_0x018c;
    L_0x0189:
        r13.close();	 Catch:{ IOException -> 0x0219 }
    L_0x018c:
        throw r2;
    L_0x018d:
        r0 = r19;
        r2 = r0.mManageIntent;
        if (r2 == 0) goto L_0x01c6;
    L_0x0193:
        r0 = r19;
        r2 = r0.this$0;	 Catch:{ SendIntentException -> 0x01ae, IllegalArgumentException -> 0x01b6, ActivityNotFoundException -> 0x01be }
        r2 = r2.getActivity();	 Catch:{ SendIntentException -> 0x01ae, IllegalArgumentException -> 0x01b6, ActivityNotFoundException -> 0x01be }
        r0 = r19;
        r3 = r0.mManageIntent;	 Catch:{ SendIntentException -> 0x01ae, IllegalArgumentException -> 0x01b6, ActivityNotFoundException -> 0x01be }
        r3 = r3.getIntentSender();	 Catch:{ SendIntentException -> 0x01ae, IllegalArgumentException -> 0x01b6, ActivityNotFoundException -> 0x01be }
        r4 = 0;
        r5 = 268959744; // 0x10080000 float:2.682127E-29 double:1.328837696E-315;
        r6 = 524288; // 0x80000 float:7.34684E-40 double:2.590327E-318;
        r7 = 0;
        r2.startIntentSender(r3, r4, r5, r6, r7);	 Catch:{ SendIntentException -> 0x01ae, IllegalArgumentException -> 0x01b6, ActivityNotFoundException -> 0x01be }
        goto L_0x0127;
    L_0x01ae:
        r10 = move-exception;
        r2 = "RunningServicesDetails";
        android.util.Log.w(r2, r10);
        goto L_0x0127;
    L_0x01b6:
        r10 = move-exception;
        r2 = "RunningServicesDetails";
        android.util.Log.w(r2, r10);
        goto L_0x0127;
    L_0x01be:
        r10 = move-exception;
        r2 = "RunningServicesDetails";
        android.util.Log.w(r2, r10);
        goto L_0x0127;
    L_0x01c6:
        r0 = r19;
        r2 = r0.mServiceItem;
        if (r2 == 0) goto L_0x01d4;
    L_0x01cc:
        r2 = 0;
        r0 = r19;
        r0.stopActiveService(r2);
        goto L_0x0127;
    L_0x01d4:
        r0 = r19;
        r2 = r0.mActiveItem;
        r2 = r2.mItem;
        r2 = r2.mBackground;
        if (r2 == 0) goto L_0x01fa;
    L_0x01de:
        r0 = r19;
        r2 = r0.this$0;
        r2 = r2.mAm;
        r0 = r19;
        r3 = r0.mActiveItem;
        r3 = r3.mItem;
        r3 = r3.mPackageInfo;
        r3 = r3.packageName;
        r2.killBackgroundProcesses(r3);
        r0 = r19;
        r2 = r0.this$0;
        com.jellybyn.settings.applications.RunningServiceDetails.access$100(r2);
        goto L_0x0127;
    L_0x01fa:
        r0 = r19;
        r2 = r0.this$0;
        r2 = r2.mAm;
        r0 = r19;
        r3 = r0.mActiveItem;
        r3 = r3.mItem;
        r3 = r3.mPackageInfo;
        r3 = r3.packageName;
        r2.forceStopPackage(r3);
        r0 = r19;
        r2 = r0.this$0;
        com.jellybyn.settings.applications.RunningServiceDetails.access$100(r2);
        goto L_0x0127;
    L_0x0216:
        r3 = move-exception;
        goto L_0x015e;
    L_0x0219:
        r3 = move-exception;
        goto L_0x018c;
    L_0x021c:
        r2 = move-exception;
        r13 = r14;
        goto L_0x0187;
    L_0x0220:
        r10 = move-exception;
        r13 = r14;
        goto L_0x0164;
    L_0x0224:
        r2 = move-exception;
        r15 = r16;
        goto L_0x0159;
    L_0x0229:
        r10 = move-exception;
        r15 = r16;
        goto L_0x0136;
    L_0x022e:
        r13 = r14;
        goto L_0x00db;
    L_0x0231:
        r15 = r16;
        goto L_0x00be;
    }

    void stopActiveService(boolean r5) {
        r4 = this;
        r0 = r4.mServiceItem;
        if (r5 != 0) goto L_0x0018;
    L_0x0004:
        r1 = r0.mServiceInfo;
        r1 = r1.applicationInfo;
        r1 = r1.flags;
        r1 = r1 & 1;
        if (r1 == 0) goto L_0x0018;
    L_0x000e:
        r1 = r4.this$0;
        r2 = r0.mRunningService;
        r2 = r2.service;
        com.jellybyn.settings.applications.RunningServiceDetails.access$000(r1, r2);
    L_0x0017:
        return;
    L_0x0018:
        r1 = r4.this$0;
        r1 = r1.getActivity();
        r2 = new android.content.Intent;
        r2.<init>();
        r3 = r0.mRunningService;
        r3 = r3.service;
        r2 = r2.setComponent(r3);
        r1.stopService(r2);
        r1 = r4.this$0;
        r1 = r1.mMergedItem;
        if (r1 != 0) goto L_0x0041;
    L_0x0034:
        r1 = r4.this$0;
        r1 = r1.mState;
        r1.updateNow();
        r1 = r4.this$0;
        com.jellybyn.settings.applications.RunningServiceDetails.access$100(r1);
        goto L_0x0017;
    L_0x0041:
        r1 = r4.this$0;
        r1 = r1.mShowBackground;
        if (r1 != 0) goto L_0x0061;
    L_0x0047:
        r1 = r4.this$0;
        r1 = r1.mMergedItem;
        r1 = r1.mServices;
        r1 = r1.size();
        r2 = 1;
        if (r1 > r2) goto L_0x0061;
    L_0x0054:
        r1 = r4.this$0;
        r1 = r1.mState;
        r1.updateNow();
        r1 = r4.this$0;
        com.jellybyn.settings.applications.RunningServiceDetails.access$100(r1);
        goto L_0x0017;
    L_0x0061:
        r1 = r4.this$0;
        r1 = r1.mState;
        r1.updateNow();
        goto L_0x0017;
    }
}