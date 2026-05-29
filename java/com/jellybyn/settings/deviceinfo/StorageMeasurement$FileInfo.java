package com.jellybyn.settings.deviceinfo;

class StorageMeasurement$FileInfo implements Comparable<StorageMeasurement$FileInfo> {
    final String mFileName;
    final long mId;
    final long mSize;

    StorageMeasurement$FileInfo(String str, long j, long j2) {
        this.mFileName = str;
        this.mSize = j;
        this.mId = j2;
    }

    public int compareTo(StorageMeasurement$FileInfo storageMeasurement$FileInfo) {
        if (this == storageMeasurement$FileInfo || this.mSize == storageMeasurement$FileInfo.mSize) {
            return 0;
        }
        return this.mSize < storageMeasurement$FileInfo.mSize ? 1 : -1;
    }

    public String toString() {
        return this.mFileName + " : " + this.mSize + ", id:" + this.mId;
    }
}