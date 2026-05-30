package com.jellybyn.settings;

import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import android.net.Uri;
import android.preference.RingtonePreference;
import android.util.AttributeSet;

public class DefaultRingtonePreference extends RingtonePreference {
    protected void onPrepareRingtonePickerIntent(Intent intent) {
        super.onPrepareRingtonePickerIntent(intent);
        intent.putExtra("android.intent.extra.ringtone.SHOW_DEFAULT", false);
    }

    public DefaultRingtonePreference(Context context, AttributeSet attributeSet) {
    }

    protected void onSaveRingtone(Uri uri) {
        RingtoneManager.setActualDefaultRingtoneUri(getContext(), getRingtoneType(), uri);
    }

    protected Uri onRestoreRingtone() {
        return RingtoneManager.getActualDefaultRingtoneUri(getContext(), getRingtoneType());
    }
}