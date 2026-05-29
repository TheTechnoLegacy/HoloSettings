package com.jellybyn.settings.users;

import android.app.AlertDialog.Builder;
import android.app.AppGlobals;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.RestrictionEntry;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.content.pm.IPackageManager.Stub;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.res.Resources.NotFoundException;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.MultiSelectListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceGroup;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.jellybyn.settings.SettingsPreferenceFragment;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.StringTokenizer;

public class AppRestrictionsFragment extends SettingsPreferenceFragment implements OnPreferenceChangeListener, OnPreferenceClickListener, OnClickListener {
    private static final String TAG = AppRestrictionsFragment.class.getSimpleName();
    private PreferenceGroup mAppList;
    private boolean mAppListChanged;
    private int mCustomRequestCode;
    private HashMap<Integer, AppRestrictionsPreference> mCustomRequestMap = new HashMap();
    private Dialog mEditUserInfoDialog;
    private EditUserPhotoController mEditUserPhotoController;
    private boolean mFirstTime = true;
    private View mHeaderView;
    private boolean mNewUser;
    private PackageManager mPackageManager;
    private Bitmap mSavedPhoto;
    HashMap<String, Boolean> mSelectedPackages = new HashMap();
    private UserHandle mUser;
    private List<ApplicationInfo> mUserApps;
    private BroadcastReceiver mUserBackgrounding = new 1(this);
    private ImageView mUserIconView;
    private UserManager mUserManager;
    private TextView mUserNameView;
    private List<SelectableAppInfo> mVisibleApps;

    private void populateApps() {
        Context context = getActivity();
        if (context != null) {
            PackageManager pm = this.mPackageManager;
            IPackageManager ipm = AppGlobals.getPackageManager();
            this.mAppList.removeAll();
            List<ResolveInfo> receivers = pm.queryBroadcastReceivers(new Intent("android.intent.action.GET_RESTRICTION_ENTRIES"), 0);
            int i = 0;
            if (this.mVisibleApps.size() > 0) {
                for (SelectableAppInfo app : this.mVisibleApps) {
                    String packageName = app.packageName;
                    if (packageName != null) {
                        boolean isSettingsApp = packageName.equals(context.getPackageName());
                        AppRestrictionsPreference p = new AppRestrictionsPreference(context, this);
                        boolean hasSettings = resolveInfoListHasPackage(receivers, packageName);
                        p.setIcon(app.icon != null ? app.icon.mutate() : null);
                        p.setChecked(false);
                        p.setTitle(app.activityName);
                        if (app.masterEntry != null) {
                            p.setSummary(context.getString(2131429136, new Object[]{app.masterEntry.activityName}));
                        }
                        p.setKey("pkg_" + packageName);
                        boolean z = hasSettings || isSettingsApp;
                        AppRestrictionsPreference.access$700(p, z);
                        p.setPersistent(false);
                        p.setOnPreferenceChangeListener(this);
                        p.setOnPreferenceClickListener(this);
                        PackageInfo pi = null;
                        try {
                            pi = pm.getPackageInfo(packageName, 0);
                        } catch (NameNotFoundException e) {
                            try {
                                pi = ipm.getPackageInfo(packageName, 0, this.mUser.getIdentifier());
                            } catch (RemoteException e2) {
                            }
                        }
                        if (pi != null && pi.requiredForAllUsers) {
                            p.setChecked(true);
                            p.setImmutable(true);
                            if (hasSettings || isSettingsApp) {
                                if (hasSettings) {
                                    requestRestrictionsForApp(packageName, p);
                                }
                            }
                        } else if (!this.mNewUser) {
                            if (appInfoListHasPackage(this.mUserApps, packageName)) {
                                p.setChecked(true);
                            }
                        }
                        if (pi.requiredAccountType != null && pi.restrictedAccountType == null) {
                            p.setChecked(false);
                            p.setImmutable(true);
                            p.setSummary(2131429137);
                        }
                        if (pi.restrictedAccountType != null) {
                            p.setSummary(2131429138);
                        }
                        if (app.masterEntry != null) {
                            p.setImmutable(true);
                            p.setChecked(((Boolean) this.mSelectedPackages.get(packageName)).booleanValue());
                        }
                        this.mAppList.addPreference(p);
                        if (isSettingsApp) {
                            p.setOrder(100);
                        } else {
                            p.setOrder((i + 2) * 100);
                        }
                        p.setSelectableAppInfo(app);
                        this.mSelectedPackages.put(packageName, Boolean.valueOf(p.isChecked()));
                        this.mAppListChanged = true;
                        i++;
                    }
                }
            }
            if (this.mNewUser && this.mFirstTime) {
                this.mFirstTime = false;
                updateUserAppList();
            }
        }
    }

