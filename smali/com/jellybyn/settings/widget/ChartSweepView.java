package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.DynamicLayout;
import android.text.Layout;
import android.text.Layout.Alignment;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.MathUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLayoutChangeListener;
import com.android.internal.util.Preconditions;
import com.jellybyn.settings.R;

public class ChartSweepView extends View {
    private ChartAxis mAxis;
    private OnClickListener mClickListener;
    private Rect mContentOffset;
    private long mDragInterval;
    private int mFollowAxis;
    private int mLabelColor;
    private DynamicLayout mLabelLayout;
    private int mLabelMinSize;
    private float mLabelOffset;
    private float mLabelSize;
    private SpannableStringBuilder mLabelTemplate;
    private int mLabelTemplateRes;
    private long mLabelValue;
    private OnSweepListener mListener;
    private Rect mMargins;
    private float mNeighborMargin;
    private ChartSweepView[] mNeighbors;
    private Paint mOutlinePaint;
    private Drawable mSweep;
    private Point mSweepOffset;
    private Rect mSweepPadding;
    private int mTouchMode;
    private MotionEvent mTracking;
    private float mTrackingStart;
    private long mValidAfter;
    private ChartSweepView mValidAfterDynamic;
    private long mValidBefore;
    private ChartSweepView mValidBeforeDynamic;
    private long mValue;

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!isEnabled()) {
            return false;
        }
        View parent = (View) getParent();
        switch (motionEvent.getAction()) {
            case 0:
                Object obj;
                Object obj2;
                if (this.mFollowAxis == 1) {
                    obj = motionEvent.getX() > ((float) (getWidth() - (this.mSweepPadding.right * 8))) ? 1 : null;
                    obj2 = this.mLabelLayout != null ? motionEvent.getX() < ((float) this.mLabelLayout.getWidth()) ? 1 : null : null;
                } else {
                    obj = motionEvent.getY() > ((float) (getHeight() - (this.mSweepPadding.bottom * 8))) ? 1 : null;
                    obj2 = this.mLabelLayout != null ? motionEvent.getY() < ((float) this.mLabelLayout.getHeight()) ? 1 : null : null;
                }
                MotionEvent copy = motionEvent.copy();
                copy.offsetLocation((float) getLeft(), (float) getTop());
                for (ChartSweepView isTouchCloserTo : this.mNeighbors) {
                    if (isTouchCloserTo(copy, isTouchCloserTo)) {
                        return false;
                    }
                }
                if (obj != null) {
                    if (this.mFollowAxis == 1) {
                        this.mTrackingStart = (float) (getTop() - this.mMargins.top);
                    } else {
                        this.mTrackingStart = (float) (getLeft() - this.mMargins.left);
                    }
                    this.mTracking = motionEvent.copy();
                    this.mTouchMode = 1;
                    if (!parent.isActivated()) {
                        parent.setActivated(true);
                    }
                    return true;
                } else if (obj2 != null) {
                    this.mTouchMode = 2;
                    return true;
                } else {
                    this.mTouchMode = 0;
                    return false;
                }
            case 1:
                if (this.mTouchMode == 2) {
                    performClick();
                } else if (this.mTouchMode == 1) {
                    this.mTrackingStart = 0.0f;
                    this.mTracking = null;
                    this.mValue = this.mLabelValue;
                    dispatchOnSweep(true);
                    setTranslationX(0.0f);
                    setTranslationY(0.0f);
                    requestLayout();
                }
                this.mTouchMode = 0;
                return true;
            case 2:
                if (this.mTouchMode == 2) {
                    return true;
                }
                getParent().requestDisallowInterceptTouchEvent(true);
                Rect parentContentRect = getParentContentRect();
                Rect computeClampRect = computeClampRect(parentContentRect);
                if (computeClampRect.isEmpty()) {
                    return true;
                }
                long convertToValue;
                if (this.mFollowAxis == 1) {
                    float top = (float) (getTop() - this.mMargins.top);
                    float constrain = MathUtils.constrain(this.mTrackingStart + (motionEvent.getRawY() - this.mTracking.getRawY()), (float) computeClampRect.top, (float) computeClampRect.bottom);
                    setTranslationY(constrain - top);
                    convertToValue = this.mAxis.convertToValue(constrain - ((float) parentContentRect.top));
                } else {
                    float left = (float) (getLeft() - this.mMargins.left);
                    float constrain2 = MathUtils.constrain(this.mTrackingStart + (motionEvent.getRawX() - this.mTracking.getRawX()), (float) computeClampRect.left, (float) computeClampRect.right);
                    setTranslationX(constrain2 - left);
                    convertToValue = this.mAxis.convertToValue(constrain2 - ((float) parentContentRect.left));
                }
                setValue(convertToValue - (convertToValue % this.mDragInterval));
                dispatchOnSweep(false);
                return true;
            default:
                return false;
        }
    }

    protected void onMeasure(int i, int i2) {
        if (!isEnabled() || this.mLabelLayout == null) {
            this.mSweepOffset.x = 0;
            this.mSweepOffset.y = 0;
            setMeasuredDimension(this.mSweep.getIntrinsicWidth(), this.mSweep.getIntrinsicHeight());
        } else {
            int intrinsicHeight = this.mSweep.getIntrinsicHeight();
            int height = this.mLabelLayout.getHeight();
            this.mSweepOffset.x = 0;
            this.mSweepOffset.y = 0;
            this.mSweepOffset.y = (int) (((float) (height / 2)) - getTargetInset());
            setMeasuredDimension(this.mSweep.getIntrinsicWidth(), Math.max(intrinsicHeight, height));
        }
        if (this.mFollowAxis == 1) {
            int intrinsicHeight2 = (this.mSweep.getIntrinsicHeight() - this.mSweepPadding.top) - this.mSweepPadding.bottom;
            this.mMargins.top = -(this.mSweepPadding.top + (intrinsicHeight2 / 2));
            this.mMargins.bottom = 0;
            this.mMargins.left = -this.mSweepPadding.left;
            this.mMargins.right = this.mSweepPadding.right;
        } else {
            int intrinsicWidth = (this.mSweep.getIntrinsicWidth() - this.mSweepPadding.left) - this.mSweepPadding.right;
            this.mMargins.left = -(this.mSweepPadding.left + (intrinsicWidth / 2));
            this.mMargins.right = 0;
            this.mMargins.top = -this.mSweepPadding.top;
            this.mMargins.bottom = this.mSweepPadding.bottom;
        }
        this.mContentOffset.set(0, 0, 0, 0);
        int widthBefore = getMeasuredWidth();
        int heightBefore = getMeasuredHeight();
        int offset;
        Rect rect;
        if (this.mFollowAxis == 0) {
            int i3 = widthBefore * 3;
            setMeasuredDimension(i3, heightBefore);
            this.mContentOffset.left = (i3 - widthBefore) / 2;
            offset = this.mSweepPadding.bottom * 2;
            rect = this.mContentOffset;
            rect.bottom -= offset;
            rect = this.mMargins;
            rect.bottom += offset;
        } else {
            int heightAfter = heightBefore * 2;
            setMeasuredDimension(widthBefore, heightAfter);
            this.mContentOffset.offset(0, (heightAfter - heightBefore) / 2);
            offset = this.mSweepPadding.right * 2;
            rect = this.mContentOffset;
            rect.right -= offset;
            rect = this.mMargins;
            rect.right += offset;
        }
        this.mSweepOffset.offset(this.mContentOffset.left, this.mContentOffset.top);
        this.mMargins.offset(-this.mSweepOffset.x, -this.mSweepOffset.y);
    }

    public ChartSweepView(Context context, AttributeSet attributeSet, int i) {
        this.mSweepPadding = new Rect();
        this.mContentOffset = new Rect();
        this.mSweepOffset = new Point();
        this.mMargins = new Rect();
        this.mOutlinePaint = new Paint();
        this.mTouchMode = 0;
        this.mDragInterval = 1;
        this.mNeighbors = new ChartSweepView[0];
        this.mClickListener = new 1(this);
        TypedArray a = context.obtainStyledAttributes(attributeSet, R.styleable.ChartSweepView, i, 0);
        setSweepDrawable(a.getDrawable(0));
        setFollowAxis(a.getInt(1, -1));
        setNeighborMargin((float) a.getDimensionPixelSize(2, 0));
        setLabelMinSize(a.getDimensionPixelSize(3, 0));
        setLabelTemplate(a.getResourceId(4, 0));
        setLabelColor(a.getColor(5, -16776961));
        setBackgroundResource(2130837551);
        this.mOutlinePaint.setColor(-65536);
        this.mOutlinePaint.setStrokeWidth(1.0f);
        this.mOutlinePaint.setStyle(Style.STROKE);
        a.recycle();
        setClickable(true);
        setFocusable(true);
        setOnClickListener(this.mClickListener);
        setWillNotDraw(false);
    }

    public void invalidateLabelOffset() {
        float labelOffset = 0.0f;
        if (this.mFollowAxis == 1) {
            float labelTop;
            if (this.mValidAfterDynamic != null) {
                this.mLabelSize = Math.max(getLabelWidth(this), getLabelWidth(this.mValidAfterDynamic));
                labelTop = getLabelTop(this.mValidAfterDynamic) - getLabelBottom(this);
                if (labelTop < 0.0f) {
                    labelOffset = labelTop / 2.0f;
                }
            } else if (this.mValidBeforeDynamic != null) {
                this.mLabelSize = Math.max(getLabelWidth(this), getLabelWidth(this.mValidBeforeDynamic));
                labelTop = getLabelTop(this) - getLabelBottom(this.mValidBeforeDynamic);
                if (labelTop < 0.0f) {
                    labelOffset = (-labelTop) / 2.0f;
                }
            } else {
                this.mLabelSize = getLabelWidth(this);
            }
        }
        this.mLabelSize = Math.max(this.mLabelSize, (float) this.mLabelMinSize);
        if (labelOffset != this.mLabelOffset) {
            this.mLabelOffset = labelOffset;
            invalidate();
            if (this.mValidAfterDynamic != null) {
                this.mValidAfterDynamic.invalidateLabelOffset();
            }
            if (this.mValidBeforeDynamic != null) {
                this.mValidBeforeDynamic.invalidateLabelOffset();
            }
        }
    }

    private Rect buildClampRect(Rect rect, long j, long j2, float f) {
        if (this.mAxis instanceof InvertedChartAxis) {
            long j3 = j2;
            j2 = j;
            j = j3;
        }
        boolean afterValid = (j == Long.MIN_VALUE || j == Long.MAX_VALUE) ? false : true;
        boolean beforeValid = (j2 == Long.MIN_VALUE || j2 == Long.MAX_VALUE) ? false : true;
        float afterPoint = this.mAxis.convertToPoint(j) + f;
        float beforePoint = this.mAxis.convertToPoint(j2) - f;
        Rect clampRect = new Rect(rect);
        if (this.mFollowAxis == 1) {
            if (beforeValid) {
                clampRect.bottom = clampRect.top + ((int) beforePoint);
            }
            if (afterValid) {
                clampRect.top = (int) (((float) clampRect.top) + afterPoint);
            }
        } else {
            if (beforeValid) {
                clampRect.right = clampRect.left + ((int) beforePoint);
            }
            if (afterValid) {
                clampRect.left = (int) (((float) clampRect.left) + afterPoint);
            }
        }
        return clampRect;
    }

    protected void onDraw(Canvas canvas) {
        int labelSize;
        super.onDraw(canvas);
        int width = getWidth();
        int height = getHeight();
        if (!isEnabled() || this.mLabelLayout == null) {
            labelSize = 0;
        } else {
            int save = canvas.save();
            canvas.translate(((float) this.mContentOffset.left) + (this.mLabelSize - 1024.0f), ((float) this.mContentOffset.top) + this.mLabelOffset);
            this.mLabelLayout.draw(canvas);
            canvas.restoreToCount(save);
            labelSize = (int) this.mLabelSize;
        }
        if (this.mFollowAxis == 1) {
            this.mSweep.setBounds(labelSize, this.mSweepOffset.y, this.mContentOffset.right + width, this.mSweepOffset.y + this.mSweep.getIntrinsicHeight());
        } else {
            this.mSweep.setBounds(this.mSweepOffset.x, labelSize, this.mSweepOffset.x + this.mSweep.getIntrinsicWidth(), this.mContentOffset.bottom + height);
        }
        this.mSweep.draw(canvas);
    }

    private void invalidateLabelTemplate() {
        if (this.mLabelTemplateRes != 0) {
            CharSequence text = getResources().getText(this.mLabelTemplateRes);
            TextPaint textPaint = new TextPaint(1);
            textPaint.density = getResources().getDisplayMetrics().density;
            textPaint.setCompatibilityScaling(getResources().getCompatibilityInfo().applicationScale);
            textPaint.setColor(this.mLabelColor);
            textPaint.setShadowLayer(4.0f * textPaint.density, 0.0f, 0.0f, -16777216);
            this.mLabelTemplate = new SpannableStringBuilder(text);
            this.mLabelLayout = new DynamicLayout(this.mLabelTemplate, textPaint, 1024, Alignment.ALIGN_RIGHT, 1.0f, 0.0f, false);
            invalidateLabel();
        } else {
            this.mLabelTemplate = null;
            this.mLabelLayout = null;
        }
        invalidate();
        requestLayout();
    }

    public void setSweepDrawable(Drawable drawable) {
        if (this.mSweep != null) {
            this.mSweep.setCallback(null);
            unscheduleDrawable(this.mSweep);
        }
        if (drawable != null) {
            drawable.setCallback(this);
            if (drawable.isStateful()) {
                drawable.setState(getDrawableState());
            }
            drawable.setVisible(getVisibility() == 0, false);
            this.mSweep = drawable;
            drawable.getPadding(this.mSweepPadding);
        } else {
            this.mSweep = null;
        }
        invalidate();
    }

    private void invalidateLabel() {
        if (this.mLabelTemplate == null || this.mAxis == null) {
            this.mLabelValue = this.mValue;
            return;
        }
        this.mLabelValue = this.mAxis.buildLabel(getResources(), this.mLabelTemplate, this.mValue);
        setContentDescription(this.mLabelTemplate);
        invalidateLabelOffset();
        invalidate();
    }

    public void updateValueFromPosition() {
        Rect parentContent = getParentContentRect();
        if (this.mFollowAxis == 1) {
            setValue(this.mAxis.convertToValue((getY() - ((float) this.mMargins.top)) - ((float) parentContent.top)));
            return;
        }
        setValue(this.mAxis.convertToValue((getX() - ((float) this.mMargins.left)) - ((float) parentContent.left)));
    }

    private float getTargetInset() {
        if (this.mFollowAxis == 1) {
            return (((float) this.mSweepPadding.top) + (((float) ((this.mSweep.getIntrinsicHeight() - this.mSweepPadding.top) - this.mSweepPadding.bottom)) / 2.0f)) + ((float) this.mSweepOffset.y);
        }
        return (((float) this.mSweepPadding.left) + (((float) ((this.mSweep.getIntrinsicWidth() - this.mSweepPadding.left) - this.mSweepPadding.right)) / 2.0f)) + ((float) this.mSweepOffset.x);
    }

    private Rect computeClampRect(Rect rect) {
        Rect rect2 = buildClampRect(rect, this.mValidAfter, this.mValidBefore, 0.0f);
        if (!rect2.intersect(buildClampRect(rect, getValidAfterDynamic(), getValidBeforeDynamic(), this.mNeighborMargin))) {
            rect2.setEmpty();
        }
        return rect2;
    }

    public void setVisibility(int i) {
        super.setVisibility(i);
        if (this.mSweep != null) {
            this.mSweep.setVisible(i == 0, false);
        }
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mSweep.isStateful()) {
            this.mSweep.setState(getDrawableState());
        }
    }

    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.mSweep != null) {
            this.mSweep.jumpToCurrentState();
        }
    }

    public void setEnabled(boolean z) {
        super.setEnabled(z);
        setFocusable(z);
        requestLayout();
    }

    private void dispatchOnSweep(boolean z) {
        if (this.mListener != null) {
            this.mListener.onSweep(this, z);
        }
    }

    private void dispatchRequestEdit() {
        if (this.mListener != null) {
            this.mListener.requestEdit(this);
        }
    }

    private float getTouchDistanceFromTarget(MotionEvent motionEvent) {
        return this.mFollowAxis == 0 ? Math.abs(motionEvent.getX() - (getX() + getTargetInset())) : Math.abs(motionEvent.getY() - (getY() + getTargetInset()));
    }

    public float getPoint() {
        return isEnabled() ? this.mAxis.convertToPoint(this.mValue) : 0.0f;
    }

    public boolean isTouchCloserTo(MotionEvent motionEvent, ChartSweepView chartSweepView) {
        return chartSweepView.getTouchDistanceFromTarget(motionEvent) < getTouchDistanceFromTarget(motionEvent);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        invalidateLabelOffset();
    }

    public void setLabelColor(int i) {
        this.mLabelColor = i;
        invalidateLabelTemplate();
    }

    public void setLabelMinSize(int i) {
        this.mLabelMinSize = i;
        invalidateLabelTemplate();
    }

    public void setLabelTemplate(int i) {
        this.mLabelTemplateRes = i;
        invalidateLabelTemplate();
    }

    public void setValidRange(long j, long j2) {
        this.mValidAfter = j;
        this.mValidBefore = j2;
    }

    public void setValidRangeDynamic(ChartSweepView chartSweepView, ChartSweepView chartSweepView2) {
        this.mValidAfterDynamic = chartSweepView;
        this.mValidBeforeDynamic = chartSweepView2;
    }

    public void setValue(long j) {
        this.mValue = j;
        invalidateLabel();
    }

    public ChartSweepView(Context context) {
        this(context, null);
    }

    public ChartSweepView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    private Rect getParentContentRect() {
        View parent = (View) getParent();
        return new Rect(parent.getPaddingLeft(), parent.getPaddingTop(), parent.getWidth() - parent.getPaddingRight(), parent.getHeight() - parent.getPaddingBottom());
    }

    private long getValidAfterDynamic() {
        ChartSweepView dynamic = this.mValidAfterDynamic;
        return (dynamic == null || !dynamic.isEnabled()) ? Long.MIN_VALUE : dynamic.getValue();
    }

    private long getValidBeforeDynamic() {
        ChartSweepView dynamic = this.mValidBeforeDynamic;
        return (dynamic == null || !dynamic.isEnabled()) ? Long.MAX_VALUE : dynamic.getValue();
    }

    public void addOnSweepListener(OnSweepListener onSweepListener) {
        this.mListener = onSweepListener;
    }

    void init(ChartAxis chartAxis) {
        this.mAxis = (ChartAxis) Preconditions.checkNotNull(chartAxis, "missing axis");
    }

    public void setDragInterval(long j) {
        this.mDragInterval = j;
    }

    public void setFollowAxis(int i) {
        this.mFollowAxis = i;
    }

    public void setNeighborMargin(float f) {
        this.mNeighborMargin = f;
    }

    public void setNeighbors(ChartSweepView... chartSweepViewArr) {
        this.mNeighbors = chartSweepViewArr;
    }

    public static float getLabelBottom(ChartSweepView chartSweepView) {
        return getLabelTop(chartSweepView) + ((float) chartSweepView.mLabelLayout.getHeight());
    }

    public static float getLabelTop(ChartSweepView chartSweepView) {
        return chartSweepView.getY() + ((float) chartSweepView.mContentOffset.top);
    }

    public static float getLabelWidth(ChartSweepView chartSweepView) {
        return Layout.getDesiredWidth(chartSweepView.mLabelLayout.getText(), chartSweepView.mLabelLayout.getPaint());
    }

    public void addOnLayoutChangeListener(OnLayoutChangeListener onLayoutChangeListener) {
    }

    public int getFollowAxis() {
        return this.mFollowAxis;
    }

    public long getLabelValue() {
        return this.mLabelValue;
    }

    public Rect getMargins() {
        return this.mMargins;
    }

    public long getValue() {
        return this.mValue;
    }

    public void removeOnLayoutChangeListener(OnLayoutChangeListener onLayoutChangeListener) {
    }

    public int shouldAdjustAxis() {
        return this.mAxis.shouldAdjustAxis(getValue());
    }

    protected boolean verifyDrawable(Drawable drawable) {
        return drawable == this.mSweep || super.verifyDrawable(drawable);
    }
}