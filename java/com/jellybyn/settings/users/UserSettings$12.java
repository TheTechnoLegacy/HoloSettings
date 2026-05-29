package com.jellybyn.settings.users;

import android.os.AsyncTask;
import java.util.List;

class UserSettings$12 extends AsyncTask<List<Integer>, Void, Void> {
    final /* synthetic */ UserSettings this$0;

    protected Void doInBackground(List<Integer>... values) {
        for (Integer intValue : values[0]) {
            int intValue2 = intValue.intValue();
            UserSettings.access$400(this.this$0).append(intValue2, UserSettings.access$700(this.this$0).getUserIcon(intValue2));
        }
        return null;
    }

    protected void onPostExecute(Void voidR) {
        UserSettings.access$000(this.this$0);
    }

    UserSettings$12(UserSettings userSettings) {
        this.this$0 = userSettings;
    }
}