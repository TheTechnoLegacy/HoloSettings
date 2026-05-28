package android.support.v4.view;

public class ViewPager extends android.view.ViewGroup {
    private static final java.util.Comparator<android.support.v4.view.ViewPager.ItemInfo> COMPARATOR = null;
    private static final int[] LAYOUT_ATTRS = null;
    private static final android.view.animation.Interpolator sInterpolator = null;
    private static final android.support.v4.view.ViewPager.ViewPositionComparator sPositionComparator = null;
    private int mActivePointerId;
    private android.support.v4.view.PagerAdapter mAdapter;
    private android.support.v4.view.ViewPager.OnAdapterChangeListener mAdapterChangeListener;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    private int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    private int mDrawingOrder;
    private java.util.ArrayList<android.view.View> mDrawingOrderedChildren;
    private final java.lang.Runnable mEndScrollRunnable;
    private int mExpectedAdapterCount;
    private boolean mFakeDragging;
    private boolean mFirstLayout;
    private float mFirstOffset;
    private int mFlingDistance;
    private int mGutterSize;
    private boolean mInLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private android.support.v4.view.ViewPager.OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private final java.util.ArrayList<android.support.v4.view.ViewPager.ItemInfo> mItems;
    private float mLastMotionX;
    private float mLastMotionY;
    private float mLastOffset;
    private android.support.v4.widget.EdgeEffectCompat mLeftEdge;
    private android.graphics.drawable.Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private boolean mNeedCalculatePageOffsets;
    private android.support.v4.view.ViewPager.PagerObserver mObserver;
    private int mOffscreenPageLimit;
    private android.support.v4.view.ViewPager.OnPageChangeListener mOnPageChangeListener;
    private int mPageMargin;
    private android.support.v4.view.ViewPager.PageTransformer mPageTransformer;
    private boolean mPopulatePending;
    private android.os.Parcelable mRestoredAdapterState;
    private java.lang.ClassLoader mRestoredClassLoader;
    private int mRestoredCurItem;
    private android.support.v4.widget.EdgeEffectCompat mRightEdge;
    private int mScrollState;
    private android.widget.Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private final android.support.v4.view.ViewPager.ItemInfo mTempItem;
    private final android.graphics.Rect mTempRect;
    private int mTopPageBounds;
    private int mTouchSlop;
    private android.view.VelocityTracker mVelocityTracker;

    static {
        r0 = 1;
        r0 = new int[r0];
        r1 = 0;
        r2 = 16842931; // 0x10100b3 float:2.369406E-38 double:8.3215136E-317;
        r0[r1] = r2;
        LAYOUT_ATTRS = r0;
        r0 = new android.support.v4.view.ViewPager$1;
        r0.<init>();
        COMPARATOR = r0;
        r0 = new android.support.v4.view.ViewPager$2;
        r0.<init>();
        sInterpolator = r0;
        r0 = new android.support.v4.view.ViewPager$ViewPositionComparator;
        r0.<init>();
        sPositionComparator = r0;
        return;
    }

    public ViewPager(android.content.Context r6) {
        r5 = this;
        r4 = 0;
        r3 = 1;
        r2 = 0;
        r1 = -1;
        r5.<init>(r6);
        r0 = new java.util.ArrayList;
        r0.<init>();
        r5.mItems = r0;
        r0 = new android.support.v4.view.ViewPager$ItemInfo;
        r0.<init>();
        r5.mTempItem = r0;
        r0 = new android.graphics.Rect;
        r0.<init>();
        r5.mTempRect = r0;
        r5.mRestoredCurItem = r1;
        r5.mRestoredAdapterState = r4;
        r5.mRestoredClassLoader = r4;
        r0 = -8388609; // 0xffffffffff7fffff float:-3.4028235E38 double:NaN;
        r5.mFirstOffset = r0;
        r0 = 2139095039; // 0x7f7fffff float:3.4028235E38 double:1.056853372E-314;
        r5.mLastOffset = r0;
        r5.mOffscreenPageLimit = r3;
        r5.mActivePointerId = r1;
        r5.mFirstLayout = r3;
        r5.mNeedCalculatePageOffsets = r2;
        r0 = new android.support.v4.view.ViewPager$3;
        r0.<init>(r5);
        r5.mEndScrollRunnable = r0;
        r5.mScrollState = r2;
        r5.initViewPager();
        return;
    }

    public ViewPager(android.content.Context r6, android.util.AttributeSet r7) {
        r5 = this;
        r4 = 0;
        r3 = 1;
        r2 = 0;
        r1 = -1;
        r5.<init>(r6, r7);
        r0 = new java.util.ArrayList;
        r0.<init>();
        r5.mItems = r0;
        r0 = new android.support.v4.view.ViewPager$ItemInfo;
        r0.<init>();
        r5.mTempItem = r0;
        r0 = new android.graphics.Rect;
        r0.<init>();
        r5.mTempRect = r0;
        r5.mRestoredCurItem = r1;
        r5.mRestoredAdapterState = r4;
        r5.mRestoredClassLoader = r4;
        r0 = -8388609; // 0xffffffffff7fffff float:-3.4028235E38 double:NaN;
        r5.mFirstOffset = r0;
        r0 = 2139095039; // 0x7f7fffff float:3.4028235E38 double:1.056853372E-314;
        r5.mLastOffset = r0;
        r5.mOffscreenPageLimit = r3;
        r5.mActivePointerId = r1;
        r5.mFirstLayout = r3;
        r5.mNeedCalculatePageOffsets = r2;
        r0 = new android.support.v4.view.ViewPager$3;
        r0.<init>(r5);
        r5.mEndScrollRunnable = r0;
        r5.mScrollState = r2;
        r5.initViewPager();
        return;
    }

    static /* synthetic */ void access$000(android.support.v4.view.ViewPager r0, int r1) {
        r0.setScrollState(r1);
        return;
    }

    static /* synthetic */ android.support.v4.view.PagerAdapter access$200(android.support.v4.view.ViewPager r1) {
        r0 = r1.mAdapter;
        return r0;
    }

    static /* synthetic */ int access$300(android.support.v4.view.ViewPager r1) {
        r0 = r1.mCurItem;
        return r0;
    }

    static /* synthetic */ int[] access$400() {
        r0 = LAYOUT_ATTRS;
        return r0;
    }

    private void calculatePageOffsets(android.support.v4.view.ViewPager.ItemInfo r15, int r16, android.support.v4.view.ViewPager.ItemInfo r17) {
        r14 = this;
        r12 = r14.mAdapter;
        r1 = r12.getCount();
        r11 = r14.getClientWidth();
        if (r11 <= 0) goto L_0x0058;
    L_0x000c:
        r12 = r14.mPageMargin;
        r12 = (float) r12;
        r13 = (float) r11;
        r6 = r12 / r13;
    L_0x0012:
        if (r17 == 0) goto L_0x00bc;
    L_0x0014:
        r0 = r17;
        r8 = r0.position;
        r12 = r15.position;
        if (r8 >= r12) goto L_0x0072;
    L_0x001c:
        r5 = 0;
        r3 = 0;
        r0 = r17;
        r12 = r0.offset;
        r0 = r17;
        r13 = r0.widthFactor;
        r12 = r12 + r13;
        r7 = r12 + r6;
        r9 = r8 + 1;
    L_0x002b:
        r12 = r15.position;
        if (r9 > r12) goto L_0x00bc;
    L_0x002f:
        r12 = r14.mItems;
        r12 = r12.size();
        if (r5 >= r12) goto L_0x00bc;
    L_0x0037:
        r12 = r14.mItems;
        r3 = r12.get(r5);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
    L_0x003f:
        r12 = r3.position;
        if (r9 <= r12) goto L_0x005a;
    L_0x0043:
        r12 = r14.mItems;
        r12 = r12.size();
        r12 = r12 + -1;
        if (r5 >= r12) goto L_0x005a;
    L_0x004d:
        r5 = r5 + 1;
        r12 = r14.mItems;
        r3 = r12.get(r5);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        goto L_0x003f;
    L_0x0058:
        r6 = 0;
        goto L_0x0012;
    L_0x005a:
        r12 = r3.position;
        if (r9 >= r12) goto L_0x0069;
    L_0x005e:
        r12 = r14.mAdapter;
        r12 = r12.getPageWidth(r9);
        r12 = r12 + r6;
        r7 = r7 + r12;
        r9 = r9 + 1;
        goto L_0x005a;
    L_0x0069:
        r3.offset = r7;
        r12 = r3.widthFactor;
        r12 = r12 + r6;
        r7 = r7 + r12;
        r9 = r9 + 1;
        goto L_0x002b;
    L_0x0072:
        r12 = r15.position;
        if (r8 <= r12) goto L_0x00bc;
    L_0x0076:
        r12 = r14.mItems;
        r12 = r12.size();
        r5 = r12 + -1;
        r3 = 0;
        r0 = r17;
        r7 = r0.offset;
        r9 = r8 + -1;
    L_0x0085:
        r12 = r15.position;
        if (r9 < r12) goto L_0x00bc;
    L_0x0089:
        if (r5 < 0) goto L_0x00bc;
    L_0x008b:
        r12 = r14.mItems;
        r3 = r12.get(r5);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
    L_0x0093:
        r12 = r3.position;
        if (r9 >= r12) goto L_0x00a4;
    L_0x0097:
        if (r5 <= 0) goto L_0x00a4;
    L_0x0099:
        r5 = r5 + -1;
        r12 = r14.mItems;
        r3 = r12.get(r5);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        goto L_0x0093;
    L_0x00a4:
        r12 = r3.position;
        if (r9 <= r12) goto L_0x00b3;
    L_0x00a8:
        r12 = r14.mAdapter;
        r12 = r12.getPageWidth(r9);
        r12 = r12 + r6;
        r7 = r7 - r12;
        r9 = r9 + -1;
        goto L_0x00a4;
    L_0x00b3:
        r12 = r3.widthFactor;
        r12 = r12 + r6;
        r7 = r7 - r12;
        r3.offset = r7;
        r9 = r9 + -1;
        goto L_0x0085;
    L_0x00bc:
        r12 = r14.mItems;
        r4 = r12.size();
        r7 = r15.offset;
        r12 = r15.position;
        r9 = r12 + -1;
        r12 = r15.position;
        if (r12 != 0) goto L_0x00fc;
    L_0x00cc:
        r12 = r15.offset;
    L_0x00ce:
        r14.mFirstOffset = r12;
        r12 = r15.position;
        r13 = r1 + -1;
        if (r12 != r13) goto L_0x0100;
    L_0x00d6:
        r12 = r15.offset;
        r13 = r15.widthFactor;
        r12 = r12 + r13;
        r13 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r12 = r12 - r13;
    L_0x00de:
        r14.mLastOffset = r12;
        r2 = r16 + -1;
    L_0x00e2:
        if (r2 < 0) goto L_0x0115;
    L_0x00e4:
        r12 = r14.mItems;
        r3 = r12.get(r2);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
    L_0x00ec:
        r12 = r3.position;
        if (r9 <= r12) goto L_0x0104;
    L_0x00f0:
        r12 = r14.mAdapter;
        r10 = r9 + -1;
        r12 = r12.getPageWidth(r9);
        r12 = r12 + r6;
        r7 = r7 - r12;
        r9 = r10;
        goto L_0x00ec;
    L_0x00fc:
        r12 = -8388609; // 0xffffffffff7fffff float:-3.4028235E38 double:NaN;
        goto L_0x00ce;
    L_0x0100:
        r12 = 2139095039; // 0x7f7fffff float:3.4028235E38 double:1.056853372E-314;
        goto L_0x00de;
    L_0x0104:
        r12 = r3.widthFactor;
        r12 = r12 + r6;
        r7 = r7 - r12;
        r3.offset = r7;
        r12 = r3.position;
        if (r12 != 0) goto L_0x0110;
    L_0x010e:
        r14.mFirstOffset = r7;
    L_0x0110:
        r2 = r2 + -1;
        r9 = r9 + -1;
        goto L_0x00e2;
    L_0x0115:
        r12 = r15.offset;
        r13 = r15.widthFactor;
        r12 = r12 + r13;
        r7 = r12 + r6;
        r12 = r15.position;
        r9 = r12 + 1;
        r2 = r16 + 1;
    L_0x0122:
        if (r2 >= r4) goto L_0x0155;
    L_0x0124:
        r12 = r14.mItems;
        r3 = r12.get(r2);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
    L_0x012c:
        r12 = r3.position;
        if (r9 >= r12) goto L_0x013c;
    L_0x0130:
        r12 = r14.mAdapter;
        r10 = r9 + 1;
        r12 = r12.getPageWidth(r9);
        r12 = r12 + r6;
        r7 = r7 + r12;
        r9 = r10;
        goto L_0x012c;
    L_0x013c:
        r12 = r3.position;
        r13 = r1 + -1;
        if (r12 != r13) goto L_0x014a;
    L_0x0142:
        r12 = r3.widthFactor;
        r12 = r12 + r7;
        r13 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r12 = r12 - r13;
        r14.mLastOffset = r12;
    L_0x014a:
        r3.offset = r7;
        r12 = r3.widthFactor;
        r12 = r12 + r6;
        r7 = r7 + r12;
        r2 = r2 + 1;
        r9 = r9 + 1;
        goto L_0x0122;
    L_0x0155:
        r12 = 0;
        r14.mNeedCalculatePageOffsets = r12;
        return;
    }

    private void completeScroll(boolean r11) {
        r10 = this;
        r7 = 0;
        r8 = r10.mScrollState;
        r9 = 2;
        if (r8 != r9) goto L_0x0049;
    L_0x0006:
        r2 = 1;
    L_0x0007:
        if (r2 == 0) goto L_0x002c;
    L_0x0009:
        r10.setScrollingCacheEnabled(r7);
        r8 = r10.mScroller;
        r8.abortAnimation();
        r3 = r10.getScrollX();
        r4 = r10.getScrollY();
        r8 = r10.mScroller;
        r5 = r8.getCurrX();
        r8 = r10.mScroller;
        r6 = r8.getCurrY();
        if (r3 != r5) goto L_0x0029;
    L_0x0027:
        if (r4 == r6) goto L_0x002c;
    L_0x0029:
        r10.scrollTo(r5, r6);
    L_0x002c:
        r10.mPopulatePending = r7;
        r0 = 0;
    L_0x002f:
        r8 = r10.mItems;
        r8 = r8.size();
        if (r0 >= r8) goto L_0x004b;
    L_0x0037:
        r8 = r10.mItems;
        r1 = r8.get(r0);
        r1 = (android.support.v4.view.ViewPager.ItemInfo) r1;
        r8 = r1.scrolling;
        if (r8 == 0) goto L_0x0046;
    L_0x0043:
        r2 = 1;
        r1.scrolling = r7;
    L_0x0046:
        r0 = r0 + 1;
        goto L_0x002f;
    L_0x0049:
        r2 = r7;
        goto L_0x0007;
    L_0x004b:
        if (r2 == 0) goto L_0x0054;
    L_0x004d:
        if (r11 == 0) goto L_0x0055;
    L_0x004f:
        r7 = r10.mEndScrollRunnable;
        android.support.v4.view.ViewCompat.postOnAnimation(r10, r7);
    L_0x0054:
        return;
    L_0x0055:
        r7 = r10.mEndScrollRunnable;
        r7.run();
        goto L_0x0054;
    }

    private int determineTargetPage(int r4, float r5, int r6, int r7) {
        r3 = this;
        r0 = java.lang.Math.abs(r7);
        r1 = r3.mFlingDistance;
        if (r0 <= r1) goto L_0x0043;
    L_0x0008:
        r0 = java.lang.Math.abs(r6);
        r1 = r3.mMinimumVelocity;
        if (r0 <= r1) goto L_0x0043;
    L_0x0010:
        if (r6 <= 0) goto L_0x0040;
    L_0x0012:
        r0 = r3.mItems;
        r0 = r0.size();
        if (r0 <= 0) goto L_0x003f;
    L_0x001a:
        r0 = r3.mItems;
        r1 = 0;
        r0 = r0.get(r1);
        r0 = (android.support.v4.view.ViewPager.ItemInfo) r0;
        r1 = r3.mItems;
        r2 = r3.mItems;
        r2 = r2.size();
        r2 = r2 + -1;
        r1 = r1.get(r2);
        r1 = (android.support.v4.view.ViewPager.ItemInfo) r1;
        r0 = r0.position;
        r1 = r1.position;
        r1 = java.lang.Math.min(r4, r1);
        r4 = java.lang.Math.max(r0, r1);
    L_0x003f:
        return r4;
    L_0x0040:
        r4 = r4 + 1;
        goto L_0x0012;
    L_0x0043:
        r0 = r3.mCurItem;
        if (r4 < r0) goto L_0x004f;
    L_0x0047:
        r0 = 1053609165; // 0x3ecccccd float:0.4 double:5.205520926E-315;
    L_0x004a:
        r1 = (float) r4;
        r1 = r1 + r5;
        r0 = r0 + r1;
        r4 = (int) r0;
        goto L_0x0012;
    L_0x004f:
        r0 = 1058642330; // 0x3f19999a float:0.6 double:5.230388065E-315;
        goto L_0x004a;
    }

