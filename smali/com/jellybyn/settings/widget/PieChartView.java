package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.google.android.collect.Lists;
import java.util.ArrayList;
import java.util.Iterator;

public class PieChartView extends View {
    private Matrix mMatrix;
    private int mOriginAngle;
    private Paint mPaintOutline;
    private Path mPathOutline;
    private Path mPathSide;
    private Path mPathSideOutline;
    private int mSideWidth;
    private ArrayList<Slice> mSlices;

    public void generatePath() {
        Slice slice;
        long total = 0;
        Iterator i$ = this.mSlices.iterator();
        while (i$.hasNext()) {
            slice = (Slice) i$.next();
            slice.path.reset();
            slice.pathSide.reset();
            slice.pathOutline.reset();
            total += slice.value;
        }
        this.mPathSide.reset();
        this.mPathSideOutline.reset();
        this.mPathOutline.reset();
        if (total == 0) {
            invalidate();
            return;
        }
        RectF rect = new RectF(0.0f, 0.0f, (float) getWidth(), (float) getHeight());
        RectF rectSide = new RectF();
        rectSide.set(rect);
        rectSide.offset((float) (-this.mSideWidth), 0.0f);
        this.mPathSide.addOval(rectSide, Direction.CW);
        this.mPathSideOutline.addOval(rectSide, Direction.CW);
        this.mPathOutline.addOval(rect, Direction.CW);
        int startAngle = this.mOriginAngle;
        i$ = this.mSlices.iterator();
        while (i$.hasNext()) {
            slice = (Slice) i$.next();
            int i = (int) ((slice.value * 360) / total);
            int i2 = startAngle + i;
            float f = (float) (startAngle % 360);
            float f2 = (float) (i2 % 360);
            Object obj = (f <= 90.0f || f >= 270.0f) ? null : 1;
            Object obj2 = (f2 <= 90.0f || f2 >= 270.0f) ? null : 1;
            slice.path.moveTo(rect.centerX(), rect.centerY());
            slice.path.arcTo(rect, (float) startAngle, (float) i);
            slice.path.lineTo(rect.centerX(), rect.centerY());
            if (!(obj == null && obj2 == null)) {
                float f3 = obj != null ? (float) startAngle : 450.0f;
                float f4 = obj2 != null ? (float) i2 : 270.0f;
                float f5 = f4 - f3;
                slice.pathSide.moveTo(rect.centerX(), rect.centerY());
                slice.pathSide.arcTo(rect, f3, 0.0f);
                slice.pathSide.rLineTo((float) (-this.mSideWidth), 0.0f);
                slice.pathSide.arcTo(rectSide, f3, f5);
                slice.pathSide.rLineTo((float) this.mSideWidth, 0.0f);
                slice.pathSide.arcTo(rect, f4, -f5);
            }
            slice.pathOutline.moveTo(rect.centerX(), rect.centerY());
            slice.pathOutline.arcTo(rect, (float) startAngle, 0.0f);
            if (obj != null) {
                slice.pathOutline.rLineTo((float) (-this.mSideWidth), 0.0f);
            }
            slice.pathOutline.moveTo(rect.centerX(), rect.centerY());
            slice.pathOutline.arcTo(rect, (float) (startAngle + i), 0.0f);
            if (obj2 != null) {
                slice.pathOutline.rLineTo((float) (-this.mSideWidth), 0.0f);
            }
            startAngle += i;
        }
        invalidate();
    }

    public PieChartView(Context context, AttributeSet attributeSet, int i) {
        this.mSlices = Lists.newArrayList();
        this.mMatrix = new Matrix();
        this.mPaintOutline = new Paint();
        this.mPathSide = new Path();
        this.mPathSideOutline = new Path();
        this.mPathOutline = new Path();
        this.mPaintOutline.setColor(-16777216);
        this.mPaintOutline.setStyle(Style.STROKE);
        this.mPaintOutline.setStrokeWidth(3.0f * getResources().getDisplayMetrics().density);
        this.mPaintOutline.setAntiAlias(true);
        this.mSideWidth = (int) (20.0f * getResources().getDisplayMetrics().density);
        setWillNotDraw(false);
    }

    protected void onDraw(Canvas canvas) {
        Slice slice;
        canvas.concat(this.mMatrix);
        Iterator i$ = this.mSlices.iterator();
        while (i$.hasNext()) {
            slice = (Slice) i$.next();
            canvas.drawPath(slice.pathSide, slice.paint);
        }
        canvas.drawPath(this.mPathSideOutline, this.mPaintOutline);
        i$ = this.mSlices.iterator();
        while (i$.hasNext()) {
            slice = (Slice) i$.next();
            canvas.drawPath(slice.path, slice.paint);
            canvas.drawPath(slice.pathOutline, this.mPaintOutline);
        }
        canvas.drawPath(this.mPathOutline, this.mPaintOutline);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        float centerX = (float) (getWidth() / 2);
        float centerY = (float) (getHeight() / 2);
        this.mMatrix.reset();
        this.mMatrix.postScale(0.665f, 0.95f, centerX, centerY);
        this.mMatrix.postRotate(-40.0f, centerX, centerY);
        generatePath();
    }

    private static Paint buildFillPaint(int i, Resources resources) {
        Paint paint = new Paint();
        paint.setColor(i);
        paint.setStyle(Style.FILL_AND_STROKE);
        paint.setAntiAlias(true);
        return paint;
    }

    public PieChartView(Context context) {
        this(context, null);
    }

    public PieChartView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public void addSlice(long j, int i) {
        this.mSlices.add(new Slice(this, j, i));
    }

    public void removeAllSlices() {
        this.mSlices.clear();
    }

    public void setOriginAngle(int i) {
        this.mOriginAngle = i;
    }
}