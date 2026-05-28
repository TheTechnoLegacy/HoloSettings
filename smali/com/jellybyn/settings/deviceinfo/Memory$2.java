package com.jellybyn.settings.deviceinfo;

class Memory$2 extends android.content.BroadcastReceiver {
    final /* synthetic */ com.jellybyn.settings.deviceinfo.Memory this$0;

    Memory$2(com.jellybyn.settings.deviceinfo.Memory r1) {
        r0 = this;
        r0.this$0 = r1;
        r0.<init>();
        return;
    }

    public void onReceive(android.content.Context r8, android.content.Intent r9) {
        r7 = this;
        r0 = r9.getAction();
        r5 = "android.hardware.usb.action.USB_STATE";
        r5 = r0.equals(r5);
        if (r5 == 0) goto L_0x0037;
    L_0x000c:
        r5 = "connected";
        r6 = 0;
        r3 = r9.getBooleanExtra(r5, r6);
        r5 = r7.this$0;
        r5 = com.jellybyn.settings.deviceinfo.Memory.access$100(r5);
        r4 = r5.getDefaultFunction();
        r5 = r7.this$0;
        r5 = com.jellybyn.settings.deviceinfo.Memory.access$000(r5);
        r2 = r5.iterator();
    L_0x0027:
        r5 = r2.hasNext();
        if (r5 == 0) goto L_0x0059;
    L_0x002d:
        r1 = r2.next();
        r1 = (com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory) r1;
        r1.onUsbStateChanged(r3, r4);
        goto L_0x0027;
    L_0x0037:
        r5 = "android.intent.action.MEDIA_SCANNER_FINISHED";
        r5 = r0.equals(r5);
        if (r5 == 0) goto L_0x0059;
    L_0x003f:
        r5 = r7.this$0;
        r5 = com.jellybyn.settings.deviceinfo.Memory.access$000(r5);
        r2 = r5.iterator();
    L_0x0049:
        r5 = r2.hasNext();
        if (r5 == 0) goto L_0x0059;
    L_0x004f:
        r1 = r2.next();
        r1 = (com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory) r1;
        r1.onMediaScannerFinished();
        goto L_0x0049;
    L_0x0059:
        return;
    }
}