    private void enableLayers(boolean r6) {
        r5 = this;
        r0 = r5.getChildCount();
        r1 = 0;
    L_0x0005:
        if (r1 >= r0) goto L_0x0017;
    L_0x0007:
        if (r6 == 0) goto L_0x0015;
    L_0x0009:
        r2 = 2;
    L_0x000a:
        r3 = r5.getChildAt(r1);
        r4 = 0;
        android.support.v4.view.ViewCompat.setLayerType(r3, r2, r4);
        r1 = r1 + 1;
        goto L_0x0005;
    L_0x0015:
        r2 = 0;
        goto L_0x000a;
    L_0x0017:
        return;
    }

    private void endDrag() {
        r1 = this;
        r0 = 0;
        r1.mIsBeingDragged = r0;
        r1.mIsUnableToDrag = r0;
        r0 = r1.mVelocityTracker;
        if (r0 == 0) goto L_0x0011;
    L_0x0009:
        r0 = r1.mVelocityTracker;
        r0.recycle();
        r0 = 0;
        r1.mVelocityTracker = r0;
    L_0x0011:
        return;
    }

    private android.graphics.Rect getChildRectInPagerCoordinates(android.graphics.Rect r5, android.view.View r6) {
        r4 = this;
        r2 = 0;
        if (r5 != 0) goto L_0x0008;
    L_0x0003:
        r5 = new android.graphics.Rect;
        r5.<init>();
    L_0x0008:
        if (r6 != 0) goto L_0x000e;
    L_0x000a:
        r5.set(r2, r2, r2, r2);
    L_0x000d:
        return r5;
    L_0x000e:
        r2 = r6.getLeft();
        r5.left = r2;
        r2 = r6.getRight();
        r5.right = r2;
        r2 = r6.getTop();
        r5.top = r2;
        r2 = r6.getBottom();
        r5.bottom = r2;
        r1 = r6.getParent();
    L_0x002a:
        r2 = r1 instanceof android.view.ViewGroup;
        if (r2 == 0) goto L_0x000d;
    L_0x002e:
        if (r1 == r4) goto L_0x000d;
    L_0x0030:
        r0 = r1;
        r0 = (android.view.ViewGroup) r0;
        r2 = r5.left;
        r3 = r0.getLeft();
        r2 = r2 + r3;
        r5.left = r2;
        r2 = r5.right;
        r3 = r0.getRight();
        r2 = r2 + r3;
        r5.right = r2;
        r2 = r5.top;
        r3 = r0.getTop();
        r2 = r2 + r3;
        r5.top = r2;
        r2 = r5.bottom;
        r3 = r0.getBottom();
        r2 = r2 + r3;
        r5.bottom = r2;
        r1 = r0.getParent();
        goto L_0x002a;
    }

    private int getClientWidth() {
        r2 = this;
        r0 = r2.getMeasuredWidth();
        r1 = r2.getPaddingLeft();
        r0 = r0 - r1;
        r1 = r2.getPaddingRight();
        r0 = r0 - r1;
        return r0;
    }

    private android.support.v4.view.ViewPager.ItemInfo infoForCurrentScrollPosition() {
        r15 = this;
        r8 = 0;
        r12 = r15.getClientWidth();
        if (r12 <= 0) goto L_0x006a;
    L_0x0007:
        r13 = r15.getScrollX();
        r13 = (float) r13;
        r14 = (float) r12;
        r11 = r13 / r14;
    L_0x000f:
        if (r12 <= 0) goto L_0x0017;
    L_0x0011:
        r13 = r15.mPageMargin;
        r13 = (float) r13;
        r14 = (float) r12;
        r8 = r13 / r14;
    L_0x0017:
        r5 = -1;
        r4 = 0;
        r6 = 0;
        r0 = 1;
        r3 = 0;
        r1 = 0;
    L_0x001d:
        r13 = r15.mItems;
        r13 = r13.size();
        if (r1 >= r13) goto L_0x0069;
    L_0x0025:
        r13 = r15.mItems;
        r2 = r13.get(r1);
        r2 = (android.support.v4.view.ViewPager.ItemInfo) r2;
        if (r0 != 0) goto L_0x004c;
    L_0x002f:
        r13 = r2.position;
        r14 = r5 + 1;
        if (r13 == r14) goto L_0x004c;
    L_0x0035:
        r2 = r15.mTempItem;
        r13 = r4 + r6;
        r13 = r13 + r8;
        r2.offset = r13;
        r13 = r5 + 1;
        r2.position = r13;
        r13 = r15.mAdapter;
        r14 = r2.position;
        r13 = r13.getPageWidth(r14);
        r2.widthFactor = r13;
        r1 = r1 + -1;
    L_0x004c:
        r9 = r2.offset;
        r7 = r9;
        r13 = r2.widthFactor;
        r13 = r13 + r9;
        r10 = r13 + r8;
        if (r0 != 0) goto L_0x005a;
    L_0x0056:
        r13 = (r11 > r7 ? 1 : (r11 == r7 ? 0 : -1));
        if (r13 < 0) goto L_0x0069;
    L_0x005a:
        r13 = (r11 > r10 ? 1 : (r11 == r10 ? 0 : -1));
        if (r13 < 0) goto L_0x0068;
    L_0x005e:
        r13 = r15.mItems;
        r13 = r13.size();
        r13 = r13 + -1;
        if (r1 != r13) goto L_0x006c;
    L_0x0068:
        r3 = r2;
    L_0x0069:
        return r3;
    L_0x006a:
        r11 = r8;
        goto L_0x000f;
    L_0x006c:
        r0 = 0;
        r5 = r2.position;
        r4 = r9;
        r6 = r2.widthFactor;
        r3 = r2;
        r1 = r1 + 1;
        goto L_0x001d;
    }

    private boolean isGutterDrag(float r4, float r5) {
        r3 = this;
        r2 = 0;
        r0 = r3.mGutterSize;
        r0 = (float) r0;
        r0 = (r4 > r0 ? 1 : (r4 == r0 ? 0 : -1));
        if (r0 >= 0) goto L_0x000c;
    L_0x0008:
        r0 = (r5 > r2 ? 1 : (r5 == r2 ? 0 : -1));
        if (r0 > 0) goto L_0x001c;
    L_0x000c:
        r0 = r3.getWidth();
        r1 = r3.mGutterSize;
        r0 = r0 - r1;
        r0 = (float) r0;
        r0 = (r4 > r0 ? 1 : (r4 == r0 ? 0 : -1));
        if (r0 <= 0) goto L_0x001e;
    L_0x0018:
        r0 = (r5 > r2 ? 1 : (r5 == r2 ? 0 : -1));
        if (r0 >= 0) goto L_0x001e;
    L_0x001c:
        r0 = 1;
    L_0x001d:
        return r0;
    L_0x001e:
        r0 = 0;
        goto L_0x001d;
    }

    private void onSecondaryPointerUp(android.view.MotionEvent r5) {
        r4 = this;
        r2 = android.support.v4.view.MotionEventCompat.getActionIndex(r5);
        r1 = android.support.v4.view.MotionEventCompat.getPointerId(r5, r2);
        r3 = r4.mActivePointerId;
        if (r1 != r3) goto L_0x0024;
    L_0x000c:
        if (r2 != 0) goto L_0x0025;
    L_0x000e:
        r0 = 1;
    L_0x000f:
        r3 = android.support.v4.view.MotionEventCompat.getX(r5, r0);
        r4.mLastMotionX = r3;
        r3 = android.support.v4.view.MotionEventCompat.getPointerId(r5, r0);
        r4.mActivePointerId = r3;
        r3 = r4.mVelocityTracker;
        if (r3 == 0) goto L_0x0024;
    L_0x001f:
        r3 = r4.mVelocityTracker;
        r3.clear();
    L_0x0024:
        return;
    L_0x0025:
        r0 = 0;
        goto L_0x000f;
    }

    private boolean pageScrolled(int r8) {
        r7 = this;
        r0 = 0;
        r1 = r7.mItems;
        r1 = r1.size();
        if (r1 != 0) goto L_0x001b;
    L_0x0009:
        r7.mCalledSuper = r0;
        r1 = 0;
        r7.onPageScrolled(r0, r1, r0);
        r1 = r7.mCalledSuper;
        if (r1 != 0) goto L_0x004e;
    L_0x0013:
        r0 = new java.lang.IllegalStateException;
        r1 = "onPageScrolled did not call superclass implementation";
        r0.<init>(r1);
        throw r0;
    L_0x001b:
        r1 = r7.infoForCurrentScrollPosition();
        r2 = r7.getClientWidth();
        r3 = r7.mPageMargin;
        r3 = r3 + r2;
        r4 = r7.mPageMargin;
        r4 = (float) r4;
        r5 = (float) r2;
        r4 = r4 / r5;
        r5 = r1.position;
        r6 = (float) r8;
        r2 = (float) r2;
        r2 = r6 / r2;
        r6 = r1.offset;
        r2 = r2 - r6;
        r1 = r1.widthFactor;
        r1 = r1 + r4;
        r1 = r2 / r1;
        r2 = (float) r3;
        r2 = r2 * r1;
        r2 = (int) r2;
        r7.mCalledSuper = r0;
        r7.onPageScrolled(r5, r1, r2);
        r0 = r7.mCalledSuper;
        if (r0 != 0) goto L_0x004d;
    L_0x0045:
        r0 = new java.lang.IllegalStateException;
        r1 = "onPageScrolled did not call superclass implementation";
        r0.<init>(r1);
        throw r0;
    L_0x004d:
        r0 = 1;
    L_0x004e:
        return r0;
    }

    private boolean performDrag(float r18) {
        r17 = this;
        r7 = 0;
        r0 = r17;
        r14 = r0.mLastMotionX;
        r2 = r14 - r18;
        r0 = r18;
        r1 = r17;
        r1.mLastMotionX = r0;
        r14 = r17.getScrollX();
        r8 = (float) r14;
        r12 = r8 + r2;
        r13 = r17.getClientWidth();
        r14 = (float) r13;
        r0 = r17;
        r15 = r0.mFirstOffset;
        r6 = r14 * r15;
        r14 = (float) r13;
        r0 = r17;
        r15 = r0.mLastOffset;
        r11 = r14 * r15;
        r5 = 1;
        r10 = 1;
        r0 = r17;
        r14 = r0.mItems;
        r15 = 0;
        r3 = r14.get(r15);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        r0 = r17;
        r14 = r0.mItems;
        r0 = r17;
        r15 = r0.mItems;
        r15 = r15.size();
        r15 = r15 + -1;
        r4 = r14.get(r15);
        r4 = (android.support.v4.view.ViewPager.ItemInfo) r4;
        r14 = r3.position;
        if (r14 == 0) goto L_0x0051;
    L_0x004b:
        r5 = 0;
        r14 = r3.offset;
        r15 = (float) r13;
        r6 = r14 * r15;
    L_0x0051:
        r14 = r4.position;
        r0 = r17;
        r15 = r0.mAdapter;
        r15 = r15.getCount();
        r15 = r15 + -1;
        if (r14 == r15) goto L_0x0065;
    L_0x005f:
        r10 = 0;
        r14 = r4.offset;
        r15 = (float) r13;
        r11 = r14 * r15;
    L_0x0065:
        r14 = (r12 > r6 ? 1 : (r12 == r6 ? 0 : -1));
        if (r14 >= 0) goto L_0x009d;
    L_0x0069:
        if (r5 == 0) goto L_0x007e;
    L_0x006b:
        r9 = r6 - r12;
        r0 = r17;
        r14 = r0.mLeftEdge;
        r15 = java.lang.Math.abs(r9);
        r0 = (float) r13;
        r16 = r0;
        r15 = r15 / r16;
        r7 = r14.onPull(r15);
    L_0x007e:
        r12 = r6;
    L_0x007f:
        r0 = r17;
        r14 = r0.mLastMotionX;
        r15 = (int) r12;
        r15 = (float) r15;
        r15 = r12 - r15;
        r14 = r14 + r15;
        r0 = r17;
        r0.mLastMotionX = r14;
        r14 = (int) r12;
        r15 = r17.getScrollY();
        r0 = r17;
        r0.scrollTo(r14, r15);
        r14 = (int) r12;
        r0 = r17;
        r0.pageScrolled(r14);
        return r7;
    L_0x009d:
        r14 = (r12 > r11 ? 1 : (r12 == r11 ? 0 : -1));
        if (r14 <= 0) goto L_0x007f;
    L_0x00a1:
        if (r10 == 0) goto L_0x00b6;
    L_0x00a3:
        r9 = r12 - r11;
        r0 = r17;
        r14 = r0.mRightEdge;
        r15 = java.lang.Math.abs(r9);
        r0 = (float) r13;
        r16 = r0;
        r15 = r15 / r16;
        r7 = r14.onPull(r15);
    L_0x00b6:
        r12 = r11;
        goto L_0x007f;
    }

    private void recomputeScrollPosition(int r15, int r16, int r17, int r18) {
        r14 = this;
        if (r16 <= 0) goto L_0x005f;
    L_0x0002:
        r0 = r14.mItems;
        r0 = r0.isEmpty();
        if (r0 != 0) goto L_0x005f;
    L_0x000a:
        r0 = r14.getPaddingLeft();
        r0 = r15 - r0;
        r2 = r14.getPaddingRight();
        r0 = r0 - r2;
        r12 = r0 + r17;
        r0 = r14.getPaddingLeft();
        r0 = r16 - r0;
        r2 = r14.getPaddingRight();
        r0 = r0 - r2;
        r7 = r0 + r18;
        r13 = r14.getScrollX();
        r0 = (float) r13;
        r2 = (float) r7;
        r8 = r0 / r2;
        r0 = (float) r12;
        r0 = r0 * r8;
        r1 = (int) r0;
        r0 = r14.getScrollY();
        r14.scrollTo(r1, r0);
        r0 = r14.mScroller;
        r0 = r0.isFinished();
        if (r0 != 0) goto L_0x005e;
    L_0x003e:
        r0 = r14.mScroller;
        r0 = r0.getDuration();
        r2 = r14.mScroller;
        r2 = r2.timePassed();
        r5 = r0 - r2;
        r0 = r14.mCurItem;
        r11 = r14.infoForPosition(r0);
        r0 = r14.mScroller;
        r2 = 0;
        r3 = r11.offset;
        r4 = (float) r15;
        r3 = r3 * r4;
        r3 = (int) r3;
        r4 = 0;
        r0.startScroll(r1, r2, r3, r4, r5);
    L_0x005e:
        return;
    L_0x005f:
        r0 = r14.mCurItem;
        r6 = r14.infoForPosition(r0);
        if (r6 == 0) goto L_0x008f;
    L_0x0067:
        r0 = r6.offset;
        r2 = r14.mLastOffset;
        r9 = java.lang.Math.min(r0, r2);
    L_0x006f:
        r0 = r14.getPaddingLeft();
        r0 = r15 - r0;
        r2 = r14.getPaddingRight();
        r0 = r0 - r2;
        r0 = (float) r0;
        r0 = r0 * r9;
        r10 = (int) r0;
        r0 = r14.getScrollX();
        if (r10 == r0) goto L_0x005e;
    L_0x0083:
        r0 = 0;
        r14.completeScroll(r0);
        r0 = r14.getScrollY();
        r14.scrollTo(r10, r0);
        goto L_0x005e;
    L_0x008f:
        r9 = 0;
        goto L_0x006f;
    }

    private void removeNonDecorViews() {
        r4 = this;
        r1 = 0;
    L_0x0001:
        r3 = r4.getChildCount();
        if (r1 >= r3) goto L_0x001d;
    L_0x0007:
        r0 = r4.getChildAt(r1);
        r2 = r0.getLayoutParams();
        r2 = (android.support.v4.view.ViewPager.LayoutParams) r2;
        r3 = r2.isDecor;
        if (r3 != 0) goto L_0x001a;
    L_0x0015:
        r4.removeViewAt(r1);
        r1 = r1 + -1;
    L_0x001a:
        r1 = r1 + 1;
        goto L_0x0001;
    L_0x001d:
        return;
    }

    private void scrollToItem(int r9, boolean r10, int r11, boolean r12) {
        r8 = this;
        r7 = 0;
        r0 = r8.infoForPosition(r9);
        r1 = 0;
        if (r0 == 0) goto L_0x001d;
    L_0x0008:
        r2 = r8.getClientWidth();
        r3 = (float) r2;
        r4 = r8.mFirstOffset;
        r5 = r0.offset;
        r6 = r8.mLastOffset;
        r5 = java.lang.Math.min(r5, r6);
        r4 = java.lang.Math.max(r4, r5);
        r3 = r3 * r4;
        r1 = (int) r3;
    L_0x001d:
        if (r10 == 0) goto L_0x0039;
    L_0x001f:
        r8.smoothScrollTo(r1, r7, r11);
        if (r12 == 0) goto L_0x002d;
    L_0x0024:
        r3 = r8.mOnPageChangeListener;
        if (r3 == 0) goto L_0x002d;
    L_0x0028:
        r3 = r8.mOnPageChangeListener;
        r3.onPageSelected(r9);
    L_0x002d:
        if (r12 == 0) goto L_0x0038;
    L_0x002f:
        r3 = r8.mInternalPageChangeListener;
        if (r3 == 0) goto L_0x0038;
    L_0x0033:
        r3 = r8.mInternalPageChangeListener;
        r3.onPageSelected(r9);
    L_0x0038:
        return;
    L_0x0039:
        if (r12 == 0) goto L_0x0044;
    L_0x003b:
        r3 = r8.mOnPageChangeListener;
        if (r3 == 0) goto L_0x0044;
    L_0x003f:
        r3 = r8.mOnPageChangeListener;
        r3.onPageSelected(r9);
    L_0x0044:
        if (r12 == 0) goto L_0x004f;
    L_0x0046:
        r3 = r8.mInternalPageChangeListener;
        if (r3 == 0) goto L_0x004f;
    L_0x004a:
        r3 = r8.mInternalPageChangeListener;
        r3.onPageSelected(r9);
    L_0x004f:
        r8.completeScroll(r7);
        r8.scrollTo(r1, r7);
        r8.pageScrolled(r1);
        goto L_0x0038;
    }

