package android.support.v4.view;

import android.support.v4.view.ViewConfigurationCompat.ViewConfigurationVersionImpl;
import android.view.ViewConfiguration;

class ViewConfigurationCompat$BaseViewConfigurationVersionImpl implements ViewConfigurationVersionImpl {
    ViewConfigurationCompat$BaseViewConfigurationVersionImpl() {
    }

    public int getScaledPagingTouchSlop(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledTouchSlop();
    }
}