package android.support.v4.view;

import android.support.v4.view.MotionEventCompat.MotionEventVersionImpl;
import android.view.MotionEvent;

class MotionEventCompat$BaseMotionEventVersionImpl implements MotionEventVersionImpl {
    public int findPointerIndex(MotionEvent motionEvent, int i) {
        return i == 0 ? 0 : -1;
    }

    public int getPointerId(MotionEvent motionEvent, int i) {
        if (i == 0) {
            return 0;
        }
        throw new IndexOutOfBoundsException("Pre-Eclair does not support multiple pointers");
    }

    public float getX(MotionEvent motionEvent, int i) {
        if (i == 0) {
            return motionEvent.getX();
        }
        throw new IndexOutOfBoundsException("Pre-Eclair does not support multiple pointers");
    }

    public float getY(MotionEvent motionEvent, int i) {
        if (i == 0) {
            return motionEvent.getY();
        }
        throw new IndexOutOfBoundsException("Pre-Eclair does not support multiple pointers");
    }

    MotionEventCompat$BaseMotionEventVersionImpl() {
    }
}