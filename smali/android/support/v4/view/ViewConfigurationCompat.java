package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.ViewConfiguration;

public class ViewConfigurationCompat {
    static final ViewConfigurationVersionImpl IMPL;

    static {
        if (VERSION.SDK_INT >= 11) {
            IMPL = new FroyoViewConfigurationVersionImpl();
        } else {
            IMPL = new BaseViewConfigurationVersionImpl();
        }
    }

    public static int getScaledPagingTouchSlop(ViewConfiguration viewConfiguration) {
        return IMPL.getScaledPagingTouchSlop(viewConfiguration);
    }
}