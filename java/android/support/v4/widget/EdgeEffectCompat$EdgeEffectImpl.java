package android.support.v4.widget;

import android.content.Context;
import android.graphics.Canvas;

interface EdgeEffectCompat$EdgeEffectImpl {
    boolean draw(Object obj, Canvas canvas);

    void finish(Object obj);

    boolean isFinished(Object obj);

    Object newEdgeEffect(Context context);

    boolean onPull(Object obj, float f);

    boolean onRelease(Object obj);

    void setSize(Object obj, int i, int i2);
}