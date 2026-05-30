package com.jellybyn.settings.net;

import android.net.NetworkPolicy;
import android.os.AsyncTask;

class NetworkPolicyEditor$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ NetworkPolicyEditor this$0;
    final /* synthetic */ NetworkPolicy[] val$policies;

    protected Void doInBackground(Void... voidArr) {
        this.this$0.write(this.val$policies);
        return null;
    }

    NetworkPolicyEditor$1(NetworkPolicyEditor networkPolicyEditor, NetworkPolicy[] networkPolicyArr) {
        this.this$0 = networkPolicyEditor;
        this.val$policies = networkPolicyArr;
    }
}