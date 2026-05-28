package android.support.v4.view.accessibility;

import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat.AccessibilityNodeProviderStubImpl;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompatJellyBean.AccessibilityNodeInfoBridge;
import java.util.ArrayList;
import java.util.List;

class AccessibilityNodeProviderCompat$AccessibilityNodeProviderJellyBeanImpl extends AccessibilityNodeProviderStubImpl {
    AccessibilityNodeProviderCompat$AccessibilityNodeProviderJellyBeanImpl() {
    }

    public Object newAccessibilityNodeProviderBridge(final AccessibilityNodeProviderCompat accessibilityNodeProviderCompat) {
        return AccessibilityNodeProviderCompatJellyBean.newAccessibilityNodeProviderBridge(new AccessibilityNodeInfoBridge() {
            public List<Object> findAccessibilityNodeInfosByText(String str, int i) {
                List<AccessibilityNodeInfoCompat> compatInfos = accessibilityNodeProviderCompat.findAccessibilityNodeInfosByText(str, i);
                List<Object> infos = new ArrayList();
                int infoCount = compatInfos.size();
                for (int i2 = 0; i2 < infoCount; i2++) {
                    infos.add(((AccessibilityNodeInfoCompat) compatInfos.get(i2)).getInfo());
                }
                return infos;
            }

            public Object createAccessibilityNodeInfo(int i) {
                AccessibilityNodeInfoCompat compatInfo = accessibilityNodeProviderCompat.createAccessibilityNodeInfo(i);
                return compatInfo == null ? null : compatInfo.getInfo();
            }

            public boolean performAction(int i, int i2, Bundle bundle) {
                return accessibilityNodeProviderCompat.performAction(i, i2, bundle);
            }
        });
    }
}