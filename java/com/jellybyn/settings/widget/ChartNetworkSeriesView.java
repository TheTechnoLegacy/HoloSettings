package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.net.NetworkStatsHistory;
import android.net.NetworkStatsHistory.Entry;
import android.util.AttributeSet;
import android.view.View;
import com.android.internal.util.Preconditions;
import com.jellybyn.settings.R;

public class ChartNetworkSeriesView extends View {
    private long mEnd;
    private long mEndTime;
    private boolean mEstimateVisible;
    private ChartAxis mHoriz;
    private long mMax;
    private long mMaxEstimate;
    private Paint mPaintEstimate;
    private Paint mPaintFill;
    private Paint mPaintFillSecondary;
    private Paint mPaintStroke;
    private Path mPathEstimate;
    private Path mPathFill;
    private Path mPathStroke;
    private boolean mPathValid;
    private long mPrimaryLeft;
    private long mPrimaryRight;
    private long mStart;
    private NetworkStatsHistory mStats;
    private ChartAxis mVert;

    private void generatePath() {
        this.mMax = 0;
        this.mPathStroke.reset();
        this.mPathFill.reset();
        this.mPathEstimate.reset();
        this.mPathValid = true;
        if (this.mStats != null && this.mStats.size() >= 2) {
            int width = getWidth();
            int height = getHeight();
            float lastX = 0.0f;
            float lastY = (float) height;
            long lastTime = this.mHoriz.convertToValue(0.0f);
            this.mPathStroke.moveTo(0.0f, lastY);
            this.mPathFill.moveTo(0.0f, lastY);
            long totalData = 0;
            Entry entry = null;
            int start = this.mStats.getIndexBefore(this.mStart);
            int end = this.mStats.getIndexAfter(this.mEnd);
            for (int i = start; i <= end; i++) {
                entry = this.mStats.getValues(i, entry);
                long j = entry.bucketStart;
                long j2 = j + entry.bucketDuration;
                float convertToPoint = this.mHoriz.convertToPoint(j);
                float convertToPoint2 = this.mHoriz.convertToPoint(j2);
                if (convertToPoint2 >= 0.0f) {
                    totalData += entry.rxBytes + entry.txBytes;
                    float f = lastY;
                    float convertToPoint3 = this.mVert.convertToPoint(totalData);
                    if (lastTime != j) {
                        this.mPathStroke.lineTo(convertToPoint, f);
                        this.mPathFill.lineTo(convertToPoint, f);
                    }
                    this.mPathStroke.lineTo(convertToPoint2, convertToPoint3);
                    this.mPathFill.lineTo(convertToPoint2, convertToPoint3);
                    lastX = convertToPoint2;
                    lastY = convertToPoint3;
                    lastTime = j2;
                }
            }
            if (lastTime < this.mEndTime) {
                lastX = this.mHoriz.convertToPoint(this.mEndTime);
                this.mPathStroke.lineTo(lastX, lastY);
                this.mPathFill.lineTo(lastX, lastY);
            }
            this.mPathFill.lineTo(lastX, (float) height);
            this.mPathFill.lineTo(0.0f, (float) height);
            this.mMax = totalData;
            invalidate();
        }
    }

    protected void onDraw(Canvas canvas) {
        int save;
        if (!this.mPathValid) {
            generatePath();
        }
        float primaryLeftPoint = this.mHoriz.convertToPoint(this.mPrimaryLeft);
        float primaryRightPoint = this.mHoriz.convertToPoint(this.mPrimaryRight);
        if (this.mEstimateVisible) {
            save = canvas.save();
            canvas.clipRect(0, 0, getWidth(), getHeight());
            canvas.drawPath(this.mPathEstimate, this.mPaintEstimate);
            canvas.restoreToCount(save);
        }
        save = canvas.save();
        canvas.clipRect(0.0f, 0.0f, primaryLeftPoint, (float) getHeight());
        canvas.drawPath(this.mPathFill, this.mPaintFillSecondary);
        canvas.restoreToCount(save);
        save = canvas.save();
        canvas.clipRect(primaryRightPoint, 0.0f, (float) getWidth(), (float) getHeight());
        canvas.drawPath(this.mPathFill, this.mPaintFillSecondary);
        canvas.restoreToCount(save);
        save = canvas.save();
        canvas.clipRect(primaryLeftPoint, 0.0f, primaryRightPoint, (float) getHeight());
        canvas.drawPath(this.mPathFill, this.mPaintFill);
        canvas.drawPath(this.mPathStroke, this.mPaintStroke);
        canvas.restoreToCount(save);
    }

