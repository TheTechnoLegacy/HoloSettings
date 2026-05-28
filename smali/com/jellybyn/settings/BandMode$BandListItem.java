package com.jellybyn.settings;

class BandMode$BandListItem {
    private int mBandMode = 0;

    public BandMode$BandListItem(int i) {
        this.mBandMode = i;
    }

    public int getBand() {
        return this.mBandMode;
    }

    public String toString() {
        return BandMode.access$300()[this.mBandMode];
    }
}