    private void fetchAndMergeApps() {
        this.mAppList.setOrderingAsAdded(false);
        this.mVisibleApps = new ArrayList();
        if (getActivity() != null) {
            SelectableAppInfo selectableAppInfo;
            PackageManager pm = this.mPackageManager;
            IPackageManager ipm = AppGlobals.getPackageManager();
            HashSet<String> excludePackages = new HashSet();
            addSystemImes(excludePackages);
            Intent launcherIntent = new Intent("android.intent.action.MAIN");
            launcherIntent.addCategory("android.intent.category.LAUNCHER");
            addSystemApps(this.mVisibleApps, launcherIntent, excludePackages);
            Intent widgetIntent = new Intent("android.appwidget.action.APPWIDGET_UPDATE");
            addSystemApps(this.mVisibleApps, widgetIntent, excludePackages);
            for (ApplicationInfo applicationInfo : pm.getInstalledApplications(0)) {
                if ((applicationInfo.flags & 1) == 0 && (applicationInfo.flags & 128) == 0) {
                    selectableAppInfo = new SelectableAppInfo();
                    selectableAppInfo.packageName = applicationInfo.packageName;
                    selectableAppInfo.appName = applicationInfo.loadLabel(pm);
                    selectableAppInfo.activityName = selectableAppInfo.appName;
                    selectableAppInfo.icon = applicationInfo.loadIcon(pm);
                    this.mVisibleApps.add(selectableAppInfo);
                } else {
                    try {
                        PackageInfo packageInfo = pm.getPackageInfo(applicationInfo.packageName, 0);
                        if (packageInfo.requiredAccountType != null && packageInfo.restrictedAccountType == null) {
                            this.mSelectedPackages.put(applicationInfo.packageName, Boolean.valueOf(false));
                        }
                    } catch (NameNotFoundException e) {
                    }
                }
            }
            this.mUserApps = null;
            try {
                this.mUserApps = ipm.getInstalledApplications(0, this.mUser.getIdentifier()).getList();
            } catch (RemoteException e2) {
            }
            if (this.mUserApps != null) {
                for (ApplicationInfo applicationInfo2 : this.mUserApps) {
                    if ((applicationInfo2.flags & 1) == 0 && (applicationInfo2.flags & 128) == 0) {
                        selectableAppInfo = new SelectableAppInfo();
                        selectableAppInfo.packageName = applicationInfo2.packageName;
                        selectableAppInfo.appName = applicationInfo2.loadLabel(pm);
                        selectableAppInfo.activityName = selectableAppInfo.appName;
                        selectableAppInfo.icon = applicationInfo2.loadIcon(pm);
                        this.mVisibleApps.add(selectableAppInfo);
                    }
                }
            }
            Collections.sort(this.mVisibleApps, new AppLabelComparator(this, null));
            HashSet hashSet = new HashSet();
            for (int size = this.mVisibleApps.size() - 1; size >= 0; size--) {
                selectableAppInfo = (SelectableAppInfo) this.mVisibleApps.get(size);
                String str = selectableAppInfo.packageName + "+" + selectableAppInfo.activityName;
                if (TextUtils.isEmpty(selectableAppInfo.packageName) || TextUtils.isEmpty(selectableAppInfo.activityName) || !hashSet.contains(str)) {
                    hashSet.add(str);
                } else {
                    this.mVisibleApps.remove(size);
                }
            }
            HashMap hashMap = new HashMap();
            for (SelectableAppInfo selectableAppInfo2 : this.mVisibleApps) {
                if (hashMap.containsKey(selectableAppInfo2.packageName)) {
                    selectableAppInfo2.masterEntry = (SelectableAppInfo) hashMap.get(selectableAppInfo2.packageName);
                } else {
                    hashMap.put(selectableAppInfo2.packageName, selectableAppInfo2);
                }
            }
        }
    }

