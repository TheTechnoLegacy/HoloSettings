package android.support.v4.view.accessibility;

import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompatJellyBean.AccessibilityNodeInfoBridge;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.List;

class AccessibilityNodeProviderCompatJellyBean$1 extends AccessibilityNodeProvider {
    final /* synthetic */ AccessibilityNodeInfoBridge val$bridge;

    AccessibilityNodeProviderCompatJellyBean$1(AccessibilityNodeInfoBridge accessibilityNodeInfoBridge) {
        this.val$bridge = accessibilityNodeInfoBridge;
    }

    public AccessibilityNodeInfo createAccessibilityNodeInfo(int i) {
        return this.val$bridge.createAccessibilityNodeInfo(i);
    }

    public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String str, int i) {
        return this.val$bridge.findAccessibilityNodeInfosByText(str, i);
    }

    public boolean performAction(int i, int i2, Bundle bundle) {
        return this.val$bridge.performAction(i, i2, bundle);
    }
}