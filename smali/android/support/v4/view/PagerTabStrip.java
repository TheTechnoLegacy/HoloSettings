package android.support.v4.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewConfiguration;

public class PagerTabStrip extends PagerTitleStrip {
    private boolean mDrawFullUnderline;
    private boolean mDrawFullUnderlineSet;
    private int mFullUnderlineHeight;
    private boolean mIgnoreTap;
    private int mIndicatorColor;
    private int mIndicatorHeight;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private int mMinPaddingBottom;
    private int mMinStripHeight;
    private int mMinTextSpacing;
    private int mTabAlpha;
    private int mTabPadding;
    private final Paint mTabPaint;
    private final Rect mTempRect;
    private int mTouchSlop;

    public PagerTabStrip(Context context, AttributeSet attributeSet) {
        this.mTabPaint = new Paint();
        this.mTempRect = new Rect();
        this.mTabAlpha = 255;
        this.mDrawFullUnderline = false;
        this.mDrawFullUnderlineSet = false;
        this.mIndicatorColor = this.mTextColor;
        this.mTabPaint.setColor(this.mIndicatorColor);
        float density = context.getResources().getDisplayMetrics().density;
        this.mIndicatorHeight = (int) ((3.0f * density) + 0.5f);
        this.mMinPaddingBottom = (int) ((6.0f * density) + 0.5f);
        this.mMinTextSpacing = (int) (64.0f * density);
        this.mTabPadding = (int) ((16.0f * density) + 0.5f);
        this.mFullUnderlineHeight = (int) ((1.0f * density) + 0.5f);
        this.mMinStripHeight = (int) ((32.0f * density) + 0.5f);
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
        setTextSpacing(getTextSpacing());
        setWillNotDraw(false);
        this.mPrevText.setFocusable(true);
        this.mPrevText.setOnClickListener(new 1(this));
        this.mNextText.setFocusable(true);
        this.mNextText.setOnClickListener(new 2(this));
        if (getBackground() == null) {
            this.mDrawFullUnderline = true;
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action != 0 && this.mIgnoreTap) {
            return false;
        }
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        switch (action) {
            case 0:
                this.mInitialMotionX = x;
                this.mInitialMotionY = y;
                this.mIgnoreTap = false;
                break;
            case 1:
                if (x >= ((float) (this.mCurrText.getLeft() - this.mTabPadding))) {
                    if (x > ((float) (this.mCurrText.getRight() + this.mTabPadding))) {
                        this.mPager.setCurrentItem(this.mPager.getCurrentItem() + 1);
                        break;
                    }
                }
                this.mPager.setCurrentItem(this.mPager.getCurrentItem() - 1);
                break;
                break;
            case 2:
                if (Math.abs(x - this.mInitialMotionX) > ((float) this.mTouchSlop) || Math.abs(y - this.mInitialMotionY) > ((float) this.mTouchSlop)) {
                    this.mIgnoreTap = true;
                    break;
                }
        }
        return true;
    }

    void updateTextPositions(int i, float f, boolean z) {
        Rect r = this.mTempRect;
        int bottom = getHeight();
        int top = bottom - this.mIndicatorHeight;
        r.set(this.mCurrText.getLeft() - this.mTabPadding, top, this.mCurrText.getRight() + this.mTabPadding, bottom);
        super.updateTextPositions(i, f, z);
        this.mTabAlpha = (int) ((Math.abs(f - 0.5f) * 2.0f) * 255.0f);
        r.union(this.mCurrText.getLeft() - this.mTabPadding, top, this.mCurrText.getRight() + this.mTabPadding, bottom);
        invalidate(r);
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int height = getHeight();
        int bottom = height;
        int left = this.mCurrText.getLeft() - this.mTabPadding;
        int right = this.mCurrText.getRight() + this.mTabPadding;
        int top = bottom - this.mIndicatorHeight;
        this.mTabPaint.setColor((this.mTabAlpha << 24) | (this.mIndicatorColor & 16777215));
        canvas.drawRect((float) left, (float) top, (float) right, (float) bottom, this.mTabPaint);
        if (this.mDrawFullUnderline) {
            this.mTabPaint.setColor(-16777216 | (this.mIndicatorColor & 16777215));
            canvas.drawRect((float) getPaddingLeft(), (float) (height - this.mFullUnderlineHeight), (float) (getWidth() - getPaddingRight()), (float) height, this.mTabPaint);
        }
    }

    public void setBackgroundColor(int i) {
        super.setBackgroundColor(i);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = (-16777216 & i) == 0;
        }
    }

    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = drawable == null;
        }
    }

    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = i == 0;
        }
    }

    public void setPadding(int i, int i2, int i3, int i4) {
        if (i4 < this.mMinPaddingBottom) {
            i4 = this.mMinPaddingBottom;
        }
        super.setPadding(i, i2, i3, i4);
    }

    public void setTabIndicatorColor(int i) {
        this.mIndicatorColor = i;
        this.mTabPaint.setColor(this.mIndicatorColor);
        invalidate();
    }

    public void setTextSpacing(int i) {
        if (i < this.mMinTextSpacing) {
            i = this.mMinTextSpacing;
        }
        super.setTextSpacing(i);
    }

    public PagerTabStrip(Context context) {
        this(context, null);
    }

    public void setTabIndicatorColorResource(int i) {
        setTabIndicatorColor(getContext().getResources().getColor(i));
    }

    int getMinHeight() {
        return Math.max(super.getMinHeight(), this.mMinStripHeight);
    }
}