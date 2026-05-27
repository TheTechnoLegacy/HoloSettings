package com.jellybyn.settings.applications;

import android.app.AppOpsManager;
import android.app.AppOpsManager.OpEntry;
import android.app.AppOpsManager.PackageOps;
import android.content.res.Resources;
import android.text.format.DateUtils;
import com.jellybyn.settings.applications.AppOpsState.AppEntry;
import java.util.ArrayList;

public class AppOpsState$AppOpEntry {
    private final AppEntry mApp;
    private final ArrayList<OpEntry> mOps = new ArrayList();
    private final PackageOps mPkgOps;
    private final ArrayList<OpEntry> mSwitchOps = new ArrayList();
    private final int mSwitchOrder;

    public AppOpsState$AppOpEntry(PackageOps packageOps, OpEntry opEntry, AppEntry appEntry, int i) {
        this.mPkgOps = packageOps;
        this.mApp = appEntry;
        this.mSwitchOrder = i;
        this.mApp.addOp(this, opEntry);
        this.mOps.add(opEntry);
        this.mSwitchOps.add(opEntry);
    }

    private static void addOp(ArrayList<OpEntry> list, OpEntry opEntry) {
        for (int i = 0; i < list.size(); i++) {
            OpEntry opEntry2 = (OpEntry) list.get(i);
            if (opEntry2.isRunning() != opEntry.isRunning()) {
                if (opEntry.isRunning()) {
                    list.add(i, opEntry);
                    return;
                }
            } else if (opEntry2.getTime() < opEntry.getTime()) {
                list.add(i, opEntry);
                return;
            }
        }
        list.add(opEntry);
    }

    private CharSequence getCombinedText(ArrayList<OpEntry> ops, CharSequence[] charSequenceArr) {
        if (ops.size() == 1) {
            return charSequenceArr[((OpEntry) ops.get(0)).getOp()];
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < ops.size(); i++) {
            if (i > 0) {
                builder.append(", ");
            }
            builder.append(charSequenceArr[((OpEntry) ops.get(i)).getOp()]);
        }
        return builder.toString();
    }

    public CharSequence getTimeText(Resources resources, boolean z) {
        if (isRunning()) {
            return resources.getText(2131428432);
        }
        if (getTime() > 0) {
            return DateUtils.getRelativeTimeSpanString(getTime(), System.currentTimeMillis(), 60000, 262144);
        }
        return z ? resources.getText(2131428433) : "";
    }

    public void addOp(OpEntry opEntry) {
        this.mApp.addOp(this, opEntry);
        addOp(this.mOps, opEntry);
        if (this.mApp.getOpSwitch(AppOpsManager.opToSwitch(opEntry.getOp())) == null) {
            addOp(this.mSwitchOps, opEntry);
        }
    }

    public CharSequence getSwitchText(AppOpsState appOpsState) {
        return this.mSwitchOps.size() > 0 ? getCombinedText(this.mSwitchOps, appOpsState.mOpLabels) : getCombinedText(this.mOps, appOpsState.mOpLabels);
    }

    public AppEntry getAppEntry() {
        return this.mApp;
    }

    public OpEntry getOpEntry(int i) {
        return (OpEntry) this.mOps.get(i);
    }

    public PackageOps getPackageOps() {
        return this.mPkgOps;
    }

    public CharSequence getSummaryText(AppOpsState appOpsState) {
        return getCombinedText(this.mOps, appOpsState.mOpSummaries);
    }

    public int getSwitchOrder() {
        return this.mSwitchOrder;
    }

    public long getTime() {
        return ((OpEntry) this.mOps.get(0)).getTime();
    }

    public boolean isRunning() {
        return ((OpEntry) this.mOps.get(0)).isRunning();
    }

    public String toString() {
        return this.mApp.getLabel();
    }
}