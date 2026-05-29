package com.jellybyn.settings.users;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.ActivityManagerNative;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.Profile;
import android.provider.Settings.Secure;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.SimpleAdapter;
import com.android.internal.widget.LockPatternUtils;
import com.jellybyn.settings.OwnerInfoSettings;
import com.jellybyn.settings.SelectableEditTextPreference;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.Utils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class UserSettings extends SettingsPreferenceFragment implements OnDismissListener, OnPreferenceChangeListener, OnPreferenceClickListener, OnClickListener {
    static final int[] USER_DRAWABLES = new int[]{2130837527, 2130837528, 2130837529, 2130837530, 2130837531, 2130837532, 2130837533, 2130837534};
    private Preference mAddUser;
    private int mAddedUserId = 0;
    private boolean mAddingUser;
    private Handler mHandler;
    private boolean mIsOwner;
    private Preference mMePreference;
    private SelectableEditTextPreference mNicknamePreference;
    private boolean mProfileExists;
    private int mRemovingUserId = -1;
    private BroadcastReceiver mUserChangeReceiver;
    private SparseArray<Bitmap> mUserIcons = new SparseArray();
    private PreferenceGroup mUserListCategory;
    private final Object mUserLock = new Object();
    private UserManager mUserManager;

    private void updateUserList() {
        boolean z = true;
        if (getActivity() != null) {
            List<UserInfo> users = this.mUserManager.getUsers(true);
            this.mUserListCategory.removeAll();
            this.mUserListCategory.setOrderingAsAdded(false);
            this.mUserListCategory.addPreference(this.mMePreference);
            ArrayList<Integer> missingIcons = new ArrayList();
            for (UserInfo userInfo : users) {
                Preference preference;
                if (userInfo.id == UserHandle.myUserId()) {
                    preference = this.mMePreference;
                } else {
                    Activity activity = getActivity();
                    int i = userInfo.id;
                    OnClickListener onClickListener = (this.mIsOwner && userInfo.isRestricted()) ? this : null;
                    preference = new UserPreference(activity, null, i, onClickListener, this.mIsOwner ? this : null);
                    preference.setOnPreferenceClickListener(this);
                    preference.setKey("id=" + userInfo.id);
                    this.mUserListCategory.addPreference(preference);
                    if (userInfo.id == 0) {
                        preference.setSummary(2131429076);
                    }
                    preference.setTitle(userInfo.name);
                }
                if (!isInitialized(userInfo)) {
                    preference.setSummary(userInfo.isRestricted() ? 2131429075 : 2131429074);
                } else if (userInfo.isRestricted()) {
                    preference.setSummary(2131429071);
                }
                if (userInfo.iconPath != null) {
                    if (this.mUserIcons.get(userInfo.id) == null) {
                        missingIcons.add(Integer.valueOf(userInfo.id));
                        preference.setIcon(encircle(2130837527));
                    } else {
                        setPhotoId(preference, userInfo);
                    }
                }
            }
            if (this.mAddingUser) {
                UserPreference userPreference = new UserPreference(getActivity(), null, -10, null, null);
                userPreference.setEnabled(false);
                userPreference.setTitle(2131429095);
                userPreference.setIcon(encircle(2130837527));
                this.mUserListCategory.addPreference(userPreference);
            }
            getActivity().invalidateOptionsMenu();
            if (missingIcons.size() > 0) {
                loadIconsAsync(missingIcons);
            }
            UserManager userManager = this.mUserManager;
            if (UserManager.getMaxSupportedUsers() <= users.size()) {
                z = false;
            }
            this.mAddUser.setEnabled(z);
        }
    }

    public Dialog onCreateDialog(int i) {
        Context context = getActivity();
        if (context == null) {
            return null;
        }
        switch (i) {
            case 1:
                Builder builder = new Builder(getActivity());
                int i2 = UserHandle.myUserId() == this.mRemovingUserId ? 2131429097 : this.mUserManager.getUserInfo(this.mRemovingUserId).isRestricted() ? 2131429099 : 2131429098;
                builder = builder.setTitle(i2);
                i2 = UserHandle.myUserId() == this.mRemovingUserId ? 2131429100 : this.mUserManager.getUserInfo(this.mRemovingUserId).isRestricted() ? 2131429102 : 2131429101;
                return builder.setMessage(i2).setPositiveButton(2131429105, new 4(this)).setNegativeButton(17039360, null).create();
            case 2:
                SharedPreferences preferences = getActivity().getPreferences(0);
                boolean z = preferences.getBoolean("key_add_user_long_message_displayed", false);
                return new Builder(context).setTitle(2131429084).setMessage(z ? 2131429086 : 2131429085).setPositiveButton(17039370, new 5(this, i == 2 ? 1 : 2, z, preferences)).setNegativeButton(17039360, null).create();
            case 3:
                return new Builder(context).setTitle(2131429087).setMessage(2131429088).setPositiveButton(2131429090, new 6(this)).setNegativeButton(2131429091, null).create();
            case 4:
                return new Builder(context).setMessage(2131429089).setPositiveButton(17039370, new 7(this)).setNegativeButton(17039360, null).create();
            case 5:
                return new Builder(context).setMessage(2131429092).setPositiveButton(17039370, null).create();
            case 6:
                ArrayList arrayList = new ArrayList();
                HashMap hashMap = new HashMap();
                hashMap.put("title", getString(2131429082));
                hashMap.put("summary", getString(2131429080));
                HashMap hashMap2 = new HashMap();
                hashMap2.put("title", getString(2131429083));
                hashMap2.put("summary", getString(2131429081));
                arrayList.add(hashMap);
                arrayList.add(hashMap2);
                return new Builder(context).setTitle(2131429079).setAdapter(new SimpleAdapter(context, arrayList, 2130968703, new String[]{"title", "summary"}, new int[]{2131230757, 2131230917}), new 8(this)).create();
            case 7:
                return new Builder(context).setMessage(2131429072).setPositiveButton(2131429073, new 9(this)).setNegativeButton(17039360, null).create();
            default:
                return null;
        }
    }

    public void onCreate(Bundle bundle) {
        OnClickListener onClickListener;
        super.onCreate(bundle);
        if (bundle != null) {
            if (bundle.containsKey("adding_user")) {
                this.mAddedUserId = bundle.getInt("adding_user");
            }
            if (bundle.containsKey("removing_user")) {
                this.mRemovingUserId = bundle.getInt("removing_user");
            }
        }
        this.mUserManager = (UserManager) getActivity().getSystemService("user");
        addPreferencesFromResource(2131034160);
        this.mUserListCategory = (PreferenceGroup) findPreference("user_list");
        Activity activity = getActivity();
        int myUserId = UserHandle.myUserId();
        if (this.mUserManager.isLinkedUser()) {
            onClickListener = null;
        } else {
            Object onClickListener2 = this;
        }
        this.mMePreference = new UserPreference(activity, null, myUserId, onClickListener2, null);
        this.mMePreference.setKey("user_me");
        this.mMePreference.setOnPreferenceClickListener(this);
        if (this.mIsOwner) {
            this.mMePreference.setSummary(2131429076);
        }
        this.mAddUser = findPreference("user_add");
        this.mAddUser.setOnPreferenceClickListener(this);
        if (!this.mIsOwner || UserManager.getMaxSupportedUsers() < 2) {
            removePreference("user_add");
        }
        loadProfile();
        setHasOptionsMenu(true);
        IntentFilter intent = new Intent("android.intent.action.USER_REMOVED");
        intent.addAction("android.intent.action.USER_INFO_CHANGED");
        getActivity().registerReceiverAsUser(this.mUserChangeReceiver, UserHandle.ALL, intent, null, this.mHandler);
    }

    public boolean onPreferenceClick(Preference preference) {
        if (preference == this.mMePreference) {
            Intent intent;
            if (this.mProfileExists) {
                intent = new Intent("android.intent.action.EDIT", Profile.CONTENT_URI);
            } else {
                intent = new Intent("android.intent.action.INSERT", Contacts.CONTENT_URI);
                intent.putExtra("newLocalProfile", true);
            }
            intent.putExtra("finishActivityOnSaveCompleted", true);
            if (this.mUserManager.isLinkedUser()) {
                onManageUserClicked(UserHandle.myUserId(), false);
            } else {
                startActivity(intent);
            }
        } else if (preference instanceof UserPreference) {
            UserInfo userInfo = this.mUserManager.getUserInfo(((UserPreference) preference).getUserId());
            if (UserHandle.myUserId() != 0) {
                showDialog(5);
            } else if (!isInitialized(userInfo)) {
                this.mHandler.sendMessage(this.mHandler.obtainMessage(2, userInfo.id, userInfo.serialNumber));
            } else if (userInfo.isRestricted()) {
                onManageUserClicked(userInfo.id, false);
            }
        } else if (preference == this.mAddUser) {
            showDialog(6);
        }
        return false;
    }

    private UserInfo createLimitedUser() {
        UserInfo newUserInfo = this.mUserManager.createUser(getResources().getString(2131429096), 8);
        int userId = newUserInfo.id;
        UserHandle user = new UserHandle(userId);
        this.mUserManager.setUserRestriction("no_modify_accounts", true, user);
        this.mUserManager.setUserRestriction("no_share_location", true, user);
        Secure.putStringForUser(getContentResolver(), "location_providers_allowed", "", userId);
        this.mUserManager.setUserIcon(userId, BitmapFactory.decodeResource(getResources(), USER_DRAWABLES[userId % USER_DRAWABLES.length]));
        AccountManager am = AccountManager.get(getActivity());
        Account[] accounts = am.getAccounts();
        if (accounts != null) {
            for (Account addSharedAccount : accounts) {
                am.addSharedAccount(addSharedAccount, user);
            }
        }
        return newUserInfo;
    }

    private void onManageUserClicked(int i, boolean z) {
        UserInfo userInfo = this.mUserManager.getUserInfo(i);
        Bundle bundle;
        if (userInfo.isRestricted() && this.mIsOwner) {
            bundle = new Bundle();
            bundle.putInt("user_id", i);
            bundle.putBoolean("new_user", z);
            ((PreferenceActivity) getActivity()).startPreferencePanel(AppRestrictionsFragment.class.getName(), bundle, 2131429133, null, null, 0);
        } else if (userInfo.id == UserHandle.myUserId()) {
            bundle = new Bundle();
            if (!userInfo.isRestricted()) {
                bundle.putBoolean("show_nickname", true);
            }
            int i2 = userInfo.id == 0 ? 2131427604 : userInfo.isRestricted() ? 2131427610 : 2131427608;
            ((PreferenceActivity) getActivity()).startPreferencePanel(OwnerInfoSettings.class.getName(), bundle, i2, null, null, 0);
        }
    }

    private void onAddUserClicked(int i) {
        synchronized (this.mUserLock) {
            if (this.mRemovingUserId == -1 && !this.mAddingUser) {
                switch (i) {
                    case 1:
                        showDialog(2);
                        break;
                    case 2:
                        if (!hasLockscreenSecurity()) {
                            showDialog(7);
                            break;
                        } else {
                            addUserNow(2);
                            break;
                        }
                }
            }
        }
    }

    public UserSettings() {
        boolean z = false;
        if (UserHandle.myUserId() == 0) {
            z = true;
        }
        this.mIsOwner = z;
        this.mHandler = new 1(this);
        this.mUserChangeReceiver = new 2(this);
    }

    private void finishLoadProfile(String str) {
        if (getActivity() != null) {
            this.mMePreference.setTitle(getString(2131429077, new Object[]{str}));
            int myUserId = UserHandle.myUserId();
            Bitmap b = this.mUserManager.getUserIcon(myUserId);
            if (b != null) {
                this.mMePreference.setIcon(encircle(b));
                this.mUserIcons.put(myUserId, b);
            }
        }
    }

    private void onRemoveUserClicked(int i) {
        synchronized (this.mUserLock) {
            if (this.mRemovingUserId == -1 && !this.mAddingUser) {
                this.mRemovingUserId = i;
                showDialog(1);
            }
        }
    }

    public void onClick(View view) {
        if (view.getTag() instanceof UserPreference) {
            int userId = ((UserPreference) view.getTag()).getUserId();
            switch (view.getId()) {
                case 2131230959:
                    onManageUserClicked(userId, false);
                    return;
                case 2131230961:
                    onRemoveUserClicked(userId);
                    return;
                default:
                    return;
            }
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        UserManager um = (UserManager) getActivity().getSystemService("user");
        if (!(this.mIsOwner || um.hasUserRestriction("no_remove_user"))) {
            String userName = this.mUserManager.getUserName();
            menu.add(0, 1, 0, getResources().getString(2131429094, new Object[]{userName})).setShowAsAction(0);
        }
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public void onDismiss(DialogInterface dialogInterface) {
        synchronized (this.mUserLock) {
            this.mAddingUser = false;
            this.mRemovingUserId = -1;
            updateUserList();
        }
    }

    private void addUserNow(int i) {
        synchronized (this.mUserLock) {
            this.mAddingUser = true;
            new 11(this, i).start();
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i != 10) {
            return;
        }
        if (i2 == 0 || !hasLockscreenSecurity()) {
            showDialog(7);
        } else {
            addUserNow(2);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (preference != this.mNicknamePreference) {
            return false;
        }
        String str = (String) obj;
        if (preference == this.mNicknamePreference && str != null && str.length() > 0) {
            setUserName(str);
        }
        return true;
    }

    private void onUserCreated(int i) {
        this.mAddedUserId = i;
        if (this.mUserManager.getUserInfo(i).isRestricted()) {
            showDialog(4);
        } else {
            showDialog(3);
        }
    }

    private void removeThisUser() {
        try {
            ActivityManagerNative.getDefault().switchUser(0);
            ((UserManager) getActivity().getSystemService("user")).removeUser(UserHandle.myUserId());
        } catch (RemoteException e) {
            Log.e("UserSettings", "Unable to remove self user");
        }
    }

    private UserInfo createTrustedUser() {
        UserInfo newUserInfo = this.mUserManager.createUser(getResources().getString(2131429095), 0);
        if (newUserInfo != null) {
            assignDefaultPhoto(newUserInfo);
        }
        return newUserInfo;
    }

    private String getProfileName() {
        String name = Utils.getMeProfileName(getActivity(), true);
        if (name != null) {
            this.mProfileExists = true;
        }
        return name;
    }

    private void launchChooseLockscreen() {
        Intent chooseLockIntent = new Intent("android.app.action.SET_NEW_PASSWORD");
        chooseLockIntent.putExtra("minimum_quality", 65536);
        startActivityForResult(chooseLockIntent, 10);
    }

    private void removeUserNow() {
        if (this.mRemovingUserId == UserHandle.myUserId()) {
            removeThisUser();
        } else {
            new 10(this).start();
        }
    }

    private void setPhotoId(Preference preference, UserInfo userInfo) {
        Bitmap bitmap = (Bitmap) this.mUserIcons.get(userInfo.id);
        if (bitmap != null) {
            preference.setIcon(encircle(bitmap));
        }
    }

    private void setUserName(String str) {
        this.mUserManager.setUserName(UserHandle.myUserId(), str);
        this.mNicknamePreference.setSummary(str);
        getActivity().invalidateOptionsMenu();
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 1) {
            return super.onOptionsItemSelected(menuItem);
        }
        onRemoveUserClicked(UserHandle.myUserId());
        return true;
    }

    public void onResume() {
        super.onResume();
        loadProfile();
        updateUserList();
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("adding_user", this.mAddedUserId);
        bundle.putInt("removing_user", this.mRemovingUserId);
    }

    private void assignDefaultPhoto(UserInfo userInfo) {
        this.mUserManager.setUserIcon(userInfo.id, BitmapFactory.decodeResource(getResources(), USER_DRAWABLES[userInfo.id % USER_DRAWABLES.length]));
    }

    private void assignProfilePhoto(UserInfo userInfo) {
        if (!Utils.copyMeProfilePhoto(getActivity(), userInfo)) {
            assignDefaultPhoto(userInfo);
        }
    }

    private void loadIconsAsync(List<Integer> missingIcons) {
        Resources resources = getResources();
        new 12(this).execute(new List[]{missingIcons});
    }

    private void loadProfile() {
        this.mProfileExists = false;
        new 3(this).execute(new Void[0]);
    }

    private void switchUserNow(int i) {
        try {
            ActivityManagerNative.getDefault().switchUser(i);
        } catch (RemoteException e) {
        }
    }

    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mUserChangeReceiver);
    }

    public void onDialogShowing() {
        super.onDialogShowing();
        setOnDismissListener(this);
    }

    private Drawable encircle(int i) {
        return encircle(BitmapFactory.decodeResource(getResources(), i));
    }

    private Drawable encircle(Bitmap bitmap) {
        return CircleFramedDrawable.getInstance(getActivity(), bitmap);
    }

    private boolean hasLockscreenSecurity() {
        LockPatternUtils lpu = new LockPatternUtils(getActivity());
        return lpu.isLockPasswordEnabled() || lpu.isLockPatternEnabled();
    }

    private boolean isInitialized(UserInfo userInfo) {
        return (userInfo.flags & 16) != 0;
    }

    public int getHelpResource() {
        return 2131429126;
    }
}