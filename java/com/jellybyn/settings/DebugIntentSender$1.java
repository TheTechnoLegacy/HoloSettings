package com.jellybyn.settings;

import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;

class DebugIntentSender$1 implements OnClickListener {
    final /* synthetic */ DebugIntentSender this$0;

    public void onClick(View view) {
        if (view == DebugIntentSender.access$000(this.this$0) || view == DebugIntentSender.access$100(this.this$0)) {
            String intentAction = DebugIntentSender.access$200(this.this$0).getText().toString();
            String intentData = DebugIntentSender.access$300(this.this$0).getText().toString();
            String account = DebugIntentSender.access$400(this.this$0).getText().toString();
            String resource = DebugIntentSender.access$500(this.this$0).getText().toString();
            Intent intent = new Intent(intentAction);
            if (!TextUtils.isEmpty(intentData)) {
                intent.setData(Uri.parse(intentData));
            }
            intent.putExtra("account", account);
            intent.putExtra("resource", resource);
            if (view == DebugIntentSender.access$000(this.this$0)) {
                this.this$0.sendBroadcast(intent);
            } else {
                this.this$0.startActivity(intent);
            }
            this.this$0.setResult(-1);
            this.this$0.finish();
        }
    }

    DebugIntentSender$1(DebugIntentSender debugIntentSender) {
        this.this$0 = debugIntentSender;
    }
}