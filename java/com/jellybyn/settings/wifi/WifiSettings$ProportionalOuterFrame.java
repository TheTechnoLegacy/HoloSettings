package com.jellybyn.settings.wifi;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.RelativeLayout;

public class WifiSettings$ProportionalOuterFrame extends RelativeLayout {
    protected void onMeasure(int i, int i2) {
        int parentWidth = MeasureSpec.getSize(i);
        int parentHeight = MeasureSpec.getSize(i2);
        Resources resources = getContext().getResources();
        float titleHeight = resources.getFraction(2131558416, 1, 1);
        float sideMargin = resources.getFraction(2131558417, 1, 1);
        setPaddingRelative((int) (((float) parentWidth) * sideMargin), 0, (int) (((float) parentWidth) * sideMargin), resources.getDimensionPixelSize(2131558418));
        View title = findViewById(2131231031);
        if (title != null) {
            title.setMinimumHeight((int) (((float) parentHeight) * titleHeight));
        }
        super.onMeasure(i, i2);
    }

    public WifiSettings$ProportionalOuterFrame(Context context) {
        super(context);
    }

    public WifiSettings$ProportionalOuterFrame(Context context, AttributeSet attributeSet) {
    }

    public WifiSettings$ProportionalOuterFrame(Context context, AttributeSet attributeSet, int i) {
    }
}