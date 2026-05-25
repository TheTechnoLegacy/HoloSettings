package android.support.v4.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.support.v4.widget.EdgeEffectCompat.EdgeEffectImpl;

class EdgeEffectCompat$BaseEdgeEffectImpl implements EdgeEffectImpl {
    EdgeEffectCompat$BaseEdgeEffectImpl() {
    }

    public boolean draw(Object obj, Canvas canvas) {
        return false;
    }

    public void finish(Object obj) {
    }

    public boolean isFinished(Object obj) {
        return true;
    }

    public Object newEdgeEffect(Context context) {
        return null;
    }

    public boolean onPull(Object obj, float f) {
        return false;
    }

    public boolean onRelease(Object obj) {
        return false;
    }

    public void setSize(Object obj, int i, int i2) {
    }
}