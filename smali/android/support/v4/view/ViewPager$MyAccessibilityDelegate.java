package android.support.v4.view;

import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;

class ViewPager$MyAccessibilityDelegate extends AccessibilityDelegateCompat {
    final /* synthetic */ ViewPager this$0;

    public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
        if (super.performAccessibilityAction(view, i, bundle)) {
            return true;
        }
        switch (i) {
            case 4096:
                if (!canScrollForward()) {
                    return false;
                }
                this.this$0.setCurrentItem(ViewPager.access$300(this.this$0) + 1);
                return true;
            case 8192:
                if (!canScrollBackward()) {
                    return false;
                }
                this.this$0.setCurrentItem(ViewPager.access$300(this.this$0) - 1);
                return true;
            default:
                return false;
        }
    }

    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(view, accessibilityEvent);
        accessibilityEvent.setClassName(ViewPager.class.getName());
        AccessibilityRecordCompat obtain = AccessibilityRecordCompat.obtain();
        obtain.setScrollable(canScroll());
        if (accessibilityEvent.getEventType() == 4096 && ViewPager.access$200(this.this$0) != null) {
            obtain.setItemCount(ViewPager.access$200(this.this$0).getCount());
            obtain.setFromIndex(ViewPager.access$300(this.this$0));
            obtain.setToIndex(ViewPager.access$300(this.this$0));
        }
    }

    public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
        super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
        accessibilityNodeInfoCompat.setClassName(ViewPager.class.getName());
        accessibilityNodeInfoCompat.setScrollable(canScroll());
        if (canScrollForward()) {
            accessibilityNodeInfoCompat.addAction(4096);
        }
        if (canScrollBackward()) {
            accessibilityNodeInfoCompat.addAction(8192);
        }
    }

    ViewPager$MyAccessibilityDelegate(ViewPager viewPager) {
        this.this$0 = viewPager;
    }

    private boolean canScroll() {
        return ViewPager.access$200(this.this$0) != null && ViewPager.access$200(this.this$0).getCount() > 1;
    }

    private boolean canScrollBackward() {
        return ViewPager.access$200(this.this$0) != null && ViewPager.access$300(this.this$0) > 0 && ViewPager.access$300(this.this$0) < ViewPager.access$200(this.this$0).getCount();
    }

    private boolean canScrollForward() {
        return ViewPager.access$200(this.this$0) != null && ViewPager.access$300(this.this$0) >= 0 && ViewPager.access$300(this.this$0) < ViewPager.access$200(this.this$0).getCount() - 1;
    }
}