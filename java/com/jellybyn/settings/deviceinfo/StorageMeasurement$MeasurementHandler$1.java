package com.jellybyn.settings.deviceinfo;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.android.internal.app.IMediaContainerService;
import com.android.internal.app.IMediaContainerService.Stub;
import com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementHandler;

class StorageMeasurement$MeasurementHandler$1 implements ServiceConnection {
    final /* synthetic */ MeasurementHandler this$1;

    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        IMediaContainerService imcs = Stub.asInterface(iBinder);
        MeasurementHandler.access$102(this.this$1, imcs);
        MeasurementHandler.access$202(this.this$1, true);
        this.this$1.sendMessage(this.this$1.obtainMessage(2, imcs));
    }

    public void onServiceDisconnected(ComponentName componentName) {
        MeasurementHandler.access$202(this.this$1, false);
        this.this$1.removeMessages(2);
    }

    StorageMeasurement$MeasurementHandler$1(MeasurementHandler measurementHandler) {
        this.this$1 = measurementHandler;
    }
}