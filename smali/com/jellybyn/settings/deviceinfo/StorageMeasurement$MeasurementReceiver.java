package com.jellybyn.settings.deviceinfo;

import com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails;

public interface StorageMeasurement$MeasurementReceiver {
    void updateApproximate(StorageMeasurement storageMeasurement, long j, long j2);

    void updateDetails(StorageMeasurement storageMeasurement, MeasurementDetails measurementDetails);
}