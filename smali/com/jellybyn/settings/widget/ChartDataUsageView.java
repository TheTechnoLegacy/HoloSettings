package com.jellybyn.settings.widget;

import android.content.Context;
import android.net.NetworkPolicy;
import android.net.NetworkStatsHistory;
import android.os.Handler;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.jellybyn.settings.widget.ChartSweepView.OnSweepListener;

public class ChartDataUsageView extends ChartView {
    private ChartNetworkSeriesView mDetailSeries;
    private ChartGridView mGrid;
    private Handler mHandler;
    private NetworkStatsHistory mHistory;
    private OnSweepListener mHorizListener;
    private DataUsageChartListener mListener;
    private ChartNetworkSeriesView mSeries;
    private ChartSweepView mSweepLeft;
    private ChartSweepView mSweepLimit;
    private ChartSweepView mSweepRight;
    private ChartSweepView mSweepWarning;
    private OnSweepListener mVertListener;
    private long mVertMax;

    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mGrid = (ChartGridView) findViewById(2131230789);
        this.mSeries = (ChartNetworkSeriesView) findViewById(2131230790);
        this.mDetailSeries = (ChartNetworkSeriesView) findViewById(2131230791);
        this.mDetailSeries.setVisibility(8);
        this.mSweepLeft = (ChartSweepView) findViewById(2131230792);
        this.mSweepRight = (ChartSweepView) findViewById(2131230793);
        this.mSweepLimit = (ChartSweepView) findViewById(2131230795);
        this.mSweepWarning = (ChartSweepView) findViewById(2131230794);
        this.mSweepLeft.setValidRangeDynamic(null, this.mSweepRight);
        this.mSweepRight.setValidRangeDynamic(this.mSweepLeft, null);
        this.mSweepWarning.setValidRangeDynamic(null, this.mSweepLimit);
        this.mSweepLimit.setValidRangeDynamic(this.mSweepWarning, null);
        this.mSweepLeft.setNeighbors(new ChartSweepView[]{this.mSweepRight});
        this.mSweepRight.setNeighbors(new ChartSweepView[]{this.mSweepLeft});
        this.mSweepLimit.setNeighbors(new ChartSweepView[]{this.mSweepWarning, this.mSweepLeft, this.mSweepRight});
        this.mSweepWarning.setNeighbors(new ChartSweepView[]{this.mSweepLimit, this.mSweepLeft, this.mSweepRight});
        this.mSweepLeft.addOnSweepListener(this.mHorizListener);
        this.mSweepRight.addOnSweepListener(this.mHorizListener);
        this.mSweepWarning.addOnSweepListener(this.mVertListener);
        this.mSweepLimit.addOnSweepListener(this.mVertListener);
        this.mSweepWarning.setDragInterval(5242880);
        this.mSweepLimit.setDragInterval(5242880);
        this.mSweepLeft.setClickable(false);
        this.mSweepLeft.setFocusable(false);
        this.mSweepRight.setClickable(false);
        this.mSweepRight.setFocusable(false);
        this.mGrid.init(this.mHoriz, this.mVert);
        this.mSeries.init(this.mHoriz, this.mVert);
        this.mDetailSeries.init(this.mHoriz, this.mVert);
        this.mSweepLeft.init(this.mHoriz);
        this.mSweepRight.init(this.mHoriz);
        this.mSweepWarning.init(this.mVert);
        this.mSweepLimit.init(this.mVert);
        setActivated(false);
    }

    private void updateVertAxisBounds(ChartSweepView chartSweepView) {
        long max = this.mVertMax;
        long newMax = 0;
        if (chartSweepView != null) {
            int adjustAxis = chartSweepView.shouldAdjustAxis();
            newMax = adjustAxis > 0 ? (11 * max) / 10 : adjustAxis < 0 ? (9 * max) / 10 : max;
        }
        newMax = Math.max(Math.max((Math.max(Math.max(this.mSeries.getMaxVisible(), this.mDetailSeries.getMaxVisible()), Math.max(this.mSweepWarning.getValue(), this.mSweepLimit.getValue())) * 12) / 10, 52428800), newMax);
        if (newMax != this.mVertMax) {
            this.mVertMax = newMax;
            boolean bounds = this.mVert.setBounds(0, newMax);
            this.mSweepWarning.setValidRange(0, newMax);
            this.mSweepLimit.setValidRange(0, newMax);
            if (bounds) {
                this.mSeries.invalidatePath();
                this.mDetailSeries.invalidatePath();
            }
            this.mGrid.invalidate();
            if (chartSweepView != null) {
                chartSweepView.updateValueFromPosition();
            }
            if (this.mSweepLimit != chartSweepView) {
                layoutSweep(this.mSweepLimit);
            }
            if (this.mSweepWarning != chartSweepView) {
                layoutSweep(this.mSweepWarning);
            }
        }
    }

    public void setVisibleRange(long j, long j2) {
        boolean changed = this.mHoriz.setBounds(j, j2);
        this.mGrid.setBounds(j, j2);
        this.mSeries.setBounds(j, j2);
        this.mDetailSeries.setBounds(j, j2);
        long historyStart = getHistoryStart();
        long historyEnd = getHistoryEnd();
        long validStart;
        if (historyStart == Long.MAX_VALUE) {
            validStart = j;
        } else {
            validStart = Math.max(j, historyStart);
        }
        long min = historyEnd == Long.MIN_VALUE ? j2 : Math.min(j2, historyEnd);
        this.mSweepLeft.setValidRange(j, j2);
        this.mSweepRight.setValidRange(j, j2);
        long j3 = (j2 + j) / 2;
        long j4 = min;
        this.mSweepLeft.setValue(Math.max(j, j4 - 604800000));
        this.mSweepRight.setValue(j4);
        requestLayout();
        if (changed) {
            this.mSeries.invalidatePath();
            this.mDetailSeries.invalidatePath();
        }
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
    }

    public void bindNetworkPolicy(NetworkPolicy networkPolicy) {
        if (networkPolicy == null) {
            this.mSweepLimit.setVisibility(4);
            this.mSweepLimit.setValue(-1);
            this.mSweepWarning.setVisibility(4);
            this.mSweepWarning.setValue(-1);
            return;
        }
        if (networkPolicy.limitBytes != -1) {
            this.mSweepLimit.setVisibility(0);
            this.mSweepLimit.setEnabled(true);
            this.mSweepLimit.setValue(networkPolicy.limitBytes);
        } else {
            this.mSweepLimit.setVisibility(0);
            this.mSweepLimit.setEnabled(false);
            this.mSweepLimit.setValue(-1);
        }
        if (networkPolicy.warningBytes != -1) {
            this.mSweepWarning.setVisibility(0);
            this.mSweepWarning.setValue(networkPolicy.warningBytes);
        } else {
            this.mSweepWarning.setVisibility(4);
            this.mSweepWarning.setValue(-1);
        }
        updateVertAxisBounds(null);
        requestLayout();
        invalidate();
    }

    private void updateEstimateVisible() {
        long maxEstimate = this.mSeries.getMaxEstimate();
        long interestLine = Long.MAX_VALUE;
        if (this.mSweepWarning.isEnabled()) {
            interestLine = this.mSweepWarning.getValue();
        } else if (this.mSweepLimit.isEnabled()) {
            interestLine = this.mSweepLimit.getValue();
        }
        if (interestLine < 0) {
            interestLine = Long.MAX_VALUE;
        }
        this.mSeries.setEstimateVisible(maxEstimate >= (7 * interestLine) / 10);
    }

    public void bindDetailNetworkStats(NetworkStatsHistory networkStatsHistory) {
        this.mDetailSeries.bindNetworkStats(networkStatsHistory);
        this.mDetailSeries.setVisibility(networkStatsHistory != null ? 0 : 8);
        if (this.mHistory != null) {
            this.mDetailSeries.setEndTime(this.mHistory.getEnd());
        }
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
        requestLayout();
    }

    private static long roundUpToPowerOfTwo(long j) {
        j--;
        j |= j >>> 1;
        j |= j >>> 2;
        j |= j >>> 4;
        j |= j >>> 8;
        j |= j >>> 16;
        j = (j | (j >>> 32)) + 1;
        return j > 0 ? j : Long.MAX_VALUE;
    }

    private static void setText(SpannableStringBuilder spannableStringBuilder, Object obj, CharSequence charSequence, String str) {
        int start = spannableStringBuilder.getSpanStart(obj);
        int end = spannableStringBuilder.getSpanEnd(obj);
        if (start == -1) {
            start = TextUtils.indexOf(spannableStringBuilder, str);
            end = start + str.length();
            spannableStringBuilder.setSpan(obj, start, end, 18);
        }
        spannableStringBuilder.replace(start, end, charSequence);
    }

    private void updatePrimaryRange() {
        long left = this.mSweepLeft.getValue();
        long right = this.mSweepRight.getValue();
        if (this.mDetailSeries.getVisibility() == 0) {
            this.mDetailSeries.setPrimaryRange(left, right);
            this.mSeries.setPrimaryRange(0, 0);
            return;
        }
        this.mSeries.setPrimaryRange(left, right);
    }

    public void bindNetworkStats(NetworkStatsHistory networkStatsHistory) {
        this.mSeries.bindNetworkStats(networkStatsHistory);
        this.mHistory = networkStatsHistory;
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
        requestLayout();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (isActivated()) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                return true;
            case 1:
                setActivated(true);
                return true;
            default:
                return false;
        }
    }

    public ChartDataUsageView(Context context, AttributeSet attributeSet, int i) {
        this.mHorizListener = new 2(this);
        this.mVertListener = new 3(this);
        init(new TimeAxis(), new InvertedChartAxis(new DataAxis()));
        this.mHandler = new 1(this);
    }

    private void sendUpdateAxisDelayed(ChartSweepView chartSweepView, boolean z) {
        if (z || !this.mHandler.hasMessages(100, chartSweepView)) {
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(100, chartSweepView), 250);
        }
    }

    public ChartDataUsageView(Context context) {
        this(context, null, 0);
    }

    public ChartDataUsageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    private void clearUpdateAxisDelayed(ChartSweepView chartSweepView) {
        this.mHandler.removeMessages(100, chartSweepView);
    }

    public void setListener(DataUsageChartListener dataUsageChartListener) {
        this.mListener = dataUsageChartListener;
    }

    private long getHistoryEnd() {
        return this.mHistory != null ? this.mHistory.getEnd() : Long.MIN_VALUE;
    }

    private long getHistoryStart() {
        return this.mHistory != null ? this.mHistory.getStart() : Long.MAX_VALUE;
    }

    public long getInspectEnd() {
        return this.mSweepRight.getValue();
    }

    public long getInspectStart() {
        return this.mSweepLeft.getValue();
    }

    public long getLimitBytes() {
        return this.mSweepLimit.getLabelValue();
    }

    public long getWarningBytes() {
        return this.mSweepWarning.getLabelValue();
    }
}