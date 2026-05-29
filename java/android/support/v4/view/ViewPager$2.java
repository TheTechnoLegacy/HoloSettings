package android.support.v4.view;

class ViewPager$2 implements android.view.animation.Interpolator {
    ViewPager$2() {
        r0 = this;
        r0.<init>();
        return;
    }

    public float getInterpolation(float r3) {
        r2 = this;
        r1 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r3 = r3 - r1;
        r0 = r3 * r3;
        r0 = r0 * r3;
        r0 = r0 * r3;
        r0 = r0 * r3;
        r0 = r0 + r1;
        return r0;
    }
}