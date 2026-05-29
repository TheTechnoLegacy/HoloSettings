package com.jellybyn.settings;

import android.app.Activity;
import android.app.StatusBarManager;
import android.content.ComponentName;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.os.storage.IMountService;
import android.os.storage.IMountService.Stub;
import android.provider.Settings.Global;
import android.telephony.TelephonyManager;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.view.View.OnTouchListener;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.android.internal.telephony.ITelephony;
import java.util.List;

public class CryptKeeper extends Activity implements TextWatcher, OnKeyListener, OnTouchListener, OnEditorActionListener {
    private AudioManager mAudioManager;
    private int mCooldown;
    private boolean mEncryptionGoneBad;
    private final Handler mHandler = new 1(this);
    private boolean mIgnoreBack = false;
    private int mNotificationCountdown = 0;
    private EditText mPasswordEntry;
    private StatusBarManager mStatusBar;
    private boolean mValidationComplete;
    private boolean mValidationRequested;
    WakeLock mWakeLock;

    private void passwordEntryInit() {
        this.mPasswordEntry = (EditText) findViewById(2131230778);
        this.mPasswordEntry.setOnEditorActionListener(this);
        this.mPasswordEntry.requestFocus();
        this.mPasswordEntry.setOnKeyListener(this);
        this.mPasswordEntry.setOnTouchListener(this);
        this.mPasswordEntry.addTextChangedListener(this);
        if (!((TelephonyManager) getSystemService("phone")).isVoiceCapable()) {
            View findViewById = findViewById(2131230775);
            if (findViewById != null) {
                Log.d("CryptKeeper", "Removing the emergency Call button");
                findViewById.setVisibility(8);
            }
        }
        View imeSwitcher = findViewById(2131230779);
        InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        if (imeSwitcher != null && hasMultipleEnabledIMEsOrSubtypes(imm, false)) {
            imeSwitcher.setVisibility(0);
            imeSwitcher.setOnClickListener(new 3(this, imm));
        }
        if (this.mWakeLock == null) {
            Log.d("CryptKeeper", "Acquiring wakelock.");
            PowerManager powerManager = (PowerManager) getSystemService("power");
            if (powerManager != null) {
                this.mWakeLock = powerManager.newWakeLock(26, "CryptKeeper");
                this.mWakeLock.acquire();
            }
        }
        this.mHandler.postDelayed(new 3(this, imm), 0);
        updateEmergencyCallButtonState();
        this.mHandler.removeMessages(3);
        this.mHandler.sendEmptyMessageDelayed(3, 120000);
    }

    private boolean hasMultipleEnabledIMEsOrSubtypes(InputMethodManager inputMethodManager, boolean z) {
        boolean z2 = false;
        int filteredImisCount = 0;
        for (InputMethodInfo inputMethodInfo : inputMethodManager.getEnabledInputMethodList()) {
            if (filteredImisCount > 1) {
                return true;
            }
            List<InputMethodSubtype> enabledInputMethodSubtypeList = inputMethodManager.getEnabledInputMethodSubtypeList(inputMethodInfo, true);
            if (enabledInputMethodSubtypeList.isEmpty()) {
                filteredImisCount++;
            } else {
                int i = 0;
                for (InputMethodSubtype isAuxiliary : enabledInputMethodSubtypeList) {
                    if (isAuxiliary.isAuxiliary()) {
                        i++;
                    }
                }
                if (enabledInputMethodSubtypeList.size() - i > 0 || (z && i > 1)) {
                    filteredImisCount++;
                }
            }
        }
        if (filteredImisCount > 1 || inputMethodManager.getEnabledInputMethodSubtypeList(null, false).size() > 1) {
            z2 = true;
        }
        return z2;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String str = SystemProperties.get("vold.decrypt");
        if (isDebugView() || !("".equals(str) || "trigger_restart_framework".equals(str))) {
            this.mStatusBar = (StatusBarManager) getSystemService("statusbar");
            this.mStatusBar.disable(20381696);
            setAirplaneModeIfNecessary();
            this.mAudioManager = (AudioManager) getSystemService("audio");
            Object lastNonConfigurationInstance = getLastNonConfigurationInstance();
            if (lastNonConfigurationInstance instanceof NonConfigurationInstanceState) {
                this.mWakeLock = ((NonConfigurationInstanceState) lastNonConfigurationInstance).wakelock;
                Log.d("CryptKeeper", "Restoring wakelock from NonConfigurationInstanceState");
                return;
            }
            return;
        }
        getPackageManager().setComponentEnabledSetting(new ComponentName(this, CryptKeeper.class), 2, 1);
        finish();
    }

