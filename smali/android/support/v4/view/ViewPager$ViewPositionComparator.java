package android.support.v4.view;

import android.support.v4.view.ViewPager.LayoutParams;
import android.view.View;
import java.util.Comparator;

class ViewPager$ViewPositionComparator implements Comparator<View> {
    public int compare(View view, View view2) {
        LayoutParams llp = (LayoutParams) view.getLayoutParams();
        LayoutParams rlp = (LayoutParams) view2.getLayoutParams();
        if (llp.isDecor != rlp.isDecor) {
            return llp.isDecor ? 1 : -1;
        } else {
            return llp.position - rlp.position;
        }
    }

    ViewPager$ViewPositionComparator() {
    }
}