package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceFragment.OnPreferenceStartFragmentCallback;
import android.provider.Settings.Global;
import android.provider.Settings.SettingNotFoundException;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.DatePicker;
import android.widget.ListPopupWindow;
import android.widget.SimpleAdapter;
import android.widget.TimePicker;
import java.util.Calendar;
import java.util.TimeZone;

public class DateTimeSettingsSetupWizard extends Activity implements OnPreferenceStartFragmentCallback, OnClickListener, OnItemClickListener, OnCheckedChangeListener {
    private static final String TAG = DateTimeSettingsSetupWizard.class.getSimpleName();
    private CompoundButton mAutoDateTimeButton;
    private DatePicker mDatePicker;
    private InputMethodManager mInputMethodManager;
    private BroadcastReceiver mIntentReceiver = new 1(this);
    private TimeZone mSelectedTimeZone;
    private TimePicker mTimePicker;
    private SimpleAdapter mTimeZoneAdapter;
    private Button mTimeZoneButton;
    private ListPopupWindow mTimeZonePopup;
    private boolean mUsingXLargeLayout;

    public void initUiForXl() {
        boolean z = true;
        TimeZone tz = TimeZone.getDefault();
        this.mSelectedTimeZone = tz;
        this.mTimeZoneButton = (Button) findViewById(2131230814);
        this.mTimeZoneButton.setText(tz.getDisplayName());
        this.mTimeZoneButton.setOnClickListener(this);
        Intent intent = getIntent();
        boolean autoDateTimeEnabled = intent.hasExtra("extra_initial_auto_datetime_value") ? intent.getBooleanExtra("extra_initial_auto_datetime_value", false) : isAutoDateTimeEnabled();
        this.mAutoDateTimeButton = (CompoundButton) findViewById(2131230816);
        this.mAutoDateTimeButton.setChecked(autoDateTimeEnabled);
        this.mAutoDateTimeButton.setOnCheckedChangeListener(this);
        this.mTimePicker = (TimePicker) findViewById(2131230821);
        this.mTimePicker.setEnabled(!autoDateTimeEnabled);
        this.mDatePicker = (DatePicker) findViewById(2131230818);
        DatePicker datePicker = this.mDatePicker;
        if (autoDateTimeEnabled) {
            z = false;
        }
        datePicker.setEnabled(z);
        this.mDatePicker.setCalendarViewShown(false);
        this.mInputMethodManager = (InputMethodManager) getSystemService("input_method");
        ((Button) findViewById(2131230762)).setOnClickListener(this);
        Button button = (Button) findViewById(2131231041);
        if (button != null) {
            button.setOnClickListener(this);
        }
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case 2131230762:
                if (!(this.mSelectedTimeZone == null || TimeZone.getDefault().equals(this.mSelectedTimeZone))) {
                    Log.i(TAG, "Another TimeZone is selected by a user. Changing system TimeZone.");
                    ((AlarmManager) getSystemService("alarm")).setTimeZone(this.mSelectedTimeZone.getID());
                }
                if (this.mAutoDateTimeButton != null) {
                    Global.putInt(getContentResolver(), "auto_time", this.mAutoDateTimeButton.isChecked() ? 1 : 0);
                    if (!this.mAutoDateTimeButton.isChecked()) {
                        DateTimeSettings.setDate(this, this.mDatePicker.getYear(), this.mDatePicker.getMonth(), this.mDatePicker.getDayOfMonth());
                        DateTimeSettings.setTime(this, this.mTimePicker.getCurrentHour().intValue(), this.mTimePicker.getCurrentMinute().intValue());
                        break;
                    }
                }
                break;
            case 2131230814:
                showTimezonePicker(2131230814);
                return;
            case 2131231041:
                break;
            default:
                return;
        }
        setResult(-1);
        finish();
    }

    public void onItemClick(AdapterView<?> parent, View view, int i, long j) {
        TimeZone tz = ZonePicker.obtainTimeZoneFromItem(parent.getItemAtPosition(i));
        if (this.mUsingXLargeLayout) {
            this.mSelectedTimeZone = tz;
            Calendar instance = Calendar.getInstance(tz);
            if (this.mTimeZoneButton != null) {
                this.mTimeZoneButton.setText(tz.getDisplayName());
            }
            this.mDatePicker.updateDate(instance.get(1), instance.get(2), instance.get(5));
            this.mTimePicker.setCurrentHour(Integer.valueOf(instance.get(11)));
            this.mTimePicker.setCurrentMinute(Integer.valueOf(instance.get(12)));
        } else {
            ((AlarmManager) getSystemService("alarm")).setTimeZone(tz.getID());
            ((DateTimeSettings) getFragmentManager().findFragmentById(2131230812)).updateTimeAndDateDisplay(this);
        }
        this.mTimeZonePopup.dismiss();
    }

    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        boolean z2 = true;
        boolean autoEnabled = z;
        if (compoundButton == this.mAutoDateTimeButton) {
            Global.putInt(getContentResolver(), "auto_time", z ? 1 : 0);
            this.mTimePicker.setEnabled(!autoEnabled);
            DatePicker datePicker = this.mDatePicker;
            if (autoEnabled) {
                z2 = false;
            }
            datePicker.setEnabled(z2);
        }
        if (autoEnabled) {
            View currentFocus = getCurrentFocus();
            if (currentFocus != null) {
                this.mInputMethodManager.hideSoftInputFromWindow(currentFocus.getWindowToken(), 0);
                currentFocus.clearFocus();
            }
        }
    }

    protected void onCreate(Bundle bundle) {
        boolean z = true;
        requestWindowFeature(1);
        super.onCreate(bundle);
        setContentView(2130968619);
        if (findViewById(2131230814) == null) {
            z = false;
        }
        this.mUsingXLargeLayout = z;
        if (this.mUsingXLargeLayout) {
            initUiForXl();
        } else {
            findViewById(2131230762).setOnClickListener(this);
        }
        this.mTimeZoneAdapter = ZonePicker.constructTimezoneAdapter(this, false, 2130968620);
        if (!this.mUsingXLargeLayout) {
            findViewById(2131230810).setSystemUiVisibility(4194304);
        }
    }

    private void showTimezonePicker(int i) {
        View anchorView = findViewById(i);
        if (anchorView == null) {
            Log.e(TAG, "Unable to find zone picker anchor view " + i);
            return;
        }
        this.mTimeZonePopup = new ListPopupWindow(this, null);
        this.mTimeZonePopup.setWidth(anchorView.getWidth());
        this.mTimeZonePopup.setAnchorView(anchorView);
        this.mTimeZonePopup.setAdapter(this.mTimeZoneAdapter);
        this.mTimeZonePopup.setOnItemClickListener(this);
        this.mTimeZonePopup.setModal(true);
        this.mTimeZonePopup.show();
    }

    private void updateTimeAndDateDisplay() {
        if (this.mUsingXLargeLayout) {
            Calendar now = Calendar.getInstance();
            this.mTimeZoneButton.setText(now.getTimeZone().getDisplayName());
            this.mDatePicker.updateDate(now.get(1), now.get(2), now.get(5));
            this.mTimePicker.setCurrentHour(Integer.valueOf(now.get(11)));
            this.mTimePicker.setCurrentMinute(Integer.valueOf(now.get(12)));
        }
    }

    public void onResume() {
        super.onResume();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.TIME_TICK");
        filter.addAction("android.intent.action.TIME_SET");
        filter.addAction("android.intent.action.TIMEZONE_CHANGED");
        registerReceiver(this.mIntentReceiver, filter, null, null);
    }

    private boolean isAutoDateTimeEnabled() {
        try {
            return Global.getInt(getContentResolver(), "auto_time") > 0;
        } catch (SettingNotFoundException e) {
            return true;
        }
    }

    public void onPause() {
        super.onPause();
        unregisterReceiver(this.mIntentReceiver);
    }

    public boolean onPreferenceStartFragment(PreferenceFragment preferenceFragment, Preference preference) {
        showTimezonePicker(2131230811);
        return true;
    }
}