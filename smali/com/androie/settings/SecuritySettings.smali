.class public Lcom/androie/settings/SecuritySettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "SecuritySettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

.field private mBlacklist:Landroid/preference/PreferenceScreen;

.field private mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

.field mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mIsPrimary:Z

.field private mKeyStore:Landroid/security/KeyStore;

.field private mLockAfter:Landroid/preference/ListPreference;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mNotificationAccess:Landroid/preference/Preference;

.field private mPM:Landroid/content/pm/PackageManager;

.field private mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

.field private mResetCredentials:Landroid/preference/Preference;

.field private mShowPassword:Landroid/preference/CheckBoxPreference;

.field private mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

.field private mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

.field private mSmsSecurityCheck:Landroid/preference/ListPreference;

.field private mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

.field private mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

.field private mVisibleDots:Landroid/preference/CheckBoxPreference;

.field private mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

.field private mVisiblePattern:Landroid/preference/CheckBoxPreference;

.field private mWarnInstallApps:Landroid/content/DialogInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method private checkPowerInstantLockDependency()V
    .locals 6

    .prologue
    .line 654
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_0

    .line 655
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "lock_screen_lock_after_timeout"

    const-wide/16 v4, 0x1388

    invoke-static {v2, v3, v4, v5}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 657
    .local v0, "timeout":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 658
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 663
    .end local v0    # "timeout":J
    :cond_0
    :goto_0
    return-void

    .line 660
    .restart local v0    # "timeout":J
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_0
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 47

    .prologue
    .line 153
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v29

    .line 154
    .local v29, "root":Landroid/preference/PreferenceScreen;
    if-eqz v29, :cond_0

    .line 155
    invoke-virtual/range {v29 .. v29}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 157
    :cond_0
    const v41, 0x7f050036

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 158
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v29

    .line 161
    const/16 v17, 0x0

    .line 162
    .local v17, "isCmSecurity":Z
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    .line 163
    .local v6, "args":Landroid/os/Bundle;
    if-eqz v6, :cond_1

    .line 164
    const-string v41, "cm_security"

    move-object/from16 v0, v41

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v17

    .line 167
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v28

    .line 168
    .local v28, "resolver":Landroid/content/ContentResolver;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    .line 171
    .local v26, "res":Landroid/content/res/Resources;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v23

    .line 174
    .local v23, "pm":Landroid/content/pm/PackageManager;
    const/16 v27, 0x0

    .line 175
    .local v27, "resid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isSecure()Z

    move-result v41

    if-nez v41, :cond_c

    .line 177
    const-string v41, "user"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/os/UserManager;

    .line 178
    .local v18, "mUm":Landroid/os/UserManager;
    const/16 v41, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getUsers(Z)Ljava/util/List;

    move-result-object v39

    .line 179
    .local v39, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface/range {v39 .. v39}, Ljava/util/List;->size()I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_a

    const/16 v31, 0x1

    .line 181
    .local v31, "singleUser":Z
    :goto_0
    if-eqz v31, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled()Z

    move-result v41

    if-eqz v41, :cond_b

    .line 182
    const v27, 0x7f05003c

    .line 204
    .end local v18    # "mUm":Landroid/os/UserManager;
    .end local v31    # "singleUser":Z
    .end local v39    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :goto_1
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 208
    const-string v41, "device_policy"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/admin/DevicePolicyManager;

    .line 211
    .local v12, "dpm":Landroid/app/admin/DevicePolicyManager;
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v41

    if-nez v41, :cond_e

    const/16 v41, 0x1

    :goto_2
    move/from16 v0, v41

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    .line 213
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v41, v0

    if-nez v41, :cond_2

    .line 215
    const-string v41, "owner_info_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v22

    .line 216
    .local v22, "ownerInfoPref":Landroid/preference/Preference;
    if-eqz v22, :cond_2

    .line 217
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/os/UserManager;->isLinkedUser()Z

    move-result v41

    if-eqz v41, :cond_f

    .line 218
    const v41, 0x7f080488

    move-object/from16 v0, v22

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(I)V

    .line 225
    .end local v22    # "ownerInfoPref":Landroid/preference/Preference;
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v41, v0

    if-eqz v41, :cond_3

    if-nez v17, :cond_3

    .line 226
    invoke-virtual {v12}, Landroid/app/admin/DevicePolicyManager;->getStorageEncryptionStatus()I

    move-result v41

    packed-switch v41, :pswitch_data_0

    .line 239
    :cond_3
    :goto_4
    :pswitch_0
    const-string v41, "lock_after_timeout"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/ListPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    if-eqz v41, :cond_10

    .line 241
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->setupLockAfterPreference()V

    .line 242
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 263
    :cond_4
    :goto_5
    if-eqz v17, :cond_7

    .line 265
    const-string v41, "power_button_instantly_locks"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    .line 267
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->checkPowerInstantLockDependency()V

    .line 270
    const v41, 0x7f05003a

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 272
    const-string v41, "lockscreen_quick_unlock_control"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v24

    check-cast v24, Landroid/preference/CheckBoxPreference;

    .line 274
    .local v24, "quickUnlockScreen":Landroid/preference/CheckBoxPreference;
    const-string v41, "menu_unlock_screen"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v19

    check-cast v19, Landroid/preference/CheckBoxPreference;

    .line 276
    .local v19, "menuUnlock":Landroid/preference/CheckBoxPreference;
    const-string v41, "home_unlock_screen"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    check-cast v13, Landroid/preference/CheckBoxPreference;

    .line 278
    .local v13, "homeUnlock":Landroid/preference/CheckBoxPreference;
    const-string v41, "camera_unlock_screen"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/CheckBoxPreference;

    .line 280
    .local v7, "cameraUnlock":Landroid/preference/CheckBoxPreference;
    const-string v41, "lockscreen.vibrate_enabled"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v40

    check-cast v40, Landroid/preference/CheckBoxPreference;

    .line 283
    .local v40, "vibratePref":Landroid/preference/CheckBoxPreference;
    const v41, 0x10e0043

    move-object/from16 v0, v26

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    .line 285
    .local v10, "deviceKeys":I
    const-string v41, "additional_options"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceGroup;

    .line 289
    .local v4, "additionalPrefs":Landroid/preference/PreferenceGroup;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled()Z

    move-result v41

    if-eqz v41, :cond_11

    .line 290
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 307
    :goto_6
    and-int/lit8 v41, v10, 0x4

    if-nez v41, :cond_5

    .line 308
    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 311
    :cond_5
    and-int/lit8 v41, v10, 0x1

    if-nez v41, :cond_6

    .line 312
    invoke-virtual {v4, v13}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 315
    :cond_6
    and-int/lit8 v41, v10, 0x20

    if-nez v41, :cond_7

    .line 316
    invoke-virtual {v4, v7}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 321
    .end local v4    # "additionalPrefs":Landroid/preference/PreferenceGroup;
    .end local v7    # "cameraUnlock":Landroid/preference/CheckBoxPreference;
    .end local v10    # "deviceKeys":I
    .end local v13    # "homeUnlock":Landroid/preference/CheckBoxPreference;
    .end local v19    # "menuUnlock":Landroid/preference/CheckBoxPreference;
    .end local v24    # "quickUnlockScreen":Landroid/preference/CheckBoxPreference;
    .end local v40    # "vibratePref":Landroid/preference/CheckBoxPreference;
    :cond_7
    const-string v41, "biometric_weak_liveliness"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    .line 325
    const-string v41, "visiblepattern"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    .line 328
    const-string v41, "visible_error_pattern"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

    .line 331
    const-string v41, "visibledots"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mVisibleDots:Landroid/preference/CheckBoxPreference;

    .line 334
    const-string v41, "power_button_instantly_locks"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    .line 338
    const v41, 0x7f050038

    move/from16 v0, v27

    move/from16 v1, v41

    if-ne v0, v1, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v41

    const/high16 v42, 0x10000

    move/from16 v0, v41

    move/from16 v1, v42

    if-eq v0, v1, :cond_8

    .line 341
    const-string v41, "security_category"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v30

    check-cast v30, Landroid/preference/PreferenceGroup;

    .line 343
    .local v30, "securityCategory":Landroid/preference/PreferenceGroup;
    if-eqz v30, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    if-eqz v41, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    if-eqz v41, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisibleDots:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    if-eqz v41, :cond_8

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mVisibleDots:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 352
    .end local v30    # "securityCategory":Landroid/preference/PreferenceGroup;
    :cond_8
    if-nez v17, :cond_17

    .line 353
    const v41, 0x7f05003d

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 355
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v41

    if-eqz v41, :cond_1a

    .line 356
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v36

    .line 357
    .local v36, "tm":Landroid/telephony/MSimTelephonyManager;
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v21

    .line 358
    .local v21, "numPhones":I
    const/4 v11, 0x1

    .line 359
    .local v11, "disableLock":Z
    const/16 v25, 0x1

    .line 360
    .local v25, "removeLock":Z
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_7
    move/from16 v0, v21

    if-ge v14, v0, :cond_14

    .line 362
    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/MSimTelephonyManager;->hasIccCard(I)Z

    move-result v41

    if-eqz v41, :cond_9

    .line 364
    const/16 v25, 0x0

    .line 365
    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/MSimTelephonyManager;->getSimState(I)I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-eq v0, v1, :cond_9

    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/MSimTelephonyManager;->getSimState(I)I

    move-result v41

    if-eqz v41, :cond_9

    move-object/from16 v0, v36

    invoke-virtual {v0, v14}, Landroid/telephony/MSimTelephonyManager;->getSimState(I)I

    move-result v41

    const/16 v42, 0x6

    move/from16 v0, v41

    move/from16 v1, v42

    if-eq v0, v1, :cond_9

    .line 368
    const/4 v11, 0x0

    .line 360
    :cond_9
    add-int/lit8 v14, v14, 0x1

    goto :goto_7

    .line 179
    .end local v11    # "disableLock":Z
    .end local v12    # "dpm":Landroid/app/admin/DevicePolicyManager;
    .end local v14    # "i":I
    .end local v21    # "numPhones":I
    .end local v25    # "removeLock":Z
    .end local v36    # "tm":Landroid/telephony/MSimTelephonyManager;
    .restart local v18    # "mUm":Landroid/os/UserManager;
    .restart local v39    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_a
    const/16 v31, 0x0

    goto/16 :goto_0

    .line 184
    .restart local v31    # "singleUser":Z
    :cond_b
    const v27, 0x7f050039

    goto/16 :goto_1

    .line 186
    .end local v18    # "mUm":Landroid/os/UserManager;
    .end local v31    # "singleUser":Z
    .end local v39    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->usingBiometricWeak()Z

    move-result v41

    if-eqz v41, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakInstalled()Z

    move-result v41

    if-eqz v41, :cond_d

    .line 188
    const v27, 0x7f050038

    goto/16 :goto_1

    .line 190
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v41

    sparse-switch v41, :sswitch_data_0

    goto/16 :goto_1

    .line 192
    :sswitch_0
    const v27, 0x7f05003f

    .line 193
    goto/16 :goto_1

    .line 195
    :sswitch_1
    const v27, 0x7f050042

    .line 196
    goto/16 :goto_1

    .line 200
    :sswitch_2
    const v27, 0x7f05003e

    goto/16 :goto_1

    .line 211
    .restart local v12    # "dpm":Landroid/app/admin/DevicePolicyManager;
    :cond_e
    const/16 v41, 0x0

    goto/16 :goto_2

    .line 220
    .restart local v22    # "ownerInfoPref":Landroid/preference/Preference;
    :cond_f
    const v41, 0x7f080486

    move-object/from16 v0, v22

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(I)V

    goto/16 :goto_3

    .line 229
    .end local v22    # "ownerInfoPref":Landroid/preference/Preference;
    :pswitch_1
    const v41, 0x7f05003b

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_4

    .line 233
    :pswitch_2
    const v41, 0x7f050044

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_4

    .line 243
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled()Z

    move-result v41

    if-nez v41, :cond_4

    if-eqz v17, :cond_4

    .line 244
    const v41, 0x7f050043

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 246
    const-string v41, "slide_lock_timeout_delay"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/ListPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    .line 248
    const-string v41, "screen_lock_slide_timeout_delay"

    const/16 v42, 0x1388

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    move/from16 v2, v42

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v33

    .line 250
    .local v33, "slideTimeoutDelay":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 251
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->updateSlideAfterTimeoutSummary()V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 254
    const-string v41, "slide_lock_screenoff_delay"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/ListPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    .line 256
    const-string v41, "screen_lock_slide_screenoff_delay"

    const/16 v42, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    move/from16 v2, v42

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v32

    .line 258
    .local v32, "slideScreenOffDelay":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 259
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->updateSlideAfterScreenOffSummary()V

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto/16 :goto_5

    .line 292
    .end local v32    # "slideScreenOffDelay":I
    .end local v33    # "slideTimeoutDelay":I
    .restart local v4    # "additionalPrefs":Landroid/preference/PreferenceGroup;
    .restart local v7    # "cameraUnlock":Landroid/preference/CheckBoxPreference;
    .restart local v10    # "deviceKeys":I
    .restart local v13    # "homeUnlock":Landroid/preference/CheckBoxPreference;
    .restart local v19    # "menuUnlock":Landroid/preference/CheckBoxPreference;
    .restart local v24    # "quickUnlockScreen":Landroid/preference/CheckBoxPreference;
    .restart local v40    # "vibratePref":Landroid/preference/CheckBoxPreference;
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isLockPatternEnabled()Z

    move-result v41

    if-eqz v41, :cond_12

    .line 293
    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 294
    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_6

    .line 298
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Lcom/android/internal/widget/LockPatternUtils;->isLockPasswordEnabled()Z

    move-result v41

    if-eqz v41, :cond_13

    .line 299
    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_6

    .line 303
    :cond_13
    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_6

    .line 372
    .end local v4    # "additionalPrefs":Landroid/preference/PreferenceGroup;
    .end local v7    # "cameraUnlock":Landroid/preference/CheckBoxPreference;
    .end local v10    # "deviceKeys":I
    .end local v13    # "homeUnlock":Landroid/preference/CheckBoxPreference;
    .end local v19    # "menuUnlock":Landroid/preference/CheckBoxPreference;
    .end local v24    # "quickUnlockScreen":Landroid/preference/CheckBoxPreference;
    .end local v40    # "vibratePref":Landroid/preference/CheckBoxPreference;
    .restart local v11    # "disableLock":Z
    .restart local v14    # "i":I
    .restart local v21    # "numPhones":I
    .restart local v25    # "removeLock":Z
    .restart local v36    # "tm":Landroid/telephony/MSimTelephonyManager;
    :cond_14
    if-eqz v25, :cond_19

    .line 373
    const-string v41, "sim_lock"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 396
    .end local v11    # "disableLock":Z
    .end local v14    # "i":I
    .end local v21    # "numPhones":I
    .end local v25    # "removeLock":Z
    .end local v36    # "tm":Landroid/telephony/MSimTelephonyManager;
    :cond_15
    :goto_8
    const-string v41, "show_password"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    .line 398
    const-string v41, "sim_lock"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    if-eqz v41, :cond_16

    .line 400
    const-string v41, "sim_lock_settings"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v15

    .line 402
    .local v15, "iccLock":Landroid/preference/Preference;
    new-instance v16, Landroid/content/Intent;

    invoke-direct/range {v16 .. v16}, Landroid/content/Intent;-><init>()V

    .line 403
    .local v16, "intent":Landroid/content/Intent;
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v41

    if-eqz v41, :cond_1e

    .line 404
    const-string v41, "com.android.settings"

    const-string v42, "com.android.settings.SelectSubscription"

    move-object/from16 v0, v16

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 406
    const-string v41, "PACKAGE"

    const-string v42, "com.android.settings"

    move-object/from16 v0, v16

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 407
    const-string v41, "TARGET_CLASS"

    const-string v42, "com.android.settings.IccLockSettings"

    move-object/from16 v0, v16

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 412
    :goto_9
    invoke-virtual/range {v15 .. v16}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 416
    .end local v15    # "iccLock":Landroid/preference/Preference;
    .end local v16    # "intent":Landroid/content/Intent;
    :cond_16
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v41

    const-string v42, "user"

    invoke-virtual/range {v41 .. v42}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v38

    check-cast v38, Landroid/os/UserManager;

    .line 417
    .local v38, "um":Landroid/os/UserManager;
    const-string v41, "no_config_credentials"

    move-object/from16 v0, v38

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v41

    if-nez v41, :cond_20

    .line 418
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v41

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    .line 419
    const-string v41, "credential_storage_type"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    .line 421
    .local v8, "credentialStorageType":Landroid/preference/Preference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Landroid/security/KeyStore;->isHardwareBacked()Z

    move-result v41

    if-eqz v41, :cond_1f

    const v35, 0x7f080902

    .line 424
    .local v35, "storageSummaryRes":I
    :goto_a
    move/from16 v0, v35

    invoke-virtual {v8, v0}, Landroid/preference/Preference;->setSummary(I)V

    .line 426
    const-string v41, "reset_credentials"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    .line 432
    .end local v8    # "credentialStorageType":Landroid/preference/Preference;
    .end local v35    # "storageSummaryRes":I
    :goto_b
    const-string v41, "device_admin_category"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    check-cast v9, Landroid/preference/PreferenceGroup;

    .line 435
    .local v9, "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    const-string v41, "toggle_install_applications"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->isNonMarketAppsAllowed()Z

    move-result v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v42, v0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 444
    const-string v41, "toggle_verify_applications"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    .line 445
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v41, v0

    if-eqz v41, :cond_22

    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->showVerifierSetting()Z

    move-result v41

    if-eqz v41, :cond_22

    .line 446
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->isVerifierInstalled()Z

    move-result v41

    if-eqz v41, :cond_21

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->isVerifyAppsEnabled()Z

    move-result v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 461
    :goto_c
    const v41, 0x7f050037

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 462
    const-string v41, "sms_security_check_limit"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/ListPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    .line 463
    const-string v41, "blacklist"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/PreferenceScreen;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mBlacklist:Landroid/preference/PreferenceScreen;

    .line 466
    const-string v41, "android.hardware.telephony"

    move-object/from16 v0, v23

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_24

    .line 467
    const-string v41, "sms_security_check_limit"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    check-cast v41, Landroid/preference/ListPreference;

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    .line 468
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/Integer;->intValue()I

    move-result v34

    .line 470
    .local v34, "smsSecurityCheck":I
    move-object/from16 v0, p0

    move/from16 v1, v34

    invoke-direct {v0, v1}, Lcom/androie/settings/SecuritySettings;->updateSmsSecuritySummary(I)V

    .line 481
    .end local v34    # "smsSecurityCheck":I
    :goto_d
    const-string v41, "android.hardware.telephony"

    move-object/from16 v0, v23

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_17

    const-string v41, "org.whispersystems.whisperpush"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->isPackageInstalled(Ljava/lang/String;)Z

    move-result v41

    if-eqz v41, :cond_17

    .line 483
    const v41, 0x7f050045

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 487
    .end local v9    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v38    # "um":Landroid/os/UserManager;
    :cond_17
    const-string v41, "manage_notification_access"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    move-object/from16 v0, v41

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v41, v0

    if-eqz v41, :cond_18

    .line 489
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mPM:Landroid/content/pm/PackageManager;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/androie/settings/NotificationAccessSettings;->getListenersCount(Landroid/content/pm/PackageManager;)I

    move-result v37

    .line 490
    .local v37, "total":I
    if-nez v37, :cond_25

    .line 491
    const-string v41, "device_admin_category"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    check-cast v9, Landroid/preference/PreferenceGroup;

    .line 493
    .restart local v9    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    if-eqz v9, :cond_18

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 509
    .end local v9    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v37    # "total":I
    :cond_18
    :goto_e
    return-object v29

    .line 375
    .restart local v11    # "disableLock":Z
    .restart local v14    # "i":I
    .restart local v21    # "numPhones":I
    .restart local v25    # "removeLock":Z
    .restart local v36    # "tm":Landroid/telephony/MSimTelephonyManager;
    :cond_19
    if-eqz v11, :cond_15

    .line 376
    const-string v41, "sim_lock"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    const/16 v42, 0x0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_8

    .line 381
    .end local v11    # "disableLock":Z
    .end local v14    # "i":I
    .end local v21    # "numPhones":I
    .end local v25    # "removeLock":Z
    .end local v36    # "tm":Landroid/telephony/MSimTelephonyManager;
    :cond_1a
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v36

    .line 382
    .local v36, "tm":Landroid/telephony/TelephonyManager;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v41, v0

    if-eqz v41, :cond_1b

    invoke-virtual/range {v36 .. v36}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v41

    if-nez v41, :cond_1c

    .line 383
    :cond_1b
    const-string v41, "sim_lock"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_8

    .line 386
    :cond_1c
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-eq v0, v1, :cond_1d

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v41

    if-nez v41, :cond_15

    .line 390
    :cond_1d
    const-string v41, "sim_lock"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v41

    const/16 v42, 0x0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_8

    .line 410
    .end local v36    # "tm":Landroid/telephony/TelephonyManager;
    .restart local v15    # "iccLock":Landroid/preference/Preference;
    .restart local v16    # "intent":Landroid/content/Intent;
    :cond_1e
    const-string v41, "com.android.settings"

    const-string v42, "com.android.settings.IccLockSettings"

    move-object/from16 v0, v16

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_9

    .line 421
    .end local v15    # "iccLock":Landroid/preference/Preference;
    .end local v16    # "intent":Landroid/content/Intent;
    .restart local v8    # "credentialStorageType":Landroid/preference/Preference;
    .restart local v38    # "um":Landroid/os/UserManager;
    :cond_1f
    const v35, 0x7f080903

    goto/16 :goto_a

    .line 428
    .end local v8    # "credentialStorageType":Landroid/preference/Preference;
    :cond_20
    const-string v41, "credentials_management"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/androie/settings/SecuritySettings;->removePreference(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 449
    .restart local v9    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_c

    .line 453
    :cond_22
    if-eqz v9, :cond_23

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_c

    .line 456
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v41, v0

    const/16 v42, 0x0

    invoke-virtual/range {v41 .. v42}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_c

    .line 473
    :cond_24
    const-string v41, "app_security"

    move-object/from16 v0, v29

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    check-cast v5, Landroid/preference/PreferenceGroup;

    .line 475
    .local v5, "appCategory":Landroid/preference/PreferenceGroup;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v5, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mBlacklist:Landroid/preference/PreferenceScreen;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v5, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_d

    .line 497
    .end local v5    # "appCategory":Landroid/preference/PreferenceGroup;
    .end local v9    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v38    # "um":Landroid/os/UserManager;
    .restart local v37    # "total":I
    :cond_25
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getNumEnabledNotificationListeners()I

    move-result v20

    .line 498
    .local v20, "n":I
    if-nez v20, :cond_26

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v41, v0

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v42

    const v43, 0x7f0804d8

    invoke-virtual/range {v42 .. v43}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_e

    .line 502
    :cond_26
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v41, v0

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v42

    const v43, 0x7f0e0008

    const/16 v44, 0x1

    move/from16 v0, v44

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v44, v0

    const/16 v45, 0x0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    aput-object v46, v44, v45

    move-object/from16 v0, v42

    move/from16 v1, v43

    move/from16 v2, v20

    move-object/from16 v3, v44

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v42

    const/16 v43, 0x0

    move/from16 v0, v43

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v43, v0

    invoke-static/range {v42 .. v43}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v42

    invoke-virtual/range {v41 .. v42}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_e

    .line 226
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 190
    :sswitch_data_0
    .sparse-switch
        0x10000 -> :sswitch_0
        0x20000 -> :sswitch_1
        0x40000 -> :sswitch_2
        0x50000 -> :sswitch_2
        0x60000 -> :sswitch_2
    .end sparse-switch
.end method

.method private disableUnusableTimeouts(J)V
    .locals 10
    .param p1, "maxTimeout"    # J

    .prologue
    .line 666
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 667
    .local v0, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 668
    .local v7, "values":[Ljava/lang/CharSequence;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 669
    .local v2, "revisedEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 670
    .local v3, "revisedValues":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v8, v7

    if-ge v1, v8, :cond_1

    .line 671
    aget-object v8, v7, v1

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 672
    .local v4, "timeout":J
    cmp-long v8, v4, p1

    if-gtz v8, :cond_0

    .line 673
    aget-object v8, v0, v1

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 674
    aget-object v8, v7, v1

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 670
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 677
    .end local v4    # "timeout":J
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    array-length v9, v0

    if-ne v8, v9, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    array-length v9, v7

    if-eq v8, v9, :cond_3

    .line 678
    :cond_2
    iget-object v9, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 680
    iget-object v9, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 682
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 683
    .local v6, "userPreference":I
    int-to-long v8, v6

    cmp-long v8, v8, p1

    if-gtz v8, :cond_3

    .line 684
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 691
    .end local v6    # "userPreference":I
    :cond_3
    iget-object v9, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_4

    const/4 v8, 0x1

    :goto_1
    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 692
    return-void

    .line 691
    :cond_4
    const/4 v8, 0x0

    goto :goto_1
.end method

.method private getNumEnabledNotificationListeners()I
    .locals 4

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "enabled_notification_listeners"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 515
    .local v1, "flat":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 517
    :goto_0
    return v2

    .line 516
    :cond_1
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 517
    .local v0, "components":[Ljava/lang/String;
    array-length v2, v0

    goto :goto_0
.end method

.method private isNonMarketAppsAllowed()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 521
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "install_non_market_apps"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isToggled(Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "pref"    # Landroid/preference/Preference;

    .prologue
    .line 804
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .end local p1    # "pref":Landroid/preference/Preference;
    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    return v0
.end method

.method private isVerifierInstalled()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 541
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 542
    .local v0, "pm":Landroid/content/pm/PackageManager;
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.PACKAGE_NEEDS_VERIFICATION"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 543
    .local v2, "verification":Landroid/content/Intent;
    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 544
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 545
    invoke-virtual {v0, v2, v4}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 546
    .local v1, "receivers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    :goto_0
    return v3

    :cond_0
    move v3, v4

    goto :goto_0
.end method

.method private isVerifyAppsEnabled()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 536
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "package_verifier_enable"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setNonMarketAppsAllowed(Z)V
    .locals 4
    .param p1, "enabled"    # Z

    .prologue
    .line 526
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    .line 527
    .local v0, "um":Landroid/os/UserManager;
    const-string v1, "no_install_unknown_sources"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 533
    :goto_0
    return-void

    .line 531
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "install_non_market_apps"

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private setupLockAfterPreference()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const-wide/16 v6, 0x0

    .line 622
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "lock_screen_lock_after_timeout"

    const-wide/16 v10, 0x1388

    invoke-static {v8, v9, v10, v11}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    .line 624
    .local v2, "currentTimeout":J
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 625
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 626
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/app/admin/DevicePolicyManager;->getMaximumTimeToLock(Landroid/content/ComponentName;)J

    move-result-wide v0

    .line 627
    .local v0, "adminTimeout":J
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "screen_off_timeout"

    invoke-static {v8, v9, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-long v4, v8

    .line 629
    .local v4, "displayTimeout":J
    cmp-long v8, v0, v6

    if-lez v8, :cond_0

    .line 633
    sub-long v8, v0, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/androie/settings/SecuritySettings;->disableUnusableTimeouts(J)V

    .line 635
    :cond_0
    return-void

    .end local v0    # "adminTimeout":J
    .end local v4    # "displayTimeout":J
    :cond_1
    move-wide v0, v6

    .line 626
    goto :goto_0
.end method

.method private showVerifierSetting()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 550
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "verifier_setting_visible"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateBlacklistSummary()V
    .locals 2

    .prologue
    .line 872
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mBlacklist:Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 873
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/util/BlacklistUtils;->isBlacklistEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 874
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mBlacklist:Landroid/preference/PreferenceScreen;

    const v1, 0x7f0802e8

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    .line 879
    :cond_0
    :goto_0
    return-void

    .line 876
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mBlacklist:Landroid/preference/PreferenceScreen;

    const v1, 0x7f0802e7

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    goto :goto_0
.end method

.method private updateLockAfterPreferenceSummary()V
    .locals 13

    .prologue
    .line 639
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "lock_screen_lock_after_timeout"

    const-wide/16 v10, 0x1388

    invoke-static {v8, v9, v10, v11}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 641
    .local v1, "currentTimeout":J
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 642
    .local v3, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 643
    .local v7, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 644
    .local v0, "best":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v7

    if-ge v4, v8, :cond_1

    .line 645
    aget-object v8, v7, v4

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 646
    .local v5, "timeout":J
    cmp-long v8, v1, v5

    if-ltz v8, :cond_0

    .line 647
    move v0, v4

    .line 644
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 650
    .end local v5    # "timeout":J
    :cond_1
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    const v9, 0x7f080480

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v12, v3, v0

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v10}, Lcom/androie/settings/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 651
    return-void
.end method

.method private updateSlideAfterScreenOffSummary()V
    .locals 11

    .prologue
    .line 606
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "screen_lock_slide_screenoff_delay"

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    int-to-long v1, v8

    .line 608
    .local v1, "currentTimeout":J
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 609
    .local v3, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 610
    .local v7, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 611
    .local v0, "best":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v7

    if-ge v4, v8, :cond_1

    .line 612
    aget-object v8, v7, v4

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 613
    .local v5, "timeout":J
    cmp-long v8, v1, v5

    if-ltz v8, :cond_0

    .line 614
    move v0, v4

    .line 611
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 617
    .end local v5    # "timeout":J
    :cond_1
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    aget-object v9, v3, v0

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 618
    return-void
.end method

.method private updateSlideAfterTimeoutSummary()V
    .locals 11

    .prologue
    .line 585
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "screen_lock_slide_timeout_delay"

    const/16 v10, 0x1388

    invoke-static {v8, v9, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    int-to-long v1, v8

    .line 587
    .local v1, "currentTimeout":J
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 588
    .local v3, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 589
    .local v7, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 590
    .local v0, "best":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v7

    if-ge v4, v8, :cond_1

    .line 591
    aget-object v8, v7, v4

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 592
    .local v5, "timeout":J
    cmp-long v8, v1, v5

    if-ltz v8, :cond_0

    .line 593
    move v0, v4

    .line 590
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 596
    .end local v5    # "timeout":J
    :cond_1
    iget-object v8, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    aget-object v9, v3, v0

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 597
    return-void
.end method

.method private updateSmsSecuritySummary(I)V
    .locals 5
    .param p1, "i"    # I

    .prologue
    .line 600
    const v1, 0x7f080257

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/androie/settings/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 601
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 602
    return-void
.end method

.method private warnAppInstallation()V
    .locals 3

    .prologue
    .line 556
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0806c9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080753

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040013

    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040009

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    .line 563
    return-void
.end method


# virtual methods
.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 862
    const v0, 0x7f080a6d

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 812
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 813
    const/16 v1, 0x7c

    if-ne p1, v1, :cond_0

    if-ne p2, v2, :cond_0

    .line 815
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->startBiometricWeakImprove()V

    .line 827
    :goto_0
    return-void

    .line 817
    :cond_0
    const/16 v1, 0x7d

    if-ne p1, v1, :cond_1

    if-ne p2, v2, :cond_1

    .line 819
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {v1}, Lcom/androie/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    .line 820
    .local v0, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    goto :goto_0

    .line 826
    .end local v0    # "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x1

    .line 567
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 568
    invoke-direct {p0, v1}, Lcom/androie/settings/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    .line 569
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    .line 570
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 573
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 142
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 144
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/androie/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 146
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/SecuritySettings;->mPM:Landroid/content/pm/PackageManager;

    .line 147
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Lcom/androie/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    iput-object v0, p0, Lcom/androie/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 149
    new-instance v0, Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/androie/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/androie/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

    .line 150
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 577
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 578
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-eqz v0, :cond_0

    .line 579
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    .line 581
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3

    .prologue
    .line 831
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_1

    .line 832
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 834
    :try_start_0
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "lock_screen_lock_after_timeout"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 839
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 840
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->checkPowerInstantLockDependency()V

    .line 857
    :cond_0
    :goto_1
    const/4 v0, 0x1

    return v0

    .line 836
    :catch_0
    move-exception v0

    .line 837
    const-string v1, "SecuritySettings"

    const-string v2, "could not persist lockAfter timeout setting"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 841
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockTimeoutDelay:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_2

    .line 842
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 843
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "screen_lock_slide_timeout_delay"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 845
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->updateSlideAfterTimeoutSummary()V

    goto :goto_1

    .line 846
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mSlideLockScreenOffDelay:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_3

    .line 847
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 848
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "screen_lock_slide_screenoff_delay"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 850
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->updateSlideAfterScreenOffSummary()V

    goto :goto_1

    .line 851
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/SecuritySettings;->mSmsSecurityCheck:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_0

    .line 852
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 853
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "sms_outgoing_check_max_count"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 855
    invoke-direct {p0, v0}, Lcom/androie/settings/SecuritySettings;->updateSmsSecuritySummary(I)V

    goto :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 735
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 737
    iget-object v3, p0, Lcom/androie/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {v3}, Lcom/androie/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v3

    .line 738
    const-string v4, "unlock_set_or_change"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 739
    const-string v0, "com.android.settings.ChooseLockGeneric$ChooseLockGenericFragment"

    const/16 v2, 0x7b

    invoke-virtual {p0, p0, v0, v2, v5}, Lcom/androie/settings/SecuritySettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    .line 800
    :cond_0
    :goto_0
    return v1

    .line 741
    :cond_1
    const-string v4, "biometric_weak_improve_matching"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 742
    new-instance v0, Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lcom/androie/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 744
    const/16 v2, 0x7c

    invoke-virtual {v0, v2, v5, v5}, Lcom/androie/settings/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 750
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->startBiometricWeakImprove()V

    goto :goto_0

    .line 752
    :cond_2
    const-string v4, "biometric_weak_liveliness"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 753
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 754
    invoke-virtual {v3, v1}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    goto :goto_0

    .line 759
    :cond_3
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 760
    new-instance v2, Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v2, v4, p0}, Lcom/androie/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 762
    const/16 v4, 0x7d

    invoke-virtual {v2, v4, v5, v5}, Lcom/androie/settings/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 768
    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    .line 769
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 772
    :cond_4
    const-string v4, "lockenabled"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 773
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setLockPatternEnabled(Z)V

    goto :goto_0

    .line 774
    :cond_5
    const-string v4, "visiblepattern"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 775
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setVisiblePatternEnabled(Z)V

    goto :goto_0

    .line 776
    :cond_6
    const-string v4, "visible_error_pattern"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 777
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setShowErrorPath(Z)V

    goto :goto_0

    .line 778
    :cond_7
    const-string v4, "visibledots"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 779
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setVisibleDotsEnabled(Z)V

    goto/16 :goto_0

    .line 780
    :cond_8
    const-string v4, "power_button_instantly_locks"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 781
    invoke-direct {p0, p2}, Lcom/androie/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/internal/widget/LockPatternUtils;->setPowerButtonInstantlyLocks(Z)V

    goto/16 :goto_0

    .line 782
    :cond_9
    iget-object v3, p0, Lcom/androie/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_b

    .line 783
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "show_password"

    iget-object v4, p0, Lcom/androie/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_a

    move v0, v1

    :cond_a
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 785
    :cond_b
    iget-object v3, p0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    if-ne p2, v3, :cond_d

    .line 786
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 787
    iget-object v2, p0, Lcom/androie/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 788
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->warnAppInstallation()V

    goto/16 :goto_0

    .line 790
    :cond_c
    invoke-direct {p0, v0}, Lcom/androie/settings/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    goto/16 :goto_0

    .line 792
    :cond_d
    const-string v3, "toggle_verify_applications"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 793
    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "package_verifier_enable"

    iget-object v4, p0, Lcom/androie/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_e

    move v0, v1

    :cond_e
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 797
    :cond_f
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 696
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 700
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 702
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/androie/settings/ChooseLockSettingsHelper;

    invoke-virtual {v1}, Lcom/androie/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    .line 703
    .local v0, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_0

    .line 704
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakLivelinessEnabled()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 707
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_1

    .line 708
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isVisiblePatternEnabled()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 710
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_2

    .line 711
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisibleErrorPattern:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isShowErrorPath()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 713
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisibleDots:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_3

    .line 714
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mVisibleDots:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isVisibleDotsEnabled()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 716
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_4

    .line 717
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->getPowerButtonInstantlyLocks()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 720
    :cond_4
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_5

    .line 721
    iget-object v4, p0, Lcom/androie/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v5, "show_password"

    invoke-static {v1, v5, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_7

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 725
    :cond_5
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    if-eqz v1, :cond_6

    .line 726
    iget-object v1, p0, Lcom/androie/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    iget-object v4, p0, Lcom/androie/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v4}, Landroid/security/KeyStore;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8

    :goto_1
    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 730
    :cond_6
    invoke-direct {p0}, Lcom/androie/settings/SecuritySettings;->updateBlacklistSummary()V

    .line 731
    return-void

    :cond_7
    move v1, v3

    .line 721
    goto :goto_0

    :cond_8
    move v2, v3

    .line 726
    goto :goto_1
.end method

.method public startBiometricWeakImprove()V
    .locals 3

    .prologue
    .line 866
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 867
    const-string v1, "com.android.facelock"

    const-string v2, "com.android.facelock.AddToSetup"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 868
    invoke-virtual {p0, v0}, Lcom/androie/settings/SecuritySettings;->startActivity(Landroid/content/Intent;)V

    .line 869
    return-void
.end method
