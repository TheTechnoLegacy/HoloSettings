package com.jellybyn.settings.deviceinfo;

import android.content.ComponentName;
import android.content.Context;
import android.os.Environment;
import android.os.HandlerThread;
import android.os.storage.StorageVolume;
import android.util.Log;
import android.util.SparseLongArray;
import com.android.internal.app.IMediaContainerService;
import com.google.android.collect.Maps;
import com.google.android.collect.Sets;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class StorageMeasurement {
    public static final ComponentName DEFAULT_CONTAINER_COMPONENT = new ComponentName("com.android.defcontainer", "com.android.defcontainer.DefaultContainerService");
    static final boolean LOGV = Log.isLoggable("StorageMeasurement", 2);
    private static HashMap<StorageVolume, StorageMeasurement> sInstances = Maps.newHashMap();
    private static final Set<String> sMeasureMediaTypes = Sets.newHashSet(new String[]{Environment.DIRECTORY_DCIM, Environment.DIRECTORY_MOVIES, Environment.DIRECTORY_PICTURES, Environment.DIRECTORY_MUSIC, Environment.DIRECTORY_ALARMS, Environment.DIRECTORY_NOTIFICATIONS, Environment.DIRECTORY_RINGTONES, Environment.DIRECTORY_PODCASTS, Environment.DIRECTORY_DOWNLOADS, Environment.DIRECTORY_ANDROID});
    private long mAvailSize;
    List<FileInfo> mFileInfoForMisc;
    private final MeasurementHandler mHandler;
    private final boolean mIsInternal;
    private final boolean mIsPrimary;
    private volatile WeakReference<MeasurementReceiver> mReceiver;
    private long mTotalSize;
    private final StorageVolume mVolume;

    public interface MeasurementReceiver {
        void updateApproximate(StorageMeasurement storageMeasurement, long j, long j2);

        void updateDetails(StorageMeasurement storageMeasurement, MeasurementDetails measurementDetails);
    }

    private long measureMisc(IMediaContainerService iMediaContainerService, File file) {
        this.mFileInfoForMisc = new ArrayList();
        File[] files = file.listFiles();
        if (files == null) {
            return 0;
        }
        long counter = 0;
        long miscSize = 0;
        for (File file2 : files) {
            String absolutePath = file2.getAbsolutePath();
            if (!sMeasureMediaTypes.contains(file2.getName())) {
                long j;
                if (file2.isFile()) {
                    long length = file2.length();
                    j = counter + 1;
                    this.mFileInfoForMisc.add(new FileInfo(absolutePath, length, counter));
                    miscSize += length;
                    counter = j;
                } else if (file2.isDirectory()) {
                    long directorySize = getDirectorySize(iMediaContainerService, file2);
                    j = counter + 1;
                    this.mFileInfoForMisc.add(new FileInfo(absolutePath, directorySize, counter));
                    miscSize += directorySize;
                    counter = j;
                }
            }
        }
        Collections.sort(this.mFileInfoForMisc);
        return miscSize;
    }

    private StorageMeasurement(Context context, StorageVolume storageVolume) {
        boolean z = false;
        this.mVolume = storageVolume;
        this.mIsInternal = storageVolume == null;
        if (storageVolume != null) {
            z = storageVolume.isPrimary();
        }
        this.mIsPrimary = z;
        HandlerThread handlerThread = new HandlerThread("MemoryMeasurement");
        handlerThread.start();
        this.mHandler = new MeasurementHandler(this, context, handlerThread.getLooper());
    }

    public static StorageMeasurement getInstance(Context context, StorageVolume storageVolume) {
        StorageMeasurement storageMeasurement;
        synchronized (sInstances) {
            storageMeasurement = (StorageMeasurement) sInstances.get(storageVolume);
            if (storageMeasurement == null) {
                storageMeasurement = new StorageMeasurement(context.getApplicationContext(), storageVolume);
                sInstances.put(storageVolume, storageMeasurement);
            }
        }
        return storageMeasurement;
    }

    private void sendExactUpdate(MeasurementDetails measurementDetails) {
        MeasurementReceiver receiver = this.mReceiver != null ? (MeasurementReceiver) this.mReceiver.get() : null;
        if (receiver != null) {
            receiver.updateDetails(this, measurementDetails);
        } else if (LOGV) {
            Log.i("StorageMeasurement", "measurements dropped because receiver is null! wasted effort");
        }
    }

    private static long getDirectorySize(IMediaContainerService iMediaContainerService, File file) {
        try {
            long calculateDirectorySize = iMediaContainerService.calculateDirectorySize(file.toString());
            Log.d("StorageMeasurement", "getDirectorySize(" + file + ") returned " + calculateDirectorySize);
            return calculateDirectorySize;
        } catch (Exception e) {
            Log.w("StorageMeasurement", "Could not read memory from default container service for " + file, e);
            return 0;
        }
    }

    private void sendInternalApproximateUpdate() {
        MeasurementReceiver receiver = this.mReceiver != null ? (MeasurementReceiver) this.mReceiver.get() : null;
        if (receiver != null) {
            receiver.updateApproximate(this, this.mTotalSize, this.mAvailSize);
        }
    }

    public void cleanUp() {
        this.mReceiver = null;
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(3);
    }

    public void measure() {
        if (!this.mHandler.hasMessages(1)) {
            this.mHandler.sendEmptyMessage(1);
        }
    }

    public void setReceiver(MeasurementReceiver measurementReceiver) {
        if (this.mReceiver == null || this.mReceiver.get() == null) {
            this.mReceiver = new WeakReference(measurementReceiver);
        }
    }

    private static void addValue(SparseLongArray sparseLongArray, int i, long j) {
        sparseLongArray.put(i, sparseLongArray.get(i) + j);
    }

    public void invalidate() {
        this.mHandler.sendEmptyMessage(5);
    }
}