    private void updateEmergencyCallButtonState() {
        Button emergencyCall = (Button) findViewById(2131230775);
        if (emergencyCall != null) {
            if (isEmergencyCallCapable()) {
                int textId;
                emergencyCall.setVisibility(0);
                emergencyCall.setOnClickListener(new 1(this));
                if (TelephonyManager.getDefault().getCallState() == 2) {
                    textId = 2131429013;
                    emergencyCall.setCompoundDrawablesWithIntrinsicBounds(2130837672, 0, 0, 0);
                } else {
                    textId = 2131429012;
                    emergencyCall.setCompoundDrawablesWithIntrinsicBounds(2130837581, 0, 0, 0);
                }
                emergencyCall.setText(textId);
                return;
            }
            emergencyCall.setVisibility(8);
        }
    }

    private void updateProgress() {
        String state = SystemProperties.get("vold.encrypt_progress");
        if ("error_partially_encrypted".equals(state)) {
            showFactoryReset();
            return;
        }
        int progress = 0;
        try {
            progress = isDebugView() ? 50 : Integer.parseInt(state);
        } catch (Exception e) {
            Log.w("CryptKeeper", "Error parsing progress: " + e.toString());
        }
        CharSequence text = getText(2131427629);
        Log.v("CryptKeeper", "Encryption progress: " + progress);
        TextView textView = (TextView) findViewById(2131230740);
        if (textView != null) {
            textView.setText(TextUtils.expandTemplate(text, new CharSequence[]{Integer.toString(progress)}));
        }
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    private void setupUi() {
        if (this.mEncryptionGoneBad || isDebugView("error")) {
            setContentView(2130968606);
            showFactoryReset();
            return;
        }
        if (!"".equals(SystemProperties.get("vold.encrypt_progress")) || isDebugView("progress")) {
            setContentView(2130968606);
            encryptionProgressInit();
        } else if (this.mValidationComplete || isDebugView("password")) {
            setContentView(2130968604);
            passwordEntryInit();
        } else if (!this.mValidationRequested) {
            new ValidationTask(this, null).execute((Void[]) null);
            this.mValidationRequested = true;
        }
    }

    private void cooldown() {
        TextView status = (TextView) findViewById(2131230740);
        if (this.mCooldown <= 0) {
            this.mPasswordEntry.setEnabled(true);
            setBackFunctionality(true);
            status.setText(2131428889);
            return;
        }
        status.setText(TextUtils.expandTemplate(getText(2131427630), new CharSequence[]{Integer.toString(this.mCooldown)}));
        this.mCooldown--;
        this.mHandler.removeMessages(2);
        this.mHandler.sendEmptyMessageDelayed(2, 1000);
    }

    private void encryptionProgressInit() {
        Log.d("CryptKeeper", "Encryption progress screen initializing.");
        if (this.mWakeLock == null) {
            Log.d("CryptKeeper", "Acquiring wakelock.");
            this.mWakeLock = ((PowerManager) getSystemService("power")).newWakeLock(26, "CryptKeeper");
            this.mWakeLock.acquire();
        }
        ((ProgressBar) findViewById(2131230781)).setIndeterminate(true);
        setBackFunctionality(false);
        updateProgress();
    }

    private void showFactoryReset() {
        findViewById(2131230776).setVisibility(8);
        Button button = (Button) findViewById(2131230782);
        button.setVisibility(0);
        button.setOnClickListener(new 1(this));
        ((TextView) findViewById(2131230757)).setText(2131427632);
        ((TextView) findViewById(2131230740)).setText(2131427633);
        View view = findViewById(2131230783);
        if (view != null) {
            view.setVisibility(0);
        }
    }

    public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
        if (i != 0 && i != 6) {
            return false;
        }
        if (TextUtils.isEmpty(textView.getText().toString())) {
            return true;
        }
        textView.setText(null);
        this.mPasswordEntry.setEnabled(false);
        setBackFunctionality(false);
        Log.d("CryptKeeper", "Attempting to send command to decrypt");
        new ValidationTask(this, null).execute(new String[]{password});
        return true;
    }

