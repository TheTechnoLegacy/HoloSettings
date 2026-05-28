package android.support.v4.view.accessibility;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompatJellyBean.AccessibilityNodeInfoBridge;
import java.util.ArrayList;
import java.util.List;

public class AccessibilityNodeProviderCompat {
    private static final AccessibilityNodeProviderImpl IMPL;
    private final Object mProvider;

    interface AccessibilityNodeProviderImpl {
        Object newAccessibilityNodeProviderBridge(AccessibilityNodeProviderCompat accessibilityNodeProviderCompat);
    }

    static class AccessibilityNodeProviderStubImpl implements AccessibilityNodeProviderImpl {
        AccessibilityNodeProviderStubImpl() {
        }

        public Object newAccessibilityNodeProviderBridge(AccessibilityNodeProviderCompat accessibilityNodeProviderCompat) {
            return null;
        }
    }

    static class AccessibilityNodeProviderJellyBeanImpl extends AccessibilityNodeProviderStubImpl {
        AccessibilityNodeProviderJellyBeanImpl() {
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

    static {
        if (VERSION.SDK_INT >= 16) {
            IMPL = new AccessibilityNodeProviderJellyBeanImpl();
        } else {
            IMPL = new AccessibilityNodeProviderStubImpl();
        }
    }

    public AccessibilityNodeProviderCompat() {
        this.mProvider = IMPL.newAccessibilityNodeProviderBridge(this);
    }

    public AccessibilityNodeProviderCompat(Object obj) {
        this.mProvider = obj;
    }

    public Object createAccessibilityNodeInfo(int i) {
        return null;
    }

    public List<AccessibilityNodeInfoCompat> findAccessibilityNodeInfosByText(String str, int i) {
        return null;
    }

    public Object getProvider() {
        return this.mProvider;
    }

    public boolean performAction(int i, int i2, Bundle bundle) {
        return false;
    }
}