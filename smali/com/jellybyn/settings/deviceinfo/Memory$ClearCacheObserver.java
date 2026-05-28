package com.jellybyn.settings.deviceinfo;

import android.content.pm.IPackageDataObserver.Stub;

class Memory$ClearCacheObserver extends Stub {
    private int mRemaining;
    private final Memory mTarget;

    public void onRemoveCompleted(String str, boolean z) {
        synchronized (this) {
            int i = this.mRemaining - 1;
            this.mRemaining = i;
            if (i == 0) {
                Memory.access$300(this.mTarget);
            }
        }
    }

    public Memory$ClearCacheObserver(Memory memory, int i) {
        this.mTarget = memory;
        this.mRemaining = i;
    }
}