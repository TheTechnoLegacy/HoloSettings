package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.DatePickerDialog;
import android.app.DatePickerDialog.OnDateSetListener;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.app.TimePickerDialog.OnTimeSetListener;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings.Global;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.text.format.DateFormat;
import android.widget.DatePicker;
import android.widget.TimePicker;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateTimeSettings extends SettingsPreferenceFragment implements OnDateSetListener, OnTimeSetListener, OnSharedPreferenceChangeListener {
    private CheckBoxPreference mAutoTimePref;
    private CheckBoxPreference mAutoTimeZonePref;
    private ListPreference mDateFormat;
    private Preference mDatePref;
    private Calendar mDummyDate;
    private BroadcastReceiver mIntentReceiver = new 1(this);
    private Preference mTime24Pref;
    private Preference mTimePref;
    private Preference mTimeZone;

    private void initUI() {
        boolean autoTimeEnabled = getAutoState("auto_time");
        boolean autoTimeZoneEnabled = getAutoState("auto_time_zone");
        boolean isFirstRun = getActivity().getIntent().getBooleanExtra("firstRun", false);
        this.mDummyDate = Calendar.getInstance();
        this.mAutoTimePref = (CheckBoxPreference) findPreference("auto_time");
        this.mAutoTimePref.setChecked(autoTimeEnabled);
        this.mAutoTimeZonePref = (CheckBoxPreference) findPreference("auto_zone");
        if (Utils.isWifiOnly(getActivity()) || isFirstRun) {
            getPreferenceScreen().removePreference(this.mAutoTimeZonePref);
            autoTimeZoneEnabled = false;
        }
        this.mAutoTimeZonePref.setChecked(autoTimeZoneEnabled);
        this.mTimePref = findPreference("time");
        this.mTime24Pref = findPreference("24 hour");
        this.mTimeZone = findPreference("timezone");
        this.mDatePref = findPreference("date");
        this.mDateFormat = (ListPreference) findPreference("date_format");
        if (isFirstRun) {
            getPreferenceScreen().removePreference(this.mTime24Pref);
            getPreferenceScreen().removePreference(this.mDateFormat);
        }
        String[] dateFormats = getResources().getStringArray(2131165185);
        String[] formattedDates = new String[dateFormats.length];
        String currentFormat = getDateFormat();
        if (currentFormat == null) {
            currentFormat = "";
        }
        Calendar calendar = this.mDummyDate;
        int i = this.mDummyDate.get(1);
        Calendar calendar2 = this.mDummyDate;
        calendar.set(i, 11, 31, 13, 0, 0);
        for (int i2 = 0; i2 < formattedDates.length; i2++) {
            String format = DateFormat.getDateFormatForSetting(getActivity(), dateFormats[i2]).format(this.mDummyDate.getTime());
            if (dateFormats[i2].length() == 0) {
                formattedDates[i2] = getResources().getString(2131427476, new Object[]{format});
            } else {
                formattedDates[i2] = format;
            }
        }
        this.mDateFormat.setEntries(formattedDates);
        this.mDateFormat.setEntryValues(2131165185);
        this.mDateFormat.setValue(currentFormat);
        this.mTimePref.setEnabled(!autoTimeEnabled);
        this.mDatePref.setEnabled(!autoTimeEnabled);
        this.mTimeZone.setEnabled(!autoTimeZoneEnabled);
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        boolean z = true;
        Preference preference;
        if (str.equals("date_format")) {
            System.putString(getContentResolver(), "date_format", sharedPreferences.getString(str, getResources().getString(2131427475)));
            updateTimeAndDateDisplay(getActivity());
        } else if (str.equals("auto_time")) {
            boolean z2 = sharedPreferences.getBoolean(str, true);
            Global.putInt(getContentResolver(), "auto_time", z2 ? 1 : 0);
            this.mTimePref.setEnabled(!z2);
            preference = this.mDatePref;
            if (z2) {
                z = false;
            }
            preference.setEnabled(z);
        } else if (str.equals("auto_zone")) {
            boolean autoZoneEnabled = sharedPreferences.getBoolean(str, true);
            Global.putInt(getContentResolver(), "auto_time_zone", autoZoneEnabled ? 1 : 0);
            preference = this.mTimeZone;
            if (autoZoneEnabled) {
                z = false;
            }
            preference.setEnabled(z);
        }
    }

    public Dialog onCreateDialog(int i) {
        Calendar calendar;
        switch (i) {
            case 0:
                calendar = Calendar.getInstance();
                Dialog d = new DatePickerDialog(getActivity(), this, calendar.get(1), calendar.get(2), calendar.get(5));
                DatePickerDialog datePickerDialog = (DatePickerDialog) d;
                Calendar instance = Calendar.getInstance();
                instance.clear();
                instance.set(1970, 0, 1);
                datePickerDialog.getDatePicker().setMinDate(instance.getTimeInMillis());
                instance.clear();
                instance.set(2037, 11, 31);
                datePickerDialog.getDatePicker().setMaxDate(instance.getTimeInMillis());
                return d;
            case 1:
                calendar = Calendar.getInstance();
                return new TimePickerDialog(getActivity(), this, calendar.get(11), calendar.get(12), DateFormat.is24HourFormat(getActivity()));
            default:
                return null;
        }
    }

    private static StringBuilder formatOffset(StringBuilder stringBuilder, TimeZone timeZone, Date date) {
        int off = (timeZone.getOffset(date.getTime()) / 1000) / 60;
        stringBuilder.append("GMT");
        if (off < 0) {
            stringBuilder.append('-');
            off = -off;
        } else {
            stringBuilder.append('+');
        }
        int i = off / 60;
        int i2 = off % 60;
        stringBuilder.append((char) ((i / 10) + 48));
        stringBuilder.append((char) ((i % 10) + 48));
        stringBuilder.append(':');
        stringBuilder.append((char) ((i2 / 10) + 48));
        stringBuilder.append((char) ((i2 % 10) + 48));
        return stringBuilder;
    }

    public void updateTimeAndDateDisplay(Context context) {
        java.text.DateFormat shortDateFormat = DateFormat.getDateFormat(context);
        Calendar now = Calendar.getInstance();
        this.mDummyDate.setTimeZone(now.getTimeZone());
        this.mDummyDate.set(now.get(1), 11, 31, 13, 0, 0);
        Date dummyDate = this.mDummyDate.getTime();
        this.mTimePref.setSummary(DateFormat.getTimeFormat(getActivity()).format(now.getTime()));
        this.mTimeZone.setSummary(getTimeZoneText(now.getTimeZone()));
        this.mDatePref.setSummary(shortDateFormat.format(now.getTime()));
        this.mDateFormat.setSummary(shortDateFormat.format(dummyDate));
        this.mTime24Pref.setSummary(DateFormat.getTimeFormat(getActivity()).format(dummyDate));
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference == this.mDatePref) {
            showDialog(0);
        } else if (preference == this.mTimePref) {
            removeDialog(1);
            showDialog(1);
        } else if (preference == this.mTime24Pref) {
            set24Hour(((CheckBoxPreference) this.mTime24Pref).isChecked());
            updateTimeAndDateDisplay(getActivity());
            timeUpdated();
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    public void onResume() {
        super.onResume();
        getPreferenceScreen().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
        ((CheckBoxPreference) this.mTime24Pref).setChecked(is24Hour());
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.TIME_TICK");
        filter.addAction("android.intent.action.TIME_SET");
        filter.addAction("android.intent.action.TIMEZONE_CHANGED");
        getActivity().registerReceiver(this.mIntentReceiver, filter, null, null);
        updateTimeAndDateDisplay(getActivity());
    }

    static void setTime(Context context, int i, int i2) {
        Calendar c = Calendar.getInstance();
        c.set(11, i);
        c.set(12, i2);
        c.set(13, 0);
        c.set(14, 0);
        long when = c.getTimeInMillis();
        if (when / 1000 < 2147483647L) {
            ((AlarmManager) context.getSystemService("alarm")).setTime(when);
        }
    }

    static void setDate(Context context, int i, int i2, int i3) {
        Calendar c = Calendar.getInstance();
        c.set(1, i);
        c.set(2, i2);
        c.set(5, i3);
        long when = c.getTimeInMillis();
        if (when / 1000 < 2147483647L) {
            ((AlarmManager) context.getSystemService("alarm")).setTime(when);
        }
    }

    public void onDateSet(DatePicker datePicker, int i, int i2, int i3) {
        Activity activity = getActivity();
        if (activity != null) {
            setDate(activity, i, i2, i3);
            updateTimeAndDateDisplay(activity);
        }
    }

    public void onTimeSet(TimePicker timePicker, int i, int i2) {
        Activity activity = getActivity();
        if (activity != null) {
            setTime(activity, i, i2);
            updateTimeAndDateDisplay(activity);
        }
    }

    private boolean getAutoState(String str) {
        try {
            return Global.getInt(getContentResolver(), str) > 0;
        } catch (SettingNotFoundException e) {
            return false;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034123);
        initUI();
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mIntentReceiver);
        getPreferenceScreen().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
    }

    private void set24Hour(boolean z) {
        System.putString(getContentResolver(), "time_12_24", z ? "24" : "12");
    }

    private void timeUpdated() {
        getActivity().sendBroadcast(new Intent("android.intent.action.TIME_SET"));
    }

    static String getTimeZoneText(TimeZone timeZone) {
        Date now = new Date();
        return timeZone + ", " + timeZone.getDisplayName(timeZone.inDaylightTime(now), 1);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        updateTimeAndDateDisplay(getActivity());
    }

    private String getDateFormat() {
        return System.getString(getContentResolver(), "date_format");
    }

    private boolean is24Hour() {
        return DateFormat.is24HourFormat(getActivity());
    }
}