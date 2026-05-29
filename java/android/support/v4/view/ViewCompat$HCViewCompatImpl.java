package android.support.v4.view;

import android.graphics.Paint;
import android.support.v4.view.ViewCompat.GBViewCompatImpl;
import android.view.View;

class ViewCompat$HCViewCompatImpl extends GBViewCompatImpl {
    public void setLayerType(View view, int i, Paint paint) {
        ViewCompatHC.setLayerType(view, i, paint);
    }

    ViewCompat$HCViewCompatImpl() {
    }

    long getFrameTime() {
        return getFrameTime();
    }
}