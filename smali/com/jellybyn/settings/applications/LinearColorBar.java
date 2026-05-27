package com.jellybyn.settings.applications;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Shader.TileMode;
import android.util.AttributeSet;
import android.widget.LinearLayout;

public class LinearColorBar extends LinearLayout {
    final Paint mColorGradientPaint = new Paint();
    final Path mColorPath = new Path();
    final Paint mEdgeGradientPaint = new Paint();
    final Path mEdgePath = new Path();
    private float mGreenRatio;
    int mLastInterestingLeft;
    int mLastInterestingRight;
    int mLineWidth;
    final Paint mPaint = new Paint();
    final Rect mRect = new Rect();
    private float mRedRatio;
    private boolean mShowingGreen;
    private float mYellowRatio;

    protected void onDraw(Canvas canvas) {
        int indicatorLeft;
        int indicatorRight;
        super.onDraw(canvas);
        int width = getWidth();
        int left = 0;
        int right = 0 + ((int) (((float) width) * this.mRedRatio));
        int right2 = right + ((int) (((float) width) * this.mYellowRatio));
        int right3 = right2 + ((int) (((float) width) * this.mGreenRatio));
        if (this.mShowingGreen) {
            indicatorLeft = right2;
            indicatorRight = right3;
        } else {
            indicatorLeft = right;
            indicatorRight = right2;
        }
        if (!(this.mLastInterestingLeft == indicatorLeft && this.mLastInterestingRight == indicatorRight)) {
            this.mColorPath.reset();
            this.mEdgePath.reset();
            if (indicatorLeft < indicatorRight) {
                int i = this.mRect.top;
                this.mColorPath.moveTo((float) indicatorLeft, (float) this.mRect.top);
                this.mColorPath.cubicTo((float) indicatorLeft, 0.0f, -2.0f, (float) i, -2.0f, 0.0f);
                this.mColorPath.lineTo((float) ((width + 2) - 1), 0.0f);
                this.mColorPath.cubicTo((float) ((width + 2) - 1), (float) i, (float) indicatorRight, 0.0f, (float) indicatorRight, (float) this.mRect.top);
                this.mColorPath.close();
                float f = ((float) this.mLineWidth) + 0.5f;
                this.mEdgePath.moveTo(-2.0f + f, 0.0f);
                this.mEdgePath.cubicTo(-2.0f + f, (float) i, ((float) indicatorLeft) + f, 0.0f, ((float) indicatorLeft) + f, (float) this.mRect.top);
                this.mEdgePath.moveTo(((float) ((width + 2) - 1)) - f, 0.0f);
                this.mEdgePath.cubicTo(((float) ((width + 2) - 1)) - f, (float) i, ((float) indicatorRight) - f, 0.0f, ((float) indicatorRight) - f, (float) this.mRect.top);
            }
            this.mLastInterestingLeft = indicatorLeft;
            this.mLastInterestingRight = indicatorRight;
        }
        if (!this.mEdgePath.isEmpty()) {
            canvas.drawPath(this.mEdgePath, this.mEdgeGradientPaint);
            canvas.drawPath(this.mColorPath, this.mColorGradientPaint);
        }
        if (0 < right) {
            this.mRect.left = 0;
            this.mRect.right = right;
            this.mPaint.setColor(-16737844);
            canvas.drawRect(this.mRect, this.mPaint);
            width -= right - 0;
            left = right;
        }
        right = right2;
        if (left < right) {
            this.mRect.left = left;
            this.mRect.right = right;
            this.mPaint.setColor(-16737844);
            canvas.drawRect(this.mRect, this.mPaint);
            width -= right - left;
            left = right;
        }
        right = left + width;
        if (left < right) {
            this.mRect.left = left;
            this.mRect.right = right;
            this.mPaint.setColor(-7829368);
            canvas.drawRect(this.mRect, this.mPaint);
        }
    }

    public LinearColorBar(Context context, AttributeSet attributeSet) {
        setWillNotDraw(false);
        this.mPaint.setStyle(Style.FILL);
        this.mColorGradientPaint.setStyle(Style.FILL);
        this.mColorGradientPaint.setAntiAlias(true);
        this.mEdgeGradientPaint.setStyle(Style.STROKE);
        this.mLineWidth = getResources().getDisplayMetrics().densityDpi >= 240 ? 2 : 1;
        this.mEdgeGradientPaint.setStrokeWidth((float) this.mLineWidth);
        this.mEdgeGradientPaint.setAntiAlias(true);
    }

    private void updateIndicator() {
        int off = getPaddingTop() - getPaddingBottom();
        if (off < 0) {
            off = 0;
        }
        this.mRect.top = off;
        this.mRect.bottom = getHeight();
        if (this.mShowingGreen) {
            this.mColorGradientPaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) (off - 2), 8947848, -7829368, TileMode.CLAMP));
        } else {
            this.mColorGradientPaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) (off - 2), 39372, -16737844, TileMode.CLAMP));
        }
        this.mEdgeGradientPaint.setShader(new LinearGradient(0.0f, 0.0f, 0.0f, (float) (off / 2), 10526880, -6250336, TileMode.CLAMP));
    }

    public void setRatios(float f, float f2, float f3) {
        this.mRedRatio = f;
        this.mYellowRatio = f2;
        this.mGreenRatio = f3;
        invalidate();
    }

    public void setShowingGreen(boolean z) {
        if (this.mShowingGreen != z) {
            this.mShowingGreen = z;
            updateIndicator();
            invalidate();
        }
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        updateIndicator();
    }
}