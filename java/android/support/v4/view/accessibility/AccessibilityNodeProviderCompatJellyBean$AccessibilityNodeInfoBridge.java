package android.support.v4.view.accessibility;

import android.os.Bundle;
import java.util.List;

interface AccessibilityNodeProviderCompatJellyBean$AccessibilityNodeInfoBridge {
    Object createAccessibilityNodeInfo(int i);

    List<Object> findAccessibilityNodeInfosByText(String str, int i);

    boolean performAction(int i, int i2, Bundle bundle);
}