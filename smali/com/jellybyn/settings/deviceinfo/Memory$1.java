package com.jellybyn.settings.deviceinfo;

class Memory$1 extends android.os.storage.StorageEventListener {
    final /* synthetic */ com.jellybyn.settings.deviceinfo.Memory this$0;

    Memory$1(com.jellybyn.settings.deviceinfo.Memory r1) {
        r0 = this;
        r0.this$0 = r1;
        r0.<init>();
        return;
    }

    public void onStorageStateChanged(java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        r6 = this;
        r3 = "MemorySettings";
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r5 = "Received storage state changed notification that ";
        r4 = r4.append(r5);
        r4 = r4.append(r7);
        r5 = " changed state from ";
        r4 = r4.append(r5);
        r4 = r4.append(r8);
        r5 = " to ";
        r4 = r4.append(r5);
        r4 = r4.append(r9);
        r4 = r4.toString();
        android.util.Log.i(r3, r4);
        r3 = r6.this$0;
        r3 = com.jellybyn.settings.deviceinfo.Memory.access$000(r3);
        r1 = r3.iterator();
    L_0x0036:
        r3 = r1.hasNext();
        if (r3 == 0) goto L_0x0055;
    L_0x003c:
        r0 = r1.next();
        r0 = (com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory) r0;
        r2 = r0.getStorageVolume();
        if (r2 == 0) goto L_0x0036;
    L_0x0048:
        r3 = r2.getPath();
        r3 = r7.equals(r3);
        if (r3 == 0) goto L_0x0036;
    L_0x0052:
        r0.onStorageStateChanged();
    L_0x0055:
        return;
    }
}