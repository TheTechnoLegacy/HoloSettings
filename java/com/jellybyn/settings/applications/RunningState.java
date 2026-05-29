package com.jellybyn.settings.applications;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningServiceInfo;
import android.app.ActivityManagerNative;
import android.content.Context;
import android.content.pm.PackageItemInfo;
import android.content.pm.PackageManager;
import android.content.pm.UserInfo;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import android.os.UserHandle;
import android.os.UserManager;
import android.util.Log;
import android.util.SparseArray;
import com.jellybyn.settings.users.UserUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RunningState {
    static Object sGlobalLock = new Object();
    static RunningState sInstance;
    final ArrayList<ProcessItem> mAllProcessItems = new ArrayList();
    final ActivityManager mAm;
    final Context mApplicationContext;
    final Comparator<MergedItem> mBackgroundComparator = new ServiceProcessComparator(this);
    final BackgroundHandler mBackgroundHandler;
    ArrayList<MergedItem> mBackgroundItems = new ArrayList();
    long mBackgroundProcessMemory;
    final HandlerThread mBackgroundThread;
    long mForegroundProcessMemory;
    final Handler mHandler = new ServiceProcessComparator(this);
    boolean mHaveData;
    final InterestingConfigChanges mInterestingConfigChanges = new InterestingConfigChanges();
    final ArrayList<ProcessItem> mInterestingProcesses = new ArrayList();
    ArrayList<BaseItem> mItems = new ArrayList();
    final Object mLock = new Object();
    ArrayList<MergedItem> mMergedItems = new ArrayList();
    final int mMyUserId;
    int mNumBackgroundProcesses;
    int mNumForegroundProcesses;
    int mNumServiceProcesses;
    final SparseArray<MergedItem> mOtherUserBackgroundItems = new SparseArray();
    final SparseArray<MergedItem> mOtherUserMergedItems = new SparseArray();
    final PackageManager mPm;
    final ArrayList<ProcessItem> mProcessItems = new ArrayList();
    OnRefreshUiListener mRefreshUiListener;
    boolean mResumed;
    final SparseArray<ProcessItem> mRunningProcesses = new SparseArray();
    int mSequence = 0;
    final ServiceProcessComparator mServiceProcessComparator = new ServiceProcessComparator(this);
    long mServiceProcessMemory;
    final SparseArray<HashMap<String, ProcessItem>> mServiceProcessesByName = new SparseArray();
    final SparseArray<ProcessItem> mServiceProcessesByPid = new SparseArray();
    final SparseArray<AppProcessInfo> mTmpAppProcesses = new SparseArray();
    final UserManager mUm;
    ArrayList<MergedItem> mUserBackgroundItems = new ArrayList();
    final SparseArray<UserState> mUsers = new SparseArray();
    boolean mWatchingBackgroundItems;

    private boolean update(Context context, ActivityManager activityManager) {
        RunningServiceInfo runningServiceInfo;
        RunningAppProcessInfo runningAppProcessInfo;
        AppProcessInfo appProcessInfo;
        HashMap hashMap;
        ProcessItem proc;
        ProcessItem processItem;
        ProcessItem processItem2;
        MergedItem mergedItem;
        MergedItem mergedItem2;
        int size;
        MergedItem mergedItem3;
        int i;
        PackageManager pm = context.getPackageManager();
        this.mSequence++;
        boolean changed = false;
        List<RunningServiceInfo> services = activityManager.getRunningServices(100);
        int NS = services != null ? services.size() : 0;
        int i2 = 0;
        while (i2 < NS) {
            runningServiceInfo = (RunningServiceInfo) services.get(i2);
            if (!runningServiceInfo.started && runningServiceInfo.clientLabel == 0) {
                services.remove(i2);
                i2--;
                NS--;
            } else if ((runningServiceInfo.flags & 8) != 0) {
                services.remove(i2);
                i2--;
                NS--;
            }
            i2++;
        }
        List<RunningAppProcessInfo> processes = activityManager.getRunningAppProcesses();
        int NP = processes != null ? processes.size() : 0;
        this.mTmpAppProcesses.clear();
        for (i2 = 0; i2 < NP; i2++) {
            runningAppProcessInfo = (RunningAppProcessInfo) processes.get(i2);
            this.mTmpAppProcesses.put(runningAppProcessInfo.pid, new AppProcessInfo(runningAppProcessInfo));
        }
        for (i2 = 0; i2 < NS; i2++) {
            runningServiceInfo = (RunningServiceInfo) services.get(i2);
            if (runningServiceInfo.restarting == 0 && runningServiceInfo.pid > 0) {
                appProcessInfo = (AppProcessInfo) this.mTmpAppProcesses.get(runningServiceInfo.pid);
                if (appProcessInfo != null) {
                    appProcessInfo.hasServices = true;
                    if (runningServiceInfo.foreground) {
                        appProcessInfo.hasForegroundServices = true;
                    }
                }
            }
        }
        for (i2 = 0; i2 < NS; i2++) {
            runningServiceInfo = (RunningServiceInfo) services.get(i2);
            if (runningServiceInfo.restarting == 0 && runningServiceInfo.pid > 0) {
                appProcessInfo = (AppProcessInfo) this.mTmpAppProcesses.get(runningServiceInfo.pid);
                if (!(appProcessInfo == null || appProcessInfo.hasForegroundServices || appProcessInfo.info.importance >= 300)) {
                    Object obj = null;
                    appProcessInfo = (AppProcessInfo) this.mTmpAppProcesses.get(appProcessInfo.info.importanceReasonPid);
                    while (appProcessInfo != null) {
                        if (!appProcessInfo.hasServices) {
                            if (!isInterestingProcess(appProcessInfo.info)) {
                                appProcessInfo = (AppProcessInfo) this.mTmpAppProcesses.get(appProcessInfo.info.importanceReasonPid);
                            }
                        }
                        obj = 1;
                        break;
                    }
                    if (obj != null) {
                    }
                }
            }
            hashMap = (HashMap) this.mServiceProcessesByName.get(runningServiceInfo.uid);
            if (hashMap == null) {
                hashMap = new HashMap();
                this.mServiceProcessesByName.put(runningServiceInfo.uid, hashMap);
            }
            proc = (ProcessItem) hashMap.get(runningServiceInfo.process);
            if (proc == null) {
                changed = true;
                processItem = new ProcessItem(context, runningServiceInfo.uid, runningServiceInfo.process);
                hashMap.put(runningServiceInfo.process, processItem);
            }
            if (proc.mCurSeq != this.mSequence) {
                int i3 = runningServiceInfo.restarting == 0 ? runningServiceInfo.pid : 0;
                if (i3 != proc.mPid) {
                    changed = true;
                    if (proc.mPid != i3) {
                        if (proc.mPid != 0) {
                            this.mServiceProcessesByPid.remove(proc.mPid);
                        }
                        if (i3 != 0) {
                            this.mServiceProcessesByPid.put(i3, proc);
                        }
                        proc.mPid = i3;
                    }
                }
                proc.mDependentProcesses.clear();
                proc.mCurSeq = this.mSequence;
            }
            changed |= proc.updateService(context, runningServiceInfo);
        }
        for (i2 = 0; i2 < NP; i2++) {
            runningAppProcessInfo = (RunningAppProcessInfo) processes.get(i2);
            proc = (ProcessItem) this.mServiceProcessesByPid.get(runningAppProcessInfo.pid);
            if (proc == null) {
                proc = (ProcessItem) this.mRunningProcesses.get(runningAppProcessInfo.pid);
                if (proc == null) {
                    changed = true;
                    processItem = new ProcessItem(context, runningAppProcessInfo.uid, runningAppProcessInfo.processName);
                    processItem.mPid = runningAppProcessInfo.pid;
                    this.mRunningProcesses.put(runningAppProcessInfo.pid, processItem);
                }
                proc.mDependentProcesses.clear();
            }
            if (isInterestingProcess(runningAppProcessInfo)) {
                if (!this.mInterestingProcesses.contains(proc)) {
                    changed = true;
                    this.mInterestingProcesses.add(proc);
                }
                proc.mCurSeq = this.mSequence;
                proc.mInteresting = true;
                proc.ensureLabel(pm);
            } else {
                proc.mInteresting = false;
            }
            proc.mRunningSeq = this.mSequence;
            proc.mRunningProcessInfo = runningAppProcessInfo;
        }
        int NRP = this.mRunningProcesses.size();
        i2 = 0;
        while (i2 < NRP) {
            proc = (ProcessItem) this.mRunningProcesses.valueAt(i2);
            if (proc.mRunningSeq == this.mSequence) {
                int i4 = proc.mRunningProcessInfo.importanceReasonPid;
                if (i4 != 0) {
                    ProcessItem processItem3 = (ProcessItem) this.mServiceProcessesByPid.get(i4);
                    if (processItem3 == null) {
                        processItem3 = (ProcessItem) this.mRunningProcesses.get(i4);
                    }
                    if (processItem3 != null) {
                        processItem3.mDependentProcesses.put(proc.mPid, proc);
                    }
                } else {
                    proc.mClient = null;
                }
                i2++;
            } else {
                changed = true;
                this.mRunningProcesses.remove(this.mRunningProcesses.keyAt(i2));
                NRP--;
            }
        }
        int NHP = this.mInterestingProcesses.size();
        i2 = 0;
        while (i2 < NHP) {
            proc = (ProcessItem) this.mInterestingProcesses.get(i2);
            if (!proc.mInteresting || this.mRunningProcesses.get(proc.mPid) == null) {
                changed = true;
                this.mInterestingProcesses.remove(i2);
                i2--;
                NHP--;
            }
            i2++;
        }
        int NAP = this.mServiceProcessesByPid.size();
        for (i2 = 0; i2 < NAP; i2++) {
            proc = (ProcessItem) this.mServiceProcessesByPid.valueAt(i2);
            if (proc.mCurSeq == this.mSequence) {
                changed |= proc.buildDependencyChain(context, pm, this.mSequence);
            }
        }
        ArrayList<Integer> uidToDelete = null;
        for (i2 = 0; i2 < this.mServiceProcessesByName.size(); i2++) {
            hashMap = (HashMap) this.mServiceProcessesByName.valueAt(i2);
            Iterator it = hashMap.values().iterator();
            while (it.hasNext()) {
                processItem2 = (ProcessItem) it.next();
                if (processItem2.mCurSeq == this.mSequence) {
                    processItem2.ensureLabel(pm);
                    if (processItem2.mPid == 0) {
                        processItem2.mDependentProcesses.clear();
                    }
                    Iterator it2 = processItem2.mServices.values().iterator();
                    while (it2.hasNext()) {
                        if (((ServiceItem) it2.next()).mCurSeq != this.mSequence) {
                            changed = true;
                            it2.remove();
                        }
                    }
                } else {
                    changed = true;
                    it.remove();
                    if (hashMap.size() == 0) {
                        if (uidToDelete == null) {
                            uidToDelete = new ArrayList();
                        }
                        uidToDelete.add(Integer.valueOf(this.mServiceProcessesByName.keyAt(i2)));
                    }
                    if (processItem2.mPid != 0) {
                        this.mServiceProcessesByPid.remove(processItem2.mPid);
                    }
                }
            }
        }
        if (uidToDelete != null) {
            for (i2 = 0; i2 < uidToDelete.size(); i2++) {
                this.mServiceProcessesByName.remove(((Integer) uidToDelete.get(i2)).intValue());
            }
        }
        if (changed) {
            ArrayList arrayList = new ArrayList();
            for (i2 = 0; i2 < this.mServiceProcessesByName.size(); i2++) {
                for (ProcessItem processItem22 : ((HashMap) this.mServiceProcessesByName.valueAt(i2)).values()) {
                    processItem22.mIsSystem = false;
                    processItem22.mIsStarted = true;
                    processItem22.mActiveSince = Long.MAX_VALUE;
                    for (ServiceItem serviceItem : processItem22.mServices.values()) {
                        if (!(serviceItem.mServiceInfo == null || (serviceItem.mServiceInfo.applicationInfo.flags & 1) == 0)) {
                            processItem22.mIsSystem = true;
                        }
                        if (!(serviceItem.mRunningService == null || serviceItem.mRunningService.clientLabel == 0)) {
                            processItem22.mIsStarted = false;
                            if (processItem22.mActiveSince > serviceItem.mRunningService.activeSince) {
                                processItem22.mActiveSince = serviceItem.mRunningService.activeSince;
                            }
                        }
                    }
                    arrayList.add(processItem22);
                }
            }
            Collections.sort(arrayList, this.mServiceProcessComparator);
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            this.mProcessItems.clear();
            for (i2 = 0; i2 < arrayList.size(); i2++) {
                processItem22 = (ProcessItem) arrayList.get(i2);
                processItem22.mNeedDivider = false;
                int size2 = this.mProcessItems.size();
                processItem22.addDependentProcesses(arrayList2, this.mProcessItems);
                arrayList2.add(processItem22);
                if (processItem22.mPid > 0) {
                    this.mProcessItems.add(processItem22);
                }
                mergedItem = null;
                Object obj2 = null;
                boolean z = false;
                for (ServiceItem serviceItem2 : processItem22.mServices.values()) {
                    serviceItem2.mNeedDivider = z;
                    z = true;
                    arrayList2.add(serviceItem2);
                    if (serviceItem2.mMergedItem != null) {
                        if (!(mergedItem == null || mergedItem == serviceItem2.mMergedItem)) {
                            obj2 = null;
                        }
                        mergedItem = serviceItem2.mMergedItem;
                    } else {
                        obj2 = null;
                    }
                }
                if (obj2 == null || mergedItem == null || mergedItem.mServices.size() != processItem22.mServices.size()) {
                    mergedItem2 = new MergedItem(processItem22.mUserId);
                    for (ServiceItem serviceItem22 : processItem22.mServices.values()) {
                        mergedItem2.mServices.add(serviceItem22);
                        serviceItem22.mMergedItem = mergedItem2;
                    }
                    mergedItem2.mProcess = processItem22;
                    mergedItem2.mOtherProcesses.clear();
                    for (int i5 = size2; i5 < this.mProcessItems.size() - 1; i5++) {
                        mergedItem2.mOtherProcesses.add(this.mProcessItems.get(i5));
                    }
                }
                mergedItem.update(context, false);
                if (mergedItem.mUserId != this.mMyUserId) {
                    addOtherUserItem(context, arrayList3, this.mOtherUserMergedItems, mergedItem);
                } else {
                    arrayList3.add(mergedItem);
                }
            }
            NHP = this.mInterestingProcesses.size();
            for (i2 = 0; i2 < NHP; i2++) {
                proc = (ProcessItem) this.mInterestingProcesses.get(i2);
                if (proc.mClient == null && proc.mServices.size() <= 0) {
                    if (proc.mMergedItem == null) {
                        proc.mMergedItem = new MergedItem(proc.mUserId);
                        proc.mMergedItem.mProcess = proc;
                    }
                    proc.mMergedItem.update(context, false);
                    if (proc.mMergedItem.mUserId != this.mMyUserId) {
                        addOtherUserItem(context, arrayList3, this.mOtherUserMergedItems, proc.mMergedItem);
                    } else {
                        arrayList3.add(0, proc.mMergedItem);
                    }
                    this.mProcessItems.add(proc);
                }
            }
            size = this.mOtherUserMergedItems.size();
            for (i2 = 0; i2 < size; i2++) {
                mergedItem3 = (MergedItem) this.mOtherUserMergedItems.valueAt(i2);
                if (mergedItem3.mCurSeq == this.mSequence) {
                    mergedItem3.update(context, false);
                }
            }
            synchronized (this.mLock) {
                this.mItems = arrayList2;
                this.mMergedItems = arrayList3;
            }
        }
        this.mAllProcessItems.clear();
        this.mAllProcessItems.addAll(this.mProcessItems);
        int numBackgroundProcesses = 0;
        int numForegroundProcesses = 0;
        int numServiceProcesses = 0;
        NRP = this.mRunningProcesses.size();
        for (i2 = 0; i2 < NRP; i2++) {
            proc = (ProcessItem) this.mRunningProcesses.valueAt(i2);
            if (proc.mCurSeq == this.mSequence) {
                numServiceProcesses++;
            } else if (proc.mRunningProcessInfo.importance >= 400) {
                numBackgroundProcesses++;
                this.mAllProcessItems.add(proc);
            } else if (proc.mRunningProcessInfo.importance <= 200) {
                numForegroundProcesses++;
                this.mAllProcessItems.add(proc);
            } else {
                Log.i("RunningState", "Unknown non-service process: " + proc.mProcessName + " #" + proc.mPid);
            }
        }
        long backgroundProcessMemory = 0;
        long foregroundProcessMemory = 0;
        long serviceProcessMemory = 0;
        ArrayList<MergedItem> newBackgroundItems = null;
        ArrayList<MergedItem> newUserBackgroundItems = null;
        boolean diffUsers = false;
        try {
            int numProc = this.mAllProcessItems.size();
            int[] pids = new int[numProc];
            for (i2 = 0; i2 < numProc; i2++) {
                pids[i2] = ((ProcessItem) this.mAllProcessItems.get(i2)).mPid;
            }
            long[] pss = ActivityManagerNative.getDefault().getProcessPss(pids);
            int bgIndex = 0;
            i2 = 0;
            ArrayList<MergedItem> arrayList4 = null;
            while (true) {
                try {
                    if (i2 >= pids.length) {
                        break;
                    }
                    proc = (ProcessItem) this.mAllProcessItems.get(i2);
                    changed |= proc.updateSize(context, pss[i2], this.mSequence);
                    if (proc.mCurSeq == this.mSequence) {
                        serviceProcessMemory += proc.mSize;
                        newBackgroundItems = arrayList4;
                    } else if (proc.mRunningProcessInfo.importance >= 400) {
                        backgroundProcessMemory += proc.mSize;
                        if (arrayList4 != null) {
                            mergedItem2 = new MergedItem(proc.mUserId);
                            proc.mMergedItem = mergedItem2;
                            proc.mMergedItem.mProcess = proc;
                            diffUsers |= mergedItem2.mUserId != this.mMyUserId ? 1 : 0;
                            arrayList4.add(mergedItem2);
                            newBackgroundItems = arrayList4;
                        } else if (bgIndex >= this.mBackgroundItems.size() || ((MergedItem) this.mBackgroundItems.get(bgIndex)).mProcess != proc) {
                            mergedItem2 = new MergedItem(numBackgroundProcesses);
                            for (i = 0; i < bgIndex; i++) {
                                mergedItem = (MergedItem) this.mBackgroundItems.get(i);
                                diffUsers |= mergedItem.mUserId != this.mMyUserId ? 1 : 0;
                                mergedItem2.add(mergedItem);
                            }
                            mergedItem2 = new MergedItem(proc.mUserId);
                            proc.mMergedItem = mergedItem2;
                            proc.mMergedItem.mProcess = proc;
                            diffUsers |= mergedItem2.mUserId != this.mMyUserId ? 1 : 0;
                            mergedItem2.add(mergedItem2);
                        } else {
                            mergedItem = (MergedItem) this.mBackgroundItems.get(bgIndex);
                            newBackgroundItems = arrayList4;
                        }
                        mergedItem.update(context, true);
                        mergedItem.updateSize(context);
                        bgIndex++;
                    } else if (proc.mRunningProcessInfo.importance <= 200) {
                        foregroundProcessMemory += proc.mSize;
                        newBackgroundItems = arrayList4;
                    } else {
                        newBackgroundItems = arrayList4;
                    }
                    i2++;
                    arrayList4 = newBackgroundItems;
                } catch (RemoteException e) {
                    newBackgroundItems = arrayList4;
                }
            }
            newBackgroundItems = arrayList4;
        } catch (RemoteException e2) {
        }
        if (newBackgroundItems == null && this.mBackgroundItems.size() > numBackgroundProcesses) {
            mergedItem2 = new MergedItem(numBackgroundProcesses);
            for (i = 0; i < numBackgroundProcesses; i++) {
                mergedItem = (MergedItem) this.mBackgroundItems.get(i);
                diffUsers |= mergedItem.mUserId != this.mMyUserId ? 1 : 0;
                mergedItem2.add(mergedItem);
            }
        }
        if (newBackgroundItems != null) {
            if (diffUsers) {
                newUserBackgroundItems = new ArrayList();
                int size3 = newBackgroundItems.size();
                for (i2 = 0; i2 < size3; i2++) {
                    mergedItem = (MergedItem) newBackgroundItems.get(i2);
                    if (mergedItem.mUserId != this.mMyUserId) {
                        addOtherUserItem(context, newUserBackgroundItems, this.mOtherUserBackgroundItems, mergedItem);
                    } else {
                        newUserBackgroundItems.add(mergedItem);
                    }
                }
                size = this.mOtherUserBackgroundItems.size();
                for (i2 = 0; i2 < size; i2++) {
                    mergedItem3 = (MergedItem) this.mOtherUserBackgroundItems.valueAt(i2);
                    if (mergedItem3.mCurSeq == this.mSequence) {
                        mergedItem3.update(context, true);
                        mergedItem3.updateSize(context);
                    }
                }
            } else {
                newUserBackgroundItems = newBackgroundItems;
            }
        }
        for (i2 = 0; i2 < this.mMergedItems.size(); i2++) {
            ((MergedItem) this.mMergedItems.get(i2)).updateSize(context);
        }
        synchronized (this.mLock) {
            this.mNumBackgroundProcesses = numBackgroundProcesses;
            this.mNumForegroundProcesses = numForegroundProcesses;
            this.mNumServiceProcesses = numServiceProcesses;
            this.mBackgroundProcessMemory = backgroundProcessMemory;
            this.mForegroundProcessMemory = foregroundProcessMemory;
            this.mServiceProcessMemory = serviceProcessMemory;
            if (newBackgroundItems != null) {
                this.mBackgroundItems = newBackgroundItems;
                this.mUserBackgroundItems = newUserBackgroundItems;
                if (this.mWatchingBackgroundItems) {
                    changed = true;
                }
            }
            if (!this.mHaveData) {
                this.mHaveData = true;
                this.mLock.notifyAll();
            }
        }
        return changed;
    }

    private RunningState(Context context) {
        this.mApplicationContext = context.getApplicationContext();
        this.mAm = (ActivityManager) this.mApplicationContext.getSystemService("activity");
        this.mPm = this.mApplicationContext.getPackageManager();
        this.mUm = (UserManager) this.mApplicationContext.getSystemService("user");
        this.mMyUserId = UserHandle.myUserId();
        this.mResumed = false;
        this.mBackgroundThread = new HandlerThread("RunningState:Background");
        this.mBackgroundThread.start();
        this.mBackgroundHandler = new BackgroundHandler(this, this.mBackgroundThread.getLooper());
    }

    private void addOtherUserItem(Context context, ArrayList<MergedItem> newMergedItems, SparseArray<MergedItem> userItems, MergedItem mergedItem) {
        MergedItem userItem = (MergedItem) userItems.get(mergedItem.mUserId);
        boolean first = userItem == null || userItem.mCurSeq != this.mSequence;
        if (first) {
            if (userItem == null) {
                userItem = new MergedItem(mergedItem.mUserId);
                userItems.put(mergedItem.mUserId, userItem);
            } else {
                userItem.mChildren.clear();
            }
            userItem.mCurSeq = this.mSequence;
            UserState userState = (UserState) this.mUsers.get(mergedItem.mUserId);
            userItem.mUser = userState;
            if (userState == null) {
                userItem.mUser = new UserState();
                UserInfo info = this.mUm.getUserInfo(mergedItem.mUserId);
                userItem.mUser.mInfo = info;
                if (info != null) {
                    userItem.mUser.mIcon = UserUtils.getUserIcon(this.mUm, info, context.getResources());
                }
                String str = info != null ? info.name : null;
                if (str == null) {
                    str = Integer.toString(info.id);
                }
                userItem.mUser.mLabel = context.getResources().getString(2131428447, new Object[]{str});
            }
            newMergedItems.add(userItem);
        }
        userItem.mChildren.add(mergedItem);
    }

    void resume(OnRefreshUiListener onRefreshUiListener) {
        synchronized (this.mLock) {
            this.mResumed = true;
            this.mRefreshUiListener = onRefreshUiListener;
            if (this.mInterestingConfigChanges.applyNewConfig(this.mApplicationContext.getResources())) {
                this.mHaveData = false;
                this.mBackgroundHandler.removeMessages(1);
                this.mBackgroundHandler.removeMessages(2);
                this.mBackgroundHandler.sendEmptyMessage(1);
            }
            if (!this.mBackgroundHandler.hasMessages(2)) {
                this.mBackgroundHandler.sendEmptyMessage(2);
            }
            this.mHandler.sendEmptyMessage(4);
        }
    }

    static CharSequence makeLabel(PackageManager packageManager, String str, PackageItemInfo packageItemInfo) {
        String label;
        if (!(packageItemInfo == null || (packageItemInfo.labelRes == 0 && packageItemInfo.nonLocalizedLabel == null))) {
            label = packageItemInfo.loadLabel(packageManager);
            if (label != null) {
                return label;
            }
        }
        label = str;
        int tail = label.lastIndexOf(46);
        return tail >= 0 ? label.substring(tail + 1, label.length()) : label;
    }

    private void reset() {
        this.mServiceProcessesByName.clear();
        this.mServiceProcessesByPid.clear();
        this.mInterestingProcesses.clear();
        this.mRunningProcesses.clear();
        this.mProcessItems.clear();
        this.mAllProcessItems.clear();
        this.mUsers.clear();
    }

    void pause() {
        synchronized (this.mLock) {
            this.mResumed = false;
            this.mRefreshUiListener = null;
            this.mHandler.removeMessages(4);
        }
    }

    void waitForData() {
        synchronized (this.mLock) {
            while (!this.mHaveData) {
                try {
                    this.mLock.wait(0);
                } catch (InterruptedException e) {
                }
            }
        }
    }

    void updateNow() {
        synchronized (this.mLock) {
            this.mBackgroundHandler.removeMessages(2);
            this.mBackgroundHandler.sendEmptyMessage(2);
        }
    }

    static RunningState getInstance(Context context) {
        RunningState runningState;
        synchronized (sGlobalLock) {
            if (sInstance == null) {
                sInstance = new RunningState(context);
            }
            runningState = sInstance;
        }
        return runningState;
    }

    void setWatchingBackgroundItems(boolean z) {
        synchronized (this.mLock) {
            this.mWatchingBackgroundItems = z;
        }
    }

    private boolean isInterestingProcess(RunningAppProcessInfo runningAppProcessInfo) {
        if ((runningAppProcessInfo.flags & 1) != 0) {
            return true;
        }
        return (runningAppProcessInfo.flags & 2) == 0 && runningAppProcessInfo.importance >= 100 && runningAppProcessInfo.importance < 170 && runningAppProcessInfo.importanceReasonCode == 0;
    }

    ArrayList<MergedItem> getCurrentBackgroundItems() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = this.mUserBackgroundItems;
        }
        return arrayList;
    }

    ArrayList<MergedItem> getCurrentMergedItems() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = this.mMergedItems;
        }
        return arrayList;
    }

    boolean hasData() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mHaveData;
        }
        return z;
    }
}