    private void setScrollState(int r2) {
        r1 = this;
        r0 = r1.mScrollState;
        if (r0 != r2) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        r1.mScrollState = r2;
        r0 = r1.mPageTransformer;
        if (r0 == 0) goto L_0x0011;
    L_0x000b:
        if (r2 == 0) goto L_0x001b;
    L_0x000d:
        r0 = 1;
    L_0x000e:
        r1.enableLayers(r0);
    L_0x0011:
        r0 = r1.mOnPageChangeListener;
        if (r0 == 0) goto L_0x0004;
    L_0x0015:
        r0 = r1.mOnPageChangeListener;
        r0.onPageScrollStateChanged(r2);
        goto L_0x0004;
    L_0x001b:
        r0 = 0;
        goto L_0x000e;
    }

    private void setScrollingCacheEnabled(boolean r2) {
        r1 = this;
        r0 = r1.mScrollingCacheEnabled;
        if (r0 == r2) goto L_0x0006;
    L_0x0004:
        r1.mScrollingCacheEnabled = r2;
    L_0x0006:
        return;
    }

    private void sortChildDrawingOrder() {
        r5 = this;
        r3 = r5.mDrawingOrder;
        if (r3 == 0) goto L_0x002f;
    L_0x0004:
        r3 = r5.mDrawingOrderedChildren;
        if (r3 != 0) goto L_0x0022;
    L_0x0008:
        r3 = new java.util.ArrayList;
        r3.<init>();
        r5.mDrawingOrderedChildren = r3;
    L_0x000f:
        r1 = r5.getChildCount();
        r2 = 0;
    L_0x0014:
        if (r2 >= r1) goto L_0x0028;
    L_0x0016:
        r0 = r5.getChildAt(r2);
        r3 = r5.mDrawingOrderedChildren;
        r3.add(r0);
        r2 = r2 + 1;
        goto L_0x0014;
    L_0x0022:
        r3 = r5.mDrawingOrderedChildren;
        r3.clear();
        goto L_0x000f;
    L_0x0028:
        r3 = r5.mDrawingOrderedChildren;
        r4 = sPositionComparator;
        java.util.Collections.sort(r3, r4);
    L_0x002f:
        return;
    }

    public void addFocusables(java.util.ArrayList<android.view.View> r7, int r8, int r9) {
        r6 = this;
        r1 = r7.size();
        r2 = r6.getDescendantFocusability();
        r0 = 393216; // 0x60000 float:5.51013E-40 double:1.942745E-318;
        if (r2 == r0) goto L_0x002f;
    L_0x000c:
        r0 = 0;
    L_0x000d:
        r3 = r6.getChildCount();
        if (r0 >= r3) goto L_0x002f;
    L_0x0013:
        r3 = r6.getChildAt(r0);
        r4 = r3.getVisibility();
        if (r4 != 0) goto L_0x002c;
    L_0x001d:
        r4 = r6.infoForChild(r3);
        if (r4 == 0) goto L_0x002c;
    L_0x0023:
        r4 = r4.position;
        r5 = r6.mCurItem;
        if (r4 != r5) goto L_0x002c;
    L_0x0029:
        r3.addFocusables(r7, r8, r9);
    L_0x002c:
        r0 = r0 + 1;
        goto L_0x000d;
    L_0x002f:
        r0 = 262144; // 0x40000 float:3.67342E-40 double:1.295163E-318;
        if (r2 != r0) goto L_0x0039;
    L_0x0033:
        r0 = r7.size();
        if (r1 != r0) goto L_0x003f;
    L_0x0039:
        r0 = r6.isFocusable();
        if (r0 != 0) goto L_0x0040;
    L_0x003f:
        return;
    L_0x0040:
        r0 = r9 & 1;
        r1 = 1;
        if (r0 != r1) goto L_0x0051;
    L_0x0045:
        r0 = r6.isInTouchMode();
        if (r0 == 0) goto L_0x0051;
    L_0x004b:
        r0 = r6.isFocusableInTouchMode();
        if (r0 == 0) goto L_0x003f;
    L_0x0051:
        if (r7 == 0) goto L_0x003f;
    L_0x0053:
        r7.add(r6);
        goto L_0x003f;
    }

    android.support.v4.view.ViewPager.ItemInfo addNewItem(int r3, int r4) {
        r2 = this;
        r0 = new android.support.v4.view.ViewPager$ItemInfo;
        r0.<init>();
        r0.position = r3;
        r1 = r2.mAdapter;
        r1 = r1.instantiateItem(r2, r3);
        r0.object = r1;
        r1 = r2.mAdapter;
        r1 = r1.getPageWidth(r3);
        r0.widthFactor = r1;
        if (r4 < 0) goto L_0x0021;
    L_0x0019:
        r1 = r2.mItems;
        r1 = r1.size();
        if (r4 < r1) goto L_0x0027;
    L_0x0021:
        r1 = r2.mItems;
        r1.add(r0);
    L_0x0026:
        return r0;
    L_0x0027:
        r1 = r2.mItems;
        r1.add(r4, r0);
        goto L_0x0026;
    }

    public void addTouchables(java.util.ArrayList<android.view.View> r6) {
        r5 = this;
        r1 = 0;
    L_0x0001:
        r3 = r5.getChildCount();
        if (r1 >= r3) goto L_0x0023;
    L_0x0007:
        r0 = r5.getChildAt(r1);
        r3 = r0.getVisibility();
        if (r3 != 0) goto L_0x0020;
    L_0x0011:
        r2 = r5.infoForChild(r0);
        if (r2 == 0) goto L_0x0020;
    L_0x0017:
        r3 = r2.position;
        r4 = r5.mCurItem;
        if (r3 != r4) goto L_0x0020;
    L_0x001d:
        r0.addTouchables(r6);
    L_0x0020:
        r1 = r1 + 1;
        goto L_0x0001;
    L_0x0023:
        return;
    }

    public void addView(android.view.View r4, int r5, android.view.ViewGroup.LayoutParams r6) {
        r3 = this;
        r1 = r3.checkLayoutParams(r6);
        if (r1 != 0) goto L_0x000a;
    L_0x0006:
        r6 = r3.generateLayoutParams(r6);
    L_0x000a:
        r0 = r6;
        r0 = (android.support.v4.view.ViewPager.LayoutParams) r0;
        r1 = r0.isDecor;
        r2 = r4 instanceof android.support.v4.view.ViewPager.Decor;
        r1 = r1 | r2;
        r0.isDecor = r1;
        r1 = r3.mInLayout;
        if (r1 == 0) goto L_0x002d;
    L_0x0018:
        if (r0 == 0) goto L_0x0026;
    L_0x001a:
        r1 = r0.isDecor;
        if (r1 == 0) goto L_0x0026;
    L_0x001e:
        r1 = new java.lang.IllegalStateException;
        r2 = "Cannot add pager decor view during layout";
        r1.<init>(r2);
        throw r1;
    L_0x0026:
        r1 = 1;
        r0.needsMeasure = r1;
        r3.addViewInLayout(r4, r5, r6);
    L_0x002c:
        return;
    L_0x002d:
        super.addView(r4, r5, r6);
        goto L_0x002c;
    }

    public boolean arrowScroll(int r10) {
        r9 = this;
        r1 = 0;
        r8 = 66;
        r7 = 17;
        r4 = 1;
        r3 = 0;
        r2 = r9.findFocus();
        if (r2 != r9) goto L_0x003e;
    L_0x000d:
        r0 = r1;
    L_0x000e:
        r1 = android.view.FocusFinder.getInstance();
        r1 = r1.findNextFocus(r9, r0, r10);
        if (r1 == 0) goto L_0x00c6;
    L_0x0018:
        if (r1 == r0) goto L_0x00c6;
    L_0x001a:
        if (r10 != r7) goto L_0x00a4;
    L_0x001c:
        r2 = r9.mTempRect;
        r2 = r9.getChildRectInPagerCoordinates(r2, r1);
        r2 = r2.left;
        r3 = r9.mTempRect;
        r3 = r9.getChildRectInPagerCoordinates(r3, r0);
        r3 = r3.left;
        if (r0 == 0) goto L_0x009f;
    L_0x002e:
        if (r2 < r3) goto L_0x009f;
    L_0x0030:
        r0 = r9.pageLeft();
    L_0x0034:
        if (r0 == 0) goto L_0x003d;
    L_0x0036:
        r1 = android.view.SoundEffectConstants.getContantForFocusDirection(r10);
        r9.playSoundEffect(r1);
    L_0x003d:
        return r0;
    L_0x003e:
        if (r2 == 0) goto L_0x00de;
    L_0x0040:
        r0 = r2.getParent();
    L_0x0044:
        r5 = r0 instanceof android.view.ViewGroup;
        if (r5 == 0) goto L_0x00e1;
    L_0x0048:
        if (r0 != r9) goto L_0x007b;
    L_0x004a:
        r0 = r4;
    L_0x004b:
        if (r0 != 0) goto L_0x00de;
    L_0x004d:
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r0 = r2.getClass();
        r0 = r0.getSimpleName();
        r5.append(r0);
        r0 = r2.getParent();
    L_0x0061:
        r2 = r0 instanceof android.view.ViewGroup;
        if (r2 == 0) goto L_0x0080;
    L_0x0065:
        r2 = " => ";
        r2 = r5.append(r2);
        r6 = r0.getClass();
        r6 = r6.getSimpleName();
        r2.append(r6);
        r0 = r0.getParent();
        goto L_0x0061;
    L_0x007b:
        r0 = r0.getParent();
        goto L_0x0044;
    L_0x0080:
        r0 = "ViewPager";
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r6 = "arrowScroll tried to find focus based on non-child current focused view ";
        r2 = r2.append(r6);
        r5 = r5.toString();
        r2 = r2.append(r5);
        r2 = r2.toString();
        android.util.Log.e(r0, r2);
        r0 = r1;
        goto L_0x000e;
    L_0x009f:
        r0 = r1.requestFocus();
        goto L_0x0034;
    L_0x00a4:
        if (r10 != r8) goto L_0x00db;
    L_0x00a6:
        r2 = r9.mTempRect;
        r2 = r9.getChildRectInPagerCoordinates(r2, r1);
        r2 = r2.left;
        r3 = r9.mTempRect;
        r3 = r9.getChildRectInPagerCoordinates(r3, r0);
        r3 = r3.left;
        if (r0 == 0) goto L_0x00c0;
    L_0x00b8:
        if (r2 > r3) goto L_0x00c0;
    L_0x00ba:
        r0 = r9.pageRight();
        goto L_0x0034;
    L_0x00c0:
        r0 = r1.requestFocus();
        goto L_0x0034;
    L_0x00c6:
        if (r10 == r7) goto L_0x00ca;
    L_0x00c8:
        if (r10 != r4) goto L_0x00d0;
    L_0x00ca:
        r0 = r9.pageLeft();
        goto L_0x0034;
    L_0x00d0:
        if (r10 == r8) goto L_0x00d5;
    L_0x00d2:
        r0 = 2;
        if (r10 != r0) goto L_0x00db;
    L_0x00d5:
        r0 = r9.pageRight();
        goto L_0x0034;
    L_0x00db:
        r0 = r3;
        goto L_0x0034;
    L_0x00de:
        r0 = r2;
        goto L_0x000e;
    L_0x00e1:
        r0 = r3;
        goto L_0x004b;
    }

    protected boolean canScroll(android.view.View r12, boolean r13, int r14, int r15, int r16) {
        r11 = this;
        r0 = r12 instanceof android.view.ViewGroup;
        if (r0 == 0) goto L_0x0059;
    L_0x0004:
        r7 = r12;
        r7 = (android.view.ViewGroup) r7;
        r9 = r12.getScrollX();
        r10 = r12.getScrollY();
        r6 = r7.getChildCount();
        r8 = r6 + -1;
    L_0x0015:
        if (r8 < 0) goto L_0x0059;
    L_0x0017:
        r1 = r7.getChildAt(r8);
        r0 = r15 + r9;
        r2 = r1.getLeft();
        if (r0 < r2) goto L_0x0056;
    L_0x0023:
        r0 = r15 + r9;
        r2 = r1.getRight();
        if (r0 >= r2) goto L_0x0056;
    L_0x002b:
        r0 = r16 + r10;
        r2 = r1.getTop();
        if (r0 < r2) goto L_0x0056;
    L_0x0033:
        r0 = r16 + r10;
        r2 = r1.getBottom();
        if (r0 >= r2) goto L_0x0056;
    L_0x003b:
        r2 = 1;
        r0 = r15 + r9;
        r3 = r1.getLeft();
        r4 = r0 - r3;
        r0 = r16 + r10;
        r3 = r1.getTop();
        r5 = r0 - r3;
        r0 = r11;
        r3 = r14;
        r0 = r0.canScroll(r1, r2, r3, r4, r5);
        if (r0 == 0) goto L_0x0056;
    L_0x0054:
        r0 = 1;
    L_0x0055:
        return r0;
    L_0x0056:
        r8 = r8 + -1;
        goto L_0x0015;
    L_0x0059:
        if (r13 == 0) goto L_0x0064;
    L_0x005b:
        r0 = -r14;
        r0 = android.support.v4.view.ViewCompat.canScrollHorizontally(r12, r0);
        if (r0 == 0) goto L_0x0064;
    L_0x0062:
        r0 = 1;
        goto L_0x0055;
    L_0x0064:
        r0 = 0;
        goto L_0x0055;
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams r2) {
        r1 = this;
        r0 = r2 instanceof android.support.v4.view.ViewPager.LayoutParams;
        if (r0 == 0) goto L_0x000c;
    L_0x0004:
        r0 = super.checkLayoutParams(r2);
        if (r0 == 0) goto L_0x000c;
    L_0x000a:
        r0 = 1;
    L_0x000b:
        return r0;
    L_0x000c:
        r0 = 0;
        goto L_0x000b;
    }

    public void computeScroll() {
        r5 = this;
        r4 = r5.mScroller;
        r4 = r4.isFinished();
        if (r4 != 0) goto L_0x003e;
    L_0x0008:
        r4 = r5.mScroller;
        r4 = r4.computeScrollOffset();
        if (r4 == 0) goto L_0x003e;
    L_0x0010:
        r0 = r5.getScrollX();
        r1 = r5.getScrollY();
        r4 = r5.mScroller;
        r2 = r4.getCurrX();
        r4 = r5.mScroller;
        r3 = r4.getCurrY();
        if (r0 != r2) goto L_0x0028;
    L_0x0026:
        if (r1 == r3) goto L_0x003a;
    L_0x0028:
        r5.scrollTo(r2, r3);
        r4 = r5.pageScrolled(r2);
        if (r4 != 0) goto L_0x003a;
    L_0x0031:
        r4 = r5.mScroller;
        r4.abortAnimation();
        r4 = 0;
        r5.scrollTo(r4, r3);
    L_0x003a:
        android.support.v4.view.ViewCompat.postInvalidateOnAnimation(r5);
    L_0x003d:
        return;
    L_0x003e:
        r4 = 1;
        r5.completeScroll(r4);
        goto L_0x003d;
    }

