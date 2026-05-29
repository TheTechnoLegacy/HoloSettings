package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewDebug.ExportedProperty;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.android.internal.util.Preconditions;
import com.jellybyn.settings.R;

public class ChartView extends FrameLayout {
    private Rect mContent;
    ChartAxis mHoriz;
    @ExportedProperty
    private int mOptimalWidth;
    private float mOptimalWidthWeight;
    ChartAxis mVert;

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        this.mContent.set(getPaddingLeft(), getPaddingTop(), (i3 - i) - getPaddingRight(), (i4 - i2) - getPaddingBottom());
        int width = this.mContent.width();
        int height = this.mContent.height();
        this.mHoriz.setSize((float) width);
        this.mVert.setSize((float) height);
        Rect parentRect = new Rect();
        Rect childRect = new Rect();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            parentRect.set(this.mContent);
            if ((childAt instanceof ChartNetworkSeriesView) || (childAt instanceof ChartGridView)) {
                Gravity.apply(layoutParams.gravity, width, height, parentRect, childRect);
                childAt.layout(childRect.left, childRect.top, childRect.right, childRect.bottom);
            } else if (childAt instanceof ChartSweepView) {
                layoutSweep((ChartSweepView) childAt, parentRect, childRect);
                childAt.layout(childRect.left, childRect.top, childRect.right, childRect.bottom);
            }
        }
    }

    protected void layoutSweep(ChartSweepView chartSweepView, Rect rect, Rect rect2) {
        Rect sweepMargins = chartSweepView.getMargins();
        if (chartSweepView.getFollowAxis() == 1) {
            rect.top += sweepMargins.top + ((int) chartSweepView.getPoint());
            rect.bottom = rect.top;
            rect.left += sweepMargins.left;
            rect.right += sweepMargins.right;
            Gravity.apply(8388659, rect.width(), chartSweepView.getMeasuredHeight(), rect, rect2);
            return;
        }
        rect.left += sweepMargins.left + ((int) chartSweepView.getPoint());
        rect.right = rect.left;
        rect.top += sweepMargins.top;
        rect.bottom += sweepMargins.bottom;
        Gravity.apply(8388659, chartSweepView.getMeasuredWidth(), rect.height(), rect, rect2);
    }

    public ChartView(Context context, AttributeSet attributeSet, int i) {
        this.mOptimalWidth = -1;
        this.mOptimalWidthWeight = 0.0f;
        this.mContent = new Rect();
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.ChartView, i, 0);
        setOptimalWidth(a.getDimensionPixelSize(0, -1), a.getFloat(1, 0.0f));
        a.recycle();
        setClipToPadding(false);
        setClipChildren(false);
    }

    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        int slack = getMeasuredWidth() - this.mOptimalWidth;
        if (this.mOptimalWidth > 0 && slack > 0) {
            super.onMeasure(MeasureSpec.makeMeasureSpec((int) (((float) this.mOptimalWidth) + (((float) slack) * this.mOptimalWidthWeight)), 1073741824), i2);
        }
    }

    protected void layoutSweep(ChartSweepView chartSweepView) {
        Rect parentRect = new Rect(this.mContent);
        Rect childRect = new Rect();
        layoutSweep(chartSweepView, parentRect, childRect);
        chartSweepView.layout(childRect.left, childRect.top, childRect.right, childRect.bottom);
    }

    public void setOptimalWidth(int i, float f) {
        this.mOptimalWidth = i;
        this.mOptimalWidthWeight = f;
        requestLayout();
    }

    void init(ChartAxis chartAxis, ChartAxis chartAxis2) {
        this.mHoriz = (ChartAxis) Preconditions.checkNotNull(chartAxis, "missing horiz");
        this.mVert = (ChartAxis) Preconditions.checkNotNull(chartAxis2, "missing vert");
    }

    public ChartView(Context context) {
        this(context, null, 0);
    }

    public ChartView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }
}