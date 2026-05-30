package com.jellybyn.settings;

import android.graphics.Canvas;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader.WeakReferenceThreadLocal;

class KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$CanvasCache extends WeakReferenceThreadLocal<Canvas> {
    final /* synthetic */ WidgetPreviewLoader this$1;

    KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$CanvasCache(WidgetPreviewLoader widgetPreviewLoader) {
        this.this$1 = widgetPreviewLoader;
        super(widgetPreviewLoader);
    }

    protected Canvas initialValue() {
        return new Canvas();
    }
}