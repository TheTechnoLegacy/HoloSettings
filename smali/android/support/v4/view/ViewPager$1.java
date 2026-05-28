package android.support.v4.view;

import android.support.v4.view.ViewPager.ItemInfo;
import java.util.Comparator;

class ViewPager$1 implements Comparator<ItemInfo> {
    ViewPager$1() {
    }

    public int compare(ItemInfo itemInfo, ItemInfo itemInfo2) {
        return itemInfo.position - itemInfo2.position;
    }
}