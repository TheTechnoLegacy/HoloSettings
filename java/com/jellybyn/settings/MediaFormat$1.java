package com.jellybyn.settings;

import android.content.Intent;
import android.os.storage.StorageVolume;
import android.view.View;
import android.view.View.OnClickListener;
import com.android.internal.os.storage.ExternalStorageFormatter;

class MediaFormat$1 implements OnClickListener {
    final /* synthetic */ MediaFormat this$0;

    public void onClick(View view) {
        if (!Utils.isMonkeyRunning()) {
            Intent intent = new Intent("com.android.internal.os.storage.FORMAT_ONLY");
            intent.setComponent(ExternalStorageFormatter.COMPONENT_NAME);
            intent.putExtra("storage_volume", (StorageVolume) this.this$0.getIntent().getParcelableExtra("storage_volume"));
            this.this$0.startService(intent);
            this.this$0.finish();
        }
    }

    MediaFormat$1(MediaFormat mediaFormat) {
        this.this$0 = mediaFormat;
    }
}