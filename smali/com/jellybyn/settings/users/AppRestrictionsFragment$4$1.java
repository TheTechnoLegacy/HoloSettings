package com.jellybyn.settings.users;

import android.os.AsyncTask;
import com.jellybyn.settings.users.AppRestrictionsFragment.4;

class AppRestrictionsFragment$4$1 extends AsyncTask<Void, Void, Void> {
    final /* synthetic */ 4 this$1;

    protected Void doInBackground(Void... voidArr) {
        AppRestrictionsFragment.access$1200(this.this$1.this$0).setUserIcon(AppRestrictionsFragment.access$1100(this.this$1.this$0).getIdentifier(), AppRestrictionsFragment.access$1800(this.this$1.this$0).getNewUserPhotoBitmap());
        return null;
    }

    AppRestrictionsFragment$4$1(4 4) {
        this.this$1 = 4;
    }
}