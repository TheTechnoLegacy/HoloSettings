package android.support.v4.view;

import android.support.v4.view.VelocityTrackerCompat.VelocityTrackerVersionImpl;
import android.view.VelocityTracker;

class VelocityTrackerCompat$BaseVelocityTrackerVersionImpl implements VelocityTrackerVersionImpl {
    VelocityTrackerCompat$BaseVelocityTrackerVersionImpl() {
    }

    public float getXVelocity(VelocityTracker velocityTracker, int i) {
        return velocityTracker.getXVelocity();
    }
}