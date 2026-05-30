package com.jellybyn.settings;

import android.graphics.Paint;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader;
import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader.WeakReferenceThreadLocal;

class KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$PaintCache extends WeakReferenceThreadLocal<Paint> {
    final /* synthetic */ WidgetPreviewLoader this$1;

    KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$PaintCache(WidgetPreviewLoader widgetPreviewLoader) {
        this.this$1 = widgetPreviewLoader;
        super(widgetPreviewLoader);
    }

    protected Paint initialValue() {
        return null;
    }
}