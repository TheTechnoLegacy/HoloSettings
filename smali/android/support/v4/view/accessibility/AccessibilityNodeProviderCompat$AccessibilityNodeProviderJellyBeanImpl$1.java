package android.support.v4.view.accessibility;

import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat.AccessibilityNodeProviderJellyBeanImpl;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompatJellyBean.AccessibilityNodeInfoBridge;
import java.util.ArrayList;
import java.util.List;

class AccessibilityNodeProviderCompat$AccessibilityNodeProviderJellyBeanImpl$1 implements AccessibilityNodeInfoBridge {
    final /* synthetic */ AccessibilityNodeProviderJellyBeanImpl this$0;
    final /* synthetic */ AccessibilityNodeProviderCompat val$compat;

    public List<Object> findAccessibilityNodeInfosByText(String str, int i) {
        List<AccessibilityNodeInfoCompat> compatInfos = this.val$compat.findAccessibilityNodeInfosByText(str, i);
        List<Object> infos = new ArrayList();
        int infoCount = compatInfos.size();
        for (int i2 = 0; i2 < infoCount; i2++) {
            infos.add(((AccessibilityNodeInfoCompat) compatInfos.get(i2)).getInfo());
        }
        return infos;
    }

    public Object createAccessibilityNodeInfo(int i) {
        AccessibilityNodeInfoCompat compatInfo = this.val$compat.createAccessibilityNodeInfo(i);
        return compatInfo == null ? null : compatInfo.getInfo();
    }

    AccessibilityNodeProviderCompat$AccessibilityNodeProviderJellyBeanImpl$1(AccessibilityNodeProviderJellyBeanImpl accessibilityNodeProviderJellyBeanImpl, AccessibilityNodeProviderCompat accessibilityNodeProviderCompat) {
        this.this$0 = accessibilityNodeProviderJellyBeanImpl;
        this.val$compat = accessibilityNodeProviderCompat;
    }

    public boolean performAction(int i, int i2, Bundle bundle) {
        return this.val$compat.performAction(i, i2, bundle);
    }
}