    void dataSetChanged() {
        r15 = this;
        r10 = 1;
        r11 = 0;
        r12 = r15.mAdapter;
        r0 = r12.getCount();
        r15.mExpectedAdapterCount = r0;
        r12 = r15.mItems;
        r12 = r12.size();
        r13 = r15.mOffscreenPageLimit;
        r13 = r13 * 2;
        r13 = r13 + 1;
        if (r12 >= r13) goto L_0x0043;
    L_0x0018:
        r12 = r15.mItems;
        r12 = r12.size();
        if (r12 >= r0) goto L_0x0043;
    L_0x0020:
        r7 = r10;
    L_0x0021:
        r8 = r15.mCurItem;
        r5 = 0;
        r3 = 0;
    L_0x0025:
        r12 = r15.mItems;
        r12 = r12.size();
        if (r3 >= r12) goto L_0x0084;
    L_0x002d:
        r12 = r15.mItems;
        r4 = r12.get(r3);
        r4 = (android.support.v4.view.ViewPager.ItemInfo) r4;
        r12 = r15.mAdapter;
        r13 = r4.object;
        r9 = r12.getItemPosition(r13);
        r12 = -1;
        if (r9 != r12) goto L_0x0045;
    L_0x0040:
        r3 = r3 + 1;
        goto L_0x0025;
    L_0x0043:
        r7 = r11;
        goto L_0x0021;
    L_0x0045:
        r12 = -2;
        if (r9 != r12) goto L_0x0075;
    L_0x0048:
        r12 = r15.mItems;
        r12.remove(r3);
        r3 = r3 + -1;
        if (r5 != 0) goto L_0x0057;
    L_0x0051:
        r12 = r15.mAdapter;
        r12.startUpdate(r15);
        r5 = 1;
    L_0x0057:
        r12 = r15.mAdapter;
        r13 = r4.position;
        r14 = r4.object;
        r12.destroyItem(r15, r13, r14);
        r7 = 1;
        r12 = r15.mCurItem;
        r13 = r4.position;
        if (r12 != r13) goto L_0x0040;
    L_0x0067:
        r12 = r15.mCurItem;
        r13 = r0 + -1;
        r12 = java.lang.Math.min(r12, r13);
        r8 = java.lang.Math.max(r11, r12);
        r7 = 1;
        goto L_0x0040;
    L_0x0075:
        r12 = r4.position;
        if (r12 == r9) goto L_0x0040;
    L_0x0079:
        r12 = r4.position;
        r13 = r15.mCurItem;
        if (r12 != r13) goto L_0x0080;
    L_0x007f:
        r8 = r9;
    L_0x0080:
        r4.position = r9;
        r7 = 1;
        goto L_0x0040;
    L_0x0084:
        if (r5 == 0) goto L_0x008b;
    L_0x0086:
        r12 = r15.mAdapter;
        r12.finishUpdate(r15);
    L_0x008b:
        r12 = r15.mItems;
        r13 = COMPARATOR;
        java.util.Collections.sort(r12, r13);
        if (r7 == 0) goto L_0x00b5;
    L_0x0094:
        r2 = r15.getChildCount();
        r3 = 0;
    L_0x0099:
        if (r3 >= r2) goto L_0x00af;
    L_0x009b:
        r1 = r15.getChildAt(r3);
        r6 = r1.getLayoutParams();
        r6 = (android.support.v4.view.ViewPager.LayoutParams) r6;
        r12 = r6.isDecor;
        if (r12 != 0) goto L_0x00ac;
    L_0x00a9:
        r12 = 0;
        r6.widthFactor = r12;
    L_0x00ac:
        r3 = r3 + 1;
        goto L_0x0099;
    L_0x00af:
        r15.setCurrentItemInternal(r8, r11, r10);
        r15.requestLayout();
    L_0x00b5:
        return;
    }

    public boolean dispatchKeyEvent(android.view.KeyEvent r2) {
        r1 = this;
        r0 = super.dispatchKeyEvent(r2);
        if (r0 != 0) goto L_0x000c;
    L_0x0006:
        r0 = r1.executeKeyEvent(r2);
        if (r0 == 0) goto L_0x000e;
    L_0x000c:
        r0 = 1;
    L_0x000d:
        return r0;
    L_0x000e:
        r0 = 0;
        goto L_0x000d;
    }

    public boolean dispatchPopulateAccessibilityEvent(android.view.accessibility.AccessibilityEvent r7) {
        r6 = this;
        r4 = r7.getEventType();
        r5 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        if (r4 != r5) goto L_0x000d;
    L_0x0008:
        r4 = super.dispatchPopulateAccessibilityEvent(r7);
    L_0x000c:
        return r4;
    L_0x000d:
        r1 = r6.getChildCount();
        r2 = 0;
    L_0x0012:
        if (r2 >= r1) goto L_0x0035;
    L_0x0014:
        r0 = r6.getChildAt(r2);
        r4 = r0.getVisibility();
        if (r4 != 0) goto L_0x0032;
    L_0x001e:
        r3 = r6.infoForChild(r0);
        if (r3 == 0) goto L_0x0032;
    L_0x0024:
        r4 = r3.position;
        r5 = r6.mCurItem;
        if (r4 != r5) goto L_0x0032;
    L_0x002a:
        r4 = r0.dispatchPopulateAccessibilityEvent(r7);
        if (r4 == 0) goto L_0x0032;
    L_0x0030:
        r4 = 1;
        goto L_0x000c;
    L_0x0032:
        r2 = r2 + 1;
        goto L_0x0012;
    L_0x0035:
        r4 = 0;
        goto L_0x000c;
    }

    float distanceInfluenceForSnapDuration(float r5) {
        r4 = this;
        r0 = 1056964608; // 0x3f000000 float:0.5 double:5.222099017E-315;
        r5 = r5 - r0;
        r0 = (double) r5;
        r2 = 4602160705557665991; // 0x3fde28c7460698c7 float:8614.194 double:0.4712389167638204;
        r0 = r0 * r2;
        r5 = (float) r0;
        r0 = (double) r5;
        r0 = java.lang.Math.sin(r0);
        r0 = (float) r0;
        return r0;
    }

    public void draw(android.graphics.Canvas r8) {
        r7 = this;
        r2 = 1;
        super.draw(r8);
        r0 = 0;
        r1 = android.support.v4.view.ViewCompat.getOverScrollMode(r7);
        if (r1 == 0) goto L_0x0019;
    L_0x000b:
        if (r1 != r2) goto L_0x00a2;
    L_0x000d:
        r1 = r7.mAdapter;
        if (r1 == 0) goto L_0x00a2;
    L_0x0011:
        r1 = r7.mAdapter;
        r1 = r1.getCount();
        if (r1 <= r2) goto L_0x00a2;
    L_0x0019:
        r1 = r7.mLeftEdge;
        r1 = r1.isFinished();
        if (r1 != 0) goto L_0x0059;
    L_0x0021:
        r1 = r8.save();
        r2 = r7.getHeight();
        r3 = r7.getPaddingTop();
        r2 = r2 - r3;
        r3 = r7.getPaddingBottom();
        r2 = r2 - r3;
        r3 = r7.getWidth();
        r4 = 1132920832; // 0x43870000 float:270.0 double:5.597372625E-315;
        r8.rotate(r4);
        r4 = -r2;
        r5 = r7.getPaddingTop();
        r4 = r4 + r5;
        r4 = (float) r4;
        r5 = r7.mFirstOffset;
        r6 = (float) r3;
        r5 = r5 * r6;
        r8.translate(r4, r5);
        r4 = r7.mLeftEdge;
        r4.setSize(r2, r3);
        r2 = r7.mLeftEdge;
        r2 = r2.draw(r8);
        r0 = r0 | r2;
        r8.restoreToCount(r1);
    L_0x0059:
        r1 = r7.mRightEdge;
        r1 = r1.isFinished();
        if (r1 != 0) goto L_0x009c;
    L_0x0061:
        r1 = r8.save();
        r2 = r7.getWidth();
        r3 = r7.getHeight();
        r4 = r7.getPaddingTop();
        r3 = r3 - r4;
        r4 = r7.getPaddingBottom();
        r3 = r3 - r4;
        r4 = 1119092736; // 0x42b40000 float:90.0 double:5.529052754E-315;
        r8.rotate(r4);
        r4 = r7.getPaddingTop();
        r4 = -r4;
        r4 = (float) r4;
        r5 = r7.mLastOffset;
        r6 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r5 = r5 + r6;
        r5 = -r5;
        r6 = (float) r2;
        r5 = r5 * r6;
        r8.translate(r4, r5);
        r4 = r7.mRightEdge;
        r4.setSize(r3, r2);
        r2 = r7.mRightEdge;
        r2 = r2.draw(r8);
        r0 = r0 | r2;
        r8.restoreToCount(r1);
    L_0x009c:
        if (r0 == 0) goto L_0x00a1;
    L_0x009e:
        android.support.v4.view.ViewCompat.postInvalidateOnAnimation(r7);
    L_0x00a1:
        return;
    L_0x00a2:
        r1 = r7.mLeftEdge;
        r1.finish();
        r1 = r7.mRightEdge;
        r1.finish();
        goto L_0x009c;
    }

    protected void drawableStateChanged() {
        r2 = this;
        super.drawableStateChanged();
        r0 = r2.mMarginDrawable;
        if (r0 == 0) goto L_0x0014;
    L_0x0007:
        r1 = r0.isStateful();
        if (r1 == 0) goto L_0x0014;
    L_0x000d:
        r1 = r2.getDrawableState();
        r0.setState(r1);
    L_0x0014:
        return;
    }

