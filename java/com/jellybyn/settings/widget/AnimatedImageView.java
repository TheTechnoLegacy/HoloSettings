package com.jellybyn.settings.widget;

import android.content.Context;
import android.graphics.drawable.AnimatedRotateDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

public class AnimatedImageView extends ImageView {
    private boolean mAnimating;
    private AnimatedRotateDrawable mDrawable;

    private void updateDrawable() {
        if (isShown() && this.mDrawable != null) {
            this.mDrawable.stop();
        }
        Drawable drawable = getDrawable();
        if (drawable instanceof AnimatedRotateDrawable) {
            this.mDrawable = (AnimatedRotateDrawable) drawable;
            this.mDrawable.setFramesCount(56);
            this.mDrawable.setFramesDuration(32);
            if (isShown() && this.mAnimating) {
                this.mDrawable.start();
                return;
            }
            return;
        }
        this.mDrawable = null;
    }

    private void updateAnimating() {
        if (this.mDrawable == null) {
            return;
        }
        if (isShown() && this.mAnimating) {
            this.mDrawable.start();
        } else {
            this.mDrawable.stop();
        }
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateAnimating();
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        updateAnimating();
    }

    protected void onVisibilityChanged(View view, int i) {
        super.onVisibilityChanged(view, i);
        updateAnimating();
    }

    public void setAnimating(boolean z) {
        this.mAnimating = z;
        updateAnimating();
    }

    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        updateDrawable();
    }

    public void setImageResource(int i) {
        super.setImageResource(i);
        updateDrawable();
    }

    public AnimatedImageView(Context context) {
        super(context);
    }

    public AnimatedImageView(Context context, AttributeSet attributeSet) {
    }
}