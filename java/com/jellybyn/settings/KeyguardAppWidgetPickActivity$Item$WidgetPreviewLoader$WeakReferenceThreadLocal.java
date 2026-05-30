package com.jellybyn.settings;

import com.jellybyn.settings.KeyguardAppWidgetPickActivity.Item.WidgetPreviewLoader;
import java.lang.ref.WeakReference;

abstract class KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$WeakReferenceThreadLocal<T> {
    private ThreadLocal<WeakReference<T>> mThreadLocal = new ThreadLocal();
    final /* synthetic */ WidgetPreviewLoader this$1;

    public T get() {
        WeakReference<T> reference = (WeakReference) this.mThreadLocal.get();
        T initialValue;
        if (reference == null) {
            initialValue = initialValue();
            this.mThreadLocal.set(new WeakReference(initialValue));
            return initialValue;
        }
        initialValue = reference.get();
        if (initialValue == null) {
            initialValue = initialValue();
            this.mThreadLocal.set(new WeakReference(initialValue));
        }
        return initialValue;
    }

    public KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$WeakReferenceThreadLocal(WidgetPreviewLoader widgetPreviewLoader) {
        this.this$1 = widgetPreviewLoader;
    }

    public void set(T t) {
        this.mThreadLocal.set(new WeakReference(t));
    }

    abstract T initialValue();
}