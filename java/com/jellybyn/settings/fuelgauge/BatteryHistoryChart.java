package com.jellybyn.settings.fuelgauge;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Typeface;
import android.os.BatteryStats;
import android.os.BatteryStats.HistoryItem;
import android.os.SystemClock;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import com.jellybyn.settings.R;
import com.jellybyn.settings.Utils;

public class BatteryHistoryChart extends View {
    final Path mBatCriticalPath = new Path();
    final Path mBatGoodPath = new Path();
    int mBatHigh;
    final Path mBatLevelPath = new Path();
    int mBatLow;
    final Path mBatWarnPath = new Path();
    final Paint mBatteryBackgroundPaint = new Paint(1);
    final Paint mBatteryCriticalPaint = new Paint(1);
    final Paint mBatteryGoodPaint = new Paint(1);
    final Paint mBatteryWarnPaint = new Paint(1);
    String mChargingLabel;
    int mChargingOffset;
    final Paint mChargingPaint = new Paint();
    final Path mChargingPath = new Path();
    String mDurationString;
    int mDurationStringWidth;
    String mGpsOnLabel;
    int mGpsOnOffset;
    final Paint mGpsOnPaint = new Paint();
    final Path mGpsOnPath = new Path();
    boolean mHaveGps;
    boolean mHavePhoneSignal;
    boolean mHaveWifi;
    long mHistEnd;
    long mHistStart;
    boolean mLargeMode;
    int mLevelBottom;
    int mLevelOffset;
    int mLevelTop;
    int mLineWidth;
    int mNumHist;
    final ChartData mPhoneSignalChart = new ChartData();
    String mPhoneSignalLabel;
    int mPhoneSignalOffset;
    String mScreenOnLabel;
    int mScreenOnOffset;
    final Paint mScreenOnPaint = new Paint();
    final Path mScreenOnPath = new Path();
    BatteryStats mStats;
    long mStatsPeriod;
    int mTextAscent;
    int mTextDescent;
    final TextPaint mTextPaint = new Paint(1);
    int mThinLineWidth;
    String mTotalDurationString;
    int mTotalDurationStringWidth;
    String mWakeLockLabel;
    int mWakeLockOffset;
    final Paint mWakeLockPaint = new Paint();
    final Path mWakeLockPath = new Path();
    String mWifiRunningLabel;
    int mWifiRunningOffset;
    final Paint mWifiRunningPaint = new Paint();
    final Path mWifiRunningPath = new Path();

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        int textHeight = this.mTextDescent - this.mTextAscent;
        this.mThinLineWidth = (int) TypedValue.applyDimension(1, 2.0f, getResources().getDisplayMetrics());
        if (i2 > textHeight * 6) {
            this.mLargeMode = true;
            if (i2 > textHeight * 15) {
                this.mLineWidth = textHeight / 2;
            } else {
                this.mLineWidth = textHeight / 3;
            }
            this.mLevelTop = this.mLineWidth + textHeight;
            this.mScreenOnPaint.setARGB(255, 32, 64, 255);
            this.mGpsOnPaint.setARGB(255, 32, 64, 255);
            this.mWifiRunningPaint.setARGB(255, 32, 64, 255);
            this.mWakeLockPaint.setARGB(255, 32, 64, 255);
        } else {
            this.mLargeMode = false;
            this.mLineWidth = this.mThinLineWidth;
            this.mLevelTop = 0;
            this.mScreenOnPaint.setARGB(255, 0, 0, 255);
            this.mGpsOnPaint.setARGB(255, 0, 0, 255);
            this.mWifiRunningPaint.setARGB(255, 0, 0, 255);
            this.mWakeLockPaint.setARGB(255, 0, 0, 255);
        }
        if (this.mLineWidth <= 0) {
            this.mLineWidth = 1;
        }
        this.mTextPaint.setStrokeWidth((float) this.mThinLineWidth);
        this.mBatteryGoodPaint.setStrokeWidth((float) this.mThinLineWidth);
        this.mBatteryWarnPaint.setStrokeWidth((float) this.mThinLineWidth);
        this.mBatteryCriticalPaint.setStrokeWidth((float) this.mThinLineWidth);
        this.mChargingPaint.setStrokeWidth((float) this.mLineWidth);
        this.mScreenOnPaint.setStrokeWidth((float) this.mLineWidth);
        this.mGpsOnPaint.setStrokeWidth((float) this.mLineWidth);
        this.mWifiRunningPaint.setStrokeWidth((float) this.mLineWidth);
        this.mWakeLockPaint.setStrokeWidth((float) this.mLineWidth);
        int i5;
        if (this.mLargeMode) {
            int i6 = textHeight + this.mLineWidth;
            this.mChargingOffset = this.mLineWidth;
            this.mScreenOnOffset = this.mChargingOffset + i6;
            this.mWakeLockOffset = this.mScreenOnOffset + i6;
            this.mWifiRunningOffset = this.mWakeLockOffset + i6;
            this.mGpsOnOffset = (this.mHaveWifi ? i6 : 0) + this.mWifiRunningOffset;
            this.mPhoneSignalOffset = (this.mHaveGps ? i6 : 0) + this.mGpsOnOffset;
            i5 = this.mPhoneSignalOffset;
            if (!this.mHavePhoneSignal) {
                i6 = 0;
            }
            this.mLevelOffset = (i5 + i6) + ((this.mLineWidth * 3) / 2);
            if (this.mHavePhoneSignal) {
                this.mPhoneSignalChart.init(i);
            }
        } else {
            i5 = this.mLineWidth;
            this.mWakeLockOffset = i5;
            this.mWifiRunningOffset = i5;
            this.mGpsOnOffset = i5;
            this.mScreenOnOffset = i5;
            this.mChargingOffset = this.mLineWidth * 2;
            this.mPhoneSignalOffset = 0;
            this.mLevelOffset = this.mLineWidth * 3;
            if (this.mHavePhoneSignal) {
                this.mPhoneSignalChart.init(0);
            }
        }
        this.mBatLevelPath.reset();
        this.mBatGoodPath.reset();
        this.mBatWarnPath.reset();
        this.mBatCriticalPath.reset();
        this.mScreenOnPath.reset();
        this.mGpsOnPath.reset();
        this.mWifiRunningPath.reset();
        this.mWakeLockPath.reset();
        this.mChargingPath.reset();
        long timeStart = this.mHistStart;
        long timeChange = this.mHistEnd - this.mHistStart;
        int batLow = this.mBatLow;
        int batChange = this.mBatHigh - this.mBatLow;
        int levelh = (i2 - this.mLevelOffset) - this.mLevelTop;
        this.mLevelBottom = this.mLevelTop + levelh;
        int x = 0;
        int startX = 0;
        int lastX = -1;
        int lastY = -1;
        int i7 = 0;
        Path curLevelPath = null;
        Path lastLinePath = null;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        boolean lastWifiRunning = false;
        boolean lastWakeLock = false;
        int N = this.mNumHist;
        if (this.mStats.startIteratingHistoryLocked()) {
            HistoryItem historyItem = new HistoryItem();
            while (this.mStats.getNextHistoryLocked(historyItem) && i7 < N) {
                if (historyItem.cmd == (byte) 1) {
                    x = (int) (((historyItem.time - timeStart) * ((long) i)) / timeChange);
                    int y = (this.mLevelTop + levelh) - (((historyItem.batteryLevel - batLow) * (levelh - 1)) / batChange);
                    if (!(lastX == x || lastY == y)) {
                        byte b = historyItem.batteryLevel;
                        Path path = b <= (byte) 14 ? this.mBatCriticalPath : b <= (byte) 29 ? this.mBatWarnPath : this.mBatGoodPath;
                        if (path != lastLinePath) {
                            if (lastLinePath != null) {
                                lastLinePath.lineTo((float) x, (float) y);
                            }
                            path.moveTo((float) x, (float) y);
                            lastLinePath = path;
                        } else {
                            path.lineTo((float) x, (float) y);
                        }
                        if (curLevelPath == null) {
                            curLevelPath = this.mBatLevelPath;
                            curLevelPath.moveTo((float) x, (float) y);
                            startX = x;
                        } else {
                            curLevelPath.lineTo((float) x, (float) y);
                        }
                        lastX = x;
                        lastY = y;
                    }
                    boolean z4 = (historyItem.states & 524288) != 0;
                    if (z4 != z) {
                        if (z4) {
                            this.mChargingPath.moveTo((float) x, (float) (i2 - this.mChargingOffset));
                        } else {
                            this.mChargingPath.lineTo((float) x, (float) (i2 - this.mChargingOffset));
                        }
                        z = z4;
                    }
                    boolean z5 = (historyItem.states & 1048576) != 0;
                    if (z5 != z2) {
                        if (z5) {
                            this.mScreenOnPath.moveTo((float) x, (float) (i2 - this.mScreenOnOffset));
                        } else {
                            this.mScreenOnPath.lineTo((float) x, (float) (i2 - this.mScreenOnOffset));
                        }
                        z2 = z5;
                    }
                    boolean z6 = (historyItem.states & 268435456) != 0;
                    if (z6 != z3) {
                        if (z6) {
                            this.mGpsOnPath.moveTo((float) x, (float) (i2 - this.mGpsOnOffset));
                        } else {
                            this.mGpsOnPath.lineTo((float) x, (float) (i2 - this.mGpsOnOffset));
                        }
                        z3 = z6;
                    }
                    boolean z7 = (historyItem.states & 67108864) != 0;
                    if (z7 != lastWifiRunning) {
                        if (z7) {
                            this.mWifiRunningPath.moveTo((float) x, (float) (i2 - this.mWifiRunningOffset));
                        } else {
                            this.mWifiRunningPath.lineTo((float) x, (float) (i2 - this.mWifiRunningOffset));
                        }
                        lastWifiRunning = z7;
                    }
                    boolean z8 = (historyItem.states & 1073741824) != 0;
                    if (z8 != lastWakeLock) {
                        if (z8) {
                            this.mWakeLockPath.moveTo((float) x, (float) (i2 - this.mWakeLockOffset));
                        } else {
                            this.mWakeLockPath.lineTo((float) x, (float) (i2 - this.mWakeLockOffset));
                        }
                        lastWakeLock = z8;
                    }
                    if (this.mLargeMode && this.mHavePhoneSignal) {
                        int i8 = ((historyItem.states & 3840) >> 8) == 3 ? 0 : (historyItem.states & 134217728) != 0 ? 1 : ((historyItem.states & 240) >> 4) + 2;
                        this.mPhoneSignalChart.addTick(x, i8);
                    }
                } else if (!(historyItem.cmd == (byte) 3 || curLevelPath == null)) {
                    finishPaths(x + 1, i2, levelh, startX, lastY, curLevelPath, lastX, z, z2, z3, lastWifiRunning, lastWakeLock, lastLinePath);
                    lastY = -1;
                    lastX = -1;
                    curLevelPath = null;
                    lastLinePath = null;
                    lastWakeLock = false;
                    z3 = false;
                    z2 = false;
                    z = false;
                }
                i7++;
            }
        }
        finishPaths(i, i2, levelh, startX, lastY, curLevelPath, lastX, z, z2, z3, lastWifiRunning, lastWakeLock, lastLinePath);
    }

    public BatteryHistoryChart(Context context, AttributeSet attributeSet) {
        int n;
        int i;
        int index;
        this.mBatteryBackgroundPaint.setARGB(255, 128, 128, 128);
        this.mBatteryBackgroundPaint.setStyle(Style.FILL);
        this.mBatteryGoodPaint.setARGB(128, 0, 255, 0);
        this.mBatteryGoodPaint.setStyle(Style.STROKE);
        this.mBatteryWarnPaint.setARGB(128, 255, 255, 0);
        this.mBatteryWarnPaint.setStyle(Style.STROKE);
        this.mBatteryCriticalPaint.setARGB(192, 255, 0, 0);
        this.mBatteryCriticalPaint.setStyle(Style.STROKE);
        this.mChargingPaint.setARGB(255, 0, 128, 0);
        this.mChargingPaint.setStyle(Style.STROKE);
        this.mScreenOnPaint.setStyle(Style.STROKE);
        this.mGpsOnPaint.setStyle(Style.STROKE);
        this.mWifiRunningPaint.setStyle(Style.STROKE);
        this.mWakeLockPaint.setStyle(Style.STROKE);
        int[] iArr = new int[7];
        this.mPhoneSignalChart.setColors(new int[]{0, -6291456, -6250496, -8355808, -8355776, -8355744, -16744448});
        this.mTextPaint.density = getResources().getDisplayMetrics().density;
        this.mTextPaint.setCompatibilityScaling(getResources().getCompatibilityInfo().applicationScale);
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.BatteryHistoryChart, 0, 0);
        ColorStateList textColor = null;
        int textSize = 15;
        int typefaceIndex = -1;
        int styleIndex = -1;
        TypedArray appearance = null;
        int ap = a.getResourceId(0, -1);
        if (ap != -1) {
            appearance = context.obtainStyledAttributes(ap, com.android.internal.R.styleable.TextAppearance);
        }
        if (appearance != null) {
            n = appearance.getIndexCount();
            for (i = 0; i < n; i++) {
                index = appearance.getIndex(i);
                switch (index) {
                    case 0:
                        textSize = appearance.getDimensionPixelSize(index, textSize);
                        break;
                    case 1:
                        typefaceIndex = appearance.getInt(index, -1);
                        break;
                    case 2:
                        styleIndex = appearance.getInt(index, -1);
                        break;
                    case 3:
                        textColor = appearance.getColorStateList(index);
                        break;
                    default:
                        break;
                }
            }
            appearance.recycle();
        }
        int shadowcolor = 0;
        float dx = 0.0f;
        float dy = 0.0f;
        float r = 0.0f;
        n = a.getIndexCount();
        for (i = 0; i < n; i++) {
            index = a.getIndex(i);
            switch (index) {
                case 1:
                    textSize = a.getDimensionPixelSize(index, textSize);
                    break;
                case 2:
                    typefaceIndex = a.getInt(index, typefaceIndex);
                    break;
                case 3:
                    styleIndex = a.getInt(index, styleIndex);
                    break;
                case 4:
                    textColor = a.getColorStateList(index);
                    break;
                case 5:
                    shadowcolor = a.getInt(index, 0);
                    break;
                case 6:
                    dx = a.getFloat(index, 0.0f);
                    break;
                case 7:
                    dy = a.getFloat(index, 0.0f);
                    break;
                case 8:
                    r = a.getFloat(index, 0.0f);
                    break;
                default:
                    break;
            }
        }
        a.recycle();
        this.mTextPaint.setColor(textColor.getDefaultColor());
        this.mTextPaint.setTextSize((float) textSize);
        Typeface tf = null;
        switch (typefaceIndex) {
            case 1:
                tf = Typeface.SANS_SERIF;
                break;
            case 2:
                tf = Typeface.SERIF;
                break;
            case 3:
                tf = Typeface.MONOSPACE;
                break;
        }
        setTypeface(tf, styleIndex);
        if (shadowcolor != 0) {
            this.mTextPaint.setShadowLayer(r, dx, dy, shadowcolor);
        }
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int width = getWidth();
        int height = getHeight();
        canvas.drawPath(this.mBatLevelPath, this.mBatteryBackgroundPaint);
        if (this.mLargeMode) {
            canvas.drawText(this.mDurationString, 0.0f, (float) ((-this.mTextAscent) + (this.mLineWidth / 2)), this.mTextPaint);
            canvas.drawText(this.mTotalDurationString, (float) ((width / 2) - (this.mTotalDurationStringWidth / 2)), (float) ((this.mLevelBottom - this.mTextAscent) + this.mThinLineWidth), this.mTextPaint);
        } else {
            canvas.drawText(this.mDurationString, (float) ((width / 2) - (this.mDurationStringWidth / 2)), (float) (((height / 2) - ((this.mTextDescent - this.mTextAscent) / 2)) - this.mTextAscent), this.mTextPaint);
        }
        if (!this.mBatGoodPath.isEmpty()) {
            canvas.drawPath(this.mBatGoodPath, this.mBatteryGoodPaint);
        }
        if (!this.mBatWarnPath.isEmpty()) {
            canvas.drawPath(this.mBatWarnPath, this.mBatteryWarnPaint);
        }
        if (!this.mBatCriticalPath.isEmpty()) {
            canvas.drawPath(this.mBatCriticalPath, this.mBatteryCriticalPaint);
        }
        if (this.mHavePhoneSignal) {
            this.mPhoneSignalChart.draw(canvas, (height - this.mPhoneSignalOffset) - (this.mLineWidth / 2), this.mLineWidth);
        }
        if (!this.mScreenOnPath.isEmpty()) {
            canvas.drawPath(this.mScreenOnPath, this.mScreenOnPaint);
        }
        if (!this.mChargingPath.isEmpty()) {
            canvas.drawPath(this.mChargingPath, this.mChargingPaint);
        }
        if (this.mHaveGps && !this.mGpsOnPath.isEmpty()) {
            canvas.drawPath(this.mGpsOnPath, this.mGpsOnPaint);
        }
        if (this.mHaveWifi && !this.mWifiRunningPath.isEmpty()) {
            canvas.drawPath(this.mWifiRunningPath, this.mWifiRunningPaint);
        }
        if (!this.mWakeLockPath.isEmpty()) {
            canvas.drawPath(this.mWakeLockPath, this.mWakeLockPaint);
        }
        if (this.mLargeMode) {
            if (this.mHavePhoneSignal) {
                canvas.drawText(this.mPhoneSignalLabel, 0.0f, (float) ((height - this.mPhoneSignalOffset) - this.mTextDescent), this.mTextPaint);
            }
            if (this.mHaveGps) {
                canvas.drawText(this.mGpsOnLabel, 0.0f, (float) ((height - this.mGpsOnOffset) - this.mTextDescent), this.mTextPaint);
            }
            if (this.mHaveWifi) {
                canvas.drawText(this.mWifiRunningLabel, 0.0f, (float) ((height - this.mWifiRunningOffset) - this.mTextDescent), this.mTextPaint);
            }
            canvas.drawText(this.mWakeLockLabel, 0.0f, (float) ((height - this.mWakeLockOffset) - this.mTextDescent), this.mTextPaint);
            canvas.drawText(this.mChargingLabel, 0.0f, (float) ((height - this.mChargingOffset) - this.mTextDescent), this.mTextPaint);
            canvas.drawText(this.mScreenOnLabel, 0.0f, (float) ((height - this.mScreenOnOffset) - this.mTextDescent), this.mTextPaint);
            canvas.drawLine(0.0f, (float) (this.mLevelBottom + (this.mThinLineWidth / 2)), (float) width, (float) (this.mLevelBottom + (this.mThinLineWidth / 2)), this.mTextPaint);
            canvas.drawLine(0.0f, (float) this.mLevelTop, 0.0f, (float) (this.mLevelBottom + (this.mThinLineWidth / 2)), this.mTextPaint);
            for (int i = 0; i < 10; i++) {
                int i2 = this.mLevelTop + (((this.mLevelBottom - this.mLevelTop) * i) / 10);
                canvas.drawLine(0.0f, (float) i2, (float) (this.mThinLineWidth * 2), (float) i2, this.mTextPaint);
            }
        }
    }

    void setStats(BatteryStats batteryStats) {
        this.mStats = batteryStats;
        this.mStatsPeriod = this.mStats.computeBatteryRealtime(SystemClock.elapsedRealtime() * 1000, 0);
        String durationString = Utils.formatElapsedTime(getContext(), (double) (this.mStatsPeriod / 1000));
        this.mDurationString = getContext().getString(2131428627, new Object[]{durationString});
        this.mChargingLabel = getContext().getString(2131428629);
        this.mScreenOnLabel = getContext().getString(2131428630);
        this.mGpsOnLabel = getContext().getString(2131428631);
        this.mWifiRunningLabel = getContext().getString(2131428632);
        this.mWakeLockLabel = getContext().getString(2131428633);
        this.mPhoneSignalLabel = getContext().getString(2131428634);
        int pos = 0;
        int lastInteresting = 0;
        byte lastLevel = (byte) -1;
        this.mBatLow = 0;
        this.mBatHigh = 100;
        int aggrStates = 0;
        boolean first = true;
        if (batteryStats.startIteratingHistoryLocked()) {
            HistoryItem historyItem = new HistoryItem();
            while (batteryStats.getNextHistoryLocked(historyItem)) {
                pos++;
                if (historyItem.cmd == (byte) 1) {
                    if (first) {
                        first = false;
                        this.mHistStart = historyItem.time;
                    }
                    if (historyItem.batteryLevel != lastLevel || pos == 1) {
                        lastLevel = historyItem.batteryLevel;
                    }
                    lastInteresting = pos;
                    this.mHistEnd = historyItem.time;
                    aggrStates |= historyItem.states;
                }
            }
        }
        this.mNumHist = lastInteresting;
        this.mHaveGps = (268435456 & aggrStates) != 0;
        this.mHaveWifi = (67108864 & aggrStates) != 0;
        if (!Utils.isWifiOnly(getContext())) {
            this.mHavePhoneSignal = true;
        }
        if (this.mHistEnd <= this.mHistStart) {
            this.mHistEnd = this.mHistStart + 1;
        }
        this.mTotalDurationString = Utils.formatElapsedTime(getContext(), (double) (this.mHistEnd - this.mHistStart));
    }

    void finishPaths(int i, int i2, int i3, int i4, int i5, Path path, int i6, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, Path path2) {
        if (path != null) {
            if (i6 >= 0 && i6 < i) {
                if (path2 != null) {
                    path2.lineTo((float) i, (float) i5);
                }
                path.lineTo((float) i, (float) i5);
            }
            path.lineTo((float) i, (float) (this.mLevelTop + i3));
            path.lineTo((float) i4, (float) (this.mLevelTop + i3));
            path.close();
        }
        if (z) {
            this.mChargingPath.lineTo((float) i, (float) (i2 - this.mChargingOffset));
        }
        if (z2) {
            this.mScreenOnPath.lineTo((float) i, (float) (i2 - this.mScreenOnOffset));
        }
        if (z3) {
            this.mGpsOnPath.lineTo((float) i, (float) (i2 - this.mGpsOnOffset));
        }
        if (z4) {
            this.mWifiRunningPath.lineTo((float) i, (float) (i2 - this.mWifiRunningOffset));
        }
        if (z5) {
            this.mWakeLockPath.lineTo((float) i, (float) (i2 - this.mWakeLockOffset));
        }
        if (this.mHavePhoneSignal) {
            this.mPhoneSignalChart.finish(i);
        }
    }

    public void setTypeface(Typeface typeface, int i) {
        boolean z = false;
        if (i > 0) {
            typeface = typeface == null ? Typeface.defaultFromStyle(i) : Typeface.create(typeface, i);
            this.mTextPaint.setTypeface(typeface);
            int style = i & ((typeface != null ? typeface.getStyle() : 0) ^ -1);
            TextPaint textPaint = this.mTextPaint;
            if ((style & 1) != 0) {
                z = true;
            }
            textPaint.setFakeBoldText(z);
            this.mTextPaint.setTextSkewX((style & 2) != 0 ? -0.25f : 0.0f);
            return;
        }
        this.mTextPaint.setFakeBoldText(false);
        this.mTextPaint.setTextSkewX(0.0f);
        this.mTextPaint.setTypeface(typeface);
    }

    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        this.mDurationStringWidth = (int) this.mTextPaint.measureText(this.mDurationString);
        this.mTotalDurationStringWidth = (int) this.mTextPaint.measureText(this.mTotalDurationString);
        this.mTextAscent = (int) this.mTextPaint.ascent();
        this.mTextDescent = (int) this.mTextPaint.descent();
    }
}