    public boolean executeKeyEvent(android.view.KeyEvent r5) {
        r4 = this;
        r3 = 1;
        r0 = 0;
        r1 = r5.getAction();
        if (r1 != 0) goto L_0x000f;
    L_0x0008:
        r1 = r5.getKeyCode();
        switch(r1) {
            case 21: goto L_0x0010;
            case 22: goto L_0x0017;
            case 61: goto L_0x001e;
            default: goto L_0x000f;
        };
    L_0x000f:
        return r0;
    L_0x0010:
        r1 = 17;
        r0 = r4.arrowScroll(r1);
        goto L_0x000f;
    L_0x0017:
        r1 = 66;
        r0 = r4.arrowScroll(r1);
        goto L_0x000f;
    L_0x001e:
        r1 = android.os.Build.VERSION.SDK_INT;
        r2 = 11;
        if (r1 < r2) goto L_0x000f;
    L_0x0024:
        r1 = android.support.v4.view.KeyEventCompat.hasNoModifiers(r5);
        if (r1 == 0) goto L_0x0030;
    L_0x002a:
        r1 = 2;
        r0 = r4.arrowScroll(r1);
        goto L_0x000f;
    L_0x0030:
        r1 = android.support.v4.view.KeyEventCompat.hasModifiers(r5, r3);
        if (r1 == 0) goto L_0x000f;
    L_0x0036:
        r0 = r4.arrowScroll(r3);
        goto L_0x000f;
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams() {
        r1 = this;
        r0 = new android.support.v4.view.ViewPager$LayoutParams;
        r0.<init>();
        return r0;
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.util.AttributeSet r3) {
        r2 = this;
        r0 = new android.support.v4.view.ViewPager$LayoutParams;
        r1 = r2.getContext();
        r0.<init>(r1, r3);
        return r0;
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams r2) {
        r1 = this;
        r0 = r1.generateDefaultLayoutParams();
        return r0;
    }

    public android.support.v4.view.PagerAdapter getAdapter() {
        r1 = this;
        r0 = r1.mAdapter;
        return r0;
    }

    protected int getChildDrawingOrder(int r5, int r6) {
        r4 = this;
        r2 = r4.mDrawingOrder;
        r3 = 2;
        if (r2 != r3) goto L_0x001a;
    L_0x0005:
        r2 = r5 + -1;
        r0 = r2 - r6;
    L_0x0009:
        r2 = r4.mDrawingOrderedChildren;
        r2 = r2.get(r0);
        r2 = (android.view.View) r2;
        r2 = r2.getLayoutParams();
        r2 = (android.support.v4.view.ViewPager.LayoutParams) r2;
        r1 = r2.childIndex;
        return r1;
    L_0x001a:
        r0 = r6;
        goto L_0x0009;
    }

    public int getCurrentItem() {
        r1 = this;
        r0 = r1.mCurItem;
        return r0;
    }

    android.support.v4.view.ViewPager.ItemInfo infoForAnyChild(android.view.View r3) {
        r2 = this;
    L_0x0000:
        r0 = r3.getParent();
        if (r0 == r2) goto L_0x0012;
    L_0x0006:
        if (r0 == 0) goto L_0x000c;
    L_0x0008:
        r1 = r0 instanceof android.view.View;
        if (r1 != 0) goto L_0x000e;
    L_0x000c:
        r1 = 0;
    L_0x000d:
        return r1;
    L_0x000e:
        r3 = r0;
        r3 = (android.view.View) r3;
        goto L_0x0000;
    L_0x0012:
        r1 = r2.infoForChild(r3);
        goto L_0x000d;
    }

    android.support.v4.view.ViewPager.ItemInfo infoForChild(android.view.View r5) {
        r4 = this;
        r0 = 0;
    L_0x0001:
        r2 = r4.mItems;
        r2 = r2.size();
        if (r0 >= r2) goto L_0x001f;
    L_0x0009:
        r2 = r4.mItems;
        r1 = r2.get(r0);
        r1 = (android.support.v4.view.ViewPager.ItemInfo) r1;
        r2 = r4.mAdapter;
        r3 = r1.object;
        r2 = r2.isViewFromObject(r5, r3);
        if (r2 == 0) goto L_0x001c;
    L_0x001b:
        return r1;
    L_0x001c:
        r0 = r0 + 1;
        goto L_0x0001;
    L_0x001f:
        r1 = 0;
        goto L_0x001b;
    }

    android.support.v4.view.ViewPager.ItemInfo infoForPosition(int r4) {
        r3 = this;
        r0 = 0;
    L_0x0001:
        r2 = r3.mItems;
        r2 = r2.size();
        if (r0 >= r2) goto L_0x0019;
    L_0x0009:
        r2 = r3.mItems;
        r1 = r2.get(r0);
        r1 = (android.support.v4.view.ViewPager.ItemInfo) r1;
        r2 = r1.position;
        if (r2 != r4) goto L_0x0016;
    L_0x0015:
        return r1;
    L_0x0016:
        r0 = r0 + 1;
        goto L_0x0001;
    L_0x0019:
        r1 = 0;
        goto L_0x0015;
    }

    void initViewPager() {
        r6 = this;
        r5 = 1;
        r3 = 0;
        r6.setWillNotDraw(r3);
        r3 = 262144; // 0x40000 float:3.67342E-40 double:1.295163E-318;
        r6.setDescendantFocusability(r3);
        r6.setFocusable(r5);
        r1 = r6.getContext();
        r3 = new android.widget.Scroller;
        r4 = sInterpolator;
        r3.<init>(r1, r4);
        r6.mScroller = r3;
        r0 = android.view.ViewConfiguration.get(r1);
        r3 = r1.getResources();
        r3 = r3.getDisplayMetrics();
        r2 = r3.density;
        r3 = android.support.v4.view.ViewConfigurationCompat.getScaledPagingTouchSlop(r0);
        r6.mTouchSlop = r3;
        r3 = 1137180672; // 0x43c80000 float:400.0 double:5.61841903E-315;
        r3 = r3 * r2;
        r3 = (int) r3;
        r6.mMinimumVelocity = r3;
        r3 = r0.getScaledMaximumFlingVelocity();
        r6.mMaximumVelocity = r3;
        r3 = new android.support.v4.widget.EdgeEffectCompat;
        r3.<init>(r1);
        r6.mLeftEdge = r3;
        r3 = new android.support.v4.widget.EdgeEffectCompat;
        r3.<init>(r1);
        r6.mRightEdge = r3;
        r3 = 1103626240; // 0x41c80000 float:25.0 double:5.45263811E-315;
        r3 = r3 * r2;
        r3 = (int) r3;
        r6.mFlingDistance = r3;
        r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r3 = r3 * r2;
        r3 = (int) r3;
        r6.mCloseEnough = r3;
        r3 = 1098907648; // 0x41800000 float:16.0 double:5.42932517E-315;
        r3 = r3 * r2;
        r3 = (int) r3;
        r6.mDefaultGutterSize = r3;
        r3 = new android.support.v4.view.ViewPager$MyAccessibilityDelegate;
        r3.<init>(r6);
        android.support.v4.view.ViewCompat.setAccessibilityDelegate(r6, r3);
        r3 = android.support.v4.view.ViewCompat.getImportantForAccessibility(r6);
        if (r3 != 0) goto L_0x006b;
    L_0x0068:
        android.support.v4.view.ViewCompat.setImportantForAccessibility(r6, r5);
    L_0x006b:
        return;
    }

    protected void onAttachedToWindow() {
        r1 = this;
        super.onAttachedToWindow();
        r0 = 1;
        r1.mFirstLayout = r0;
        return;
    }

    protected void onDetachedFromWindow() {
        r1 = this;
        r0 = r1.mEndScrollRunnable;
        r1.removeCallbacks(r0);
        super.onDetachedFromWindow();
        return;
    }

    protected void onDraw(android.graphics.Canvas r19) {
        r18 = this;
        super.onDraw(r19);
        r0 = r18;
        r13 = r0.mPageMargin;
        if (r13 <= 0) goto L_0x00c1;
    L_0x0009:
        r0 = r18;
        r13 = r0.mMarginDrawable;
        if (r13 == 0) goto L_0x00c1;
    L_0x000f:
        r0 = r18;
        r13 = r0.mItems;
        r13 = r13.size();
        if (r13 <= 0) goto L_0x00c1;
    L_0x0019:
        r0 = r18;
        r13 = r0.mAdapter;
        if (r13 == 0) goto L_0x00c1;
    L_0x001f:
        r10 = r18.getScrollX();
        r11 = r18.getWidth();
        r0 = r18;
        r13 = r0.mPageMargin;
        r13 = (float) r13;
        r14 = (float) r11;
        r7 = r13 / r14;
        r5 = 0;
        r0 = r18;
        r13 = r0.mItems;
        r14 = 0;
        r3 = r13.get(r14);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        r8 = r3.offset;
        r0 = r18;
        r13 = r0.mItems;
        r4 = r13.size();
        r2 = r3.position;
        r0 = r18;
        r13 = r0.mItems;
        r14 = r4 + -1;
        r13 = r13.get(r14);
        r13 = (android.support.v4.view.ViewPager.ItemInfo) r13;
        r6 = r13.position;
        r9 = r2;
    L_0x0056:
        if (r9 >= r6) goto L_0x00c1;
    L_0x0058:
        r13 = r3.position;
        if (r9 <= r13) goto L_0x006b;
    L_0x005c:
        if (r5 >= r4) goto L_0x006b;
    L_0x005e:
        r0 = r18;
        r13 = r0.mItems;
        r5 = r5 + 1;
        r3 = r13.get(r5);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        goto L_0x0058;
    L_0x006b:
        r13 = r3.position;
        if (r9 != r13) goto L_0x00c2;
    L_0x006f:
        r13 = r3.offset;
        r14 = r3.widthFactor;
        r13 = r13 + r14;
        r14 = (float) r11;
        r1 = r13 * r14;
        r13 = r3.offset;
        r14 = r3.widthFactor;
        r13 = r13 + r14;
        r8 = r13 + r7;
    L_0x007e:
        r0 = r18;
        r13 = r0.mPageMargin;
        r13 = (float) r13;
        r13 = r13 + r1;
        r14 = (float) r10;
        r13 = (r13 > r14 ? 1 : (r13 == r14 ? 0 : -1));
        if (r13 <= 0) goto L_0x00ba;
    L_0x0089:
        r0 = r18;
        r13 = r0.mMarginDrawable;
        r14 = (int) r1;
        r0 = r18;
        r15 = r0.mTopPageBounds;
        r0 = r18;
        r0 = r0.mPageMargin;
        r16 = r0;
        r0 = r16;
        r0 = (float) r0;
        r16 = r0;
        r16 = r16 + r1;
        r17 = 1056964608; // 0x3f000000 float:0.5 double:5.222099017E-315;
        r16 = r16 + r17;
        r0 = r16;
        r0 = (int) r0;
        r16 = r0;
        r0 = r18;
        r0 = r0.mBottomPageBounds;
        r17 = r0;
        r13.setBounds(r14, r15, r16, r17);
        r0 = r18;
        r13 = r0.mMarginDrawable;
        r0 = r19;
        r13.draw(r0);
    L_0x00ba:
        r13 = r10 + r11;
        r13 = (float) r13;
        r13 = (r1 > r13 ? 1 : (r1 == r13 ? 0 : -1));
        if (r13 <= 0) goto L_0x00d3;
    L_0x00c1:
        return;
    L_0x00c2:
        r0 = r18;
        r13 = r0.mAdapter;
        r12 = r13.getPageWidth(r9);
        r13 = r8 + r12;
        r14 = (float) r11;
        r1 = r13 * r14;
        r13 = r12 + r7;
        r8 = r8 + r13;
        goto L_0x007e;
    L_0x00d3:
        r9 = r9 + 1;
        goto L_0x0056;
    }

    public boolean onInterceptTouchEvent(android.view.MotionEvent r15) {
        r14 = this;
        r0 = r15.getAction();
        r6 = r0 & 255;
        r0 = 3;
        if (r6 == r0) goto L_0x000c;
    L_0x0009:
        r0 = 1;
        if (r6 != r0) goto L_0x0023;
    L_0x000c:
        r0 = 0;
        r14.mIsBeingDragged = r0;
        r0 = 0;
        r14.mIsUnableToDrag = r0;
        r0 = -1;
        r14.mActivePointerId = r0;
        r0 = r14.mVelocityTracker;
        if (r0 == 0) goto L_0x0021;
    L_0x0019:
        r0 = r14.mVelocityTracker;
        r0.recycle();
        r0 = 0;
        r14.mVelocityTracker = r0;
    L_0x0021:
        r0 = 0;
    L_0x0022:
        return r0;
    L_0x0023:
        if (r6 == 0) goto L_0x0031;
    L_0x0025:
        r0 = r14.mIsBeingDragged;
        if (r0 == 0) goto L_0x002b;
    L_0x0029:
        r0 = 1;
        goto L_0x0022;
    L_0x002b:
        r0 = r14.mIsUnableToDrag;
        if (r0 == 0) goto L_0x0031;
    L_0x002f:
        r0 = 0;
        goto L_0x0022;
    L_0x0031:
        switch(r6) {
            case 0: goto L_0x00d2;
            case 2: goto L_0x0046;
            case 6: goto L_0x0128;
            default: goto L_0x0034;
        };
    L_0x0034:
        r0 = r14.mVelocityTracker;
        if (r0 != 0) goto L_0x003e;
    L_0x0038:
        r0 = android.view.VelocityTracker.obtain();
        r14.mVelocityTracker = r0;
    L_0x003e:
        r0 = r14.mVelocityTracker;
        r0.addMovement(r15);
        r0 = r14.mIsBeingDragged;
        goto L_0x0022;
    L_0x0046:
        r7 = r14.mActivePointerId;
        r0 = -1;
        if (r7 == r0) goto L_0x0034;
    L_0x004b:
        r9 = android.support.v4.view.MotionEventCompat.findPointerIndex(r15, r7);
        r10 = android.support.v4.view.MotionEventCompat.getX(r15, r9);
        r0 = r14.mLastMotionX;
        r8 = r10 - r0;
        r11 = java.lang.Math.abs(r8);
        r12 = android.support.v4.view.MotionEventCompat.getY(r15, r9);
        r0 = r14.mInitialMotionY;
        r0 = r12 - r0;
        r13 = java.lang.Math.abs(r0);
        r0 = 0;
        r0 = (r8 > r0 ? 1 : (r8 == r0 ? 0 : -1));
        if (r0 == 0) goto L_0x0089;
    L_0x006c:
        r0 = r14.mLastMotionX;
        r0 = r14.isGutterDrag(r0, r8);
        if (r0 != 0) goto L_0x0089;
    L_0x0074:
        r2 = 0;
        r3 = (int) r8;
        r4 = (int) r10;
        r5 = (int) r12;
        r0 = r14;
        r1 = r14;
        r0 = r0.canScroll(r1, r2, r3, r4, r5);
        if (r0 == 0) goto L_0x0089;
    L_0x0080:
        r14.mLastMotionX = r10;
        r14.mLastMotionY = r12;
        r0 = 1;
        r14.mIsUnableToDrag = r0;
        r0 = 0;
        goto L_0x0022;
    L_0x0089:
        r0 = r14.mTouchSlop;
        r0 = (float) r0;
        r0 = (r11 > r0 ? 1 : (r11 == r0 ? 0 : -1));
        if (r0 <= 0) goto L_0x00c7;
    L_0x0090:
        r0 = 1056964608; // 0x3f000000 float:0.5 double:5.222099017E-315;
        r0 = r0 * r11;
        r0 = (r0 > r13 ? 1 : (r0 == r13 ? 0 : -1));
        if (r0 <= 0) goto L_0x00c7;
    L_0x0097:
        r0 = 1;
        r14.mIsBeingDragged = r0;
        r0 = 1;
        r14.setScrollState(r0);
        r0 = 0;
        r0 = (r8 > r0 ? 1 : (r8 == r0 ? 0 : -1));
        if (r0 <= 0) goto L_0x00c0;
    L_0x00a3:
        r0 = r14.mInitialMotionX;
        r1 = r14.mTouchSlop;
        r1 = (float) r1;
        r0 = r0 + r1;
    L_0x00a9:
        r14.mLastMotionX = r0;
        r14.mLastMotionY = r12;
        r0 = 1;
        r14.setScrollingCacheEnabled(r0);
    L_0x00b1:
        r0 = r14.mIsBeingDragged;
        if (r0 == 0) goto L_0x0034;
    L_0x00b5:
        r0 = r14.performDrag(r10);
        if (r0 == 0) goto L_0x0034;
    L_0x00bb:
        android.support.v4.view.ViewCompat.postInvalidateOnAnimation(r14);
        goto L_0x0034;
    L_0x00c0:
        r0 = r14.mInitialMotionX;
        r1 = r14.mTouchSlop;
        r1 = (float) r1;
        r0 = r0 - r1;
        goto L_0x00a9;
    L_0x00c7:
        r0 = r14.mTouchSlop;
        r0 = (float) r0;
        r0 = (r13 > r0 ? 1 : (r13 == r0 ? 0 : -1));
        if (r0 <= 0) goto L_0x00b1;
    L_0x00ce:
        r0 = 1;
        r14.mIsUnableToDrag = r0;
        goto L_0x00b1;
    L_0x00d2:
        r0 = r15.getX();
        r14.mInitialMotionX = r0;
        r14.mLastMotionX = r0;
        r0 = r15.getY();
        r14.mInitialMotionY = r0;
        r14.mLastMotionY = r0;
        r0 = 0;
        r0 = android.support.v4.view.MotionEventCompat.getPointerId(r15, r0);
        r14.mActivePointerId = r0;
        r0 = 0;
        r14.mIsUnableToDrag = r0;
        r0 = r14.mScroller;
        r0.computeScrollOffset();
        r0 = r14.mScrollState;
        r1 = 2;
        if (r0 != r1) goto L_0x011f;
    L_0x00f6:
        r0 = r14.mScroller;
        r0 = r0.getFinalX();
        r1 = r14.mScroller;
        r1 = r1.getCurrX();
        r0 = r0 - r1;
        r0 = java.lang.Math.abs(r0);
        r1 = r14.mCloseEnough;
        if (r0 <= r1) goto L_0x011f;
    L_0x010b:
        r0 = r14.mScroller;
        r0.abortAnimation();
        r0 = 0;
        r14.mPopulatePending = r0;
        r14.populate();
        r0 = 1;
        r14.mIsBeingDragged = r0;
        r0 = 1;
        r14.setScrollState(r0);
        goto L_0x0034;
    L_0x011f:
        r0 = 0;
        r14.completeScroll(r0);
        r0 = 0;
        r14.mIsBeingDragged = r0;
        goto L_0x0034;
    L_0x0128:
        r14.onSecondaryPointerUp(r15);
        goto L_0x0034;
    }

    protected void onLayout(boolean r31, int r32, int r33, int r34, int r35) {
        r30 = this;
        r9 = r30.getChildCount();
        r24 = r34 - r32;
        r11 = r35 - r33;
        r19 = r30.getPaddingLeft();
        r21 = r30.getPaddingTop();
        r20 = r30.getPaddingRight();
        r18 = r30.getPaddingBottom();
        r22 = r30.getScrollX();
        r10 = 0;
        r14 = 0;
    L_0x001e:
        if (r14 >= r9) goto L_0x00c8;
    L_0x0020:
        r0 = r30;
        r5 = r0.getChildAt(r14);
        r26 = r5.getVisibility();
        r27 = 8;
        r0 = r26;
        r1 = r27;
        if (r0 == r1) goto L_0x0073;
    L_0x0032:
        r17 = r5.getLayoutParams();
        r17 = (android.support.v4.view.ViewPager.LayoutParams) r17;
        r6 = 0;
        r7 = 0;
        r0 = r17;
        r0 = r0.isDecor;
        r26 = r0;
        if (r26 == 0) goto L_0x0073;
    L_0x0042:
        r0 = r17;
        r0 = r0.gravity;
        r26 = r0;
        r13 = r26 & 7;
        r0 = r17;
        r0 = r0.gravity;
        r26 = r0;
        r23 = r26 & 112;
        switch(r13) {
            case 1: goto L_0x007f;
            case 2: goto L_0x0055;
            case 3: goto L_0x0076;
            case 4: goto L_0x0055;
            case 5: goto L_0x0090;
            default: goto L_0x0055;
        };
    L_0x0055:
        r6 = r19;
    L_0x0057:
        switch(r23) {
            case 16: goto L_0x00a8;
            case 48: goto L_0x009f;
            case 80: goto L_0x00b9;
            default: goto L_0x005a;
        };
    L_0x005a:
        r7 = r21;
    L_0x005c:
        r6 = r6 + r22;
        r26 = r5.getMeasuredWidth();
        r26 = r26 + r6;
        r27 = r5.getMeasuredHeight();
        r27 = r27 + r7;
        r0 = r26;
        r1 = r27;
        r5.layout(r6, r7, r0, r1);
        r10 = r10 + 1;
    L_0x0073:
        r14 = r14 + 1;
        goto L_0x001e;
    L_0x0076:
        r6 = r19;
        r26 = r5.getMeasuredWidth();
        r19 = r19 + r26;
        goto L_0x0057;
    L_0x007f:
        r26 = r5.getMeasuredWidth();
        r26 = r24 - r26;
        r26 = r26 / 2;
        r0 = r26;
        r1 = r19;
        r6 = java.lang.Math.max(r0, r1);
        goto L_0x0057;
    L_0x0090:
        r26 = r24 - r20;
        r27 = r5.getMeasuredWidth();
        r6 = r26 - r27;
        r26 = r5.getMeasuredWidth();
        r20 = r20 + r26;
        goto L_0x0057;
    L_0x009f:
        r7 = r21;
        r26 = r5.getMeasuredHeight();
        r21 = r21 + r26;
        goto L_0x005c;
    L_0x00a8:
        r26 = r5.getMeasuredHeight();
        r26 = r11 - r26;
        r26 = r26 / 2;
        r0 = r26;
        r1 = r21;
        r7 = java.lang.Math.max(r0, r1);
        goto L_0x005c;
    L_0x00b9:
        r26 = r11 - r18;
        r27 = r5.getMeasuredHeight();
        r7 = r26 - r27;
        r26 = r5.getMeasuredHeight();
        r18 = r18 + r26;
        goto L_0x005c;
    L_0x00c8:
        r26 = r24 - r19;
        r8 = r26 - r20;
        r14 = 0;
    L_0x00cd:
        if (r14 >= r9) goto L_0x0155;
    L_0x00cf:
        r0 = r30;
        r5 = r0.getChildAt(r14);
        r26 = r5.getVisibility();
        r27 = 8;
        r0 = r26;
        r1 = r27;
        if (r0 == r1) goto L_0x0151;
    L_0x00e1:
        r17 = r5.getLayoutParams();
        r17 = (android.support.v4.view.ViewPager.LayoutParams) r17;
        r0 = r17;
        r0 = r0.isDecor;
        r26 = r0;
        if (r26 != 0) goto L_0x0151;
    L_0x00ef:
        r0 = r30;
        r15 = r0.infoForChild(r5);
        if (r15 == 0) goto L_0x0151;
    L_0x00f7:
        r0 = (float) r8;
        r26 = r0;
        r0 = r15.offset;
        r27 = r0;
        r26 = r26 * r27;
        r0 = r26;
        r0 = (int) r0;
        r16 = r0;
        r6 = r19 + r16;
        r7 = r21;
        r0 = r17;
        r0 = r0.needsMeasure;
        r26 = r0;
        if (r26 == 0) goto L_0x013e;
    L_0x0111:
        r26 = 0;
        r0 = r26;
        r1 = r17;
        r1.needsMeasure = r0;
        r0 = (float) r8;
        r26 = r0;
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r26 = r26 * r27;
        r0 = r26;
        r0 = (int) r0;
        r26 = r0;
        r27 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r25 = android.view.View.MeasureSpec.makeMeasureSpec(r26, r27);
        r26 = r11 - r21;
        r26 = r26 - r18;
        r27 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r12 = android.view.View.MeasureSpec.makeMeasureSpec(r26, r27);
        r0 = r25;
        r5.measure(r0, r12);
    L_0x013e:
        r26 = r5.getMeasuredWidth();
        r26 = r26 + r6;
        r27 = r5.getMeasuredHeight();
        r27 = r27 + r7;
        r0 = r26;
        r1 = r27;
        r5.layout(r6, r7, r0, r1);
    L_0x0151:
        r14 = r14 + 1;
        goto L_0x00cd;
    L_0x0155:
        r0 = r21;
        r1 = r30;
        r1.mTopPageBounds = r0;
        r26 = r11 - r18;
        r0 = r26;
        r1 = r30;
        r1.mBottomPageBounds = r0;
        r0 = r30;
        r0.mDecorChildCount = r10;
        r0 = r30;
        r0 = r0.mFirstLayout;
        r26 = r0;
        if (r26 == 0) goto L_0x0188;
    L_0x016f:
        r0 = r30;
        r0 = r0.mCurItem;
        r26 = r0;
        r27 = 0;
        r28 = 0;
        r29 = 0;
        r0 = r30;
        r1 = r26;
        r2 = r27;
        r3 = r28;
        r4 = r29;
        r0.scrollToItem(r1, r2, r3, r4);
    L_0x0188:
        r26 = 0;
        r0 = r26;
        r1 = r30;
        r1.mFirstLayout = r0;
        return;
    }

    protected void onMeasure(int r24, int r25) {
        r23 = this;
        r21 = 0;
        r0 = r21;
        r1 = r24;
        r21 = getDefaultSize(r0, r1);
        r22 = 0;
        r0 = r22;
        r1 = r25;
        r22 = getDefaultSize(r0, r1);
        r0 = r23;
        r1 = r21;
        r2 = r22;
        r0.setMeasuredDimension(r1, r2);
        r15 = r23.getMeasuredWidth();
        r14 = r15 / 10;
        r0 = r23;
        r0 = r0.mDefaultGutterSize;
        r21 = r0;
        r0 = r21;
        r21 = java.lang.Math.min(r14, r0);
        r0 = r21;
        r1 = r23;
        r1.mGutterSize = r0;
        r21 = r23.getPaddingLeft();
        r21 = r15 - r21;
        r22 = r23.getPaddingRight();
        r5 = r21 - r22;
        r21 = r23.getMeasuredHeight();
        r22 = r23.getPaddingTop();
        r21 = r21 - r22;
        r22 = r23.getPaddingBottom();
        r4 = r21 - r22;
        r16 = r23.getChildCount();
        r12 = 0;
    L_0x0056:
        r0 = r16;
        if (r12 >= r0) goto L_0x0118;
    L_0x005a:
        r0 = r23;
        r3 = r0.getChildAt(r12);
        r21 = r3.getVisibility();
        r22 = 8;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x0102;
    L_0x006c:
        r13 = r3.getLayoutParams();
        r13 = (android.support.v4.view.ViewPager.LayoutParams) r13;
        if (r13 == 0) goto L_0x0102;
    L_0x0074:
        r0 = r13.isDecor;
        r21 = r0;
        if (r21 == 0) goto L_0x0102;
    L_0x007a:
        r0 = r13.gravity;
        r21 = r0;
        r11 = r21 & 7;
        r0 = r13.gravity;
        r21 = r0;
        r17 = r21 & 112;
        r18 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r8 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r21 = 48;
        r0 = r17;
        r1 = r21;
        if (r0 == r1) goto L_0x009a;
    L_0x0092:
        r21 = 80;
        r0 = r17;
        r1 = r21;
        if (r0 != r1) goto L_0x0106;
    L_0x009a:
        r7 = 1;
    L_0x009b:
        r21 = 3;
        r0 = r21;
        if (r11 == r0) goto L_0x00a7;
    L_0x00a1:
        r21 = 5;
        r0 = r21;
        if (r11 != r0) goto L_0x0108;
    L_0x00a7:
        r6 = 1;
    L_0x00a8:
        if (r7 == 0) goto L_0x010a;
    L_0x00aa:
        r18 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
    L_0x00ac:
        r19 = r5;
        r9 = r4;
        r0 = r13.width;
        r21 = r0;
        r22 = -2;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x00cd;
    L_0x00bb:
        r18 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r0 = r13.width;
        r21 = r0;
        r22 = -1;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x00cd;
    L_0x00c9:
        r0 = r13.width;
        r19 = r0;
    L_0x00cd:
        r0 = r13.height;
        r21 = r0;
        r22 = -2;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x00e9;
    L_0x00d9:
        r8 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r0 = r13.height;
        r21 = r0;
        r22 = -1;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x00e9;
    L_0x00e7:
        r9 = r13.height;
    L_0x00e9:
        r0 = r19;
        r1 = r18;
        r20 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r1);
        r10 = android.view.View.MeasureSpec.makeMeasureSpec(r9, r8);
        r0 = r20;
        r3.measure(r0, r10);
        if (r7 == 0) goto L_0x010f;
    L_0x00fc:
        r21 = r3.getMeasuredHeight();
        r4 = r4 - r21;
    L_0x0102:
        r12 = r12 + 1;
        goto L_0x0056;
    L_0x0106:
        r7 = 0;
        goto L_0x009b;
    L_0x0108:
        r6 = 0;
        goto L_0x00a8;
    L_0x010a:
        if (r6 == 0) goto L_0x00ac;
    L_0x010c:
        r8 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x00ac;
    L_0x010f:
        if (r6 == 0) goto L_0x0102;
    L_0x0111:
        r21 = r3.getMeasuredWidth();
        r5 = r5 - r21;
        goto L_0x0102;
    L_0x0118:
        r21 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r0 = r21;
        r21 = android.view.View.MeasureSpec.makeMeasureSpec(r5, r0);
        r0 = r21;
        r1 = r23;
        r1.mChildWidthMeasureSpec = r0;
        r21 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r0 = r21;
        r21 = android.view.View.MeasureSpec.makeMeasureSpec(r4, r0);
        r0 = r21;
        r1 = r23;
        r1.mChildHeightMeasureSpec = r0;
        r21 = 1;
        r0 = r21;
        r1 = r23;
        r1.mInLayout = r0;
        r23.populate();
        r21 = 0;
        r0 = r21;
        r1 = r23;
        r1.mInLayout = r0;
        r16 = r23.getChildCount();
        r12 = 0;
    L_0x014c:
        r0 = r16;
        if (r12 >= r0) goto L_0x0194;
    L_0x0150:
        r0 = r23;
        r3 = r0.getChildAt(r12);
        r21 = r3.getVisibility();
        r22 = 8;
        r0 = r21;
        r1 = r22;
        if (r0 == r1) goto L_0x0191;
    L_0x0162:
        r13 = r3.getLayoutParams();
        r13 = (android.support.v4.view.ViewPager.LayoutParams) r13;
        if (r13 == 0) goto L_0x0170;
    L_0x016a:
        r0 = r13.isDecor;
        r21 = r0;
        if (r21 != 0) goto L_0x0191;
    L_0x0170:
        r0 = (float) r5;
        r21 = r0;
        r0 = r13.widthFactor;
        r22 = r0;
        r21 = r21 * r22;
        r0 = r21;
        r0 = (int) r0;
        r21 = r0;
        r22 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r20 = android.view.View.MeasureSpec.makeMeasureSpec(r21, r22);
        r0 = r23;
        r0 = r0.mChildHeightMeasureSpec;
        r21 = r0;
        r0 = r20;
        r1 = r21;
        r3.measure(r0, r1);
    L_0x0191:
        r12 = r12 + 1;
        goto L_0x014c;
    L_0x0194:
        return;
    }

