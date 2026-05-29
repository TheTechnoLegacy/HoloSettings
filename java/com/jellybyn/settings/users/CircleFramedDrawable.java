package com.jellybyn.settings.users;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

class CircleFramedDrawable extends Drawable {
    private final Bitmap mBitmap = Bitmap.createBitmap(this.mSize, this.mSize, Config.ARGB_8888);
    private RectF mDstRect;
    private final int mFrameColor;
    private Path mFramePath;
    private RectF mFrameRect;
    private final int mFrameShadowColor;
    private final int mHighlightColor;
    private final Paint mPaint;
    private boolean mPressed;
    private float mScale;
    private final float mShadowRadius;
    private final int mSize;
    private Rect mSrcRect;
    private final float mStrokeWidth;

    public CircleFramedDrawable(Bitmap bitmap, int i, int i2, float f, int i3, float f2, int i4) {
        this.mSize = i;
        this.mShadowRadius = f2;
        this.mFrameColor = i2;
        this.mFrameShadowColor = i3;
        this.mStrokeWidth = f;
        this.mHighlightColor = i4;
        Canvas canvas = new Canvas(this.mBitmap);
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        int square = Math.min(width, height);
        Rect cropRect = new Rect((width - square) / 2, (height - square) / 2, square, square);
        RectF circleRect = new RectF(0.0f, 0.0f, (float) this.mSize, (float) this.mSize);
        circleRect.inset(this.mStrokeWidth / 2.0f, this.mStrokeWidth / 2.0f);
        circleRect.inset(this.mShadowRadius, this.mShadowRadius);
        Path fillPath = new Path();
        fillPath.addArc(circleRect, 0.0f, 360.0f);
        canvas.drawColor(0, Mode.CLEAR);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setColor(-16777216);
        this.mPaint.setStyle(Style.FILL);
        canvas.drawPath(fillPath, this.mPaint);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.SRC_ATOP));
        canvas.drawBitmap(bitmap, cropRect, circleRect, this.mPaint);
        this.mPaint.setXfermode(null);
        this.mScale = 1.0f;
        this.mSrcRect = new Rect(0, 0, this.mSize, this.mSize);
        this.mDstRect = new RectF(0.0f, 0.0f, (float) this.mSize, (float) this.mSize);
        this.mFrameRect = new RectF(this.mDstRect);
        this.mFramePath = new Path();
    }

    public void draw(Canvas canvas) {
        float pad = (((float) this.mSize) - (this.mScale * ((float) this.mSize))) / 2.0f;
        this.mDstRect.set(pad, pad, ((float) this.mSize) - pad, ((float) this.mSize) - pad);
        canvas.drawBitmap(this.mBitmap, this.mSrcRect, this.mDstRect, null);
        this.mFrameRect.set(this.mDstRect);
        this.mFrameRect.inset(this.mStrokeWidth / 2.0f, this.mStrokeWidth / 2.0f);
        this.mFrameRect.inset(this.mShadowRadius, this.mShadowRadius);
        this.mFramePath.reset();
        this.mFramePath.addArc(this.mFrameRect, 0.0f, 360.0f);
        if (this.mPressed) {
            this.mPaint.setStyle(Style.FILL);
            this.mPaint.setColor(Color.argb(84, Color.red(this.mHighlightColor), Color.green(this.mHighlightColor), Color.blue(this.mHighlightColor)));
            canvas.drawPath(this.mFramePath, this.mPaint);
        }
        this.mPaint.setStrokeWidth(this.mStrokeWidth);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setColor(this.mPressed ? this.mHighlightColor : this.mFrameColor);
        this.mPaint.setShadowLayer(this.mShadowRadius, 0.0f, 0.0f, this.mFrameShadowColor);
        canvas.drawPath(this.mFramePath, this.mPaint);
    }

    public static CircleFramedDrawable getInstance(Context context, Bitmap bitmap) {
        Resources res = context.getResources();
        float iconSize = res.getDimension(2131558434);
        return new CircleFramedDrawable(bitmap, (int) iconSize, res.getColor(2131361810), res.getDimension(2131558435), res.getColor(2131361811), res.getDimension(2131558436), res.getColor(2131361812));
    }

    public int getIntrinsicHeight() {
        return this.mSize;
    }

    public int getIntrinsicWidth() {
        return this.mSize;
    }

    public int getOpacity() {
        return -3;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}