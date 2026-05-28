package android.support.v4.view;

import android.view.MotionEvent;

interface MotionEventCompat$MotionEventVersionImpl {
    int findPointerIndex(MotionEvent motionEvent, int i);

    int getPointerId(MotionEvent motionEvent, int i);

    float getX(MotionEvent motionEvent, int i);

    float getY(MotionEvent motionEvent, int i);
}