    protected void onPageScrolled(int r18, float r19, int r20) {
        r17 = this;
        r0 = r17;
        r15 = r0.mDecorChildCount;
        if (r15 <= 0) goto L_0x0068;
    L_0x0006:
        r12 = r17.getScrollX();
        r10 = r17.getPaddingLeft();
        r11 = r17.getPaddingRight();
        r14 = r17.getWidth();
        r4 = r17.getChildCount();
        r8 = 0;
    L_0x001b:
        if (r8 >= r4) goto L_0x0068;
    L_0x001d:
        r0 = r17;
        r3 = r0.getChildAt(r8);
        r9 = r3.getLayoutParams();
        r9 = (android.support.v4.view.ViewPager.LayoutParams) r9;
        r15 = r9.isDecor;
        if (r15 != 0) goto L_0x0030;
    L_0x002d:
        r8 = r8 + 1;
        goto L_0x001b;
    L_0x0030:
        r15 = r9.gravity;
        r7 = r15 & 7;
        r5 = 0;
        switch(r7) {
            case 1: goto L_0x004d;
            case 2: goto L_0x0038;
            case 3: goto L_0x0046;
            case 4: goto L_0x0038;
            case 5: goto L_0x005a;
            default: goto L_0x0038;
        };
    L_0x0038:
        r5 = r10;
    L_0x0039:
        r5 = r5 + r12;
        r15 = r3.getLeft();
        r6 = r5 - r15;
        if (r6 == 0) goto L_0x002d;
    L_0x0042:
        r3.offsetLeftAndRight(r6);
        goto L_0x002d;
    L_0x0046:
        r5 = r10;
        r15 = r3.getWidth();
        r10 = r10 + r15;
        goto L_0x0039;
    L_0x004d:
        r15 = r3.getMeasuredWidth();
        r15 = r14 - r15;
        r15 = r15 / 2;
        r5 = java.lang.Math.max(r15, r10);
        goto L_0x0039;
    L_0x005a:
        r15 = r14 - r11;
        r16 = r3.getMeasuredWidth();
        r5 = r15 - r16;
        r15 = r3.getMeasuredWidth();
        r11 = r11 + r15;
        goto L_0x0039;
    L_0x0068:
        r0 = r17;
        r15 = r0.mOnPageChangeListener;
        if (r15 == 0) goto L_0x007b;
    L_0x006e:
        r0 = r17;
        r15 = r0.mOnPageChangeListener;
        r0 = r18;
        r1 = r19;
        r2 = r20;
        r15.onPageScrolled(r0, r1, r2);
    L_0x007b:
        r0 = r17;
        r15 = r0.mInternalPageChangeListener;
        if (r15 == 0) goto L_0x008e;
    L_0x0081:
        r0 = r17;
        r15 = r0.mInternalPageChangeListener;
        r0 = r18;
        r1 = r19;
        r2 = r20;
        r15.onPageScrolled(r0, r1, r2);
    L_0x008e:
        r0 = r17;
        r15 = r0.mPageTransformer;
        if (r15 == 0) goto L_0x00cb;
    L_0x0094:
        r12 = r17.getScrollX();
        r4 = r17.getChildCount();
        r8 = 0;
    L_0x009d:
        if (r8 >= r4) goto L_0x00cb;
    L_0x009f:
        r0 = r17;
        r3 = r0.getChildAt(r8);
        r9 = r3.getLayoutParams();
        r9 = (android.support.v4.view.ViewPager.LayoutParams) r9;
        r15 = r9.isDecor;
        if (r15 == 0) goto L_0x00b2;
    L_0x00af:
        r8 = r8 + 1;
        goto L_0x009d;
    L_0x00b2:
        r15 = r3.getLeft();
        r15 = r15 - r12;
        r15 = (float) r15;
        r16 = r17.getClientWidth();
        r0 = r16;
        r0 = (float) r0;
        r16 = r0;
        r13 = r15 / r16;
        r0 = r17;
        r15 = r0.mPageTransformer;
        r15.transformPage(r3, r13);
        goto L_0x00af;
    L_0x00cb:
        r15 = 1;
        r0 = r17;
        r0.mCalledSuper = r15;
        return;
    }

    protected boolean onRequestFocusInDescendants(int r10, android.graphics.Rect r11) {
        r9 = this;
        r1 = r9.getChildCount();
        r7 = r10 & 2;
        if (r7 == 0) goto L_0x002c;
    L_0x0008:
        r6 = 0;
        r5 = 1;
        r2 = r1;
    L_0x000b:
        r3 = r6;
    L_0x000c:
        if (r3 == r2) goto L_0x0033;
    L_0x000e:
        r0 = r9.getChildAt(r3);
        r7 = r0.getVisibility();
        if (r7 != 0) goto L_0x0031;
    L_0x0018:
        r4 = r9.infoForChild(r0);
        if (r4 == 0) goto L_0x0031;
    L_0x001e:
        r7 = r4.position;
        r8 = r9.mCurItem;
        if (r7 != r8) goto L_0x0031;
    L_0x0024:
        r7 = r0.requestFocus(r10, r11);
        if (r7 == 0) goto L_0x0031;
    L_0x002a:
        r7 = 1;
    L_0x002b:
        return r7;
    L_0x002c:
        r6 = r1 + -1;
        r5 = -1;
        r2 = -1;
        goto L_0x000b;
    L_0x0031:
        r3 = r3 + r5;
        goto L_0x000c;
    L_0x0033:
        r7 = 0;
        goto L_0x002b;
    }

    public void onRestoreInstanceState(android.os.Parcelable r5) {
        r4 = this;
        r1 = r5 instanceof android.support.v4.view.ViewPager.SavedState;
        if (r1 != 0) goto L_0x0008;
    L_0x0004:
        super.onRestoreInstanceState(r5);
    L_0x0007:
        return;
    L_0x0008:
        r0 = r5;
        r0 = (android.support.v4.view.ViewPager.SavedState) r0;
        r1 = r0.getSuperState();
        super.onRestoreInstanceState(r1);
        r1 = r4.mAdapter;
        if (r1 == 0) goto L_0x0027;
    L_0x0016:
        r1 = r4.mAdapter;
        r2 = r0.adapterState;
        r3 = r0.loader;
        r1.restoreState(r2, r3);
        r1 = r0.position;
        r2 = 0;
        r3 = 1;
        r4.setCurrentItemInternal(r1, r2, r3);
        goto L_0x0007;
    L_0x0027:
        r1 = r0.position;
        r4.mRestoredCurItem = r1;
        r1 = r0.adapterState;
        r4.mRestoredAdapterState = r1;
        r1 = r0.loader;
        r4.mRestoredClassLoader = r1;
        goto L_0x0007;
    }

    public android.os.Parcelable onSaveInstanceState() {
        r3 = this;
        r1 = super.onSaveInstanceState();
        r0 = new android.support.v4.view.ViewPager$SavedState;
        r0.<init>(r1);
        r2 = r3.mCurItem;
        r0.position = r2;
        r2 = r3.mAdapter;
        if (r2 == 0) goto L_0x0019;
    L_0x0011:
        r2 = r3.mAdapter;
        r2 = r2.saveState();
        r0.adapterState = r2;
    L_0x0019:
        return r0;
    }

    protected void onSizeChanged(int r3, int r4, int r5, int r6) {
        r2 = this;
        super.onSizeChanged(r3, r4, r5, r6);
        if (r3 == r5) goto L_0x000c;
    L_0x0005:
        r0 = r2.mPageMargin;
        r1 = r2.mPageMargin;
        r2.recomputeScrollPosition(r3, r5, r0, r1);
    L_0x000c:
        return;
    }

