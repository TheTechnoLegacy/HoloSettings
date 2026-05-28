package android.support.v4.view;

import android.support.v4.view.KeyEventCompat.EclairKeyEventVersionImpl;

class KeyEventCompat$HoneycombKeyEventVersionImpl extends EclairKeyEventVersionImpl {
    KeyEventCompat$HoneycombKeyEventVersionImpl() {
    }

    public boolean metaStateHasModifiers(int i, int i2) {
        return KeyEventCompatHoneycomb.metaStateHasModifiers(i, i2);
    }

    public boolean metaStateHasNoModifiers(int i) {
        return metaStateHasNoModifiers(i);
    }

    public int normalizeMetaState(int i) {
        return normalizeMetaState(i);
    }
}