    private void onRestrictionsReceived(AppRestrictionsPreference appRestrictionsPreference, String str, ArrayList<RestrictionEntry> restrictions) {
        Context context = appRestrictionsPreference.getContext();
        int count = 1;
        Iterator it = restrictions.iterator();
        while (it.hasNext()) {
            RestrictionEntry restrictionEntry = (RestrictionEntry) it.next();
            Preference preference = null;
            switch (restrictionEntry.getType()) {
                case 1:
                    preference = new CheckBoxPreference(context);
                    preference.setTitle(restrictionEntry.getTitle());
                    preference.setSummary(restrictionEntry.getDescription());
                    ((CheckBoxPreference) preference).setChecked(restrictionEntry.getSelectedState());
                    break;
                case 2:
                case 3:
                    preference = new ListPreference(context);
                    preference.setTitle(restrictionEntry.getTitle());
                    String selectedString = restrictionEntry.getSelectedString();
                    if (selectedString == null) {
                        selectedString = restrictionEntry.getDescription();
                    }
                    preference.setSummary(findInArray(restrictionEntry.getChoiceEntries(), restrictionEntry.getChoiceValues(), selectedString));
                    ((ListPreference) preference).setEntryValues(restrictionEntry.getChoiceValues());
                    ((ListPreference) preference).setEntries(restrictionEntry.getChoiceEntries());
                    ((ListPreference) preference).setValue(selectedString);
                    ((ListPreference) preference).setDialogTitle(restrictionEntry.getTitle());
                    break;
                case 4:
                    preference = new MultiSelectListPreference(context);
                    preference.setTitle(restrictionEntry.getTitle());
                    ((MultiSelectListPreference) preference).setEntryValues(restrictionEntry.getChoiceValues());
                    ((MultiSelectListPreference) preference).setEntries(restrictionEntry.getChoiceEntries());
                    HashSet hashSet = new HashSet();
                    for (Object add : restrictionEntry.getAllSelectedStrings()) {
                        hashSet.add(add);
                    }
                    ((MultiSelectListPreference) preference).setValues(hashSet);
                    ((MultiSelectListPreference) preference).setDialogTitle(restrictionEntry.getTitle());
                    break;
            }
            if (preference != null) {
                preference.setPersistent(false);
                preference.setOrder(appRestrictionsPreference.getOrder() + count);
                preference.setKey(appRestrictionsPreference.getKey().substring("pkg_".length()) + ";" + restrictionEntry.getKey());
                this.mAppList.addPreference(preference);
                preference.setOnPreferenceChangeListener(this);
                appRestrictionsPreference.childPreferences.add(preference);
                count++;
            }
        }
        appRestrictionsPreference.setRestrictions(restrictions);
        if (count == 1 && appRestrictionsPreference.isImmutable() && appRestrictionsPreference.isChecked()) {
            this.mAppList.removePreference(appRestrictionsPreference);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        String key = preference.getKey();
        if (key != null && key.contains(";")) {
            StringTokenizer stringTokenizer = new StringTokenizer(key, ";");
            String packageName = stringTokenizer.nextToken();
            String restrictionKey = stringTokenizer.nextToken();
            ArrayList<RestrictionEntry> restrictions = ((AppRestrictionsPreference) this.mAppList.findPreference("pkg_" + packageName)).getRestrictions();
            if (restrictions != null) {
                Iterator i$ = restrictions.iterator();
                while (i$.hasNext()) {
                    RestrictionEntry entry = (RestrictionEntry) i$.next();
                    if (entry.getKey().equals(restrictionKey)) {
                        switch (entry.getType()) {
                            case 1:
                                entry.setSelectedState(((Boolean) obj).booleanValue());
                                break;
                            case 2:
                            case 3:
                                ListPreference listPreference = (ListPreference) preference;
                                entry.setSelectedString((String) obj);
                                listPreference.setSummary(findInArray(entry.getChoiceEntries(), entry.getChoiceValues(), (String) obj));
                                break;
                            case 4:
                                MultiSelectListPreference multiSelectListPreference = (MultiSelectListPreference) preference;
                                Set set = (Set) obj;
                                String[] strArr = new String[set.size()];
                                set.toArray(strArr);
                                entry.setAllSelectedStrings(strArr);
                                break;
                            default:
                                continue;
                        }
                        if (packageName.equals(getActivity().getPackageName())) {
                            RestrictionUtils.setRestrictions(getActivity(), restrictions, this.mUser);
                        } else {
                            this.mUserManager.setApplicationRestrictions(packageName, RestrictionUtils.restrictionsToBundle(restrictions), this.mUser);
                        }
                    }
                }
            }
        }
        return true;
    }

    public Dialog onCreateDialog(int i) {
        if (i != 1) {
            return null;
        }
        if (this.mEditUserInfoDialog != null) {
            return this.mEditUserInfoDialog;
        }
        Drawable instance;
        View inflate = getActivity().getLayoutInflater().inflate(2130968628, null);
        EditText editText = (EditText) inflate.findViewById(2131230844);
        editText.setText(this.mUserManager.getUserInfo(this.mUser.getIdentifier()).name);
        ImageView imageView = (ImageView) inflate.findViewById(2131230843);
        if (this.mSavedPhoto != null) {
            instance = CircleFramedDrawable.getInstance(getActivity(), this.mSavedPhoto);
        } else {
            instance = this.mUserIconView.getDrawable();
            if (instance == null) {
                instance = getCircularUserIcon();
            }
        }
        imageView.setImageDrawable(instance);
        this.mEditUserPhotoController = new EditUserPhotoController(this, imageView, this.mSavedPhoto, instance);
        this.mEditUserInfoDialog = new Builder(getActivity()).setTitle(2131427610).setIconAttribute(2130837611).setView(inflate).setCancelable(true).setPositiveButton(17039370, new 4(this, editText)).setNegativeButton(17039360, new 3(this)).create();
        this.mEditUserInfoDialog.getWindow().setSoftInputMode(4);
        return this.mEditUserInfoDialog;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (this.mEditUserInfoDialog == null || !this.mEditUserInfoDialog.isShowing() || !this.mEditUserPhotoController.onActivityResult(i, i2, intent)) {
            AppRestrictionsPreference appRestrictionsPreference = (AppRestrictionsPreference) this.mCustomRequestMap.get(Integer.valueOf(i));
            if (appRestrictionsPreference == null) {
                Log.w(TAG, "Unknown requestCode " + i);
                return;
            }
            if (i2 == -1) {
                String substring = appRestrictionsPreference.getKey().substring("pkg_".length());
                ArrayList parcelableArrayListExtra = intent.getParcelableArrayListExtra("android.intent.extra.restrictions_list");
                Bundle bundleExtra = intent.getBundleExtra("android.intent.extra.restrictions_bundle");
                if (parcelableArrayListExtra != null) {
                    appRestrictionsPreference.setRestrictions(parcelableArrayListExtra);
                    this.mUserManager.setApplicationRestrictions(substring, RestrictionUtils.restrictionsToBundle(parcelableArrayListExtra), this.mUser);
                } else if (bundleExtra != null) {
                    this.mUserManager.setApplicationRestrictions(substring, bundleExtra, this.mUser);
                }
                toggleAppPanel(appRestrictionsPreference);
            }
            this.mCustomRequestMap.remove(Integer.valueOf(i));
        }
    }

    private void addSystemApps(List<SelectableAppInfo> visibleApps, Intent intent, Set<String> excludePackages) {
        if (getActivity() != null) {
            PackageManager pm = this.mPackageManager;
            for (ResolveInfo app : pm.queryIntentActivities(intent, 512)) {
                if (!(app.activityInfo == null || app.activityInfo.applicationInfo == null)) {
                    int flags = app.activityInfo.applicationInfo.flags;
                    if (!(((flags & 1) == 0 && (flags & 128) == 0) || excludePackages.contains(app.activityInfo.packageName))) {
                        SelectableAppInfo info = new SelectableAppInfo();
                        info.packageName = app.activityInfo.packageName;
                        info.appName = app.activityInfo.applicationInfo.loadLabel(pm);
                        info.icon = app.activityInfo.loadIcon(pm);
                        info.activityName = app.activityInfo.loadLabel(pm);
                        if (info.activityName == null) {
                            info.activityName = info.appName;
                        }
                        visibleApps.add(info);
                    }
                }
            }
        }
    }

    private void updateUserAppList() {
        IPackageManager ipm = Stub.asInterface(ServiceManager.getService("package"));
        int userId = this.mUser.getIdentifier();
        if (this.mUserManager.getUserInfo(userId).isRestricted()) {
            for (Entry<String, Boolean> entry : this.mSelectedPackages.entrySet()) {
                String packageName = entry.getKey();
                if (((Boolean) entry.getValue()).booleanValue()) {
                    try {
                        ApplicationInfo applicationInfo = ipm.getApplicationInfo(packageName, 0, userId);
                        if (applicationInfo == null || !applicationInfo.enabled) {
                            ipm.installExistingPackageAsUser(packageName, this.mUser.getIdentifier());
                        }
                    } catch (RemoteException e) {
                    }
                } else {
                    try {
                        if (ipm.getApplicationInfo(packageName, 0, userId) != null) {
                            ipm.deletePackageAsUser(entry.getKey(), null, this.mUser.getIdentifier(), 4);
                        }
                    } catch (RemoteException e2) {
                    }
                }
            }
            return;
        }
        Log.e(TAG, "Cannot apply application restrictions on a regular user!");
    }

    public void onClick(View view) {
        if (view == this.mHeaderView) {
            showDialog(1);
        } else if (view.getTag() instanceof AppRestrictionsPreference) {
            AppRestrictionsPreference pref = (AppRestrictionsPreference) view.getTag();
            if (view.getId() == 2131230927) {
                toggleAppPanel(pref);
            } else if (!pref.isImmutable()) {
                pref.setChecked(!pref.isChecked());
                String substring = pref.getKey().substring("pkg_".length());
                this.mSelectedPackages.put(substring, Boolean.valueOf(pref.isChecked()));
                if (pref.isChecked() && AppRestrictionsPreference.access$800(pref) && AppRestrictionsPreference.access$900(pref) == null) {
                    requestRestrictionsForApp(substring, pref);
                }
                this.mAppListChanged = true;
                updateAllEntries(pref.getKey(), pref.isChecked());
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mUser = new UserHandle(bundle.getInt("user_id"));
            this.mSavedPhoto = (Bitmap) bundle.getParcelable("pending_photo");
        } else {
            Bundle args = getArguments();
            if (args.containsKey("user_id")) {
                this.mUser = new UserHandle(args.getInt("user_id"));
            }
            this.mNewUser = args.getBoolean("new_user", false);
        }
        this.mPackageManager = getActivity().getPackageManager();
        this.mUserManager = (UserManager) getActivity().getSystemService("user");
        addPreferencesFromResource(2131034117);
        this.mAppList = getPreferenceScreen();
        setHasOptionsMenu(true);
    }

    private void toggleAppPanel(AppRestrictionsPreference appRestrictionsPreference) {
        if (appRestrictionsPreference.getKey().startsWith("pkg_")) {
            if (appRestrictionsPreference.panelOpen) {
                for (Preference removePreference : appRestrictionsPreference.childPreferences) {
                    this.mAppList.removePreference(removePreference);
                }
                appRestrictionsPreference.childPreferences.clear();
            } else {
                String substring = appRestrictionsPreference.getKey().substring("pkg_".length());
                if (substring.equals(getActivity().getPackageName())) {
                    onRestrictionsReceived(appRestrictionsPreference, substring, RestrictionUtils.getRestrictions(getActivity(), this.mUser));
                } else {
                    requestRestrictionsForApp(substring, appRestrictionsPreference);
                }
            }
            appRestrictionsPreference.panelOpen = !appRestrictionsPreference.panelOpen;
        }
    }

    private void addSystemImes(Set<String> excludePackages) {
        Context context = getActivity();
        if (context != null) {
            for (InputMethodInfo imi : ((InputMethodManager) context.getSystemService("input_method")).getInputMethodList()) {
                try {
                    if (imi.isDefault(context) && isSystemPackage(imi.getPackageName())) {
                        excludePackages.add(imi.getPackageName());
                    }
                } catch (NotFoundException e) {
                }
            }
        }
    }

    public void onActivityCreated(Bundle bundle) {
        if (this.mHeaderView == null) {
            this.mHeaderView = LayoutInflater.from(getActivity()).inflate(2130968709, null);
            ((ViewGroup) getListView().getParent()).addView(this.mHeaderView, 0);
            this.mHeaderView.setOnClickListener(this);
            this.mUserIconView = (ImageView) this.mHeaderView.findViewById(16908294);
            this.mUserNameView = (TextView) this.mHeaderView.findViewById(16908310);
            getListView().setFastScrollEnabled(true);
        }
        super.onActivityCreated(bundle);
    }

    public boolean onPreferenceClick(Preference preference) {
        boolean z = false;
        if (!preference.getKey().startsWith("pkg_")) {
            return false;
        }
        AppRestrictionsPreference appRestrictionsPreference = (AppRestrictionsPreference) preference;
        if (appRestrictionsPreference.isImmutable()) {
            return true;
        }
        if (!appRestrictionsPreference.isChecked()) {
            z = true;
        }
        appRestrictionsPreference.setChecked(z);
        this.mSelectedPackages.put(appRestrictionsPreference.getKey().substring("pkg_".length()), Boolean.valueOf(appRestrictionsPreference.isChecked()));
        updateAllEntries(appRestrictionsPreference.getKey(), appRestrictionsPreference.isChecked());
        this.mAppListChanged = true;
        return true;
    }

    public void onResume() {
        super.onResume();
        getActivity().registerReceiver(this.mUserBackgrounding, new Intent("android.intent.action.USER_BACKGROUND"));
        this.mAppListChanged = false;
        new AppLoadingTask(this, null).execute((Void[]) null);
        ((TextView) this.mHeaderView.findViewById(16908310)).setText(this.mUserManager.getUserInfo(this.mUser.getIdentifier()).name);
        ((ImageView) this.mHeaderView.findViewById(16908294)).setImageDrawable(getCircularUserIcon());
    }

    private boolean isSystemPackage(String str) {
        try {
            PackageInfo packageInfo = this.mPackageManager.getPackageInfo(str, 0);
            if (packageInfo.applicationInfo == null) {
                return false;
            }
            int i = packageInfo.applicationInfo.flags;
            return ((i & 1) == 0 && (i & 128) == 0) ? false : true;
        } catch (NameNotFoundException e) {
            return false;
        }
    }

    private void requestRestrictionsForApp(String str, AppRestrictionsPreference appRestrictionsPreference) {
        Bundle applicationRestrictions = this.mUserManager.getApplicationRestrictions(str, this.mUser);
        Intent intent = new Intent("android.intent.action.GET_RESTRICTION_ENTRIES");
        intent.setPackage(str);
        intent.putExtra("android.intent.extra.restrictions_bundle", applicationRestrictions);
        intent.addFlags(32);
        getActivity().sendOrderedBroadcast(intent, null, new RestrictionsResultReceiver(this, str, appRestrictionsPreference), null, -1, null, null);
    }

    private void updateAllEntries(String str, boolean z) {
        for (int i = 0; i < this.mAppList.getPreferenceCount(); i++) {
            Preference preference = this.mAppList.getPreference(i);
            if ((preference instanceof AppRestrictionsPreference) && str.equals(preference.getKey())) {
                ((AppRestrictionsPreference) preference).setChecked(z);
            }
        }
    }

    public void onPause() {
        super.onPause();
        this.mNewUser = false;
        getActivity().unregisterReceiver(this.mUserBackgrounding);
        if (this.mAppListChanged) {
            new 2(this).start();
        }
    }

    private String findInArray(String[] strArr, String[] strArr2, String str) {
        for (int i = 0; i < strArr2.length; i++) {
            if (strArr2[i].equals(str)) {
                return strArr[i];
            }
        }
        return str;
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("user_id", this.mUser.getIdentifier());
        if (this.mEditUserInfoDialog != null && this.mEditUserInfoDialog.isShowing() && this.mEditUserPhotoController != null) {
            bundle.putParcelable("pending_photo", this.mEditUserPhotoController.getNewUserPhotoBitmap());
        }
    }

    private boolean appInfoListHasPackage(List<ApplicationInfo> apps, String str) {
        for (ApplicationInfo applicationInfo : apps) {
            if (applicationInfo.packageName.equals(str)) {
                return true;
            }
        }
        return false;
    }

    private boolean resolveInfoListHasPackage(List<ResolveInfo> receivers, String str) {
        for (ResolveInfo resolveInfo : receivers) {
            if (resolveInfo.activityInfo.packageName.equals(str)) {
                return true;
            }
        }
        return false;
    }

    private void clearEditUserInfoDialog() {
        this.mEditUserInfoDialog = null;
        this.mSavedPhoto = null;
    }

    private int generateCustomActivityRequestCode(AppRestrictionsPreference appRestrictionsPreference) {
        this.mCustomRequestCode++;
        this.mCustomRequestMap.put(Integer.valueOf(this.mCustomRequestCode), appRestrictionsPreference);
        return this.mCustomRequestCode;
    }

    private Drawable getCircularUserIcon() {
        return CircleFramedDrawable.getInstance(getActivity(), this.mUserManager.getUserIcon(this.mUser.getIdentifier()));
    }
}