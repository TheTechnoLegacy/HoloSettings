package com.jellybyn.settings;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.PaintDrawable;
import android.util.DisplayMetrics;

class ActivityPicker$IconResizer {
    private final Canvas mCanvas = new Canvas();
    private final int mIconHeight;
    private final int mIconWidth;
    private final DisplayMetrics mMetrics;
    private final Rect mOldBounds = new Rect();

    public Drawable createIconThumbnail(Drawable drawable) {
        Drawable paintFlagsDrawFilter;
        int width = this.mIconWidth;
        int height = this.mIconHeight;
        if (drawable == null) {
            return new PaintFlagsDrawFilter(width, height);
        }
        try {
            if (drawable instanceof PaintDrawable) {
                PaintDrawable paintDrawable = (PaintDrawable) drawable;
                paintDrawable.setIntrinsicWidth(width);
                paintDrawable.setIntrinsicHeight(height);
            } else if (drawable instanceof BitmapDrawable) {
                BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
                if (bitmapDrawable.getBitmap().getDensity() == 0) {
                    bitmapDrawable.setTargetDensity(this.mMetrics);
                }
            }
            int iconWidth = drawable.getIntrinsicWidth();
            int iconHeight = drawable.getIntrinsicHeight();
            if (iconWidth > 0 && iconHeight > 0) {
                Bitmap thumb;
                Canvas canvas;
                int x;
                int y;
                Drawable bitmapDrawable2;
                if (width < iconWidth || height < iconHeight) {
                    float f = ((float) iconWidth) / ((float) iconHeight);
                    if (iconWidth > iconHeight) {
                        height = (int) (((float) width) / f);
                    } else if (iconHeight > iconWidth) {
                        width = (int) (((float) height) * f);
                    }
                    thumb = Bitmap.createBitmap(this.mIconWidth, this.mIconHeight, drawable.getOpacity() != -1 ? Config.ARGB_8888 : Config.RGB_565);
                    canvas = this.mCanvas;
                    canvas.setBitmap(thumb);
                    this.mOldBounds.set(drawable.getBounds());
                    x = (this.mIconWidth - width) / 2;
                    y = (this.mIconHeight - height) / 2;
                    drawable.setBounds(x, y, x + width, y + height);
                    drawable.draw(canvas);
                    drawable.setBounds(this.mOldBounds);
                    bitmapDrawable2 = new BitmapDrawable(thumb);
                    try {
                        ((BitmapDrawable) bitmapDrawable2).setTargetDensity(this.mMetrics);
                        canvas.setBitmap(null);
                        drawable = bitmapDrawable2;
                    } catch (Throwable th) {
                        drawable = bitmapDrawable2;
                        paintFlagsDrawFilter = new PaintFlagsDrawFilter(width, height);
                        return drawable;
                    }
                } else if (iconWidth < width && iconHeight < height) {
                    thumb = Bitmap.createBitmap(this.mIconWidth, this.mIconHeight, Config.ARGB_8888);
                    canvas = this.mCanvas;
                    canvas.setBitmap(thumb);
                    this.mOldBounds.set(drawable.getBounds());
                    x = (width - iconWidth) / 2;
                    y = (height - iconHeight) / 2;
                    drawable.setBounds(x, y, x + iconWidth, y + iconHeight);
                    drawable.draw(canvas);
                    drawable.setBounds(this.mOldBounds);
                    bitmapDrawable2 = new BitmapDrawable(thumb);
                    ((BitmapDrawable) bitmapDrawable2).setTargetDensity(this.mMetrics);
                    canvas.setBitmap(null);
                    drawable = bitmapDrawable2;
                }
            }
        } catch (Throwable th2) {
            paintFlagsDrawFilter = new PaintFlagsDrawFilter(width, height);
            return drawable;
        }
        return drawable;
    }

    public ActivityPicker$IconResizer(int i, int i2, DisplayMetrics displayMetrics) {
        this.mCanvas.setDrawFilter(new PaintFlagsDrawFilter(4, 2));
        this.mMetrics = displayMetrics;
        this.mIconWidth = i;
        this.mIconHeight = i2;
    }
}