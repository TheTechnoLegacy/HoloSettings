package android.support.v4.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.support.v4.widget.EdgeEffectCompat.EdgeEffectImpl;

class EdgeEffectCompat$EdgeEffectIcsImpl implements EdgeEffectImpl {
    public void finish(Object obj) {
        finish(obj);
    }

    public void setSize(Object obj, int i, int i2) {
        setSize(obj, i, i2);
    }

    EdgeEffectCompat$EdgeEffectIcsImpl() {
    }

    public boolean draw(Object obj, Canvas canvas) {
        return draw(obj, canvas);
    }

    public boolean isFinished(Object obj) {
        return EdgeEffectCompatIcs.isFinished(obj);
    }

    public Object newEdgeEffect(Context context) {
        return newEdgeEffect(context);
    }

    public boolean onPull(Object obj, float f) {
        return onPull(obj, f);
    }

    public boolean onRelease(Object obj) {
        return onRelease(obj);
    }
}