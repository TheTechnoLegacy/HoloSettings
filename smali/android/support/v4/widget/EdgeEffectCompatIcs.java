package android.support.v4.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.widget.EdgeEffect;

class EdgeEffectCompatIcs {
    public static boolean onRelease(Object obj) {
        EdgeEffect eff = (EdgeEffect) obj;
        eff.onRelease();
        return eff.isFinished();
    }

    public static void finish(Object obj) {
        ((EdgeEffect) obj).finish();
    }

    public static boolean onPull(Object obj, float f) {
        ((EdgeEffect) obj).onPull(f);
        return true;
    }

    public static void setSize(Object obj, int i, int i2) {
        ((EdgeEffect) obj).setSize(i, i2);
    }

    EdgeEffectCompatIcs() {
    }

    public static boolean draw(Object obj, Canvas canvas) {
        return ((EdgeEffect) obj).draw(canvas);
    }

    public static boolean isFinished(Object obj) {
        return ((EdgeEffect) obj).isFinished();
    }

    public static Object newEdgeEffect(Context context) {
        return new EdgeEffect(context);
    }
}