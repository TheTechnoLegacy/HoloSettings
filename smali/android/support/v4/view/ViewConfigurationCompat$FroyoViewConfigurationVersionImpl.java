package android.support.v4.view;

import android.support.v4.view.ViewConfigurationCompat.ViewConfigurationVersionImpl;
import android.view.ViewConfiguration;

class ViewConfigurationCompat$FroyoViewConfigurationVersionImpl implements ViewConfigurationVersionImpl {
    ViewConfigurationCompat$FroyoViewConfigurationVersionImpl() {
    }

    public int getScaledPagingTouchSlop(ViewConfiguration viewConfiguration) {
        return ViewConfigurationCompatFroyo.getScaledPagingTouchSlop(viewConfiguration);
    }
}