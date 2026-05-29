package com.jellybyn.settings.deviceinfo;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.jellybyn.settings.deviceinfo.Memory.ClearCacheObserver;
import com.jellybyn.settings.deviceinfo.Memory.ConfirmClearCacheFragment;
import java.util.List;

class Memory$ConfirmClearCacheFragment$1 implements OnClickListener {
    final /* synthetic */ ConfirmClearCacheFragment this$0;
    final /* synthetic */ Context val$context;

    public void onClick(DialogInterface dialogInterface, int i) {
        Memory target = (Memory) this.this$0.getTargetFragment();
        PackageManager pm = this.val$context.getPackageManager();
        List<PackageInfo> infos = pm.getInstalledPackages(0);
        ClearCacheObserver observer = new ClearCacheObserver(target, infos.size());
        for (PackageInfo packageInfo : infos) {
            pm.deleteApplicationCacheFiles(packageInfo.packageName, observer);
        }
    }

    Memory$ConfirmClearCacheFragment$1(ConfirmClearCacheFragment confirmClearCacheFragment, Context context) {
        this.this$0 = confirmClearCacheFragment;
        this.val$context = context;
    }
}