package com.jellybyn.settings;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.jellybyn.settings.BandMode.BandListItem;

class BandMode$1 implements OnItemClickListener {
    final /* synthetic */ BandMode this$0;

    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        this.this$0.getWindow().setFeatureInt(5, -1);
        BandMode.access$002(this.this$0, (BandListItem) adapterView.getAdapter().getItem(i));
        BandMode.access$200(this.this$0).setBandMode(BandMode.access$000(this.this$0).getBand(), BandMode.access$100(this.this$0).obtainMessage(200));
    }

    BandMode$1(BandMode bandMode) {
        this.this$0 = bandMode;
    }
}