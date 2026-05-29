.class public Lcom/jellybyn/settings/SecuritySettings;
.super Lcom/jellybyn/settings/SettingsPreferenceFragment;
.source "SecuritySettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

.field private mChooseLockSettingsHelper:Lcom/jellybyn/settings/ChooseLockSettingsHelper;

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

.field private mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

.field private mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

.field private mVisiblePattern:Landroid/preference/CheckBoxPreference;

.field private mWarnInstallApps:Landroid/content/DialogInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 24

    .prologue
    .line 122
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v10

    .line 123
    .local v10, "root":Landroid/preference/PreferenceScreen;
    if-eqz v10, :cond_0

    .line 124
    invoke-virtual {v10}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 126
    :cond_0
    const v18, 0x7f050019

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 127
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v10

    .line 130
    const/4 v9, 0x0

    .line 131
    .local v9, "resid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->isSecure()Z

    move-result v18

    if-nez v18, :cond_a

    .line 133
    const-string v18, "user"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/UserManager;

    .line 134
    .local v6, "mUm":Landroid/os/UserManager;
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/os/UserManager;->getUsers(Z)Ljava/util/List;

    move-result-object v17

    .line 135
    .local v17, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_8

    const/4 v12, 0x1

    .line 137
    .local v12, "singleUser":Z
    :goto_0
    if-eqz v12, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 138
    const v9, 0x7f05001d

    .line 160
    .end local v6    # "mUm":Landroid/os/UserManager;
    .end local v12    # "singleUser":Z
    .end local v17    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :goto_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/jellybyn/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 164
    const-string v18, "device_policy"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/admin/DevicePolicyManager;

    .line 167
    .local v5, "dpm":Landroid/app/admin/DevicePolicyManager;
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v18

    if-nez v18, :cond_c

    const/16 v18, 0x1

    :goto_2
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    .line 169
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v18, v0

    if-nez v18, :cond_1

    .line 171
    const-string v18, "owner_info_settings"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    .line 172
    .local v8, "ownerInfoPref":Landroid/preference/Preference;
    if-eqz v8, :cond_1

    .line 173
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/os/UserManager;->isLinkedUser()Z

    move-result v18

    if-eqz v18, :cond_d

    .line 174
    const v18, 0x7f0b011a

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/preference/Preference;->setTitle(I)V

    .line 181
    .end local v8    # "ownerInfoPref":Landroid/preference/Preference;
    :cond_1
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v18, v0

    if-eqz v18, :cond_2

    .line 182
    invoke-virtual {v5}, Landroid/app/admin/DevicePolicyManager;->getStorageEncryptionStatus()I

    move-result v18

    packed-switch v18, :pswitch_data_0

    .line 195
    :cond_2
    :goto_4
    :pswitch_0
    const-string v18, "lock_after_timeout"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/ListPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    move-object/from16 v18, v0

    if-eqz v18, :cond_3

    .line 197
    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->setupLockAfterPreference()V

    .line 198
    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 202
    :cond_3
    const-string v18, "biometric_weak_liveliness"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    .line 206
    const-string v18, "visiblepattern"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    .line 209
    const-string v18, "power_button_instantly_locks"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    .line 213
    const v18, 0x7f05001a

    move/from16 v0, v18

    if-ne v9, v0, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v18

    const/high16 v19, 0x10000

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_4

    .line 216
    const-string v18, "security_category"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v11

    check-cast v11, Landroid/preference/PreferenceGroup;

    .line 218
    .local v11, "securityCategory":Landroid/preference/PreferenceGroup;
    if-eqz v11, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    if-eqz v18, :cond_4

    .line 219
    const-string v18, "visiblepattern"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 224
    .end local v11    # "securityCategory":Landroid/preference/PreferenceGroup;
    :cond_4
    const v18, 0x7f05001e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 227
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v14

    .line 228
    .local v14, "tm":Landroid/telephony/TelephonyManager;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v18, v0

    if-eqz v18, :cond_5

    invoke-virtual {v14}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v18

    if-nez v18, :cond_e

    .line 229
    :cond_5
    const-string v18, "sim_lock"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 241
    :cond_6
    :goto_5
    const-string v18, "show_password"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    .line 244
    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v18

    const-string v19, "user"

    invoke-virtual/range {v18 .. v19}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/os/UserManager;

    .line 245
    .local v16, "um":Landroid/os/UserManager;
    const-string v18, "no_config_credentials"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_11

    .line 246
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    .line 247
    const-string v18, "credential_storage_type"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 249
    .local v3, "credentialStorageType":Landroid/preference/Preference;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/security/KeyStore;->isHardwareBacked()Z

    move-result v18

    if-eqz v18, :cond_10

    const v13, 0x7f0b059d

    .line 252
    .local v13, "storageSummaryRes":I
    :goto_6
    invoke-virtual {v3, v13}, Landroid/preference/Preference;->setSummary(I)V

    .line 254
    const-string v18, "reset_credentials"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    .line 260
    .end local v3    # "credentialStorageType":Landroid/preference/Preference;
    .end local v13    # "storageSummaryRes":I
    :goto_7
    const-string v18, "device_admin_category"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceGroup;

    .line 262
    .local v4, "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    const-string v18, "toggle_install_applications"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->isNonMarketAppsAllowed()Z

    move-result v19

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 270
    const-string v18, "toggle_verify_applications"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    check-cast v18, Landroid/preference/CheckBoxPreference;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    .line 271
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mIsPrimary:Z

    move/from16 v18, v0

    if-eqz v18, :cond_13

    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->showVerifierSetting()Z

    move-result v18

    if-eqz v18, :cond_13

    .line 272
    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->isVerifierInstalled()Z

    move-result v18

    if-eqz v18, :cond_12

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->isVerifyAppsEnabled()Z

    move-result v19

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 286
    :goto_8
    const-string v18, "manage_notification_access"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jellybyn/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v18, v0

    if-eqz v18, :cond_7

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mPM:Landroid/content/pm/PackageManager;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/jellybyn/settings/NotificationAccessSettings;->getListenersCount(Landroid/content/pm/PackageManager;)I

    move-result v15

    .line 289
    .local v15, "total":I
    if-nez v15, :cond_15

    .line 290
    if-eqz v4, :cond_7

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 306
    .end local v15    # "total":I
    :cond_7
    :goto_9
    return-object v10

    .line 135
    .end local v4    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    .end local v5    # "dpm":Landroid/app/admin/DevicePolicyManager;
    .end local v14    # "tm":Landroid/telephony/TelephonyManager;
    .end local v16    # "um":Landroid/os/UserManager;
    .restart local v6    # "mUm":Landroid/os/UserManager;
    .restart local v17    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_8
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 140
    .restart local v12    # "singleUser":Z
    :cond_9
    const v9, 0x7f05001b

    goto/16 :goto_1

    .line 142
    .end local v6    # "mUm":Landroid/os/UserManager;
    .end local v12    # "singleUser":Z
    .end local v17    # "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->usingBiometricWeak()Z

    move-result v18

    if-eqz v18, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakInstalled()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 144
    const v9, 0x7f05001a

    goto/16 :goto_1

    .line 146
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v18

    sparse-switch v18, :sswitch_data_0

    goto/16 :goto_1

    .line 148
    :sswitch_0
    const v9, 0x7f050020

    .line 149
    goto/16 :goto_1

    .line 151
    :sswitch_1
    const v9, 0x7f050022

    .line 152
    goto/16 :goto_1

    .line 156
    :sswitch_2
    const v9, 0x7f05001f

    goto/16 :goto_1

    .line 167
    .restart local v5    # "dpm":Landroid/app/admin/DevicePolicyManager;
    :cond_c
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 176
    .restart local v8    # "ownerInfoPref":Landroid/preference/Preference;
    :cond_d
    const v18, 0x7f0b0118

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/preference/Preference;->setTitle(I)V

    goto/16 :goto_3

    .line 185
    .end local v8    # "ownerInfoPref":Landroid/preference/Preference;
    :pswitch_1
    const v18, 0x7f05001c

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_4

    .line 189
    :pswitch_2
    const v18, 0x7f050023

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_4

    .line 232
    .restart local v14    # "tm":Landroid/telephony/TelephonyManager;
    :cond_e
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_f

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v18

    if-nez v18, :cond_6

    .line 236
    :cond_f
    const-string v18, "sim_lock"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v18

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_5

    .line 249
    .restart local v3    # "credentialStorageType":Landroid/preference/Preference;
    .restart local v16    # "um":Landroid/os/UserManager;
    :cond_10
    const v13, 0x7f0b059e

    goto/16 :goto_6

    .line 256
    .end local v3    # "credentialStorageType":Landroid/preference/Preference;
    :cond_11
    const-string v18, "credentials_management"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/SecuritySettings;->removePreference(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 275
    .restart local v4    # "deviceAdminCategory":Landroid/preference/PreferenceGroup;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_8

    .line 279
    :cond_13
    if-eqz v4, :cond_14

    .line 280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_8

    .line 282
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_8

    .line 294
    .restart local v15    # "total":I
    :cond_15
    invoke-direct/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getNumEnabledNotificationListeners()I

    move-result v7

    .line 295
    .local v7, "n":I
    if-nez v7, :cond_16

    .line 296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f0b016a

    invoke-virtual/range {v19 .. v20}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_9

    .line 299
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jellybyn/settings/SecuritySettings;->mNotificationAccess:Landroid/preference/Preference;

    move-object/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lcom/jellybyn/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v20, 0x7f0e0007

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v7, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_9

    .line 182
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 146
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
    .line 414
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 415
    .local v0, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 416
    .local v7, "values":[Ljava/lang/CharSequence;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v2, "revisedEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 418
    .local v3, "revisedValues":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v8, v7

    if-ge v1, v8, :cond_1

    .line 419
    aget-object v8, v7, v1

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 420
    .local v4, "timeout":J
    cmp-long v8, v4, p1

    if-gtz v8, :cond_0

    .line 421
    aget-object v8, v0, v1

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    aget-object v8, v7, v1

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 425
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

    .line 426
    :cond_2
    iget-object v9, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 428
    iget-object v9, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/CharSequence;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 430
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 431
    .local v6, "userPreference":I
    int-to-long v8, v6

    cmp-long v8, v8, p1

    if-gtz v8, :cond_3

    .line 432
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 439
    .end local v6    # "userPreference":I
    :cond_3
    iget-object v9, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_4

    const/4 v8, 0x1

    :goto_1
    invoke-virtual {v9, v8}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 440
    return-void

    .line 439
    :cond_4
    const/4 v8, 0x0

    goto :goto_1
.end method

.method private getNumEnabledNotificationListeners()I
    .locals 4

    .prologue
    .line 310
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "enabled_notification_listeners"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 312
    .local v1, "flat":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x0

    .line 314
    :goto_0
    return v2

    .line 313
    :cond_1
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 314
    .local v0, "components":[Ljava/lang/String;
    array-length v2, v0

    goto :goto_0
.end method

.method private isNonMarketAppsAllowed()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 318
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

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
    .line 539
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

    .line 338
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 339
    .local v0, "pm":Landroid/content/pm/PackageManager;
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.PACKAGE_NEEDS_VERIFICATION"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 340
    .local v2, "verification":Landroid/content/Intent;
    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 341
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 342
    invoke-virtual {v0, v2, v4}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 343
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

    .line 333
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

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
    .line 323
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    .line 324
    .local v0, "um":Landroid/os/UserManager;
    const-string v1, "no_install_unknown_sources"

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 330
    :goto_0
    return-void

    .line 328
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

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

    .line 382
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "lock_screen_lock_after_timeout"

    const-wide/16 v10, 0x1388

    invoke-static {v8, v9, v10, v11}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    .line 384
    .local v2, "currentTimeout":J
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 385
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 386
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/app/admin/DevicePolicyManager;->getMaximumTimeToLock(Landroid/content/ComponentName;)J

    move-result-wide v0

    .line 387
    .local v0, "adminTimeout":J
    :goto_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "screen_off_timeout"

    invoke-static {v8, v9, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-long v4, v8

    .line 389
    .local v4, "displayTimeout":J
    cmp-long v8, v0, v6

    if-lez v8, :cond_0

    .line 393
    sub-long v8, v0, v4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/jellybyn/settings/SecuritySettings;->disableUnusableTimeouts(J)V

    .line 395
    :cond_0
    return-void

    .end local v0    # "adminTimeout":J
    .end local v4    # "displayTimeout":J
    :cond_1
    move-wide v0, v6

    .line 386
    goto :goto_0
.end method

.method private showVerifierSetting()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 347
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

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

.method private updateLockAfterPreferenceSummary()V
    .locals 13

    .prologue
    .line 399
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "lock_screen_lock_after_timeout"

    const-wide/16 v10, 0x1388

    invoke-static {v8, v9, v10, v11}, Landroid/provider/Settings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 401
    .local v1, "currentTimeout":J
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 402
    .local v3, "entries":[Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    .line 403
    .local v7, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 404
    .local v0, "best":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v7

    if-ge v4, v8, :cond_1

    .line 405
    aget-object v8, v7, v4

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 406
    .local v5, "timeout":J
    cmp-long v8, v1, v5

    if-ltz v8, :cond_0

    .line 407
    move v0, v4

    .line 404
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 410
    .end local v5    # "timeout":J
    :cond_1
    iget-object v8, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    const v9, 0x7f0b0112

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aget-object v12, v3, v0

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v10}, Lcom/jellybyn/settings/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 411
    return-void
.end method

.method private warnAppInstallation()V
    .locals 3

    .prologue
    .line 353
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b035e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b03e9

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

    iput-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    .line 360
    return-void
.end method


# virtual methods
.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 581
    const v0, 0x7f0b0708

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 547
    invoke-super {p0, p1, p2, p3}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 548
    const/16 v1, 0x7c

    if-ne p1, v1, :cond_0

    if-ne p2, v2, :cond_0

    .line 550
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->startBiometricWeakImprove()V

    .line 562
    :goto_0
    return-void

    .line 552
    :cond_0
    const/16 v1, 0x7d

    if-ne p1, v1, :cond_1

    if-ne p2, v2, :cond_1

    .line 554
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {v1}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    .line 555
    .local v0, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    goto :goto_0

    .line 561
    .end local v0    # "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    :cond_1
    invoke-direct {p0}, Lcom/jellybyn/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x1

    .line 364
    iget-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 365
    invoke-direct {p0, v1}, Lcom/jellybyn/settings/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    .line 366
    iget-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 370
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 111
    invoke-super {p0, p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 113
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 115
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mPM:Landroid/content/pm/PackageManager;

    .line 116
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    iput-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 118
    new-instance v0, Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    .line 119
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 374
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 375
    iget-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/jellybyn/settings/SecuritySettings;->mWarnInstallApps:Landroid/content/DialogInterface;

    invoke-interface {v0}, Landroid/content/DialogInterface;->dismiss()V

    .line 378
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 566
    iget-object v2, p0, Lcom/jellybyn/settings/SecuritySettings;->mLockAfter:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_0

    .line 567
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 569
    .local v1, "timeout":I
    :try_start_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "lock_screen_lock_after_timeout"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 574
    :goto_0
    invoke-direct {p0}, Lcom/jellybyn/settings/SecuritySettings;->updateLockAfterPreferenceSummary()V

    .line 576
    .end local v1    # "timeout":I
    :cond_0
    const/4 v2, 0x1

    return v2

    .line 571
    .restart local v1    # "timeout":I
    :catch_0
    move-exception v0

    .line 572
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "SecuritySettings"

    const-string v3, "could not persist lockAfter timeout setting"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 8
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 474
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 476
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {v5}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v2

    .line 477
    .local v2, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    const-string v5, "unlock_set_or_change"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 478
    const-string v3, "com.jellybyn.settings.ChooseLockGeneric$ChooseLockGenericFragment"

    const/16 v5, 0x7b

    invoke-virtual {p0, p0, v3, v5, v6}, Lcom/jellybyn/settings/SecuritySettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;)Z

    .line 535
    :cond_0
    :goto_0
    return v4

    .line 480
    :cond_1
    const-string v5, "biometric_weak_improve_matching"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 481
    new-instance v0, Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3, p0}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 483
    .local v0, "helper":Lcom/jellybyn/settings/ChooseLockSettingsHelper;
    const/16 v3, 0x7c

    invoke-virtual {v0, v3, v6, v6}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 489
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->startBiometricWeakImprove()V

    goto :goto_0

    .line 491
    .end local v0    # "helper":Lcom/jellybyn/settings/ChooseLockSettingsHelper;
    :cond_2
    const-string v5, "biometric_weak_liveliness"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 492
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 493
    invoke-virtual {v2, v4}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    goto :goto_0

    .line 498
    :cond_3
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 499
    new-instance v0, Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v0, v5, p0}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 501
    .restart local v0    # "helper":Lcom/jellybyn/settings/ChooseLockSettingsHelper;
    const/16 v5, 0x7d

    invoke-virtual {v0, v5, v6, v6}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 507
    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->setBiometricWeakLivelinessEnabled(Z)V

    .line 508
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 511
    .end local v0    # "helper":Lcom/jellybyn/settings/ChooseLockSettingsHelper;
    :cond_4
    const-string v5, "lockenabled"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 512
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->setLockPatternEnabled(Z)V

    goto :goto_0

    .line 513
    :cond_5
    const-string v5, "visiblepattern"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 514
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->setVisiblePatternEnabled(Z)V

    goto :goto_0

    .line 515
    :cond_6
    const-string v5, "power_button_instantly_locks"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 516
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->setPowerButtonInstantlyLocks(Z)V

    goto :goto_0

    .line 517
    :cond_7
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    if-ne p2, v5, :cond_9

    .line 518
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "show_password"

    iget-object v7, p0, Lcom/jellybyn/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v7}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v7

    if-eqz v7, :cond_8

    move v3, v4

    :cond_8
    invoke-static {v5, v6, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 520
    :cond_9
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    if-ne p2, v5, :cond_b

    .line 521
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 522
    iget-object v5, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleAppInstallation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 523
    invoke-direct {p0}, Lcom/jellybyn/settings/SecuritySettings;->warnAppInstallation()V

    goto/16 :goto_0

    .line 525
    :cond_a
    invoke-direct {p0, v3}, Lcom/jellybyn/settings/SecuritySettings;->setNonMarketAppsAllowed(Z)V

    goto/16 :goto_0

    .line 527
    :cond_b
    const-string v5, "toggle_verify_applications"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 528
    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "package_verifier_enable"

    iget-object v7, p0, Lcom/jellybyn/settings/SecuritySettings;->mToggleVerifyApps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v7}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v7

    if-eqz v7, :cond_c

    move v3, v4

    :cond_c
    invoke-static {v5, v6, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 532
    :cond_d
    invoke-super {p0, p1, p2}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v4

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 444
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onResume()V

    .line 448
    invoke-direct {p0}, Lcom/jellybyn/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 450
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/jellybyn/settings/ChooseLockSettingsHelper;

    invoke-virtual {v1}, Lcom/jellybyn/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    .line 451
    .local v0, "lockPatternUtils":Lcom/android/internal/widget/LockPatternUtils;
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_0

    .line 452
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mBiometricWeakLiveliness:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakLivelinessEnabled()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 455
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_1

    .line 456
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isVisiblePatternEnabled()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 458
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_2

    .line 459
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mPowerButtonInstantlyLocks:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->getPowerButtonInstantlyLocks()Z

    move-result v4

    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 462
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_3

    .line 463
    iget-object v4, p0, Lcom/jellybyn/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v5, "show_password"

    invoke-static {v1, v5, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_5

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 467
    :cond_3
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    if-eqz v1, :cond_4

    .line 468
    iget-object v1, p0, Lcom/jellybyn/settings/SecuritySettings;->mResetCredentials:Landroid/preference/Preference;

    iget-object v4, p0, Lcom/jellybyn/settings/SecuritySettings;->mKeyStore:Landroid/security/KeyStore;

    invoke-virtual {v4}, Landroid/security/KeyStore;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    :goto_1
    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 470
    :cond_4
    return-void

    :cond_5
    move v1, v3

    .line 463
    goto :goto_0

    :cond_6
    move v2, v3

    .line 468
    goto :goto_1
.end method

.method public startBiometricWeakImprove()V
    .locals 3

    .prologue
    .line 585
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 586
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.android.facelock"

    const-string v2, "com.android.facelock.AddToSetup"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 587
    invoke-virtual {p0, v0}, Lcom/jellybyn/settings/SecuritySettings;->startActivity(Landroid/content/Intent;)V

    .line 588
    return-void
.end method
