package com.jellybyn.settings;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.OnAccountsUpdateListener;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build;
import android.os.Bundle;
import android.os.INetworkManagementService.Stub;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceActivity.Header;
import android.preference.PreferenceFragment;
import android.util.Log;
import android.widget.Button;
import android.widget.ListAdapter;
import com.android.internal.util.ArrayUtils;
import com.jellybyn.settings.AccessibilitySettings.ToggleAccessibilityServicePreferenceFragment;
import com.jellybyn.settings.accounts.AccountSyncSettings;
import com.jellybyn.settings.accounts.AuthenticatorHelper;
import com.jellybyn.settings.accounts.ManageAccountsSettings;
import com.jellybyn.settings.applications.ManageApplications;
import com.jellybyn.settings.bluetooth.BluetoothSettings;
import com.jellybyn.settings.wfd.WifiDisplaySettings;
import com.jellybyn.settings.wifi.WifiSettings;
import com.jellybyn.settings.wifi.p2p.WifiP2pSettings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class Settings extends PreferenceActivity implements OnAccountsUpdateListener, ButtonBarHandler {
    private int[] SETTINGS_FOR_RESTRICTED = new int[]{2131231207, 2131231208, 2131231209, 2131231210, 2131231212, 2131231213, 2131231214, 2131231215, 2131231216, 2131231218, 2131231217, 2131231221, 2131231222, 2131231223, 2131231224, 2131231219, 2131231226, 2131231227, 2131231228, 2131231229, 2131231232, 2131231230};
    private AuthenticatorHelper mAuthenticatorHelper;
    private Header mCurrentHeader;
    private SharedPreferences mDevelopmentPreferences;
    private OnSharedPreferenceChangeListener mDevelopmentPreferencesListener;
    private Header mFirstHeader;
    private String mFragmentClass;
    protected HashMap<Integer, Integer> mHeaderIndexMap = new HashMap();
    private boolean mInLocalHeaderSwitch;
    private Header mLastHeader;
    private boolean mListeningToAccountUpdates;
    private Header mParentHeader;
    private int mTopLevelHeaderId;

    private void updateHeaderList(List<Header> target) {
        boolean showDev = this.mDevelopmentPreferences.getBoolean("show", Build.TYPE.equals("eng"));
        int i = 0;
        UserManager um = (UserManager) getSystemService("user");
        this.mHeaderIndexMap.clear();
        while (i < target.size()) {
            Header header = (Header) target.get(i);
            int i2 = (int) header.id;
            if (i2 == 2131231211 || i2 == 2131231220) {
                Utils.updateHeaderToSpecificActivityFromMetaDataOrRemove(this, target, header);
            } else if (i2 == 2131231208) {
                if (!getPackageManager().hasSystemFeature("android.hardware.wifi")) {
                    target.remove(i);
                }
            } else if (i2 == 2131231209) {
                if (!getPackageManager().hasSystemFeature("android.hardware.bluetooth")) {
                    target.remove(i);
                }
            } else if (i2 == 2131231210) {
                try {
                    if (!Stub.asInterface(ServiceManager.getService("network_management")).isBandwidthControlEnabled()) {
                        target.remove(i);
                    }
                } catch (RemoteException e) {
                }
            } else if (i2 == 2131231226) {
                i = insertAccountsHeaders(target, i + 1);
            } else if (i2 == 2131231219) {
                if (!UserManager.supportsMultipleUsers() || Utils.isMonkeyRunning()) {
                    target.remove(i);
                }
            } else if (i2 == 2131231231) {
                if (!showDev) {
                    target.remove(i);
                }
            } else if (i2 == 2131231227 && um.hasUserRestriction("no_modify_accounts")) {
                target.remove(i);
            }
            if (i < target.size() && target.get(i) == header && UserHandle.myUserId() != 0 && !ArrayUtils.contains(this.SETTINGS_FOR_RESTRICTED, i2)) {
                target.remove(i);
            }
            if (i < target.size() && target.get(i) == header) {
                if (this.mFirstHeader == null && HeaderAdapter.getHeaderType(header) != 0) {
                    this.mFirstHeader = header;
                }
                this.mHeaderIndexMap.put(Integer.valueOf(i2), Integer.valueOf(i));
                i++;
            }
        }
    }

    private int insertAccountsHeaders(List<Header> list, int i) {
        String[] enabledAccountTypes = this.mAuthenticatorHelper.getEnabledAccountTypes();
        ArrayList<Header> arrayList = new ArrayList(enabledAccountTypes.length);
        for (String str : enabledAccountTypes) {
            CharSequence labelForType = this.mAuthenticatorHelper.getLabelForType(this, str);
            if (labelForType != null) {
                Account[] accountsByType = AccountManager.get(this).getAccountsByType(str);
                boolean z = accountsByType.length == 1 && !this.mAuthenticatorHelper.hasAccountPreferences(str);
                Header header = new Header();
                header.title = labelForType;
                if (header.extras == null) {
                    header.extras = new Bundle();
                }
                if (z) {
                    header.breadCrumbTitleRes = 2131428850;
                    header.breadCrumbShortTitleRes = 2131428850;
                    header.fragment = AccountSyncSettings.class.getName();
                    header.fragmentArguments = new Bundle();
                    header.extras.putString("account_type", str);
                    header.extras.putParcelable("account", accountsByType[0]);
                    header.fragmentArguments.putParcelable("account", accountsByType[0]);
                } else {
                    header.breadCrumbTitle = labelForType;
                    header.breadCrumbShortTitle = labelForType;
                    header.fragment = ManageAccountsSettings.class.getName();
                    header.fragmentArguments = new Bundle();
                    header.extras.putString("account_type", str);
                    header.fragmentArguments.putString("account_type", str);
                    if (!isMultiPane()) {
                        header.fragmentArguments.putString("account_label", labelForType.toString());
                    }
                }
                arrayList.add(header);
            }
        }
        Collections.sort(arrayList, new 3(this));
        for (Header add : arrayList) {
            int i2 = i + 1;
            list.add(i, add);
            i = i2;
        }
        if (!this.mListeningToAccountUpdates) {
            AccountManager.get(this).addOnAccountsUpdatedListener(this, null, true);
            this.mListeningToAccountUpdates = true;
        }
        return i;
    }

    protected void onCreate(Bundle bundle) {
        if (getIntent().hasExtra("settings:ui_options")) {
            getWindow().setUiOptions(getIntent().getIntExtra("settings:ui_options", 0));
        }
        this.mAuthenticatorHelper = new AuthenticatorHelper();
        this.mAuthenticatorHelper.updateAuthDescriptions(this);
        this.mAuthenticatorHelper.onAccountsUpdated(this, null);
        this.mDevelopmentPreferences = getSharedPreferences("development", 0);
        getMetaData();
        this.mInLocalHeaderSwitch = true;
        super.onCreate(bundle);
        this.mInLocalHeaderSwitch = false;
        if (!onIsHidingHeaders() && onIsMultiPane()) {
            highlightHeader(this.mTopLevelHeaderId);
            setTitle(2131427563);
        }
        if (bundle != null) {
            this.mCurrentHeader = (Header) bundle.getParcelable("com.jellybyn.settings.CURRENT_HEADER");
            this.mParentHeader = (Header) bundle.getParcelable("com.jellybyn.settings.PARENT_HEADER");
        }
        if (!(bundle == null || this.mCurrentHeader == null)) {
            showBreadCrumbs(this.mCurrentHeader.title, null);
        }
        if (this.mParentHeader != null) {
            setParentTitle(this.mParentHeader.title, null, new 3(this));
        }
        if (onIsMultiPane()) {
            getActionBar().setDisplayHomeAsUpEnabled(false);
            getActionBar().setHomeButtonEnabled(false);
        }
    }

    private void switchToParent(String str) {
        ComponentName cn = new ComponentName(this, str);
        try {
            PackageManager packageManager = getPackageManager();
            ActivityInfo activityInfo = packageManager.getActivityInfo(cn, 128);
            if (activityInfo != null && activityInfo.metaData != null) {
                String string = activityInfo.metaData.getString("com.jellybyn.settings.FRAGMENT_CLASS");
                CharSequence loadLabel = activityInfo.loadLabel(packageManager);
                Header header = new Header();
                header.fragment = string;
                header.title = loadLabel;
                this.mCurrentHeader = header;
                switchToHeaderLocal(header);
                highlightHeader(this.mTopLevelHeaderId);
                this.mParentHeader = new Header();
                this.mParentHeader.fragment = activityInfo.metaData.getString("com.jellybyn.settings.PARENT_FRAGMENT_CLASS");
                this.mParentHeader.title = activityInfo.metaData.getString("com.jellybyn.settings.PARENT_FRAGMENT_TITLE");
            }
        } catch (NameNotFoundException e) {
            Log.w("Settings", "Could not find parent activity : " + str);
        }
    }

    private void getMetaData() {
        try {
            ActivityInfo activityInfo = getPackageManager().getActivityInfo(getComponentName(), 128);
            if (activityInfo != null && activityInfo.metaData != null) {
                this.mTopLevelHeaderId = activityInfo.metaData.getInt("com.jellybyn.settings.TOP_LEVEL_HEADER_ID");
                this.mFragmentClass = activityInfo.metaData.getString("com.jellybyn.settings.FRAGMENT_CLASS");
                int i = activityInfo.metaData.getInt("com.jellybyn.settings.PARENT_FRAGMENT_TITLE");
                String string = activityInfo.metaData.getString("com.jellybyn.settings.PARENT_FRAGMENT_CLASS");
                if (string != null) {
                    this.mParentHeader = new Header();
                    this.mParentHeader.fragment = string;
                    if (i != 0) {
                        this.mParentHeader.title = getResources().getString(i);
                    }
                }
            }
        } catch (NameNotFoundException e) {
        }
    }

    public Intent getIntent() {
        Intent superIntent = super.getIntent();
        String startingFragment = getStartingFragmentClass(superIntent);
        if (startingFragment == null || onIsMultiPane()) {
            return superIntent;
        }
        Intent intent = new Intent(superIntent);
        intent.putExtra(":android:show_fragment", startingFragment);
        Bundle extras = superIntent.getExtras();
        (extras != null ? new Bundle(extras) : new Bundle()).putParcelable("intent", superIntent);
        intent.putExtra(":android:show_fragment_args", superIntent.getExtras());
        return intent;
    }

    public boolean onPreferenceStartFragment(PreferenceFragment preferenceFragment, Preference preference) {
        int titleRes = preference.getTitleRes();
        if (preference.getFragment().equals(WallpaperTypeSettings.class.getName())) {
            titleRes = 2131428040;
        } else if (preference.getFragment().equals(OwnerInfoSettings.class.getName()) && UserHandle.myUserId() != 0) {
            titleRes = UserManager.get(this).isLinkedUser() ? 2131427610 : 2131427608;
        }
        startPreferencePanel(preference.getFragment(), preference.getExtras(), titleRes, preference.getTitle(), null, 0);
        return true;
    }

    public Header onGetInitialHeader() {
        String fragmentClass = getStartingFragmentClass(super.getIntent());
        if (fragmentClass == null) {
            return this.mFirstHeader;
        }
        Header header = new Header();
        header.fragment = fragmentClass;
        header.title = getTitle();
        header.fragmentArguments = getIntent().getExtras();
        this.mCurrentHeader = header;
        return header;
    }

    public void onHeaderClick(Header header, int i) {
        Intent intent;
        if (header.id == 2131231219) {
            intent = new Intent("android.settings.USER_SETTINGS");
            intent.addFlags(true);
            startActivity(intent);
        } else if (header.id == 2131231223) {
            intent = new Intent("android.settings.SECURITY_SETTINGS");
            intent.addFlags(true);
            startActivity(intent);
        } else {
            boolean revert = false;
            if (header.id == 2131231227) {
                revert = true;
            }
            super.onHeaderClick(header, i);
            if (!revert || this.mLastHeader == null) {
                this.mLastHeader = header;
            } else {
                highlightHeader((int) this.mLastHeader.id);
            }
        }
    }

    public void onResume() {
        super.onResume();
        this.mDevelopmentPreferencesListener = new 3(this);
        this.mDevelopmentPreferences.registerOnSharedPreferenceChangeListener(this.mDevelopmentPreferencesListener);
        ListAdapter listAdapter = getListAdapter();
        if (listAdapter instanceof HeaderAdapter) {
            ((HeaderAdapter) listAdapter).resume();
        }
        invalidateHeaders();
    }

    private void highlightHeader(int i) {
        if (i != 0) {
            Integer num = (Integer) this.mHeaderIndexMap.get(Integer.valueOf(i));
            if (num != null) {
                getListView().setItemChecked(num.intValue(), true);
                if (isMultiPane()) {
                    getListView().smoothScrollToPosition(num.intValue());
                }
            }
        }
    }

    public void onPause() {
        super.onPause();
        ListAdapter listAdapter = getListAdapter();
        if (listAdapter instanceof HeaderAdapter) {
            ((HeaderAdapter) listAdapter).pause();
        }
        this.mDevelopmentPreferences.unregisterOnSharedPreferenceChangeListener(this.mDevelopmentPreferencesListener);
        this.mDevelopmentPreferencesListener = null;
    }

    protected String getStartingFragmentClass(Intent intent) {
        if (this.mFragmentClass != null) {
            return this.mFragmentClass;
        }
        String className = intent.getComponent().getClassName();
        if (className.equals(getClass().getName())) {
            return null;
        }
        return ("com.jellybyn.settings.ManageApplications".equals(className) || "com.jellybyn.settings.RunningServices".equals(className) || "com.jellybyn.settings.applications.StorageUse".equals(className)) ? ManageApplications.class.getName() : className;
    }

    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        if ((intent.getFlags() & 1048576) == 0) {
            if (!(this.mFirstHeader == null || onIsHidingHeaders() || !onIsMultiPane())) {
                switchToHeaderLocal(this.mFirstHeader);
            }
            getListView().setSelectionFromTop(0, 0);
        }
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mCurrentHeader != null) {
            bundle.putParcelable("com.jellybyn.settings.CURRENT_HEADER", this.mCurrentHeader);
        }
        if (this.mParentHeader != null) {
            bundle.putParcelable("com.jellybyn.settings.PARENT_HEADER", this.mParentHeader);
        }
    }

    public Intent onBuildStartFragmentIntent(String str, Bundle bundle, int i, int i2) {
        Intent onBuildStartFragmentIntent = super.onBuildStartFragmentIntent(str, bundle, i, i2);
        if (WifiSettings.class.getName().equals(str) || WifiP2pSettings.class.getName().equals(str) || WifiDisplaySettings.class.getName().equals(str) || BluetoothSettings.class.getName().equals(str) || DreamSettings.class.getName().equals(str) || ToggleAccessibilityServicePreferenceFragment.class.getName().equals(str)) {
            onBuildStartFragmentIntent.putExtra("settings:ui_options", 1);
        }
        onBuildStartFragmentIntent.setClass(this, SubSettings.class);
        return onBuildStartFragmentIntent;
    }

    public void switchToHeader(Header header) {
        if (!this.mInLocalHeaderSwitch) {
            this.mCurrentHeader = null;
            this.mParentHeader = null;
        }
        super.switchToHeader(header);
    }

    private void switchToHeaderLocal(Header header) {
        this.mInLocalHeaderSwitch = true;
        switchToHeader(header);
        this.mInLocalHeaderSwitch = false;
    }

    public void onAccountsUpdated(Account[] accountArr) {
        this.mAuthenticatorHelper.updateAuthDescriptions(this);
        this.mAuthenticatorHelper.onAccountsUpdated(this, accountArr);
        invalidateHeaders();
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mListeningToAccountUpdates) {
            AccountManager.get(this).removeOnAccountsUpdatedListener(this);
        }
    }

    public void setListAdapter(ListAdapter listAdapter) {
        if (listAdapter == null) {
            super.setListAdapter(null);
        } else {
            super.setListAdapter(new HeaderAdapter(this, getHeaders(), this.mAuthenticatorHelper));
        }
    }

    public void onBuildHeaders(List<Header> headers) {
        loadHeadersFromResource(2131034148, headers);
        updateHeaderList(headers);
    }

    public Button getNextButton() {
        return super.getNextButton();
    }

    public boolean hasNextButton() {
        return super.hasNextButton();
    }

    public boolean shouldUpRecreateTask(Intent intent) {
        return super.shouldUpRecreateTask(new Intent(this, Settings.class));
    }
}