    public boolean onTouchEvent(android.view.MotionEvent r28) {
        r27 = this;
        r0 = r27;
        r0 = r0.mFakeDragging;
        r23 = r0;
        if (r23 == 0) goto L_0x000b;
    L_0x0008:
        r23 = 1;
    L_0x000a:
        return r23;
    L_0x000b:
        r23 = r28.getAction();
        if (r23 != 0) goto L_0x001a;
    L_0x0011:
        r23 = r28.getEdgeFlags();
        if (r23 == 0) goto L_0x001a;
    L_0x0017:
        r23 = 0;
        goto L_0x000a;
    L_0x001a:
        r0 = r27;
        r0 = r0.mAdapter;
        r23 = r0;
        if (r23 == 0) goto L_0x002e;
    L_0x0022:
        r0 = r27;
        r0 = r0.mAdapter;
        r23 = r0;
        r23 = r23.getCount();
        if (r23 != 0) goto L_0x0031;
    L_0x002e:
        r23 = 0;
        goto L_0x000a;
    L_0x0031:
        r0 = r27;
        r0 = r0.mVelocityTracker;
        r23 = r0;
        if (r23 != 0) goto L_0x0043;
    L_0x0039:
        r23 = android.view.VelocityTracker.obtain();
        r0 = r23;
        r1 = r27;
        r1.mVelocityTracker = r0;
    L_0x0043:
        r0 = r27;
        r0 = r0.mVelocityTracker;
        r23 = r0;
        r0 = r23;
        r1 = r28;
        r0.addMovement(r1);
        r5 = r28.getAction();
        r11 = 0;
        r0 = r5 & 255;
        r23 = r0;
        switch(r23) {
            case 0: goto L_0x0064;
            case 1: goto L_0x018a;
            case 2: goto L_0x00ba;
            case 3: goto L_0x0244;
            case 4: goto L_0x005c;
            case 5: goto L_0x0288;
            case 6: goto L_0x02a6;
            default: goto L_0x005c;
        };
    L_0x005c:
        if (r11 == 0) goto L_0x0061;
    L_0x005e:
        android.support.v4.view.ViewCompat.postInvalidateOnAnimation(r27);
    L_0x0061:
        r23 = 1;
        goto L_0x000a;
    L_0x0064:
        r0 = r27;
        r0 = r0.mScroller;
        r23 = r0;
        r23.abortAnimation();
        r23 = 0;
        r0 = r23;
        r1 = r27;
        r1.mPopulatePending = r0;
        r27.populate();
        r23 = 1;
        r0 = r23;
        r1 = r27;
        r1.mIsBeingDragged = r0;
        r23 = 1;
        r0 = r27;
        r1 = r23;
        r0.setScrollState(r1);
        r23 = r28.getX();
        r0 = r23;
        r1 = r27;
        r1.mInitialMotionX = r0;
        r0 = r23;
        r1 = r27;
        r1.mLastMotionX = r0;
        r23 = r28.getY();
        r0 = r23;
        r1 = r27;
        r1.mInitialMotionY = r0;
        r0 = r23;
        r1 = r27;
        r1.mLastMotionY = r0;
        r23 = 0;
        r0 = r28;
        r1 = r23;
        r23 = android.support.v4.view.MotionEventCompat.getPointerId(r0, r1);
        r0 = r23;
        r1 = r27;
        r1.mActivePointerId = r0;
        goto L_0x005c;
    L_0x00ba:
        r0 = r27;
        r0 = r0.mIsBeingDragged;
        r23 = r0;
        if (r23 != 0) goto L_0x014e;
    L_0x00c2:
        r0 = r27;
        r0 = r0.mActivePointerId;
        r23 = r0;
        r0 = r28;
        r1 = r23;
        r14 = android.support.v4.view.MotionEventCompat.findPointerIndex(r0, r1);
        r0 = r28;
        r19 = android.support.v4.view.MotionEventCompat.getX(r0, r14);
        r0 = r27;
        r0 = r0.mLastMotionX;
        r23 = r0;
        r23 = r19 - r23;
        r20 = java.lang.Math.abs(r23);
        r0 = r28;
        r21 = android.support.v4.view.MotionEventCompat.getY(r0, r14);
        r0 = r27;
        r0 = r0.mLastMotionY;
        r23 = r0;
        r23 = r21 - r23;
        r22 = java.lang.Math.abs(r23);
        r0 = r27;
        r0 = r0.mTouchSlop;
        r23 = r0;
        r0 = r23;
        r0 = (float) r0;
        r23 = r0;
        r23 = (r20 > r23 ? 1 : (r20 == r23 ? 0 : -1));
        if (r23 <= 0) goto L_0x014e;
    L_0x0103:
        r23 = (r20 > r22 ? 1 : (r20 == r22 ? 0 : -1));
        if (r23 <= 0) goto L_0x014e;
    L_0x0107:
        r23 = 1;
        r0 = r23;
        r1 = r27;
        r1.mIsBeingDragged = r0;
        r0 = r27;
        r0 = r0.mInitialMotionX;
        r23 = r0;
        r23 = r19 - r23;
        r24 = 0;
        r23 = (r23 > r24 ? 1 : (r23 == r24 ? 0 : -1));
        if (r23 <= 0) goto L_0x0176;
    L_0x011d:
        r0 = r27;
        r0 = r0.mInitialMotionX;
        r23 = r0;
        r0 = r27;
        r0 = r0.mTouchSlop;
        r24 = r0;
        r0 = r24;
        r0 = (float) r0;
        r24 = r0;
        r23 = r23 + r24;
    L_0x0130:
        r0 = r23;
        r1 = r27;
        r1.mLastMotionX = r0;
        r0 = r21;
        r1 = r27;
        r1.mLastMotionY = r0;
        r23 = 1;
        r0 = r27;
        r1 = r23;
        r0.setScrollState(r1);
        r23 = 1;
        r0 = r27;
        r1 = r23;
        r0.setScrollingCacheEnabled(r1);
    L_0x014e:
        r0 = r27;
        r0 = r0.mIsBeingDragged;
        r23 = r0;
        if (r23 == 0) goto L_0x005c;
    L_0x0156:
        r0 = r27;
        r0 = r0.mActivePointerId;
        r23 = r0;
        r0 = r28;
        r1 = r23;
        r6 = android.support.v4.view.MotionEventCompat.findPointerIndex(r0, r1);
        r0 = r28;
        r19 = android.support.v4.view.MotionEventCompat.getX(r0, r6);
        r0 = r27;
        r1 = r19;
        r23 = r0.performDrag(r1);
        r11 = r11 | r23;
        goto L_0x005c;
    L_0x0176:
        r0 = r27;
        r0 = r0.mInitialMotionX;
        r23 = r0;
        r0 = r27;
        r0 = r0.mTouchSlop;
        r24 = r0;
        r0 = r24;
        r0 = (float) r0;
        r24 = r0;
        r23 = r23 - r24;
        goto L_0x0130;
    L_0x018a:
        r0 = r27;
        r0 = r0.mIsBeingDragged;
        r23 = r0;
        if (r23 == 0) goto L_0x005c;
    L_0x0192:
        r0 = r27;
        r0 = r0.mVelocityTracker;
        r17 = r0;
        r23 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
        r0 = r27;
        r0 = r0.mMaximumVelocity;
        r24 = r0;
        r0 = r24;
        r0 = (float) r0;
        r24 = r0;
        r0 = r17;
        r1 = r23;
        r2 = r24;
        r0.computeCurrentVelocity(r1, r2);
        r0 = r27;
        r0 = r0.mActivePointerId;
        r23 = r0;
        r0 = r17;
        r1 = r23;
        r23 = android.support.v4.view.VelocityTrackerCompat.getXVelocity(r0, r1);
        r0 = r23;
        r10 = (int) r0;
        r23 = 1;
        r0 = r23;
        r1 = r27;
        r1.mPopulatePending = r0;
        r18 = r27.getClientWidth();
        r15 = r27.getScrollX();
        r8 = r27.infoForCurrentScrollPosition();
        r7 = r8.position;
        r0 = (float) r15;
        r23 = r0;
        r0 = r18;
        r0 = (float) r0;
        r24 = r0;
        r23 = r23 / r24;
        r0 = r8.offset;
        r24 = r0;
        r23 = r23 - r24;
        r0 = r8.widthFactor;
        r24 = r0;
        r13 = r23 / r24;
        r0 = r27;
        r0 = r0.mActivePointerId;
        r23 = r0;
        r0 = r28;
        r1 = r23;
        r6 = android.support.v4.view.MotionEventCompat.findPointerIndex(r0, r1);
        r0 = r28;
        r19 = android.support.v4.view.MotionEventCompat.getX(r0, r6);
        r0 = r27;
        r0 = r0.mInitialMotionX;
        r23 = r0;
        r23 = r19 - r23;
        r0 = r23;
        r0 = (int) r0;
        r16 = r0;
        r0 = r27;
        r1 = r16;
        r12 = r0.determineTargetPage(r7, r13, r10, r1);
        r23 = 1;
        r24 = 1;
        r0 = r27;
        r1 = r23;
        r2 = r24;
        r0.setCurrentItemInternal(r12, r1, r2, r10);
        r23 = -1;
        r0 = r23;
        r1 = r27;
        r1.mActivePointerId = r0;
        r27.endDrag();
        r0 = r27;
        r0 = r0.mLeftEdge;
        r23 = r0;
        r23 = r23.onRelease();
        r0 = r27;
        r0 = r0.mRightEdge;
        r24 = r0;
        r24 = r24.onRelease();
        r11 = r23 | r24;
        goto L_0x005c;
    L_0x0244:
        r0 = r27;
        r0 = r0.mIsBeingDragged;
        r23 = r0;
        if (r23 == 0) goto L_0x005c;
    L_0x024c:
        r0 = r27;
        r0 = r0.mCurItem;
        r23 = r0;
        r24 = 1;
        r25 = 0;
        r26 = 0;
        r0 = r27;
        r1 = r23;
        r2 = r24;
        r3 = r25;
        r4 = r26;
        r0.scrollToItem(r1, r2, r3, r4);
        r23 = -1;
        r0 = r23;
        r1 = r27;
        r1.mActivePointerId = r0;
        r27.endDrag();
        r0 = r27;
        r0 = r0.mLeftEdge;
        r23 = r0;
        r23 = r23.onRelease();
        r0 = r27;
        r0 = r0.mRightEdge;
        r24 = r0;
        r24 = r24.onRelease();
        r11 = r23 | r24;
        goto L_0x005c;
    L_0x0288:
        r9 = android.support.v4.view.MotionEventCompat.getActionIndex(r28);
        r0 = r28;
        r19 = android.support.v4.view.MotionEventCompat.getX(r0, r9);
        r0 = r19;
        r1 = r27;
        r1.mLastMotionX = r0;
        r0 = r28;
        r23 = android.support.v4.view.MotionEventCompat.getPointerId(r0, r9);
        r0 = r23;
        r1 = r27;
        r1.mActivePointerId = r0;
        goto L_0x005c;
    L_0x02a6:
        r27.onSecondaryPointerUp(r28);
        r0 = r27;
        r0 = r0.mActivePointerId;
        r23 = r0;
        r0 = r28;
        r1 = r23;
        r23 = android.support.v4.view.MotionEventCompat.findPointerIndex(r0, r1);
        r0 = r28;
        r1 = r23;
        r23 = android.support.v4.view.MotionEventCompat.getX(r0, r1);
        r0 = r23;
        r1 = r27;
        r1.mLastMotionX = r0;
        goto L_0x005c;
    }

    boolean pageLeft() {
        r2 = this;
        r0 = 1;
        r1 = r2.mCurItem;
        if (r1 <= 0) goto L_0x000d;
    L_0x0005:
        r1 = r2.mCurItem;
        r1 = r1 + -1;
        r2.setCurrentItem(r1, r0);
    L_0x000c:
        return r0;
    L_0x000d:
        r0 = 0;
        goto L_0x000c;
    }

    boolean pageRight() {
        r3 = this;
        r0 = 1;
        r1 = r3.mAdapter;
        if (r1 == 0) goto L_0x0019;
    L_0x0005:
        r1 = r3.mCurItem;
        r2 = r3.mAdapter;
        r2 = r2.getCount();
        r2 = r2 + -1;
        if (r1 >= r2) goto L_0x0019;
    L_0x0011:
        r1 = r3.mCurItem;
        r1 = r1 + 1;
        r3.setCurrentItem(r1, r0);
    L_0x0018:
        return r0;
    L_0x0019:
        r0 = 0;
        goto L_0x0018;
    }

    void populate() {
        r1 = this;
        r0 = r1.mCurItem;
        r1.populate(r0);
        return;
    }

    void populate(int r31) {
        r30 = this;
        r21 = 0;
        r15 = 2;
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r0 = r27;
        r1 = r31;
        if (r0 == r1) goto L_0x0031;
    L_0x000f:
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r0 = r27;
        r1 = r31;
        if (r0 >= r1) goto L_0x003d;
    L_0x001b:
        r15 = 66;
    L_0x001d:
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r0 = r30;
        r1 = r27;
        r21 = r0.infoForPosition(r1);
        r0 = r31;
        r1 = r30;
        r1.mCurItem = r0;
    L_0x0031:
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        if (r27 != 0) goto L_0x0040;
    L_0x0039:
        r30.sortChildDrawingOrder();
    L_0x003c:
        return;
    L_0x003d:
        r15 = 17;
        goto L_0x001d;
    L_0x0040:
        r0 = r30;
        r0 = r0.mPopulatePending;
        r27 = r0;
        if (r27 == 0) goto L_0x004c;
    L_0x0048:
        r30.sortChildDrawingOrder();
        goto L_0x003c;
    L_0x004c:
        r27 = r30.getWindowToken();
        if (r27 == 0) goto L_0x003c;
    L_0x0052:
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        r0 = r27;
        r1 = r30;
        r0.startUpdate(r1);
        r0 = r30;
        r0 = r0.mOffscreenPageLimit;
        r22 = r0;
        r27 = 0;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r28 = r28 - r22;
        r26 = java.lang.Math.max(r27, r28);
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        r4 = r27.getCount();
        r27 = r4 + -1;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r28 = r28 + r22;
        r12 = java.lang.Math.min(r27, r28);
        r0 = r30;
        r0 = r0.mExpectedAdapterCount;
        r27 = r0;
        r0 = r27;
        if (r4 == r0) goto L_0x0106;
    L_0x0095:
        r27 = r30.getResources();	 Catch:{ NotFoundException -> 0x00fc }
        r28 = r30.getId();	 Catch:{ NotFoundException -> 0x00fc }
        r24 = r27.getResourceName(r28);	 Catch:{ NotFoundException -> 0x00fc }
    L_0x00a1:
        r27 = new java.lang.IllegalStateException;
        r28 = new java.lang.StringBuilder;
        r28.<init>();
        r29 = "The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: ";
        r28 = r28.append(r29);
        r0 = r30;
        r0 = r0.mExpectedAdapterCount;
        r29 = r0;
        r28 = r28.append(r29);
        r29 = ", found: ";
        r28 = r28.append(r29);
        r0 = r28;
        r28 = r0.append(r4);
        r29 = " Pager id: ";
        r28 = r28.append(r29);
        r0 = r28;
        r1 = r24;
        r28 = r0.append(r1);
        r29 = " Pager class: ";
        r28 = r28.append(r29);
        r29 = r30.getClass();
        r28 = r28.append(r29);
        r29 = " Problematic adapter: ";
        r28 = r28.append(r29);
        r0 = r30;
        r0 = r0.mAdapter;
        r29 = r0;
        r29 = r29.getClass();
        r28 = r28.append(r29);
        r28 = r28.toString();
        r27.<init>(r28);
        throw r27;
    L_0x00fc:
        r11 = move-exception;
        r27 = r30.getId();
        r24 = java.lang.Integer.toHexString(r27);
        goto L_0x00a1;
    L_0x0106:
        r8 = -1;
        r9 = 0;
        r8 = 0;
    L_0x0109:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r27 = r27.size();
        r0 = r27;
        if (r8 >= r0) goto L_0x014b;
    L_0x0117:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r17 = r0.get(r8);
        r17 = (android.support.v4.view.ViewPager.ItemInfo) r17;
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r0 = r27;
        r1 = r28;
        if (r0 < r1) goto L_0x0260;
    L_0x0137:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r0 = r27;
        r1 = r28;
        if (r0 != r1) goto L_0x014b;
    L_0x0149:
        r9 = r17;
    L_0x014b:
        if (r9 != 0) goto L_0x015d;
    L_0x014d:
        if (r4 <= 0) goto L_0x015d;
    L_0x014f:
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r0 = r30;
        r1 = r27;
        r9 = r0.addNewItem(r1, r8);
    L_0x015d:
        if (r9 == 0) goto L_0x01e1;
    L_0x015f:
        r13 = 0;
        r18 = r8 + -1;
        if (r18 < 0) goto L_0x0264;
    L_0x0164:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x0176:
        r7 = r30.getClientWidth();
        if (r7 > 0) goto L_0x0268;
    L_0x017c:
        r19 = 0;
    L_0x017e:
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r23 = r27 + -1;
    L_0x0186:
        if (r23 < 0) goto L_0x0194;
    L_0x0188:
        r27 = (r13 > r19 ? 1 : (r13 == r19 ? 0 : -1));
        if (r27 < 0) goto L_0x02d9;
    L_0x018c:
        r0 = r23;
        r1 = r26;
        if (r0 >= r1) goto L_0x02d9;
    L_0x0192:
        if (r17 != 0) goto L_0x0282;
    L_0x0194:
        r14 = r9.widthFactor;
        r18 = r8 + 1;
        r27 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r27 = (r14 > r27 ? 1 : (r14 == r27 ? 0 : -1));
        if (r27 >= 0) goto L_0x01da;
    L_0x019e:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r27 = r27.size();
        r0 = r18;
        r1 = r27;
        if (r0 >= r1) goto L_0x0337;
    L_0x01ae:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x01c0:
        if (r7 > 0) goto L_0x033b;
    L_0x01c2:
        r25 = 0;
    L_0x01c4:
        r0 = r30;
        r0 = r0.mCurItem;
        r27 = r0;
        r23 = r27 + 1;
    L_0x01cc:
        r0 = r23;
        if (r0 >= r4) goto L_0x01da;
    L_0x01d0:
        r27 = (r14 > r25 ? 1 : (r14 == r25 ? 0 : -1));
        if (r27 < 0) goto L_0x03b0;
    L_0x01d4:
        r0 = r23;
        if (r0 <= r12) goto L_0x03b0;
    L_0x01d8:
        if (r17 != 0) goto L_0x034f;
    L_0x01da:
        r0 = r30;
        r1 = r21;
        r0.calculatePageOffsets(r9, r8, r1);
    L_0x01e1:
        r0 = r30;
        r0 = r0.mAdapter;
        r28 = r0;
        r0 = r30;
        r0 = r0.mCurItem;
        r29 = r0;
        if (r9 == 0) goto L_0x0428;
    L_0x01ef:
        r0 = r9.object;
        r27 = r0;
    L_0x01f3:
        r0 = r28;
        r1 = r30;
        r2 = r29;
        r3 = r27;
        r0.setPrimaryItem(r1, r2, r3);
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        r0 = r27;
        r1 = r30;
        r0.finishUpdate(r1);
        r6 = r30.getChildCount();
        r16 = 0;
    L_0x0211:
        r0 = r16;
        if (r0 >= r6) goto L_0x042c;
    L_0x0215:
        r0 = r30;
        r1 = r16;
        r5 = r0.getChildAt(r1);
        r20 = r5.getLayoutParams();
        r20 = (android.support.v4.view.ViewPager.LayoutParams) r20;
        r0 = r16;
        r1 = r20;
        r1.childIndex = r0;
        r0 = r20;
        r0 = r0.isDecor;
        r27 = r0;
        if (r27 != 0) goto L_0x025d;
    L_0x0231:
        r0 = r20;
        r0 = r0.widthFactor;
        r27 = r0;
        r28 = 0;
        r27 = (r27 > r28 ? 1 : (r27 == r28 ? 0 : -1));
        if (r27 != 0) goto L_0x025d;
    L_0x023d:
        r0 = r30;
        r17 = r0.infoForChild(r5);
        if (r17 == 0) goto L_0x025d;
    L_0x0245:
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r0 = r27;
        r1 = r20;
        r1.widthFactor = r0;
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r27;
        r1 = r20;
        r1.position = r0;
    L_0x025d:
        r16 = r16 + 1;
        goto L_0x0211;
    L_0x0260:
        r8 = r8 + 1;
        goto L_0x0109;
    L_0x0264:
        r17 = 0;
        goto L_0x0176;
    L_0x0268:
        r27 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r0 = r9.widthFactor;
        r28 = r0;
        r27 = r27 - r28;
        r28 = r30.getPaddingLeft();
        r0 = r28;
        r0 = (float) r0;
        r28 = r0;
        r0 = (float) r7;
        r29 = r0;
        r28 = r28 / r29;
        r19 = r27 + r28;
        goto L_0x017e;
    L_0x0282:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r23;
        r1 = r27;
        if (r0 != r1) goto L_0x02d2;
    L_0x028e:
        r0 = r17;
        r0 = r0.scrolling;
        r27 = r0;
        if (r27 != 0) goto L_0x02d2;
    L_0x0296:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r0.remove(r1);
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        r0 = r17;
        r0 = r0.object;
        r28 = r0;
        r0 = r27;
        r1 = r30;
        r2 = r23;
        r3 = r28;
        r0.destroyItem(r1, r2, r3);
        r18 = r18 + -1;
        r8 = r8 + -1;
        if (r18 < 0) goto L_0x02d6;
    L_0x02c0:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x02d2:
        r23 = r23 + -1;
        goto L_0x0186;
    L_0x02d6:
        r17 = 0;
        goto L_0x02d2;
    L_0x02d9:
        if (r17 == 0) goto L_0x0309;
    L_0x02db:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r23;
        r1 = r27;
        if (r0 != r1) goto L_0x0309;
    L_0x02e7:
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r13 = r13 + r27;
        r18 = r18 + -1;
        if (r18 < 0) goto L_0x0306;
    L_0x02f3:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x0305:
        goto L_0x02d2;
    L_0x0306:
        r17 = 0;
        goto L_0x0305;
    L_0x0309:
        r27 = r18 + 1;
        r0 = r30;
        r1 = r23;
        r2 = r27;
        r17 = r0.addNewItem(r1, r2);
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r13 = r13 + r27;
        r8 = r8 + 1;
        if (r18 < 0) goto L_0x0334;
    L_0x0321:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x0333:
        goto L_0x02d2;
    L_0x0334:
        r17 = 0;
        goto L_0x0333;
    L_0x0337:
        r17 = 0;
        goto L_0x01c0;
    L_0x033b:
        r27 = r30.getPaddingRight();
        r0 = r27;
        r0 = (float) r0;
        r27 = r0;
        r0 = (float) r7;
        r28 = r0;
        r27 = r27 / r28;
        r28 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r25 = r27 + r28;
        goto L_0x01c4;
    L_0x034f:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r23;
        r1 = r27;
        if (r0 != r1) goto L_0x03a9;
    L_0x035b:
        r0 = r17;
        r0 = r0.scrolling;
        r27 = r0;
        if (r27 != 0) goto L_0x03a9;
    L_0x0363:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r0.remove(r1);
        r0 = r30;
        r0 = r0.mAdapter;
        r27 = r0;
        r0 = r17;
        r0 = r0.object;
        r28 = r0;
        r0 = r27;
        r1 = r30;
        r2 = r23;
        r3 = r28;
        r0.destroyItem(r1, r2, r3);
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r27 = r27.size();
        r0 = r18;
        r1 = r27;
        if (r0 >= r1) goto L_0x03ad;
    L_0x0397:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x03a9:
        r23 = r23 + 1;
        goto L_0x01cc;
    L_0x03ad:
        r17 = 0;
        goto L_0x03a9;
    L_0x03b0:
        if (r17 == 0) goto L_0x03ee;
    L_0x03b2:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r23;
        r1 = r27;
        if (r0 != r1) goto L_0x03ee;
    L_0x03be:
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r14 = r14 + r27;
        r18 = r18 + 1;
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r27 = r27.size();
        r0 = r18;
        r1 = r27;
        if (r0 >= r1) goto L_0x03eb;
    L_0x03d8:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x03ea:
        goto L_0x03a9;
    L_0x03eb:
        r17 = 0;
        goto L_0x03ea;
    L_0x03ee:
        r0 = r30;
        r1 = r23;
        r2 = r18;
        r17 = r0.addNewItem(r1, r2);
        r18 = r18 + 1;
        r0 = r17;
        r0 = r0.widthFactor;
        r27 = r0;
        r14 = r14 + r27;
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r27 = r27.size();
        r0 = r18;
        r1 = r27;
        if (r0 >= r1) goto L_0x0425;
    L_0x0412:
        r0 = r30;
        r0 = r0.mItems;
        r27 = r0;
        r0 = r27;
        r1 = r18;
        r27 = r0.get(r1);
        r27 = (android.support.v4.view.ViewPager.ItemInfo) r27;
        r17 = r27;
    L_0x0424:
        goto L_0x03a9;
    L_0x0425:
        r17 = 0;
        goto L_0x0424;
    L_0x0428:
        r27 = 0;
        goto L_0x01f3;
    L_0x042c:
        r30.sortChildDrawingOrder();
        r27 = r30.hasFocus();
        if (r27 == 0) goto L_0x003c;
    L_0x0435:
        r10 = r30.findFocus();
        if (r10 == 0) goto L_0x048c;
    L_0x043b:
        r0 = r30;
        r17 = r0.infoForAnyChild(r10);
    L_0x0441:
        if (r17 == 0) goto L_0x0455;
    L_0x0443:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r0 = r27;
        r1 = r28;
        if (r0 == r1) goto L_0x003c;
    L_0x0455:
        r16 = 0;
    L_0x0457:
        r27 = r30.getChildCount();
        r0 = r16;
        r1 = r27;
        if (r0 >= r1) goto L_0x003c;
    L_0x0461:
        r0 = r30;
        r1 = r16;
        r5 = r0.getChildAt(r1);
        r0 = r30;
        r17 = r0.infoForChild(r5);
        if (r17 == 0) goto L_0x0489;
    L_0x0471:
        r0 = r17;
        r0 = r0.position;
        r27 = r0;
        r0 = r30;
        r0 = r0.mCurItem;
        r28 = r0;
        r0 = r27;
        r1 = r28;
        if (r0 != r1) goto L_0x0489;
    L_0x0483:
        r27 = r5.requestFocus(r15);
        if (r27 != 0) goto L_0x003c;
    L_0x0489:
        r16 = r16 + 1;
        goto L_0x0457;
    L_0x048c:
        r17 = 0;
        goto L_0x0441;
    }

