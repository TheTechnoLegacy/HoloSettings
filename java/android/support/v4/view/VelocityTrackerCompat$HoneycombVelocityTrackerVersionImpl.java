package android.support.v4.view;

import android.support.v4.view.VelocityTrackerCompat.VelocityTrackerVersionImpl;
import android.view.VelocityTracker;

class VelocityTrackerCompat$HoneycombVelocityTrackerVersionImpl implements VelocityTrackerVersionImpl {
    VelocityTrackerCompat$HoneycombVelocityTrackerVersionImpl() {
    }

    public float getXVelocity(VelocityTracker velocityTracker, int i) {
        return VelocityTrackerCompatHoneycomb.getXVelocity(velocityTracker, i);
    }
}