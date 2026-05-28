package com.jellybyn.settings;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.CheckBoxPreference;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.provider.Telephony.Carriers;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;

public class ApnEditor extends PreferenceActivity implements OnSharedPreferenceChangeListener, OnPreferenceChangeListener {
    private static final String TAG = ApnEditor.class.getSimpleName();
    private static String sNotSet;
    private static final String[] sProjection = new String[]{"_id", "name", "apn", "proxy", "port", "user", "server", "password", "mmsc", "mcc", "mnc", "numeric", "mmsproxy", "mmsport", "authtype", "type", "protocol", "carrier_enabled", "bearer", "roaming_protocol", "mvno_type", "mvno_match_data"};
    private EditTextPreference mApn;
    private EditTextPreference mApnType;
    private ListPreference mAuthType;
    private ListPreference mBearer;
    private CheckBoxPreference mCarrierEnabled;
    private String mCurMcc;
    private String mCurMnc;
    private Cursor mCursor;
    private boolean mFirstTime;
    private EditTextPreference mMcc;
    private EditTextPreference mMmsPort;
    private EditTextPreference mMmsProxy;
    private EditTextPreference mMmsc;
    private EditTextPreference mMnc;
    private EditTextPreference mMvnoMatchData;
    private ListPreference mMvnoType;
    private EditTextPreference mName;
    private boolean mNewApn;
    private EditTextPreference mPassword;
    private EditTextPreference mPort;
    private ListPreference mProtocol;
    private EditTextPreference mProxy;
    private Resources mRes;
    private ListPreference mRoamingProtocol;
    private EditTextPreference mServer;
    private TelephonyManager mTelephonyManager;
    private Uri mUri;
    private EditTextPreference mUser;