    private void notifyUser() {
        if (this.mNotificationCountdown > 0) {
            this.mNotificationCountdown--;
        } else if (this.mAudioManager != null) {
            try {
                this.mAudioManager.playSoundEffect(5, 100.0f);
            } catch (Exception e) {
                Log.w("CryptKeeper", "notifyUser: Exception while playing sound: " + e);
            }
        }
        this.mHandler.removeMessages(3);
        this.mHandler.sendEmptyMessageDelayed(3, 5000);
    }

    private final void setAirplaneModeIfNecessary() {
        if ((TelephonyManager.getDefault().getLteOnCdmaMode() == 1 ? 1 : 0) == 0) {
            Log.d("CryptKeeper", "Going into airplane mode.");
            Global.putInt(getContentResolver(), "airplane_mode_on", 1);
            Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
            intent.putExtra("state", true);
            sendBroadcastAsUser(intent, UserHandle.ALL);
        }
    }

    private void resumeCall() {
        ITelephony phone = Stub.asInterface(ServiceManager.checkService("phone"));
        if (phone != null) {
            try {
                phone.showCallScreen();
            } catch (RemoteException e) {
                Log.e("CryptKeeper", "Error calling ITelephony service: " + e);
            }
        }
    }

    private final void setBackFunctionality(boolean z) {
        this.mIgnoreBack = !z;
        if (z) {
            this.mStatusBar.disable(20381696);
        } else {
            this.mStatusBar.disable(24576000);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mWakeLock != null) {
            Log.d("CryptKeeper", "Releasing and destroying wakelock");
            this.mWakeLock.release();
            this.mWakeLock = null;
        }
    }

    public void onStop() {
        super.onStop();
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(1);
        this.mHandler.removeMessages(3);
    }

    private IMountService getMountService() {
        IBinder service = ServiceManager.getService("mount");
        return service != null ? Stub.asInterface(service) : null;
    }

    private void launchEmergencyDialer() {
        Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
        intent.setFlags(276824064);
        startActivity(intent);
    }

    private void takeEmergencyCallAction() {
        if (TelephonyManager.getDefault().getCallState() == 2) {
            resumeCall();
        } else {
            launchEmergencyDialer();
        }
    }

    public Object onRetainNonConfigurationInstance() {
        NonConfigurationInstanceState state = new NonConfigurationInstanceState(this.mWakeLock);
        Log.d("CryptKeeper", "Handing wakelock off to NonConfigurationInstanceState");
        this.mWakeLock = null;
        return state;
    }

    public void onBackPressed() {
        if (!this.mIgnoreBack) {
            super.onBackPressed();
        }
    }

    public void onStart() {
        super.onStart();
        setupUi();
    }

    private void delayAudioNotification() {
        this.mNotificationCountdown = 20;
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        delayAudioNotification();
        return false;
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        delayAudioNotification();
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        delayAudioNotification();
        return false;
    }

    private boolean isDebugView() {
        return getIntent().hasExtra("com.jellybyn.settings.CryptKeeper.DEBUG_FORCE_VIEW");
    }

    private boolean isDebugView(String str) {
        return str.equals(getIntent().getStringExtra("com.jellybyn.settings.CryptKeeper.DEBUG_FORCE_VIEW"));
    }

    private boolean isEmergencyCallCapable() {
        return getResources().getBoolean(17891378);
    }

    public void afterTextChanged(Editable editable) {
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}