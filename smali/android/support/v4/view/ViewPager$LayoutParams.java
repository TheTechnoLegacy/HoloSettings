package android.support.v4.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;

public class ViewPager$LayoutParams extends LayoutParams {
    int childIndex;
    public int gravity;
    public boolean isDecor;
    boolean needsMeasure;
    int position;
    float widthFactor = 0.0f;

    public ViewPager$LayoutParams(Context context, AttributeSet attributeSet) {
        TypedArray a = context.obtainStyledAttributes(attributeSet, ViewPager.access$400());
        this.gravity = a.getInteger(0, 48);
        a.recycle();
    }

    public ViewPager$LayoutParams() {
        super(-1, -1);
    }
}