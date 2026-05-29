package android.support.v4.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.view.ViewPager.Decor;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;
import java.lang.ref.WeakReference;

public class PagerTitleStrip extends ViewGroup implements Decor {
    private static final int[] ATTRS = new int[]{16842804, 16842901, 16842904, 16842927};
    private static final PagerTitleStripImpl IMPL;
    private static final int[] TEXT_ATTRS = new int[]{16843660};
    TextView mCurrText;
    private int mGravity;
    private int mLastKnownCurrentPage;
    private float mLastKnownPositionOffset;
    TextView mNextText;
    private int mNonPrimaryAlpha;
    private final PageListener mPageListener;
    ViewPager mPager;
    TextView mPrevText;
    private int mScaledTextSpacing;
    int mTextColor;
    private boolean mUpdatingPositions;
    private boolean mUpdatingText;
    private WeakReference<PagerAdapter> mWatchingAdapter;

    void updateTextPositions(int i, float f, boolean z) {
        int prevTop;
        int currTop;
        int nextTop;
        if (i != this.mLastKnownCurrentPage) {
            updateText(i, this.mPager.getAdapter());
        } else if (!z && f == this.mLastKnownPositionOffset) {
            return;
        }
        this.mUpdatingPositions = true;
        int prevWidth = this.mPrevText.getMeasuredWidth();
        int currWidth = this.mCurrText.getMeasuredWidth();
        int nextWidth = this.mNextText.getMeasuredWidth();
        int halfCurrWidth = currWidth / 2;
        int stripWidth = getWidth();
        int stripHeight = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int textPaddedRight = paddingRight + halfCurrWidth;
        int contentWidth = (stripWidth - (paddingLeft + halfCurrWidth)) - textPaddedRight;
        float currOffset = f + 0.5f;
        if (currOffset > 1.0f) {
            currOffset -= 1.0f;
        }
        int currLeft = ((stripWidth - textPaddedRight) - ((int) (((float) contentWidth) * currOffset))) - (currWidth / 2);
        int currRight = currLeft + currWidth;
        int prevBaseline = this.mPrevText.getBaseline();
        int currBaseline = this.mCurrText.getBaseline();
        int nextBaseline = this.mNextText.getBaseline();
        int maxBaseline = Math.max(Math.max(prevBaseline, currBaseline), nextBaseline);
        int prevTopOffset = maxBaseline - prevBaseline;
        int currTopOffset = maxBaseline - currBaseline;
        int nextTopOffset = maxBaseline - nextBaseline;
        int alignedNextHeight = nextTopOffset + this.mNextText.getMeasuredHeight();
        int maxTextHeight = Math.max(Math.max(prevTopOffset + this.mPrevText.getMeasuredHeight(), currTopOffset + this.mCurrText.getMeasuredHeight()), alignedNextHeight);
        switch (this.mGravity & 112) {
            case 16:
                int i2 = (((stripHeight - paddingTop) - paddingBottom) - maxTextHeight) / 2;
                prevTop = i2 + prevTopOffset;
                currTop = i2 + currTopOffset;
                nextTop = i2 + nextTopOffset;
                break;
            case 80:
                int bottomGravTop = (stripHeight - paddingBottom) - maxTextHeight;
                prevTop = bottomGravTop + prevTopOffset;
                currTop = bottomGravTop + currTopOffset;
                nextTop = bottomGravTop + nextTopOffset;
                break;
            default:
                prevTop = paddingTop + prevTopOffset;
                currTop = paddingTop + currTopOffset;
                nextTop = paddingTop + nextTopOffset;
                break;
        }
        this.mCurrText.layout(currLeft, currTop, currRight, this.mCurrText.getMeasuredHeight() + currTop);
        int min = Math.min(paddingLeft, (currLeft - this.mScaledTextSpacing) - prevWidth);
        this.mPrevText.layout(min, prevTop, min + prevWidth, this.mPrevText.getMeasuredHeight() + prevTop);
        int max = Math.max((stripWidth - paddingRight) - nextWidth, this.mScaledTextSpacing + currRight);
        this.mNextText.layout(max, nextTop, max + nextWidth, this.mNextText.getMeasuredHeight() + nextTop);
        this.mLastKnownPositionOffset = f;
        this.mUpdatingPositions = false;
    }

