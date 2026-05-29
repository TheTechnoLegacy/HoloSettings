package com.jellybyn.settings.deviceinfo;

import com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails;
import com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementReceiver;

class StorageVolumePreferenceCategory$2 implements MeasurementReceiver {
    final /* synthetic */ StorageVolumePreferenceCategory this$0;

    public void updateApproximate(StorageMeasurement storageMeasurement, long j, long j2) {
        StorageVolumePreferenceCategory.access$000(this.this$0).obtainMessage(1, new long[]{j, j2}).sendToTarget();
    }

    public void updateDetails(StorageMeasurement storageMeasurement, MeasurementDetails measurementDetails) {
        StorageVolumePreferenceCategory.access$000(this.this$0).obtainMessage(2, measurementDetails).sendToTarget();
    }

    StorageVolumePreferenceCategory$2(StorageVolumePreferenceCategory storageVolumePreferenceCategory) {
        this.this$0 = storageVolumePreferenceCategory;
    }
}