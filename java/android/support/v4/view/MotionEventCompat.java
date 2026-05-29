package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.MotionEvent;

public class MotionEventCompat {
    static final MotionEventVersionImpl IMPL;

    static {
        if (VERSION.SDK_INT >= 5) {
            IMPL = new EclairMotionEventVersionImpl();
        } else {
            IMPL = new BaseMotionEventVersionImpl();
        }
    }

    public static int findPointerIndex(MotionEvent motionEvent, int i) {
        return IMPL.findPointerIndex(motionEvent, i);
    }

    public static int getActionIndex(MotionEvent motionEvent) {
        return (motionEvent.getAction() & 65280) >> 8;
    }

    public static int getPointerId(MotionEvent motionEvent, int i) {
        return IMPL.getPointerId(motionEvent, i);
    }

    public static float getX(MotionEvent motionEvent, int i) {
        return IMPL.getX(motionEvent, i);
    }

    public static float getY(MotionEvent motionEvent, int i) {
        return IMPL.getY(motionEvent, i);
    }
}