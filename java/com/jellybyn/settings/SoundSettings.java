package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.media.AudioManager;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Vibrator;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.jellybyn.settings.bluetooth.DockEventReceiver;

public class SoundSettings extends SettingsPreferenceFragment implements OnPreferenceChangeListener {
    private static final String[] NEED_VOICE_CAPABILITY = new String[]{"ringtone", "dtmf_tone", "category_calls_and_notification", "emergency_tone", "vibrate_when_ringing"};
    private AudioManager mAudioManager;
    private CheckBoxPreference mDockAudioMediaEnabled;
    private Preference mDockAudioSettings;
    private Intent mDockIntent;
    private CheckBoxPreference mDockSounds;
    private CheckBoxPreference mDtmfTone;
    private Handler mHandler = new 1(this);
    private CheckBoxPreference mHapticFeedback;
    private CheckBoxPreference mLockSounds;
    private Preference mMusicFx;
    private Preference mNotificationPreference;
    private final BroadcastReceiver mReceiver = new 1(this);
    private Runnable mRingtoneLookupRunnable;
    private Preference mRingtonePreference;
    private CheckBoxPreference mSoundEffects;
    private PreferenceGroup mSoundSettings;
    private CheckBoxPreference mVibrateWhenRinging;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ContentResolver resolver = getContentResolver();
        int activePhoneType = TelephonyManager.getDefault().getCurrentPhoneType();
        this.mAudioManager = (AudioManager) getSystemService("audio");
        addPreferencesFromResource(2131034150);
        if (2 != activePhoneType) {
            getPreferenceScreen().removePreference(findPreference("emergency_tone"));
        }
        if (!getResources().getBoolean(2131296257)) {
            findPreference("ring_volume").setDependency(null);
        }
        if (getResources().getBoolean(17891407)) {
            getPreferenceScreen().removePreference(findPreference("ring_volume"));
        }
        this.mVibrateWhenRinging = (CheckBoxPreference) findPreference("vibrate_when_ringing");
        this.mVibrateWhenRinging.setPersistent(false);
        this.mVibrateWhenRinging.setChecked(Global.getInt(resolver, "vibrate_when_ringing", 0) != 0);
        this.mDtmfTone = (CheckBoxPreference) findPreference("dtmf_tone");
        this.mDtmfTone.setPersistent(false);
        this.mDtmfTone.setChecked(Global.getInt(resolver, "dtmf_tone", 1) != 0);
        this.mSoundEffects = (CheckBoxPreference) findPreference("sound_effects");
        this.mSoundEffects.setPersistent(false);
        this.mSoundEffects.setChecked(Global.getInt(resolver, "sound_effects_enabled", 1) != 0);
        this.mHapticFeedback = (CheckBoxPreference) findPreference("haptic_feedback");
        this.mHapticFeedback.setPersistent(false);
        this.mHapticFeedback.setChecked(Global.getInt(resolver, "haptic_feedback_enabled", 1) != 0);
        this.mLockSounds = (CheckBoxPreference) findPreference("lock_sounds");
        this.mLockSounds.setPersistent(false);
        this.mLockSounds.setChecked(Global.getInt(resolver, "lockscreen_sounds_enabled", 1) != 0);
        this.mRingtonePreference = findPreference("ringtone");
        this.mNotificationPreference = findPreference("notification_sound");
        Vibrator vibrator = (Vibrator) getSystemService("vibrator");
        if (vibrator == null || !vibrator.hasVibrator()) {
            removePreference("vibrate_when_ringing");
            removePreference("haptic_feedback");
        }
        if (2 == activePhoneType) {
            ListPreference listPreference = (ListPreference) findPreference("emergency_tone");
            listPreference.setValue(String.valueOf(Global.getInt(resolver, "emergency_tone", 0)));
            listPreference.setOnPreferenceChangeListener(this);
        }
        this.mSoundSettings = (PreferenceGroup) findPreference("sound_settings");
        this.mMusicFx = this.mSoundSettings.findPreference("musicfx");
        if (getPackageManager().queryIntentActivities(new Intent("android.media.action.DISPLAY_AUDIO_EFFECT_CONTROL_PANEL"), 512).size() <= 2) {
            this.mSoundSettings.removePreference(this.mMusicFx);
        }
        if (!Utils.isVoiceCapable(getActivity())) {
            for (CharSequence findPreference : NEED_VOICE_CAPABILITY) {
                Preference findPreference2 = findPreference(findPreference);
                if (findPreference2 != null) {
                    getPreferenceScreen().removePreference(findPreference2);
                }
            }
        }
        this.mRingtoneLookupRunnable = new 1(this);
        initDockSettings();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        int i = 0;
        ContentResolver contentResolver;
        String str;
        if (preference == this.mVibrateWhenRinging) {
            Global.putInt(getContentResolver(), "vibrate_when_ringing", this.mVibrateWhenRinging.isChecked() ? 1 : 0);
        } else if (preference == this.mDtmfTone) {
            contentResolver = getContentResolver();
            str = "dtmf_tone";
            if (this.mDtmfTone.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
        } else if (preference == this.mSoundEffects) {
            if (this.mSoundEffects.isChecked()) {
                this.mAudioManager.loadSoundEffects();
            } else {
                this.mAudioManager.unloadSoundEffects();
            }
            contentResolver = getContentResolver();
            str = "sound_effects_enabled";
            if (this.mSoundEffects.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
        } else if (preference == this.mHapticFeedback) {
            contentResolver = getContentResolver();
            str = "haptic_feedback_enabled";
            if (this.mHapticFeedback.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
        } else if (preference == this.mLockSounds) {
            contentResolver = getContentResolver();
            str = "lockscreen_sounds_enabled";
            if (this.mLockSounds.isChecked()) {
                i = 1;
            }
            Global.putInt(contentResolver, str, i);
        } else if (preference == this.mMusicFx) {
            return false;
        } else {
            if (preference == this.mDockAudioSettings) {
                if ((this.mDockIntent != null ? this.mDockIntent.getIntExtra("android.intent.extra.DOCK_STATE", 0) : 0) == 0) {
                    showDialog(1);
                } else {
                    if ((this.mDockIntent.getParcelableExtra("android.bluetooth.device.extra.DEVICE") != null ? 1 : 0) != 0) {
                        Intent intent = new Intent(this.mDockIntent);
                        intent.setAction("com.jellybyn.settings.bluetooth.action.DOCK_SHOW_UI");
                        intent.setClass(getActivity(), DockEventReceiver.class);
                        getActivity().sendBroadcast(intent);
                    } else {
                        boolean z;
                        PreferenceScreen preferenceScreen2 = (PreferenceScreen) this.mDockAudioSettings;
                        Bundle extras = preferenceScreen2.getExtras();
                        String str2 = "checked";
                        if (Global.getInt(getContentResolver(), "dock_audio_media_enabled", 0) == 1) {
                            z = true;
                        }
                        extras.putBoolean(str2, z);
                        super.onPreferenceTreeClick(preferenceScreen2, preferenceScreen2);
                    }
                }
            } else if (preference == this.mDockSounds) {
                contentResolver = getContentResolver();
                str = "dock_sounds_enabled";
                if (this.mDockSounds.isChecked()) {
                    i = 1;
                }
                Global.putInt(contentResolver, str, i);
            } else if (preference == this.mDockAudioMediaEnabled) {
                contentResolver = getContentResolver();
                str = "dock_audio_media_enabled";
                if (this.mDockAudioMediaEnabled.isChecked()) {
                    i = 1;
                }
                Global.putInt(contentResolver, str, i);
            }
        }
        return true;
    }

    private void handleDockChange(Intent intent) {
        boolean z = true;
        if (this.mDockAudioSettings != null) {
            int dockState = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
            boolean isBluetooth = intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE") != null;
            this.mDockIntent = intent;
            if (dockState != 0) {
                try {
                    removeDialog(1);
                } catch (IllegalArgumentException e) {
                }
                if (isBluetooth) {
                    this.mDockAudioSettings.setEnabled(true);
                    return;
                } else if (dockState == 3) {
                    ContentResolver contentResolver = getContentResolver();
                    this.mDockAudioSettings.setEnabled(true);
                    if (Global.getInt(contentResolver, "dock_audio_media_enabled", -1) == -1) {
                        Global.putInt(contentResolver, "dock_audio_media_enabled", 0);
                    }
                    this.mDockAudioMediaEnabled = (CheckBoxPreference) findPreference("dock_audio_media_enabled");
                    this.mDockAudioMediaEnabled.setPersistent(false);
                    CheckBoxPreference checkBoxPreference = this.mDockAudioMediaEnabled;
                    if (Global.getInt(contentResolver, "dock_audio_media_enabled", 0) == 0) {
                        z = false;
                    }
                    checkBoxPreference.setChecked(z);
                    return;
                } else {
                    this.mDockAudioSettings.setEnabled(false);
                    return;
                }
            }
            this.mDockAudioSettings.setEnabled(false);
        }
    }

    private void updateRingtoneName(int i, Preference preference, int i2) {
        if (preference != null) {
            Context context = getActivity();
            if (context != null) {
                Uri ringtoneUri = RingtoneManager.getActualDefaultRingtoneUri(context, i);
                CharSequence summary = context.getString(17040430);
                if (ringtoneUri == null) {
                    summary = context.getString(17040428);
                } else {
                    try {
                        Cursor query = context.getContentResolver().query(ringtoneUri, new String[]{"title"}, null, null, null);
                        if (query != null) {
                            if (query.moveToFirst()) {
                                summary = query.getString(0);
                            }
                            query.close();
                        }
                    } catch (SQLiteException e) {
                    }
                }
                this.mHandler.sendMessage(this.mHandler.obtainMessage(i2, summary));
            }
        }
    }

    private void initDockSettings() {
        ContentResolver resolver = getContentResolver();
        if (needsDockSettings()) {
            this.mDockSounds = (CheckBoxPreference) findPreference("dock_sounds");
            this.mDockSounds.setPersistent(false);
            this.mDockSounds.setChecked(Global.getInt(resolver, "dock_sounds_enabled", 0) != 0);
            this.mDockAudioSettings = findPreference("dock_audio");
            this.mDockAudioSettings.setEnabled(false);
            return;
        }
        getPreferenceScreen().removePreference(findPreference("dock_category"));
        getPreferenceScreen().removePreference(findPreference("dock_audio"));
        getPreferenceScreen().removePreference(findPreference("dock_sounds"));
        Global.putInt(resolver, "dock_audio_media_enabled", 1);
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if ("emergency_tone".equals(preference.getKey())) {
            try {
                Global.putInt(getContentResolver(), "emergency_tone", Integer.parseInt((String) obj));
            } catch (NumberFormatException e) {
                Log.e("SoundSettings", "could not persist emergency tone setting", e);
            }
        }
        return true;
    }

    private Dialog createUndockedMessage() {
        Builder ab = new Builder(getActivity());
        ab.setTitle(2131428023);
        ab.setMessage(2131428024);
        ab.setPositiveButton(17039370, null);
        return ab.create();
    }

    public void onResume() {
        super.onResume();
        lookupRingtoneNames();
        getActivity().registerReceiver(this.mReceiver, new Intent("android.intent.action.DOCK_EVENT"));
    }

    public Dialog onCreateDialog(int i) {
        return i == 1 ? createUndockedMessage() : null;
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    private void lookupRingtoneNames() {
        new Thread(this.mRingtoneLookupRunnable).start();
    }

    private boolean needsDockSettings() {
        return getResources().getBoolean(2131296256);
    }

    protected int getHelpResource() {
        return 2131429119;
    }
}