package com.jellybyn.settings.bluetooth;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class BluetoothNameDialogFragment$2 implements OnClickListener {
    final /* synthetic */ BluetoothNameDialogFragment this$0;

    public void onClick(DialogInterface dialogInterface, int i) {
        BluetoothNameDialogFragment.access$000(this.this$0, this.this$0.mDeviceNameView.getText().toString());
    }

    BluetoothNameDialogFragment$2(BluetoothNameDialogFragment bluetoothNameDialogFragment) {
        this.this$0 = bluetoothNameDialogFragment;
    }
}