    public void removeView(android.view.View r2) {
        r1 = this;
        r0 = r1.mInLayout;
        if (r0 == 0) goto L_0x0008;
    L_0x0004:
        r1.removeViewInLayout(r2);
    L_0x0007:
        return;
    L_0x0008:
        super.removeView(r2);
        goto L_0x0007;
    }

    public void setAdapter(android.support.v4.view.PagerAdapter r11) {
        r10 = this;
        r9 = 1;
        r8 = 0;
        r7 = 0;
        r4 = r10.mAdapter;
        if (r4 == 0) goto L_0x0042;
    L_0x0007:
        r4 = r10.mAdapter;
        r5 = r10.mObserver;
        r4.unregisterDataSetObserver(r5);
        r4 = r10.mAdapter;
        r4.startUpdate(r10);
        r0 = 0;
    L_0x0014:
        r4 = r10.mItems;
        r4 = r4.size();
        if (r0 >= r4) goto L_0x0030;
    L_0x001c:
        r4 = r10.mItems;
        r1 = r4.get(r0);
        r1 = (android.support.v4.view.ViewPager.ItemInfo) r1;
        r4 = r10.mAdapter;
        r5 = r1.position;
        r6 = r1.object;
        r4.destroyItem(r10, r5, r6);
        r0 = r0 + 1;
        goto L_0x0014;
    L_0x0030:
        r4 = r10.mAdapter;
        r4.finishUpdate(r10);
        r4 = r10.mItems;
        r4.clear();
        r10.removeNonDecorViews();
        r10.mCurItem = r7;
        r10.scrollTo(r7, r7);
    L_0x0042:
        r2 = r10.mAdapter;
        r10.mAdapter = r11;
        r10.mExpectedAdapterCount = r7;
        r4 = r10.mAdapter;
        if (r4 == 0) goto L_0x0085;
    L_0x004c:
        r4 = r10.mObserver;
        if (r4 != 0) goto L_0x0057;
    L_0x0050:
        r4 = new android.support.v4.view.ViewPager$PagerObserver;
        r4.<init>(r10, r8);
        r10.mObserver = r4;
    L_0x0057:
        r4 = r10.mAdapter;
        r5 = r10.mObserver;
        r4.registerDataSetObserver(r5);
        r10.mPopulatePending = r7;
        r3 = r10.mFirstLayout;
        r10.mFirstLayout = r9;
        r4 = r10.mAdapter;
        r4 = r4.getCount();
        r10.mExpectedAdapterCount = r4;
        r4 = r10.mRestoredCurItem;
        if (r4 < 0) goto L_0x0091;
    L_0x0070:
        r4 = r10.mAdapter;
        r5 = r10.mRestoredAdapterState;
        r6 = r10.mRestoredClassLoader;
        r4.restoreState(r5, r6);
        r4 = r10.mRestoredCurItem;
        r10.setCurrentItemInternal(r4, r7, r9);
        r4 = -1;
        r10.mRestoredCurItem = r4;
        r10.mRestoredAdapterState = r8;
        r10.mRestoredClassLoader = r8;
    L_0x0085:
        r4 = r10.mAdapterChangeListener;
        if (r4 == 0) goto L_0x0090;
    L_0x0089:
        if (r2 == r11) goto L_0x0090;
    L_0x008b:
        r4 = r10.mAdapterChangeListener;
        r4.onAdapterChanged(r2, r11);
    L_0x0090:
        return;
    L_0x0091:
        if (r3 != 0) goto L_0x0097;
    L_0x0093:
        r10.populate();
        goto L_0x0085;
    L_0x0097:
        r10.requestLayout();
        goto L_0x0085;
    }

    public void setCurrentItem(int r3) {
        r2 = this;
        r1 = 0;
        r2.mPopulatePending = r1;
        r0 = r2.mFirstLayout;
        if (r0 != 0) goto L_0x000c;
    L_0x0007:
        r0 = 1;
    L_0x0008:
        r2.setCurrentItemInternal(r3, r0, r1);
        return;
    L_0x000c:
        r0 = r1;
        goto L_0x0008;
    }

    public void setCurrentItem(int r2, boolean r3) {
        r1 = this;
        r0 = 0;
        r1.mPopulatePending = r0;
        r1.setCurrentItemInternal(r2, r3, r0);
        return;
    }

    void setCurrentItemInternal(int r2, boolean r3, boolean r4) {
        r1 = this;
        r0 = 0;
        r1.setCurrentItemInternal(r2, r3, r4, r0);
        return;
    }

    void setCurrentItemInternal(int r6, boolean r7, boolean r8, int r9) {
        r5 = this;
        r0 = 1;
        r4 = 0;
        r3 = r5.mAdapter;
        if (r3 == 0) goto L_0x000e;
    L_0x0006:
        r3 = r5.mAdapter;
        r3 = r3.getCount();
        if (r3 > 0) goto L_0x0012;
    L_0x000e:
        r5.setScrollingCacheEnabled(r4);
    L_0x0011:
        return;
    L_0x0012:
        if (r8 != 0) goto L_0x0024;
    L_0x0014:
        r3 = r5.mCurItem;
        if (r3 != r6) goto L_0x0024;
    L_0x0018:
        r3 = r5.mItems;
        r3 = r3.size();
        if (r3 == 0) goto L_0x0024;
    L_0x0020:
        r5.setScrollingCacheEnabled(r4);
        goto L_0x0011;
    L_0x0024:
        if (r6 >= 0) goto L_0x0049;
    L_0x0026:
        r6 = 0;
    L_0x0027:
        r2 = r5.mOffscreenPageLimit;
        r3 = r5.mCurItem;
        r3 = r3 + r2;
        if (r6 > r3) goto L_0x0033;
    L_0x002e:
        r3 = r5.mCurItem;
        r3 = r3 - r2;
        if (r6 >= r3) goto L_0x005a;
    L_0x0033:
        r1 = 0;
    L_0x0034:
        r3 = r5.mItems;
        r3 = r3.size();
        if (r1 >= r3) goto L_0x005a;
    L_0x003c:
        r3 = r5.mItems;
        r3 = r3.get(r1);
        r3 = (android.support.v4.view.ViewPager.ItemInfo) r3;
        r3.scrolling = r0;
        r1 = r1 + 1;
        goto L_0x0034;
    L_0x0049:
        r3 = r5.mAdapter;
        r3 = r3.getCount();
        if (r6 < r3) goto L_0x0027;
    L_0x0051:
        r3 = r5.mAdapter;
        r3 = r3.getCount();
        r6 = r3 + -1;
        goto L_0x0027;
    L_0x005a:
        r3 = r5.mCurItem;
        if (r3 == r6) goto L_0x007e;
    L_0x005e:
        r3 = r5.mFirstLayout;
        if (r3 == 0) goto L_0x0080;
    L_0x0062:
        r5.mCurItem = r6;
        if (r0 == 0) goto L_0x006f;
    L_0x0066:
        r3 = r5.mOnPageChangeListener;
        if (r3 == 0) goto L_0x006f;
    L_0x006a:
        r3 = r5.mOnPageChangeListener;
        r3.onPageSelected(r6);
    L_0x006f:
        if (r0 == 0) goto L_0x007a;
    L_0x0071:
        r3 = r5.mInternalPageChangeListener;
        if (r3 == 0) goto L_0x007a;
    L_0x0075:
        r3 = r5.mInternalPageChangeListener;
        r3.onPageSelected(r6);
    L_0x007a:
        r5.requestLayout();
        goto L_0x0011;
    L_0x007e:
        r0 = r4;
        goto L_0x005e;
    L_0x0080:
        r5.populate(r6);
        r5.scrollToItem(r6, r7, r9, r0);
        goto L_0x0011;
    }

    android.support.v4.view.ViewPager.OnPageChangeListener setInternalPageChangeListener(android.support.v4.view.ViewPager.OnPageChangeListener r2) {
        r1 = this;
        r0 = r1.mInternalPageChangeListener;
        r1.mInternalPageChangeListener = r2;
        return r0;
    }

    void setOnAdapterChangeListener(android.support.v4.view.ViewPager.OnAdapterChangeListener r1) {
        r0 = this;
        r0.mAdapterChangeListener = r1;
        return;
    }

    public void setOnPageChangeListener(android.support.v4.view.ViewPager.OnPageChangeListener r1) {
        r0 = this;
        r0.mOnPageChangeListener = r1;
        return;
    }

    void smoothScrollTo(int r16, int r17, int r18) {
        r15 = this;
        r1 = r15.getChildCount();
        if (r1 != 0) goto L_0x000b;
    L_0x0006:
        r1 = 0;
        r15.setScrollingCacheEnabled(r1);
    L_0x000a:
        return;
    L_0x000b:
        r2 = r15.getScrollX();
        r3 = r15.getScrollY();
        r4 = r16 - r2;
        r5 = r17 - r3;
        if (r4 != 0) goto L_0x0027;
    L_0x0019:
        if (r5 != 0) goto L_0x0027;
    L_0x001b:
        r1 = 0;
        r15.completeScroll(r1);
        r15.populate();
        r1 = 0;
        r15.setScrollState(r1);
        goto L_0x000a;
    L_0x0027:
        r1 = 1;
        r15.setScrollingCacheEnabled(r1);
        r1 = 2;
        r15.setScrollState(r1);
        r12 = r15.getClientWidth();
        r9 = r12 / 2;
        r1 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r13 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r14 = java.lang.Math.abs(r4);
        r14 = (float) r14;
        r13 = r13 * r14;
        r14 = (float) r12;
        r13 = r13 / r14;
        r8 = java.lang.Math.min(r1, r13);
        r1 = (float) r9;
        r13 = (float) r9;
        r14 = r15.distanceInfluenceForSnapDuration(r8);
        r13 = r13 * r14;
        r7 = r1 + r13;
        r6 = 0;
        r18 = java.lang.Math.abs(r18);
        if (r18 <= 0) goto L_0x0076;
    L_0x0055:
        r1 = 1148846080; // 0x447a0000 float:1000.0 double:5.676053805E-315;
        r0 = r18;
        r13 = (float) r0;
        r13 = r7 / r13;
        r13 = java.lang.Math.abs(r13);
        r1 = r1 * r13;
        r1 = java.lang.Math.round(r1);
        r6 = r1 * 4;
    L_0x0067:
        r1 = 600; // 0x258 float:8.41E-43 double:2.964E-321;
        r6 = java.lang.Math.min(r6, r1);
        r1 = r15.mScroller;
        r1.startScroll(r2, r3, r4, r5, r6);
        android.support.v4.view.ViewCompat.postInvalidateOnAnimation(r15);
        goto L_0x000a;
    L_0x0076:
        r1 = (float) r12;
        r13 = r15.mAdapter;
        r14 = r15.mCurItem;
        r13 = r13.getPageWidth(r14);
        r11 = r1 * r13;
        r1 = java.lang.Math.abs(r4);
        r1 = (float) r1;
        r13 = r15.mPageMargin;
        r13 = (float) r13;
        r13 = r13 + r11;
        r10 = r1 / r13;
        r1 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r1 = r1 + r10;
        r13 = 1120403456; // 0x42c80000 float:100.0 double:5.53552857E-315;
        r1 = r1 * r13;
        r6 = (int) r1;
        goto L_0x0067;
    }

    protected boolean verifyDrawable(android.graphics.drawable.Drawable r2) {
        r1 = this;
        r0 = super.verifyDrawable(r2);
        if (r0 != 0) goto L_0x000a;
    L_0x0006:
        r0 = r1.mMarginDrawable;
        if (r2 != r0) goto L_0x000c;
    L_0x000a:
        r0 = 1;
    L_0x000b:
        return r0;
    L_0x000c:
        r0 = 0;
        goto L_0x000b;
    }
}