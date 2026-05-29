package com.jellybyn.settings.bluetooth;

import android.view.KeyEvent;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;

class BluetoothNameDialogFragment$3 implements OnEditorActionListener {
    final /* synthetic */ BluetoothNameDialogFragment this$0;

    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        if (i != 6) {
            return false;
        }
        BluetoothNameDialogFragment.access$000(this.this$0, textView.getText().toString());
        BluetoothNameDialogFragment.access$100(this.this$0).dismiss();
        return true;
    }

    BluetoothNameDialogFragment$3(BluetoothNameDialogFragment bluetoothNameDialogFragment) {
        this.this$0 = bluetoothNameDialogFragment;
    }
}