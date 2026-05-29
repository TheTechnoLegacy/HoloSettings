package android.support.v4.view;

class ViewPager$3 implements Runnable {
    final /* synthetic */ ViewPager this$0;

    public void run() {
        ViewPager.access$000(this.this$0, 0);
        this.this$0.populate();
    }

    ViewPager$3(ViewPager viewPager) {
        this.this$0 = viewPager;
    }
}