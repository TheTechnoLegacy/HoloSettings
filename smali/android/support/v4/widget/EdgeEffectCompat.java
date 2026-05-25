package android.support.v4.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.os.Build.VERSION;

public class EdgeEffectCompat {
    private static final EdgeEffectImpl IMPL;
    private Object mEdgeEffect;

    interface EdgeEffectImpl {
        boolean draw(Object obj, Canvas canvas);

        void finish(Object obj);

        boolean isFinished(Object obj);

        Object newEdgeEffect(Context context);

        boolean onPull(Object obj, float f);

        boolean onRelease(Object obj);

        void setSize(Object obj, int i, int i2);
    }

    static class BaseEdgeEffectImpl implements EdgeEffectImpl {
        BaseEdgeEffectImpl() {
        }

        public boolean draw(Object obj, Canvas canvas) {
            return false;
        }

        public void finish(Object obj) {
        }

        public boolean isFinished(Object obj) {
            return true;
        }

        public Object newEdgeEffect(Context context) {
            return null;
        }

        public boolean onPull(Object obj, float f) {
            return false;
        }

        public boolean onRelease(Object obj) {
            return false;
        }

        public void setSize(Object obj, int i, int i2) {
        }
    }

    static class EdgeEffectIcsImpl implements EdgeEffectImpl {
        public void finish(Object obj) {
            EdgeEffectImpl.finish(obj);
        }

        public void setSize(Object obj, int i, int i2) {
            EdgeEffectImpl.setSize(obj, i, i2);
        }

        EdgeEffectIcsImpl() {
        }

        public boolean draw(Object obj, Canvas canvas) {
            return EdgeEffectImpl.draw(obj, canvas);
        }

        public boolean isFinished(Object obj) {
            return EdgeEffectCompatIcs.isFinished(obj);
        }

        public Object newEdgeEffect(Context context) {
            return EdgeEffectImpl.newEdgeEffect(context);
        }

        public boolean onPull(Object obj, float f) {
            return EdgeEffectImpl.onPull(obj, f);
        }

        public boolean onRelease(Object obj) {
            return EdgeEffectImpl.onRelease(obj);
        }
    }

    static {
        if (VERSION.SDK_INT >= 14) {
            IMPL = new EdgeEffectIcsImpl();
        } else {
            IMPL = new BaseEdgeEffectImpl();
        }
    }

    public EdgeEffectCompat(Context context) {
        this.mEdgeEffect = IMPL.newEdgeEffect(context);
    }

    public void finish() {
        IMPL.finish(this.mEdgeEffect);
    }

    public void setSize(int i, int i2) {
        IMPL.setSize(this.mEdgeEffect, i, i2);
    }

    public boolean draw(Canvas canvas) {
        return IMPL.draw(this.mEdgeEffect, canvas);
    }

    public boolean isFinished() {
        return IMPL.isFinished(this.mEdgeEffect);
    }

    public boolean onPull(float f) {
        return IMPL.onPull(this.mEdgeEffect, f);
    }

    public boolean onRelease() {
        return IMPL.onRelease(this.mEdgeEffect);
    }
}