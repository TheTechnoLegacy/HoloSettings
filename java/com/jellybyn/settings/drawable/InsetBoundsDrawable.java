package com.jellybyn.settings.drawable;

import android.graphics.drawable.Drawable;

public class InsetBoundsDrawable extends DrawableWrapper {
    private final int mInsetBoundsSides;

    public InsetBoundsDrawable(Drawable drawable, int i) {
        super(drawable);
        this.mInsetBoundsSides = i;
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(this.mInsetBoundsSides + i, i2, i3 - this.mInsetBoundsSides, i4);
    }
}