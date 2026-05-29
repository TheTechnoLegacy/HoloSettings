package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.text.Layout;
import android.text.Layout.Alignment;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import com.android.internal.util.Preconditions;
import com.jellybyn.settings.DataUsageSummary;
import com.jellybyn.settings.R;

public class ChartGridView extends View {
    private Drawable mBorder;
    private ChartAxis mHoriz;
    private int mLabelColor;
    private Layout mLayoutEnd;
    private Layout mLayoutStart;
    private Drawable mPrimary;
    private Drawable mSecondary;
    private ChartAxis mVert;

    protected void onDraw(Canvas canvas) {
        int width = getWidth();
        int height = getHeight();
        Drawable secondary = this.mSecondary;
        int secondaryHeight = this.mSecondary.getIntrinsicHeight();
        for (float f : this.mVert.getTickPoints()) {
            secondary.setBounds(0, (int) f, width, (int) Math.min(((float) secondaryHeight) + f, (float) height));
            secondary.draw(canvas);
        }
        Drawable primary = this.mPrimary;
        int primaryWidth = this.mPrimary.getIntrinsicWidth();
        int primaryHeight = this.mPrimary.getIntrinsicHeight();
        for (float f2 : this.mHoriz.getTickPoints()) {
            primary.setBounds((int) f2, 0, (int) Math.min(((float) primaryWidth) + f2, (float) width), height);
            primary.draw(canvas);
        }
        this.mBorder.setBounds(0, 0, width, height);
        this.mBorder.draw(canvas);
        int height2 = this.mLayoutStart != null ? this.mLayoutStart.getHeight() / 8 : 0;
        Layout layout = this.mLayoutStart;
        if (layout != null) {
            canvas.save();
            canvas.translate(0.0f, (float) (height + height2));
            layout.draw(canvas);
            canvas.restore();
        }
        Layout layout2 = this.mLayoutEnd;
        if (layout2 != null) {
            canvas.save();
            canvas.translate((float) (width - layout2.getWidth()), (float) (height + height2));
            layout2.draw(canvas);
            canvas.restore();
        }
    }

    public ChartGridView(Context context, AttributeSet attributeSet, int i) {
        setWillNotDraw(false);
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.ChartGridView, i, 0);
        this.mPrimary = a.getDrawable(1);
        this.mSecondary = a.getDrawable(2);
        this.mBorder = a.getDrawable(3);
        this.mLabelColor = a.getColor(0, -65536);
        a.recycle();
    }

    private Layout makeLayout(CharSequence charSequence) {
        Resources res = getResources();
        TextPaint paint = new TextPaint(1);
        paint.density = res.getDisplayMetrics().density;
        paint.setCompatibilityScaling(res.getCompatibilityInfo().applicationScale);
        paint.setColor(this.mLabelColor);
        paint.setTextSize(TypedValue.applyDimension(2, 10.0f, res.getDisplayMetrics()));
        return new StaticLayout(charSequence, paint, (int) Math.ceil((double) Layout.getDesiredWidth(charSequence, paint)), Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
    }

    void setBounds(long j, long j2) {
        Context context = getContext();
        this.mLayoutStart = makeLayout(DataUsageSummary.formatDateRange(context, j, j));
        this.mLayoutEnd = makeLayout(DataUsageSummary.formatDateRange(context, j2, j2));
        invalidate();
    }

    void init(ChartAxis chartAxis, ChartAxis chartAxis2) {
        this.mHoriz = (ChartAxis) Preconditions.checkNotNull(chartAxis, "missing horiz");
        this.mVert = (ChartAxis) Preconditions.checkNotNull(chartAxis2, "missing vert");
    }

    public ChartGridView(Context context) {
        this(context, null, 0);
    }

    public ChartGridView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }
}