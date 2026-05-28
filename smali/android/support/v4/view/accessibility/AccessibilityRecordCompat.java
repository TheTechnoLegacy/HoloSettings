package android.support.v4.view.accessibility;

import android.os.Build.VERSION;

public class AccessibilityRecordCompat {
    private static final AccessibilityRecordImpl IMPL;
    private final Object mRecord;

    interface AccessibilityRecordImpl {
        Object obtain();

        void setFromIndex(Object obj, int i);

        void setItemCount(Object obj, int i);

        void setScrollable(Object obj, boolean z);

        void setToIndex(Object obj, int i);
    }

    static class AccessibilityRecordStubImpl implements AccessibilityRecordImpl {
        AccessibilityRecordStubImpl() {
        }

        public Object obtain() {
            return null;
        }

        public void setFromIndex(Object obj, int i) {
        }

        public void setItemCount(Object obj, int i) {
        }

        public void setScrollable(Object obj, boolean z) {
        }

        public void setToIndex(Object obj, int i) {
        }
    }

    static class AccessibilityRecordIcsImpl extends AccessibilityRecordStubImpl {
        public void setFromIndex(Object obj, int i) {
            AccessibilityRecordImpl.setFromIndex(obj, i);
        }

        public void setItemCount(Object obj, int i) {
            AccessibilityRecordCompatIcs.setItemCount(obj, i);
        }

        public void setScrollable(Object obj, boolean z) {
            AccessibilityRecordImpl.setScrollable(obj, z);
        }

        public void setToIndex(Object obj, int i) {
            AccessibilityRecordImpl.setToIndex(obj, i);
        }

        AccessibilityRecordIcsImpl() {
        }

        public Object obtain() {
            return AccessibilityRecordImpl.obtain();
        }
    }

    static class AccessibilityRecordIcsMr1Impl extends AccessibilityRecordIcsImpl {
        AccessibilityRecordIcsMr1Impl() {
        }
    }

    static class AccessibilityRecordJellyBeanImpl extends AccessibilityRecordIcsMr1Impl {
        AccessibilityRecordJellyBeanImpl() {
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        AccessibilityRecordCompat other = (AccessibilityRecordCompat) obj;
        return this.mRecord == null ? other.mRecord == null : this.mRecord.equals(other.mRecord);
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            IMPL = new AccessibilityRecordJellyBeanImpl();
        } else if (VERSION.SDK_INT >= 15) {
            IMPL = new AccessibilityRecordIcsMr1Impl();
        } else if (VERSION.SDK_INT >= 14) {
            IMPL = new AccessibilityRecordIcsImpl();
        } else {
            IMPL = new AccessibilityRecordStubImpl();
        }
    }

    public AccessibilityRecordCompat(Object obj) {
        this.mRecord = obj;
    }

    public void setFromIndex(int i) {
        IMPL.setFromIndex(this.mRecord, i);
    }

    public void setItemCount(int i) {
        IMPL.setItemCount(this.mRecord, i);
    }

    public void setScrollable(boolean z) {
        IMPL.setScrollable(this.mRecord, z);
    }

    public void setToIndex(int i) {
        IMPL.setToIndex(this.mRecord, i);
    }

    public static Object obtain() {
        return new AccessibilityRecordCompat(IMPL.obtain());
    }

    public int hashCode() {
        return this.mRecord == null ? 0 : this.mRecord.hashCode();
    }
}