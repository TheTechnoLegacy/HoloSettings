package com.jellybyn.settings.users;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.RestrictionEntry;
import android.os.Bundle;
import android.preference.Preference;
import com.jellybyn.settings.users.AppRestrictionsFragment.AppRestrictionsPreference;
import java.util.ArrayList;

class AppRestrictionsFragment$RestrictionsResultReceiver extends BroadcastReceiver {
    String packageName;
    AppRestrictionsPreference preference;
    final /* synthetic */ AppRestrictionsFragment this$0;

    public void onReceive(Context context, Intent intent) {
        Bundle results = getResultExtras(true);
        ArrayList<RestrictionEntry> restrictions = results.getParcelableArrayList("android.intent.extra.restrictions_list");
        Intent restrictionsIntent = (Intent) results.getParcelable("android.intent.extra.restrictions_intent");
        if (restrictions != null && restrictionsIntent == null) {
            AppRestrictionsFragment.access$1000(this.this$0, this.preference, this.packageName, restrictions);
            AppRestrictionsFragment.access$1200(this.this$0).setApplicationRestrictions(this.packageName, RestrictionUtils.restrictionsToBundle(restrictions), AppRestrictionsFragment.access$1100(this.this$0));
        } else if (restrictionsIntent != null) {
            Intent customIntent = restrictionsIntent;
            if (restrictions != null) {
                customIntent.putExtra("android.intent.extra.restrictions_bundle", RestrictionUtils.restrictionsToBundle(restrictions));
            }
            Preference p = new Preference(context);
            p.setTitle(2131429135);
            p.setOnPreferenceClickListener(new 1(this, customIntent));
            p.setPersistent(false);
            p.setOrder(this.preference.getOrder() + 1);
            this.preference.childPreferences.add(p);
            AppRestrictionsFragment.access$1400(this.this$0).addPreference(p);
            this.preference.setRestrictions(restrictions);
        }
    }

    AppRestrictionsFragment$RestrictionsResultReceiver(AppRestrictionsFragment appRestrictionsFragment, String str, AppRestrictionsPreference appRestrictionsPreference) {
        this.this$0 = appRestrictionsFragment;
        this.packageName = str;
        this.preference = appRestrictionsPreference;
    }
}