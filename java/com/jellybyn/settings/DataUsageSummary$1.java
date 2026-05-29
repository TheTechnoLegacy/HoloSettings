package com.jellybyn.settings;

import android.os.AsyncTask;
import android.os.RemoteException;

class DataUsageSummary$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ DataUsageSummary this$0;

    protected Void doInBackground(Void... voidArr) {
        try {
            Thread.sleep(2000);
            DataUsageSummary.access$000(this.this$0).forceUpdate();
        } catch (InterruptedException e) {
        } catch (RemoteException e2) {
        }
        return null;
    }

    protected void onPostExecute(Void voidR) {
        if (this.this$0.isAdded()) {
            DataUsageSummary.access$100(this.this$0);
        }
    }

    DataUsageSummary$1(DataUsageSummary dataUsageSummary) {
        this.this$0 = dataUsageSummary;
    }
}