package com.jellybyn.settings.deviceinfo;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.util.AttributeSet;
import android.view.View;
import com.jellybyn.settings.R;
import java.util.Collection;

public class PercentageBarChart extends View {
    private final Paint mEmptyPaint = new Paint();
    private Collection<Entry> mEntries;
    private int mMinTickWidth = 1;

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int left = getPaddingLeft();
        int right = getWidth() - getPaddingRight();
        int top = getPaddingTop();
        int bottom = getHeight() - getPaddingBottom();
        int width = right - left;
        float f;
        float lastX;
        if (isLayoutRtl()) {
            f = (float) right;
            if (this.mEntries != null) {
                for (Entry entry : this.mEntries) {
                    lastX = f - (entry.percentage == 0.0f ? 0.0f : Math.max((float) this.mMinTickWidth, ((float) width) * entry.percentage));
                    if (lastX < ((float) left)) {
                        canvas.drawRect((float) left, (float) top, f, (float) bottom, entry.paint);
                        return;
                    } else {
                        canvas.drawRect(lastX, (float) top, f, (float) bottom, entry.paint);
                        f = lastX;
                    }
                }
            }
            canvas.drawRect((float) left, (float) top, f, (float) bottom, this.mEmptyPaint);
            return;
        }
        lastX = (float) left;
        if (this.mEntries != null) {
            for (Entry entry2 : this.mEntries) {
                f = lastX + (entry2.percentage == 0.0f ? 0.0f : Math.max((float) this.mMinTickWidth, ((float) width) * entry2.percentage));
                if (f > ((float) right)) {
                    canvas.drawRect(lastX, (float) top, (float) right, (float) bottom, entry2.paint);
                    return;
                } else {
                    canvas.drawRect(lastX, (float) top, f, (float) bottom, entry2.paint);
                    lastX = f;
                }
            }
        }
        canvas.drawRect(lastX, (float) top, (float) right, (float) bottom, this.mEmptyPaint);
    }

    public PercentageBarChart(Context context, AttributeSet attributeSet) {
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.PercentageBarChart);
        this.mMinTickWidth = a.getDimensionPixelSize(1, 1);
        int emptyColor = a.getColor(0, -16777216);
        a.recycle();
        this.mEmptyPaint.setColor(emptyColor);
        this.mEmptyPaint.setStyle(Style.FILL);
    }

    public static Entry createEntry(int i, float f, int i2) {
        Paint p = new Paint();
        p.setColor(i2);
        p.setStyle(Style.FILL);
        return new Entry(i, f, p);
    }

    public void setBackgroundColor(int i) {
        this.mEmptyPaint.setColor(i);
    }

    public void setEntries(Collection<Entry> entries) {
        this.mEntries = entries;
    }
}