package com.jellybyn.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;

class ActivityPicker$EmptyDrawable extends Drawable {
    private final int mHeight;
    private final int mWidth;

    ActivityPicker$EmptyDrawable(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
    }

    public void draw(Canvas canvas) {
    }

    public int getIntrinsicHeight() {
        return this.mHeight;
    }

    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    public int getMinimumHeight() {
        return this.mHeight;
    }

    public int getMinimumWidth() {
        return this.mWidth;
    }

    public int getOpacity() {
        return -3;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}