    private void fillUi() {
        String authVal;
        boolean z = true;
        if (this.mFirstTime) {
            this.mFirstTime = false;
            this.mName.setText(this.mCursor.getString(1));
            this.mApn.setText(this.mCursor.getString(2));
            this.mProxy.setText(this.mCursor.getString(3));
            this.mPort.setText(this.mCursor.getString(4));
            this.mUser.setText(this.mCursor.getString(5));
            this.mServer.setText(this.mCursor.getString(6));
            this.mPassword.setText(this.mCursor.getString(7));
            this.mMmsProxy.setText(this.mCursor.getString(12));
            this.mMmsPort.setText(this.mCursor.getString(13));
            this.mMmsc.setText(this.mCursor.getString(8));
            this.mMcc.setText(this.mCursor.getString(9));
            this.mMnc.setText(this.mCursor.getString(10));
            this.mApnType.setText(this.mCursor.getString(15));
            if (this.mNewApn) {
                String str = SystemProperties.get("gsm.sim.operator.numeric");
                if (str != null && str.length() > 4) {
                    String substring = str.substring(0, 3);
                    String substring2 = str.substring(3);
                    this.mMcc.setText(substring);
                    this.mMnc.setText(substring2);
                    this.mCurMnc = substring2;
                    this.mCurMcc = substring;
                }
            }
            authVal = this.mCursor.getInt(14);
            if (authVal != -1) {
                this.mAuthType.setValueIndex(authVal);
            } else {
                this.mAuthType.setValue(null);
            }
            this.mProtocol.setValue(this.mCursor.getString(16));
            this.mRoamingProtocol.setValue(this.mCursor.getString(19));
            CheckBoxPreference checkBoxPreference = this.mCarrierEnabled;
            if (this.mCursor.getInt(17) != 1) {
                z = false;
            }
            checkBoxPreference.setChecked(z);
            this.mBearer.setValue(this.mCursor.getString(18));
            this.mMvnoType.setValue(this.mCursor.getString(20));
            this.mMvnoMatchData.setEnabled(false);
            this.mMvnoMatchData.setText(this.mCursor.getString(21));
        }
        this.mName.setSummary(checkNull(this.mName.getText()));
        this.mApn.setSummary(checkNull(this.mApn.getText()));
        this.mProxy.setSummary(checkNull(this.mProxy.getText()));
        this.mPort.setSummary(checkNull(this.mPort.getText()));
        this.mUser.setSummary(checkNull(this.mUser.getText()));
        this.mServer.setSummary(checkNull(this.mServer.getText()));
        this.mPassword.setSummary(starify(this.mPassword.getText()));
        this.mMmsProxy.setSummary(checkNull(this.mMmsProxy.getText()));
        this.mMmsPort.setSummary(checkNull(this.mMmsPort.getText()));
        this.mMmsc.setSummary(checkNull(this.mMmsc.getText()));
        this.mMcc.setSummary(checkNull(this.mMcc.getText()));
        this.mMnc.setSummary(checkNull(this.mMnc.getText()));
        this.mApnType.setSummary(checkNull(this.mApnType.getText()));
        authVal = this.mAuthType.getValue();
        if (authVal != null) {
            int parseInt = Integer.parseInt(authVal);
            this.mAuthType.setValueIndex(parseInt);
            this.mAuthType.setSummary(this.mRes.getStringArray(2131165225)[parseInt]);
        } else {
            this.mAuthType.setSummary(sNotSet);
        }
        this.mProtocol.setSummary(checkNull(protocolDescription(this.mProtocol.getValue(), this.mProtocol)));
        this.mRoamingProtocol.setSummary(checkNull(protocolDescription(this.mRoamingProtocol.getValue(), this.mRoamingProtocol)));
        this.mBearer.setSummary(checkNull(bearerDescription(this.mBearer.getValue())));
        this.mMvnoType.setSummary(checkNull(mvnoDescription(this.mMvnoType.getValue())));
        this.mMvnoMatchData.setSummary(checkNull(this.mMvnoMatchData.getText()));
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(2131034115);
        sNotSet = getResources().getString(2131428159);
        this.mName = (EditTextPreference) findPreference("apn_name");
        this.mApn = (EditTextPreference) findPreference("apn_apn");
        this.mProxy = (EditTextPreference) findPreference("apn_http_proxy");
        this.mPort = (EditTextPreference) findPreference("apn_http_port");
        this.mUser = (EditTextPreference) findPreference("apn_user");
        this.mServer = (EditTextPreference) findPreference("apn_server");
        this.mPassword = (EditTextPreference) findPreference("apn_password");
        this.mMmsProxy = (EditTextPreference) findPreference("apn_mms_proxy");
        this.mMmsPort = (EditTextPreference) findPreference("apn_mms_port");
        this.mMmsc = (EditTextPreference) findPreference("apn_mmsc");
        this.mMcc = (EditTextPreference) findPreference("apn_mcc");
        this.mMnc = (EditTextPreference) findPreference("apn_mnc");
        this.mApnType = (EditTextPreference) findPreference("apn_type");
        this.mAuthType = (ListPreference) findPreference("auth_type");
        this.mAuthType.setOnPreferenceChangeListener(this);
        this.mProtocol = (ListPreference) findPreference("apn_protocol");
        this.mProtocol.setOnPreferenceChangeListener(this);
        this.mRoamingProtocol = (ListPreference) findPreference("apn_roaming_protocol");
        this.mRoamingProtocol.setOnPreferenceChangeListener(this);
        this.mCarrierEnabled = (CheckBoxPreference) findPreference("carrier_enabled");
        this.mBearer = (ListPreference) findPreference("bearer");
        this.mBearer.setOnPreferenceChangeListener(this);
        this.mMvnoType = (ListPreference) findPreference("mvno_type");
        this.mMvnoType.setOnPreferenceChangeListener(this);
        this.mMvnoMatchData = (EditTextPreference) findPreference("mvno_match_data");
        this.mRes = getResources();
        Intent intent = getIntent();
        String action = intent.getAction();
        this.mFirstTime = bundle == null;
        if (action.equals("android.intent.action.EDIT")) {
            this.mUri = intent.getData();
        } else if (action.equals("android.intent.action.INSERT")) {
            if (this.mFirstTime || bundle.getInt("pos") == 0) {
                this.mUri = getContentResolver().insert(intent.getData(), new ContentValues());
            } else {
                this.mUri = ContentUris.withAppendedId(Carriers.CONTENT_URI, (long) bundle.getInt("pos"));
            }
            this.mNewApn = true;
            if (this.mUri == null) {
                Log.w(TAG, "Failed to insert new telephony provider into " + getIntent().getData());
                finish();
                return;
            }
            setResult(-1, new Intent().setAction(this.mUri.toString()));
        } else {
            finish();
            return;
        }
        this.mCursor = managedQuery(this.mUri, sProjection, null, null);
        this.mCursor.moveToFirst();
        this.mTelephonyManager = (TelephonyManager) getSystemService("phone");
        fillUi();
    }

