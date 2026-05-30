package com.jellybyn.settings.fuelgauge;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;

class BatteryHistoryChart$ChartData {
    int[] mColors;
    int mLastBin;
    int mNumTicks;
    Paint[] mPaints;
    int[] mTicks;

    void draw(Canvas canvas, int i, int i2) {
        int lastBin = 0;
        int lastX = 0;
        int bottom = i + i2;
        for (int i3 = 0; i3 < this.mNumTicks; i3++) {
            int i4 = this.mTicks[i3];
            int i5 = i4 & 65535;
            int i6 = (-65536 & i4) >> 16;
            if (lastBin != 0) {
                canvas.drawRect((float) lastX, (float) i, (float) i5, (float) bottom, this.mPaints[lastBin]);
            }
            lastBin = i6;
            lastX = i5;
        }
    }

    void setColors(int[] iArr) {
        this.mColors = iArr;
        this.mPaints = new Paint[iArr.length];
        for (int i = 0; i < iArr.length; i++) {
            this.mPaints[i] = new Paint();
            this.mPaints[i].setColor(iArr[i]);
            this.mPaints[i].setStyle(Style.FILL);
        }
    }

    void init(int i) {
        if (i > 0) {
            this.mTicks = new int[(i * 2)];
        } else {
            this.mTicks = null;
        }
        this.mNumTicks = 0;
        this.mLastBin = 0;
    }

    void addTick(int i, int i2) {
        if (i2 != this.mLastBin && this.mNumTicks < this.mTicks.length) {
            this.mTicks[this.mNumTicks] = (i2 << 16) | i;
            this.mNumTicks++;
            this.mLastBin = i2;
        }
    }

    void finish(int i) {
        if (this.mLastBin != 0) {
            addTick(i, 0);
        }
    }

    BatteryHistoryChart$ChartData() {
    }
}