    public PagerTitleStrip(Context context, AttributeSet attributeSet) {
        this.mLastKnownCurrentPage = -1;
        this.mLastKnownPositionOffset = -1.0f;
        this.mPageListener = new PageListener(this, null);
        TextView textView = new TextView(context);
        this.mPrevText = textView;
        addView(textView);
        textView = new TextView(context);
        this.mCurrText = textView;
        addView(textView);
        textView = new TextView(context);
        this.mNextText = textView;
        addView(textView);
        TypedArray a = context.obtainStyledAttributes(attributeSet, ATTRS);
        int textAppearance = a.getResourceId(0, 0);
        if (textAppearance != 0) {
            this.mPrevText.setTextAppearance(context, textAppearance);
            this.mCurrText.setTextAppearance(context, textAppearance);
            this.mNextText.setTextAppearance(context, textAppearance);
        }
        int textSize = a.getDimensionPixelSize(1, 0);
        if (textSize != 0) {
            setTextSize(0, (float) textSize);
        }
        if (a.hasValue(2)) {
            int color = a.getColor(2, 0);
            this.mPrevText.setTextColor(color);
            this.mCurrText.setTextColor(color);
            this.mNextText.setTextColor(color);
        }
        this.mGravity = a.getInteger(3, 80);
        a.recycle();
        this.mTextColor = this.mCurrText.getTextColors().getDefaultColor();
        setNonPrimaryAlpha(0.6f);
        this.mPrevText.setEllipsize(TruncateAt.END);
        this.mCurrText.setEllipsize(TruncateAt.END);
        this.mNextText.setEllipsize(TruncateAt.END);
        boolean allCaps = false;
        if (textAppearance != 0) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(textAppearance, TEXT_ATTRS);
            allCaps = obtainStyledAttributes.getBoolean(0, false);
            obtainStyledAttributes.recycle();
        }
        if (allCaps) {
            setSingleLineAllCaps(this.mPrevText);
            setSingleLineAllCaps(this.mCurrText);
            setSingleLineAllCaps(this.mNextText);
        } else {
            this.mPrevText.setSingleLine();
            this.mCurrText.setSingleLine();
            this.mNextText.setSingleLine();
        }
        this.mScaledTextSpacing = (int) (16.0f * context.getResources().getDisplayMetrics().density);
    }

    void updateText(int i, PagerAdapter pagerAdapter) {
        int itemCount = pagerAdapter != null ? pagerAdapter.getCount() : 0;
        this.mUpdatingText = true;
        CharSequence text = null;
        if (i >= 1 && pagerAdapter != null) {
            text = pagerAdapter.getPageTitle(i - 1);
        }
        this.mPrevText.setText(text);
        TextView textView = this.mCurrText;
        CharSequence pageTitle = (pagerAdapter == null || i >= itemCount) ? null : pagerAdapter.getPageTitle(i);
        textView.setText(pageTitle);
        text = null;
        if (i + 1 < itemCount && pagerAdapter != null) {
            text = pagerAdapter.getPageTitle(i + 1);
        }
        this.mNextText.setText(text);
        int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec((int) (((float) ((getWidth() - getPaddingLeft()) - getPaddingRight())) * 0.8f), Integer.MIN_VALUE);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE);
        this.mPrevText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mCurrText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mNextText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mLastKnownCurrentPage = i;
        if (!this.mUpdatingPositions) {
            updateTextPositions(i, this.mLastKnownPositionOffset, false);
        }
        this.mUpdatingText = false;
    }

    protected void onMeasure(int i, int i2) {
        int widthMode = MeasureSpec.getMode(i);
        int heightMode = MeasureSpec.getMode(i2);
        int widthSize = MeasureSpec.getSize(i);
        int heightSize = MeasureSpec.getSize(i2);
        if (widthMode != 1073741824) {
            throw new IllegalStateException("Must measure with an exact width");
        }
        int childHeight = heightSize;
        int minHeight = getMinHeight();
        int padding = getPaddingTop() + getPaddingBottom();
        childHeight -= padding;
        int childWidthSpec = MeasureSpec.makeMeasureSpec((int) (((float) widthSize) * 0.8f), Integer.MIN_VALUE);
        int childHeightSpec = MeasureSpec.makeMeasureSpec(childHeight, Integer.MIN_VALUE);
        this.mPrevText.measure(childWidthSpec, childHeightSpec);
        this.mCurrText.measure(childWidthSpec, childHeightSpec);
        this.mNextText.measure(childWidthSpec, childHeightSpec);
        if (heightMode == 1073741824) {
            setMeasuredDimension(widthSize, heightSize);
        } else {
            setMeasuredDimension(widthSize, Math.max(minHeight, this.mCurrText.getMeasuredHeight() + padding));
        }
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (parent instanceof ViewPager) {
            ViewPager pager = (ViewPager) parent;
            PagerAdapter adapter = pager.getAdapter();
            pager.setInternalPageChangeListener(this.mPageListener);
            pager.setOnAdapterChangeListener(this.mPageListener);
            this.mPager = pager;
            updateAdapter(this.mWatchingAdapter != null ? (PagerAdapter) this.mWatchingAdapter.get() : null, adapter);
            return;
        }
        throw new IllegalStateException("PagerTitleStrip must be a direct child of a ViewPager.");
    }

    void updateAdapter(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
        if (pagerAdapter != null) {
            pagerAdapter.unregisterDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = null;
        }
        if (pagerAdapter2 != null) {
            pagerAdapter2.registerDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = new WeakReference(pagerAdapter2);
        }
        if (this.mPager != null) {
            this.mLastKnownCurrentPage = -1;
            this.mLastKnownPositionOffset = -1.0f;
            updateText(this.mPager.getCurrentItem(), pagerAdapter2);
            requestLayout();
        }
    }

    static {
        if (VERSION.SDK_INT >= 14) {
            IMPL = new PagerTitleStripImplIcs();
        } else {
            IMPL = new PagerTitleStripImplBase();
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mPager != null) {
            updateAdapter(this.mPager.getAdapter(), null);
            this.mPager.setInternalPageChangeListener(null);
            this.mPager.setOnAdapterChangeListener(null);
            this.mPager = null;
        }
    }

    int getMinHeight() {
        Drawable bg = getBackground();
        return bg != null ? bg.getIntrinsicHeight() : 0;
    }

    public void setNonPrimaryAlpha(float f) {
        this.mNonPrimaryAlpha = ((int) (255.0f * f)) & 255;
        int transparentColor = (this.mNonPrimaryAlpha << 24) | (this.mTextColor & 16777215);
        this.mPrevText.setTextColor(transparentColor);
        this.mNextText.setTextColor(transparentColor);
    }

    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        float f = 0.0f;
        if (this.mPager != null) {
            if (this.mLastKnownPositionOffset >= 0.0f) {
                f = this.mLastKnownPositionOffset;
            }
            updateTextPositions(this.mLastKnownCurrentPage, f, true);
        }
    }

    public void setTextSize(int i, float f) {
        this.mPrevText.setTextSize(i, f);
        this.mCurrText.setTextSize(i, f);
        this.mNextText.setTextSize(i, f);
    }

    public void requestLayout() {
        if (!this.mUpdatingText) {
            super.requestLayout();
        }
    }

    public void setTextSpacing(int i) {
        this.mScaledTextSpacing = i;
        requestLayout();
    }

    public PagerTitleStrip(Context context) {
        this(context, null);
    }

    private static void setSingleLineAllCaps(TextView textView) {
        IMPL.setSingleLineAllCaps(textView);
    }

    public int getTextSpacing() {
        return this.mScaledTextSpacing;
    }
}