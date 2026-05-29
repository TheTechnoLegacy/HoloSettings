package com.jellybyn.settings.wifi;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.EditText;

class WifiAPITest$1 implements OnClickListener {
    final /* synthetic */ WifiAPITest this$0;
    final /* synthetic */ EditText val$input;

    public void onClick(DialogInterface dialogInterface, int i) {
        WifiAPITest.access$002(this.this$0, Integer.parseInt(this.val$input.getText().toString()));
        WifiAPITest.access$100(this.this$0).disableNetwork(WifiAPITest.access$000(this.this$0));
    }

    WifiAPITest$1(WifiAPITest wifiAPITest, EditText editText) {
        this.this$0 = wifiAPITest;
        this.val$input = editText;
    }
}