package com.jellybyn.settings;

import android.graphics.Rect;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader.WeakReferenceThreadLocal;

class KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$RectCache extends WeakReferenceThreadLocal<Rect> {
    final /* synthetic */ WidgetPreviewLoader this$1;

    KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$RectCache(WidgetPreviewLoader widgetPreviewLoader) {
        this.this$1 = widgetPreviewLoader;
        super(widgetPreviewLoader);
    }

    protected Rect initialValue() {
        return new Rect();
    }
}