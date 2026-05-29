package com.jellybyn.settings.users;

import android.content.Context;
import android.content.RestrictionEntry;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.UserManager;
import android.provider.Settings.Secure;
import java.util.ArrayList;
import java.util.Iterator;

public class RestrictionUtils {
    public static final int[] sRestrictionDescriptions = new int[]{2131429146};
    public static final String[] sRestrictionKeys = new String[]{"no_share_location"};
    public static final int[] sRestrictionTitles = new int[]{2131429145};

    public static ArrayList<RestrictionEntry> getRestrictions(Context context, UserHandle userHandle) {
        Resources res = context.getResources();
        ArrayList<RestrictionEntry> entries = new ArrayList();
        Bundle userRestrictions = UserManager.get(context).getUserRestrictions(userHandle);
        for (int i = 0; i < sRestrictionKeys.length; i++) {
            RestrictionEntry restrictionEntry = new RestrictionEntry(sRestrictionKeys[i], !userRestrictions.getBoolean(sRestrictionKeys[i], false));
            restrictionEntry.setTitle(res.getString(sRestrictionTitles[i]));
            restrictionEntry.setDescription(res.getString(sRestrictionDescriptions[i]));
            restrictionEntry.setType(1);
            entries.add(restrictionEntry);
        }
        return entries;
    }

    public static void setRestrictions(Context context, ArrayList<RestrictionEntry> entries, UserHandle userHandle) {
        UserManager um = UserManager.get(context);
        Bundle userRestrictions = um.getUserRestrictions(userHandle);
        Iterator i$ = entries.iterator();
        while (i$.hasNext()) {
            RestrictionEntry restrictionEntry = (RestrictionEntry) i$.next();
            userRestrictions.putBoolean(restrictionEntry.getKey(), !restrictionEntry.getSelectedState());
            if (restrictionEntry.getKey().equals("no_share_location") && !restrictionEntry.getSelectedState()) {
                Secure.putStringForUser(context.getContentResolver(), "location_providers_allowed", "", userHandle.getIdentifier());
            }
        }
        um.setUserRestrictions(userRestrictions, userHandle);
    }

    public static Bundle restrictionsToBundle(ArrayList<RestrictionEntry> entries) {
        Bundle bundle = new Bundle();
        Iterator i$ = entries.iterator();
        while (i$.hasNext()) {
            RestrictionEntry restrictionEntry = (RestrictionEntry) i$.next();
            if (restrictionEntry.getType() == 1) {
                bundle.putBoolean(restrictionEntry.getKey(), restrictionEntry.getSelectedState());
            } else if (restrictionEntry.getType() == 4) {
                bundle.putStringArray(restrictionEntry.getKey(), restrictionEntry.getAllSelectedStrings());
            } else {
                bundle.putString(restrictionEntry.getKey(), restrictionEntry.getSelectedString());
            }
        }
        return bundle;
    }
}