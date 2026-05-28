package android.support.v4.view;

import android.animation.ValueAnimator;
import android.graphics.Paint;
import android.view.View;

class ViewCompatHC {
    public static void setLayerType(View view, int i, Paint paint) {
        view.setLayerType(i, paint);
    }

    ViewCompatHC() {
    }

    static long getFrameTime() {
        return ValueAnimator.getFrameDelay();
    }
}