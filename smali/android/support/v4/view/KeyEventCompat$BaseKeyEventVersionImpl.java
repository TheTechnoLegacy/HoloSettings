package android.support.v4.view;

import android.support.v4.view.KeyEventCompat.KeyEventVersionImpl;

class KeyEventCompat$BaseKeyEventVersionImpl implements KeyEventVersionImpl {
    private static int metaStateFilterDirectionalModifiers(int i, int i2, int i3, int i4, int i5) {
        boolean wantLeftOrRight = true;
        boolean wantBasic = (i2 & i3) != 0;
        int directional = i4 | i5;
        if ((i2 & directional) == 0) {
            wantLeftOrRight = false;
        }
        if (!wantBasic) {
            return wantLeftOrRight ? i & (i3 ^ -1) : i;
        } else {
            if (!wantLeftOrRight) {
                return i & (directional ^ -1);
            }
            throw new IllegalArgumentException("bad arguments");
        }
    }

    public int normalizeMetaState(int i) {
        if ((i & 192) != 0) {
            i |= 1;
        }
        if ((i & 48) != 0) {
            i |= 2;
        }
        return i & 247;
    }

    public boolean metaStateHasModifiers(int i, int i2) {
        return metaStateFilterDirectionalModifiers(metaStateFilterDirectionalModifiers(normalizeMetaState(i) & 247, i2, 1, 64, 128), i2, 2, 16, 32) == i2;
    }

    KeyEventCompat$BaseKeyEventVersionImpl() {
    }

    public boolean metaStateHasNoModifiers(int i) {
        return (normalizeMetaState(i) & 247) == 0;
    }
}