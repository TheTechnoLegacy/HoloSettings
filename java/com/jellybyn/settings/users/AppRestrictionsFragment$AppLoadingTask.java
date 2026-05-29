package com.jellybyn.settings.users;

import android.os.AsyncTask;

class AppRestrictionsFragment$AppLoadingTask extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ AppRestrictionsFragment this$0;

    protected Void doInBackground(Void... voidArr) {
        AppRestrictionsFragment.access$400(this.this$0);
        return null;
    }

    protected void onPostExecute(Void voidR) {
        AppRestrictionsFragment.access$500(this.this$0);
    }

    private AppRestrictionsFragment$AppLoadingTask(AppRestrictionsFragment appRestrictionsFragment) {
        this.this$0 = appRestrictionsFragment;
    }

    protected void onPreExecute() {
    }
}