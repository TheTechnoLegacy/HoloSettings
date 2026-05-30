package com.jellybyn.settings;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.ImageView;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item;

class KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader extends AsyncTask<Void, Bitmap, Void> {
    private int mIconDpi;
    private PackageManager mPackageManager;
    private Resources mResources;
    private ImageView mView;
    CanvasCache sCachedAppWidgetPreviewCanvas = new CanvasCache(this);
    RectCache sCachedAppWidgetPreviewDestRect = new RectCache(this);
    PaintCache sCachedAppWidgetPreviewPaint = new PaintCache(this);
    RectCache sCachedAppWidgetPreviewSrcRect = new RectCache(this);
    final /* synthetic */ Item this$0;

    private Bitmap getWidgetPreview(ComponentName componentName, int i, int i2, int i3, int i4) {
        int bitmapWidth;
        int bitmapHeight;
        String packageName = componentName.getPackageName();
        if (i3 < 0) {
            i3 = Integer.MAX_VALUE;
        }
        if (i4 < 0) {
            i4 = Integer.MAX_VALUE;
        }
        int appIconSize = this.mResources.getDimensionPixelSize(2131558403);
        Drawable drawable = null;
        if (i != 0) {
            drawable = this.mPackageManager.getDrawable(packageName, i, null);
            if (drawable == null) {
                Log.w("KeyguardAppWidgetPickActivity", "Can't load widget preview drawable 0x" + Integer.toHexString(i) + " for provider: " + componentName);
            }
        }
        Bitmap defaultPreview = null;
        boolean widgetPreviewExists = drawable != null;
        if (widgetPreviewExists) {
            bitmapWidth = drawable.getIntrinsicWidth();
            bitmapHeight = drawable.getIntrinsicHeight();
        } else {
            bitmapWidth = appIconSize;
            bitmapHeight = appIconSize;
            defaultPreview = Bitmap.createBitmap(bitmapWidth, bitmapHeight, Config.ARGB_8888);
            Drawable drawable2 = null;
            if (i2 > 0) {
                try {
                    drawable2 = getFullResIcon(packageName, i2);
                } catch (NotFoundException e) {
                }
            }
            if (drawable2 != null) {
                renderDrawableToBitmap(drawable2, defaultPreview, 0, 0, appIconSize, appIconSize);
            }
        }
        float scale = 1.0f;
        if (bitmapWidth > i3) {
            scale = ((float) i3) / ((float) bitmapWidth);
        }
        int finalPreviewWidth = (int) (((float) bitmapWidth) * scale);
        int finalPreviewHeight = (int) (((float) bitmapHeight) * scale);
        Bitmap preview = Bitmap.createBitmap(finalPreviewWidth, Math.min(finalPreviewHeight, i4), Config.ARGB_8888);
        if (widgetPreviewExists) {
            renderDrawableToBitmap(drawable, preview, 0, 0, finalPreviewWidth, finalPreviewHeight);
        } else {
            Canvas c = (Canvas) this.sCachedAppWidgetPreviewCanvas.get();
            Rect src = (Rect) this.sCachedAppWidgetPreviewSrcRect.get();
            Rect dest = (Rect) this.sCachedAppWidgetPreviewDestRect.get();
            c.setBitmap(preview);
            src.set(0, 0, defaultPreview.getWidth(), defaultPreview.getHeight());
            dest.set(0, 0, finalPreviewWidth, finalPreviewHeight);
            Paint p = (Paint) this.sCachedAppWidgetPreviewPaint.get();
            if (p == null) {
                p = new Paint();
                p.setFilterBitmap(true);
                this.sCachedAppWidgetPreviewPaint.set(p);
            }
            c.drawBitmap(defaultPreview, src, dest, p);
            c.setBitmap(null);
        }
        return preview;
    }

    public KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader(Item item, Context context, ImageView imageView) {
        this.this$0 = item;
        this.mResources = context.getResources();
        this.mPackageManager = context.getPackageManager();
        this.mIconDpi = ((ActivityManager) context.getSystemService("activity")).getLauncherLargeIconDensity();
        this.mView = imageView;
    }

    private void renderDrawableToBitmap(Drawable drawable, Bitmap bitmap, int i, int i2, int i3, int i4, float f) {
        if (bitmap != null) {
            Canvas canvas = new Canvas(bitmap);
            canvas.scale(f, f);
            Rect copyBounds = drawable.copyBounds();
            drawable.setBounds(i, i2, i + i3, i2 + i4);
            drawable.draw(canvas);
            drawable.setBounds(copyBounds);
            canvas.setBitmap(null);
        }
    }

    public Drawable getFullResIcon(String str, int i) {
        Resources resources;
        try {
            resources = this.mPackageManager.getResourcesForApplication(str);
        } catch (NameNotFoundException e) {
            resources = null;
        }
        return (resources == null || i == 0) ? getFullResDefaultActivityIcon() : getFullResIcon(resources, i);
    }

    public Void doInBackground(Void... voidArr) {
        if (!isCancelled()) {
            int dimensionPixelSize = this.mResources.getDimensionPixelSize(2131558429);
            int dimensionPixelSize2 = this.mResources.getDimensionPixelSize(2131558430);
            Bitmap widgetPreview = getWidgetPreview(new ComponentName(this.this$0.packageName, this.this$0.className), this.this$0.appWidgetPreviewId, this.this$0.iconId, dimensionPixelSize, dimensionPixelSize2);
            publishProgress(new Bitmap[]{widgetPreview});
        }
        return null;
    }

    public Drawable getFullResIcon(Resources resources, int i) {
        Drawable d;
        try {
            d = resources.getDrawableForDensity(i, this.mIconDpi);
        } catch (NotFoundException e) {
            d = null;
        }
        return d != null ? d : getFullResDefaultActivityIcon();
    }

    public void onProgressUpdate(Bitmap... bitmapArr) {
        if (!isCancelled()) {
            this.mView.setImageBitmap(bitmapArr[0]);
        }
    }

    private void renderDrawableToBitmap(Drawable drawable, Bitmap bitmap, int i, int i2, int i3, int i4) {
        renderDrawableToBitmap(drawable, bitmap, i, i2, i3, i4, 1.0f);
    }

    public Drawable getFullResDefaultActivityIcon() {
        return getFullResIcon(Resources.getSystem(), 17629184);
    }
}