    private boolean validateAndSave(boolean z) {
        String checkNotSet = checkNotSet(this.mName.getText());
        String apn = checkNotSet(this.mApn.getText());
        String mcc = checkNotSet(this.mMcc.getText());
        String mnc = checkNotSet(this.mMnc.getText());
        if (getErrorMsg() != null && !z) {
            showDialog(0);
            return false;
        } else if (!this.mCursor.moveToFirst()) {
            Log.w(TAG, "Could not go to the first row in the Cursor when saving data.");
            return false;
        } else if (!z || !this.mNewApn || checkNotSet.length() >= 1 || apn.length() >= 1) {
            ContentValues values = new ContentValues();
            String str = "name";
            if (checkNotSet.length() < 1) {
                checkNotSet = getResources().getString(2131428811);
            }
            values.put(str, checkNotSet);
            values.put("apn", apn);
            values.put("proxy", checkNotSet(this.mProxy.getText()));
            values.put("port", checkNotSet(this.mPort.getText()));
            values.put("mmsproxy", checkNotSet(this.mMmsProxy.getText()));
            values.put("mmsport", checkNotSet(this.mMmsPort.getText()));
            values.put("user", checkNotSet(this.mUser.getText()));
            values.put("server", checkNotSet(this.mServer.getText()));
            values.put("password", checkNotSet(this.mPassword.getText()));
            values.put("mmsc", checkNotSet(this.mMmsc.getText()));
            String authVal = this.mAuthType.getValue();
            if (authVal != null) {
                values.put("authtype", Integer.valueOf(Integer.parseInt(authVal)));
            }
            values.put("protocol", checkNotSet(this.mProtocol.getValue()));
            values.put("roaming_protocol", checkNotSet(this.mRoamingProtocol.getValue()));
            values.put("type", checkNotSet(this.mApnType.getText()));
            values.put("mcc", mcc);
            values.put("mnc", mnc);
            values.put("numeric", mcc + mnc);
            if (this.mCurMnc != null && this.mCurMcc != null && this.mCurMnc.equals(mnc) && this.mCurMcc.equals(mcc)) {
                values.put("current", Integer.valueOf(1));
            }
            String bearerVal = this.mBearer.getValue();
            if (bearerVal != null) {
                values.put("bearer", Integer.valueOf(Integer.parseInt(bearerVal)));
            }
            values.put("mvno_type", checkNotSet(this.mMvnoType.getValue()));
            values.put("mvno_match_data", checkNotSet(this.mMvnoMatchData.getText()));
            getContentResolver().update(this.mUri, values, null, null);
            return true;
        } else {
            getContentResolver().delete(this.mUri, null, null);
            return false;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        String key = preference.getKey();
        String protocolDescription;
        if ("auth_type".equals(key)) {
            try {
                int parseInt = Integer.parseInt((String) obj);
                this.mAuthType.setValueIndex(parseInt);
                this.mAuthType.setSummary(this.mRes.getStringArray(2131165225)[parseInt]);
            } catch (NumberFormatException e) {
                return false;
            }
        } else if ("apn_protocol".equals(key)) {
            protocolDescription = protocolDescription((String) obj, this.mProtocol);
            if (protocolDescription == null) {
                return false;
            }
            this.mProtocol.setSummary(protocolDescription);
            this.mProtocol.setValue((String) obj);
        } else if ("apn_roaming_protocol".equals(key)) {
            protocolDescription = protocolDescription((String) obj, this.mRoamingProtocol);
            if (protocolDescription == null) {
                return false;
            }
            this.mRoamingProtocol.setSummary(protocolDescription);
            this.mRoamingProtocol.setValue((String) obj);
        } else if ("bearer".equals(key)) {
            String bearerDescription = bearerDescription((String) obj);
            if (bearerDescription == null) {
                return false;
            }
            this.mBearer.setValue((String) obj);
            this.mBearer.setSummary(bearerDescription);
        } else if ("mvno_type".equals(key)) {
            String mvno = mvnoDescription((String) obj);
            if (mvno == null) {
                return false;
            }
            this.mMvnoType.setValue((String) obj);
            this.mMvnoType.setSummary(mvno);
        }
        return true;
    }

    private String mvnoDescription(String str) {
        String str2 = null;
        int mvnoIndex = this.mMvnoType.findIndexOfValue(str);
        String oldValue = this.mMvnoType.getValue();
        if (mvnoIndex == -1) {
            return str2;
        }
        String[] values = this.mRes.getStringArray(2131165231);
        if (values[mvnoIndex].equals("None")) {
            this.mMvnoMatchData.setEnabled(false);
        } else {
            this.mMvnoMatchData.setEnabled(true);
        }
        if (!(str == null || str.equals(oldValue))) {
            if (values[mvnoIndex].equals("SPN")) {
                this.mMvnoMatchData.setText(this.mTelephonyManager.getSimOperatorName());
            } else if (values[mvnoIndex].equals("IMSI")) {
                this.mMvnoMatchData.setText(SystemProperties.get("gsm.sim.operator.numeric") + "x");
            } else if (values[mvnoIndex].equals("GID")) {
                this.mMvnoMatchData.setText(this.mTelephonyManager.getGroupIdLevel1());
            }
        }
        try {
            return values[mvnoIndex];
        } catch (ArrayIndexOutOfBoundsException e) {
            return str2;
        }
    }

    private String getErrorMsg() {
        String name = checkNotSet(this.mName.getText());
        String apn = checkNotSet(this.mApn.getText());
        String mcc = checkNotSet(this.mMcc.getText());
        String mnc = checkNotSet(this.mMnc.getText());
        if (name.length() < 1) {
            return this.mRes.getString(2131428191);
        }
        if (apn.length() < 1) {
            return this.mRes.getString(2131428192);
        }
        if (mcc.length() != 3) {
            return this.mRes.getString(2131428193);
        }
        return (mnc.length() & 65534) != 2 ? this.mRes.getString(2131428194) : null;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                deleteApn();
                return true;
            case 2:
                if (!validateAndSave(false)) {
                    return true;
                }
                finish();
                return true;
            case 3:
                if (this.mNewApn) {
                    getContentResolver().delete(this.mUri, null, null);
                }
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    private String starify(String str) {
        if (str == null || str.length() == 0) {
            return sNotSet;
        }
        char[] password = new char[str.length()];
        for (int i = 0; i < password.length; i++) {
            password[i] = '*';
        }
        return new String(password);
    }

    private String bearerDescription(String str) {
        String str2 = null;
        int mBearerIndex = this.mBearer.findIndexOfValue(str);
        if (mBearerIndex == -1) {
            return str2;
        }
        try {
            return this.mRes.getStringArray(2131165229)[mBearerIndex];
        } catch (ArrayIndexOutOfBoundsException e) {
            return str2;
        }
    }

    private String protocolDescription(String str, ListPreference listPreference) {
        String str2 = null;
        int protocolIndex = listPreference.findIndexOfValue(str);
        if (protocolIndex == -1) {
            return str2;
        }
        try {
            return this.mRes.getStringArray(2131165227)[protocolIndex];
        } catch (ArrayIndexOutOfBoundsException e) {
            return str2;
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        if (!this.mNewApn) {
            menu.add(0, 1, 0, 2131428186).setIcon(2130837587);
        }
        menu.add(0, 2, 0, 2131428188).setIcon(17301582);
        menu.add(0, 3, 0, 2131428189).setIcon(17301560);
        return true;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        switch (i) {
            case 4:
                if (validateAndSave(false)) {
                    finish();
                }
                return true;
            default:
                return super.onKeyDown(i, keyEvent);
        }
    }

    protected void onPrepareDialog(int i, Dialog dialog) {
        super.onPrepareDialog(i, dialog);
        if (i == 0) {
            String errorMsg = getErrorMsg();
            if (errorMsg != null) {
                ((AlertDialog) dialog).setMessage(errorMsg);
            }
        }
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        Preference pref = findPreference(str);
        if (pref == null) {
            return;
        }
        if (pref.equals(this.mPassword)) {
            pref.setSummary(starify(sharedPreferences.getString(str, "")));
        } else {
            pref.setSummary(checkNull(sharedPreferences.getString(str, "")));
        }
    }

    protected Dialog onCreateDialog(int i) {
        if (i != 0) {
            return super.onCreateDialog(i);
        }
        return new Builder(this).setTitle(2131428190).setPositiveButton(17039370, null).setMessage(getErrorMsg()).create();
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (validateAndSave(true)) {
            bundle.putInt("pos", this.mCursor.getInt(0));
        }
    }

    private String checkNotSet(String str) {
        return (str == null || str.equals(sNotSet)) ? "" : str;
    }

    private String checkNull(String str) {
        return (str == null || str.length() == 0) ? sNotSet : str;
    }

    private void deleteApn() {
        getContentResolver().delete(this.mUri, null, null);
        finish();
    }

    public void onPause() {
        getPreferenceScreen().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
        super.onPause();
    }

    public void onResume() {
        super.onResume();
        getPreferenceScreen().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
    }
}