package android.support.v4.view;

import android.support.v4.view.MotionEventCompat.MotionEventVersionImpl;
import android.view.MotionEvent;

class MotionEventCompat$EclairMotionEventVersionImpl implements MotionEventVersionImpl {
    MotionEventCompat$EclairMotionEventVersionImpl() {
    }

    public int findPointerIndex(MotionEvent motionEvent, int i) {
        return MotionEventCompatEclair.findPointerIndex(motionEvent, i);
    }

    public int getPointerId(MotionEvent motionEvent, int i) {
        return getPointerId(motionEvent, i);
    }

    public float getX(MotionEvent motionEvent, int i) {
        return MotionEventCompatEclair.getX(motionEvent, i);
    }

    public float getY(MotionEvent motionEvent, int i) {
        return MotionEventCompatEclair.getY(motionEvent, i);
    }
}