    public void setChartColor(int i, int i2, int i3) {
        this.mPaintStroke = new Paint();
        this.mPaintStroke.setStrokeWidth(4.0f * getResources().getDisplayMetrics().density);
        this.mPaintStroke.setColor(i);
        this.mPaintStroke.setStyle(Style.STROKE);
        this.mPaintStroke.setAntiAlias(true);
        this.mPaintFill = new Paint();
        this.mPaintFill.setColor(i2);
        this.mPaintFill.setStyle(Style.FILL);
        this.mPaintFill.setAntiAlias(true);
        this.mPaintFillSecondary = new Paint();
        this.mPaintFillSecondary.setColor(i3);
        this.mPaintFillSecondary.setStyle(Style.FILL);
        this.mPaintFillSecondary.setAntiAlias(true);
        this.mPaintEstimate = new Paint();
        this.mPaintEstimate.setStrokeWidth(3.0f);
        this.mPaintEstimate.setColor(i3);
        this.mPaintEstimate.setStyle(Style.STROKE);
        this.mPaintEstimate.setAntiAlias(true);
        this.mPaintEstimate.setPathEffect(new DashPathEffect(new float[]{10.0f, 10.0f}, 1.0f));
    }

    public ChartNetworkSeriesView(Context context, AttributeSet attributeSet, int i) {
        this.mEndTime = Long.MIN_VALUE;
        this.mPathValid = false;
        this.mEstimateVisible = false;
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.ChartNetworkSeriesView, i, 0);
        setChartColor(a.getColor(0, -65536), a.getColor(1, -65536), a.getColor(2, -65536));
        setWillNotDraw(false);
        a.recycle();
        this.mPathStroke = new Path();
        this.mPathFill = new Path();
        this.mPathEstimate = new Path();
    }

    public long getMaxVisible() {
        long j = this.mEstimateVisible ? this.mMaxEstimate : this.mMax;
        if (j > 0 || this.mStats == null) {
            return j;
        }
        Entry values = this.mStats.getValues(this.mStart, this.mEnd, null);
        return values.rxBytes + values.txBytes;
    }

    public void bindNetworkStats(NetworkStatsHistory networkStatsHistory) {
        this.mStats = networkStatsHistory;
        invalidatePath();
        invalidate();
    }

    public void invalidatePath() {
        this.mPathValid = false;
        this.mMax = 0;
        invalidate();
    }

    public void setPrimaryRange(long j, long j2) {
        this.mPrimaryLeft = j;
        this.mPrimaryRight = j2;
        invalidate();
    }

    void init(ChartAxis chartAxis, ChartAxis chartAxis2) {
        this.mHoriz = (ChartAxis) Preconditions.checkNotNull(chartAxis, "missing horiz");
        this.mVert = (ChartAxis) Preconditions.checkNotNull(chartAxis2, "missing vert");
    }

    public void setBounds(long j, long j2) {
        this.mStart = j;
        this.mEnd = j2;
    }

    public void setEstimateVisible(boolean z) {
        this.mEstimateVisible = false;
        invalidate();
    }

    public ChartNetworkSeriesView(Context context) {
        this(context, null, 0);
    }

    public ChartNetworkSeriesView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public void setEndTime(long j) {
        this.mEndTime = j;
    }

    public long getMaxEstimate() {
        return this.mMaxEstimate;
    }
}