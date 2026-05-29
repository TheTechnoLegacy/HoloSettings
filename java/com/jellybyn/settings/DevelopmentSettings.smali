.class public Lcom/jellybyn/settings/DevelopmentSettings;
.super Landroid/preference/PreferenceFragment;
.source "DevelopmentSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;,
        Lcom/jellybyn/settings/DevelopmentSettings$SystemPropPoker;
    }
.end annotation


# instance fields
.field private mAdbDialog:Landroid/app/Dialog;

.field private mAdbKeysDialog:Landroid/app/Dialog;

.field private final mAllPrefs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mAllowMockLocation:Landroid/preference/CheckBoxPreference;

.field private mAnimatorDurationScale:Landroid/preference/ListPreference;

.field private mAppProcessLimit:Landroid/preference/ListPreference;

.field private mBackupManager:Landroid/app/backup/IBackupManager;

.field private mBugreport:Landroid/preference/Preference;

.field private mBugreportInPower:Landroid/preference/CheckBoxPreference;

.field private mClearAdbKeys:Landroid/preference/Preference;

.field private mDebugApp:Ljava/lang/String;

.field private mDebugAppPref:Landroid/preference/Preference;

.field private mDebugLayout:Landroid/preference/CheckBoxPreference;

.field private mDialogClicked:Z

.field private mDisableOverlays:Landroid/preference/CheckBoxPreference;

.field private final mDisabledPrefs:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Landroid/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mDontPokeProperties:Z

.field private mDpm:Landroid/app/admin/DevicePolicyManager;

.field private mEnableAdb:Landroid/preference/CheckBoxPreference;

.field private mEnableDialog:Landroid/app/Dialog;

.field private mEnabledSwitch:Landroid/widget/Switch;

.field private mEnforceReadExternal:Landroid/preference/CheckBoxPreference;

.field private mExperimentalWebView:Landroid/preference/CheckBoxPreference;

.field private mForceHardwareUi:Landroid/preference/CheckBoxPreference;

.field private mForceMsaa:Landroid/preference/CheckBoxPreference;

.field private mHaveDebugSettings:Z

.field private mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

.field private mKeepScreenAlways:Landroid/preference/CheckBoxPreference;

.field private mKeepScreenOn:Landroid/preference/CheckBoxPreference;

.field private mLastEnabledState:Z

.field private mOpenGLTraces:Landroid/preference/ListPreference;

.field private mOverlayDisplayDevices:Landroid/preference/ListPreference;

.field private mPassword:Landroid/preference/PreferenceScreen;

.field private mPointerLocation:Landroid/preference/CheckBoxPreference;

.field private final mResetCbPrefs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/preference/CheckBoxPreference;",
            ">;"
        }
    .end annotation
.end field

.field private mShowAllANRs:Landroid/preference/CheckBoxPreference;

.field private mShowCpuUsage:Landroid/preference/CheckBoxPreference;

.field private mShowHwLayersUpdates:Landroid/preference/CheckBoxPreference;

.field private mShowHwOverdraw:Landroid/preference/CheckBoxPreference;

.field private mShowHwScreenUpdates:Landroid/preference/CheckBoxPreference;

.field private mShowNonRectClip:Landroid/preference/ListPreference;

.field private mShowScreenUpdates:Landroid/preference/CheckBoxPreference;

.field private mShowTouches:Landroid/preference/CheckBoxPreference;

.field private mStrictMode:Landroid/preference/CheckBoxPreference;

.field private mTrackFrameTime:Landroid/preference/ListPreference;

.field private mTransitionAnimationScale:Landroid/preference/ListPreference;

.field private mUnavailable:Z

.field private mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

.field private mWaitForDebugger:Landroid/preference/CheckBoxPreference;

.field private mWindowAnimationScale:Landroid/preference/ListPreference;

.field private mWindowManager:Landroid/view/IWindowManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 197
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    .line 198
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    .line 201
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisabledPrefs:Ljava/util/HashSet;

    .line 1304
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 77
    invoke-static {p0, p1, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->setPermissionEnforced(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/jellybyn/settings/DevelopmentSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/DevelopmentSettings;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAllOptions()V

    return-void
.end method

.method private addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;
    .locals 2
    .param p1, "prefKey"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 317
    .local v0, "pref":Landroid/preference/ListPreference;
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 319
    return-object v0
.end method

.method private static currentStrictModeActiveIndex()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 638
    const-string v1, "persist.sys.strictmode.visual"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 642
    :goto_0
    return v0

    .line 641
    :cond_0
    const-string v1, "persist.sys.strictmode.visual"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 642
    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private disableForUser(Landroid/preference/Preference;)V
    .locals 1
    .param p1, "pref"    # Landroid/preference/Preference;

    .prologue
    .line 323
    if-eqz p1, :cond_0

    .line 324
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 325
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisabledPrefs:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 327
    :cond_0
    return-void
.end method

.method private dismissDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1195
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 1196
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1197
    iput-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    .line 1199
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_1

    .line 1200
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1201
    iput-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    .line 1203
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    .line 1204
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1205
    iput-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    .line 1207
    :cond_2
    return-void
.end method

.method private enableVerifierSetting()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 589
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 590
    const-string v3, "adb_enabled"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-nez v3, :cond_1

    .line 605
    :cond_0
    :goto_0
    return v0

    .line 593
    :cond_1
    const-string v3, "package_verifier_enable"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    .line 596
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 597
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.PACKAGE_NEEDS_VERIFICATION"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 598
    const-string v4, "application/vnd.android.package-archive"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 599
    invoke-virtual {v3, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 600
    invoke-virtual {v2, v3, v0}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 601
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 605
    goto :goto_0
.end method

.method private findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 330
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 331
    .local v0, "pref":Landroid/preference/CheckBoxPreference;
    if-nez v0, :cond_0

    .line 332
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find preference with key = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 334
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    return-object v0
.end method

.method private static isPermissionEnforced(Ljava/lang/String;)Z
    .locals 3

    .prologue
    .line 1339
    :try_start_0
    invoke-static {}, Landroid/app/ActivityThread;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/content/pm/IPackageManager;->isPermissionEnforced(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    .line 1340
    :catch_0
    move-exception v0

    .line 1341
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Problem talking with PackageManager"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private removeHdcpOptionsForProduction()V
    .locals 3

    .prologue
    .line 377
    const-string v1, "user"

    sget-object v2, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 378
    const-string v1, "hdcp_checking"

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 379
    .local v0, "hdcpChecking":Landroid/preference/Preference;
    if-eqz v0, :cond_0

    .line 381
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 382
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 385
    .end local v0    # "hdcpChecking":Landroid/preference/Preference;
    :cond_0
    return-void
.end method

.method private resetDangerousOptions()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 486
    iput-boolean v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDontPokeProperties:Z

    .line 487
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 488
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 489
    .local v0, "cb":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 490
    invoke-virtual {v0, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 491
    invoke-virtual {p0, v4, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    .line 487
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 494
    .end local v0    # "cb":Landroid/preference/CheckBoxPreference;
    :cond_1
    invoke-static {}, Lcom/jellybyn/settings/DevelopmentSettings;->resetDebuggerOptions()V

    .line 495
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v5, v2, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    .line 496
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTransitionAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v3, v2, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    .line 497
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAnimatorDurationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v2, v3, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    .line 498
    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->writeOverlayDisplayDevicesOptions(Ljava/lang/Object;)V

    .line 499
    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAppProcessLimitOptions(Ljava/lang/Object;)V

    .line 500
    iput-boolean v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 501
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAllOptions()V

    .line 502
    iput-boolean v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDontPokeProperties:Z

    .line 503
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 504
    return-void
.end method

.method private static resetDebuggerOptions()V
    .locals 4

    .prologue
    .line 547
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/app/IActivityManager;->setDebugApp(Ljava/lang/String;ZZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 551
    :goto_0
    return-void

    .line 549
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static setPermissionEnforced(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 3

    .prologue
    .line 1349
    :try_start_0
    invoke-static {}, Landroid/app/ActivityThread;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v0

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-interface {v0, v1, p2}, Landroid/content/pm/IPackageManager;->setPermissionEnforced(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1354
    return-void

    .line 1351
    :catch_0
    move-exception v0

    .line 1352
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Problem talking with PackageManager"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private setPrefsEnabledState(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    .prologue
    .line 388
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 389
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/preference/Preference;

    .line 390
    .local v1, "pref":Landroid/preference/Preference;
    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisabledPrefs:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 388
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 390
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 392
    .end local v1    # "pref":Landroid/preference/Preference;
    :cond_1
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAllOptions()V

    .line 393
    return-void
.end method

.method private showVerifierSetting()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 609
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

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

.method private updateAllOptions()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 444
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 445
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 446
    .local v1, "cr":Landroid/content/ContentResolver;
    iput-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 447
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    const-string v2, "adb_enabled"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {p0, v5, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 449
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    const-string v2, "bugreport_in_power_menu"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    :goto_1
    invoke-virtual {p0, v5, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 451
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    const-string v2, "stay_on_while_plugged_in"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    :goto_2
    invoke-virtual {p0, v5, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 453
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenAlways:Landroid/preference/CheckBoxPreference;

    const-string v2, "stay_on_always"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_3

    move v2, v3

    :goto_3
    invoke-virtual {p0, v5, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 455
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnforceReadExternal:Landroid/preference/CheckBoxPreference;

    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v5}, Lcom/jellybyn/settings/DevelopmentSettings;->isPermissionEnforced(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {p0, v2, v5}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 456
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllowMockLocation:Landroid/preference/CheckBoxPreference;

    const-string v5, "mock_location"

    invoke-static {v1, v5, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    if-eqz v5, :cond_4

    :goto_4
    invoke-virtual {p0, v2, v3}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 458
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateHdcpValues()V

    .line 459
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updatePasswordSummary()V

    .line 460
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateDebuggerOptions()V

    .line 461
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateStrictModeVisualOptions()V

    .line 462
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updatePointerLocationOptions()V

    .line 463
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowTouchesOptions()V

    .line 464
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateFlingerOptions()V

    .line 465
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCpuUsageOptions()V

    .line 466
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateHardwareUiOptions()V

    .line 467
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateMsaaOptions()V

    .line 468
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateTrackFrameTimeOptions()V

    .line 469
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowNonRectClipOptions()V

    .line 470
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowHwScreenUpdatesOptions()V

    .line 471
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowHwLayersUpdatesOptions()V

    .line 472
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowHwOverdrawOptions()V

    .line 473
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateDebugLayoutOptions()V

    .line 474
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAnimationScaleOptions()V

    .line 475
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateOverlayDisplayDevicesOptions()V

    .line 476
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateOpenGLTracesOptions()V

    .line 477
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateImmediatelyDestroyActivitiesOptions()V

    .line 478
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAppProcessLimitOptions()V

    .line 479
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowAllANRsOptions()V

    .line 480
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateExperimentalWebViewOptions()V

    .line 481
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateVerifyAppsOverUsbOptions()V

    .line 482
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateBugreportOptions()V

    .line 483
    return-void

    :cond_0
    move v2, v4

    .line 447
    goto/16 :goto_0

    :cond_1
    move v2, v4

    .line 449
    goto/16 :goto_1

    :cond_2
    move v2, v4

    .line 451
    goto :goto_2

    :cond_3
    move v2, v4

    .line 453
    goto :goto_3

    :cond_4
    move v3, v4

    .line 456
    goto :goto_4
.end method

.method private updateAnimationScaleOptions()V
    .locals 2

    .prologue
    .line 903
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAnimationScaleValue(ILandroid/preference/ListPreference;)V

    .line 904
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTransitionAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAnimationScaleValue(ILandroid/preference/ListPreference;)V

    .line 905
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAnimatorDurationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAnimationScaleValue(ILandroid/preference/ListPreference;)V

    .line 906
    return-void
.end method

.method private updateAnimationScaleValue(ILandroid/preference/ListPreference;)V
    .locals 6
    .param p1, "which"    # I
    .param p2, "pref"    # Landroid/preference/ListPreference;

    .prologue
    .line 883
    :try_start_0
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowManager:Landroid/view/IWindowManager;

    invoke-interface {v4, p1}, Landroid/view/IWindowManager;->getAnimationScale(I)F

    move-result v1

    .line 884
    .local v1, "scale":F
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, v1, v4

    if-eqz v4, :cond_0

    .line 885
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 887
    :cond_0
    invoke-virtual {p2}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 888
    .local v3, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v3

    if-ge v0, v4, :cond_2

    .line 889
    aget-object v4, v3, v0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 890
    .local v2, "val":F
    cmpg-float v4, v1, v2

    if-gtz v4, :cond_1

    .line 891
    invoke-virtual {p2, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 892
    invoke-virtual {p2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v4

    aget-object v4, v4, v0

    invoke-virtual {p2, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 900
    .end local v0    # "i":I
    .end local v1    # "scale":F
    .end local v2    # "val":F
    .end local v3    # "values":[Ljava/lang/CharSequence;
    :goto_1
    return-void

    .line 888
    .restart local v0    # "i":I
    .restart local v1    # "scale":F
    .restart local v2    # "val":F
    .restart local v3    # "values":[Ljava/lang/CharSequence;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 896
    .end local v2    # "val":F
    :cond_2
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p2, v4}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 897
    invoke-virtual {p2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {p2, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 898
    .end local v0    # "i":I
    .end local v1    # "scale":F
    .end local v3    # "values":[Ljava/lang/CharSequence;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method private updateAppProcessLimitOptions()V
    .locals 7

    .prologue
    .line 968
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/app/IActivityManager;->getProcessLimit()I

    move-result v1

    .line 969
    .local v1, "limit":I
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    invoke-virtual {v4}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    .line 970
    .local v3, "values":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v3

    if-ge v0, v4, :cond_2

    .line 971
    aget-object v4, v3, v0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 972
    .local v2, "val":I
    if-lt v2, v1, :cond_1

    .line 973
    if-eqz v0, :cond_0

    .line 974
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 976
    :cond_0
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    invoke-virtual {v4, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 977
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    aget-object v5, v5, v0

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 985
    .end local v0    # "i":I
    .end local v1    # "limit":I
    .end local v2    # "val":I
    .end local v3    # "values":[Ljava/lang/CharSequence;
    :goto_1
    return-void

    .line 970
    .restart local v0    # "i":I
    .restart local v1    # "limit":I
    .restart local v2    # "val":I
    .restart local v3    # "values":[Ljava/lang/CharSequence;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 981
    .end local v2    # "val":I
    :cond_2
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 982
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 983
    .end local v0    # "i":I
    .end local v1    # "limit":I
    .end local v3    # "values":[Ljava/lang/CharSequence;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method private updateBugreportOptions()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 614
    const-string v4, "user"

    sget-object v5, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 615
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 616
    .local v1, "resolver":Landroid/content/ContentResolver;
    const-string v4, "adb_enabled"

    invoke-static {v1, v4, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_0

    move v0, v2

    .line 618
    .local v0, "adbEnabled":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 619
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreport:Landroid/preference/Preference;

    invoke-virtual {v3, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 620
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 630
    .end local v0    # "adbEnabled":Z
    .end local v1    # "resolver":Landroid/content/ContentResolver;
    :goto_1
    return-void

    .restart local v1    # "resolver":Landroid/content/ContentResolver;
    :cond_0
    move v0, v3

    .line 616
    goto :goto_0

    .line 622
    .restart local v0    # "adbEnabled":Z
    :cond_1
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreport:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 623
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 624
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 625
    const-string v2, "bugreport_in_power_menu"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    .line 628
    .end local v0    # "adbEnabled":Z
    .end local v1    # "resolver":Landroid/content/ContentResolver;
    :cond_2
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_1
.end method

.method private updateCpuUsageOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 851
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowCpuUsage:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "show_processes"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 853
    return-void
.end method

.method private updateDebugLayoutOptions()V
    .locals 3

    .prologue
    .line 840
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugLayout:Landroid/preference/CheckBoxPreference;

    const-string v1, "debug.layout"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 842
    return-void
.end method

.method private updateDebuggerOptions()V
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 554
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v7, "debug_app"

    invoke-static {v4, v7}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    .line 556
    iget-object v7, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v8, "wait_for_debugger"

    invoke-static {v4, v8, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_0

    move v4, v5

    :goto_0
    invoke-virtual {p0, v7, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 558
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 561
    :try_start_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v7, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    const/16 v8, 0x200

    invoke-virtual {v4, v7, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 563
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 564
    .local v2, "lab":Ljava/lang/CharSequence;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 568
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "lab":Ljava/lang/CharSequence;
    .local v3, "label":Ljava/lang/String;
    :goto_1
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugAppPref:Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0b0625

    new-array v9, v5, [Ljava/lang/Object;

    aput-object v3, v9, v6

    invoke-virtual {v7, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 569
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 570
    iput-boolean v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 575
    .end local v3    # "label":Ljava/lang/String;
    :goto_2
    return-void

    :cond_0
    move v4, v6

    .line 556
    goto :goto_0

    .line 564
    .restart local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "lab":Ljava/lang/CharSequence;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 565
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "lab":Ljava/lang/CharSequence;
    :catch_0
    move-exception v1

    .line 566
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    .restart local v3    # "label":Ljava/lang/String;
    goto :goto_1

    .line 572
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3    # "label":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugAppPref:Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v7, 0x7f0b0624

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 573
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_2
.end method

.method private updateExperimentalWebViewOptions()V
    .locals 3

    .prologue
    .line 1016
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    .line 1017
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    const-string v1, "persist.sys.webview.exp"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 1020
    :cond_0
    return-void
.end method

.method private updateFlingerOptions()V
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 680
    :try_start_0
    const-string v2, "SurfaceFlinger"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    .line 681
    if-eqz v2, :cond_0

    .line 682
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 683
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4

    .line 684
    const-string v5, "android.ui.ISurfaceComposer"

    invoke-virtual {v3, v5}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 685
    const/16 v5, 0x3f2

    const/4 v6, 0x0

    invoke-interface {v2, v5, v3, v4, v6}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 687
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    .line 689
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    .line 690
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 691
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowScreenUpdates:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    move v2, v0

    :goto_0
    invoke-virtual {p0, v5, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 693
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    .line 694
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 695
    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisableOverlays:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_2

    :goto_1
    invoke-virtual {p0, v5, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 696
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 697
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 701
    :cond_0
    :goto_2
    return-void

    :cond_1
    move v2, v1

    .line 691
    goto :goto_0

    :cond_2
    move v0, v1

    .line 695
    goto :goto_1

    .line 699
    :catch_0
    move-exception v0

    goto :goto_2
.end method

.method private updateHardwareUiOptions()V
    .locals 3

    .prologue
    .line 738
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceHardwareUi:Landroid/preference/CheckBoxPreference;

    const-string v1, "persist.sys.ui.hw"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 739
    return-void
.end method

.method private updateHdcpValues()V
    .locals 8

    .prologue
    .line 507
    const/4 v3, 0x1

    .line 508
    .local v3, "index":I
    const-string v6, "hdcp_checking"

    invoke-virtual {p0, v6}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 509
    .local v1, "hdcpChecking":Landroid/preference/ListPreference;
    if-eqz v1, :cond_1

    .line 510
    const-string v6, "persist.sys.hdcp_checking"

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 511
    .local v0, "currentValue":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070039

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    .line 512
    .local v5, "values":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f07003a

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 513
    .local v4, "summaries":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v5

    if-ge v2, v6, :cond_0

    .line 514
    aget-object v6, v5, v2

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 515
    move v3, v2

    .line 519
    :cond_0
    aget-object v6, v5, v3

    invoke-virtual {v1, v6}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 520
    aget-object v6, v4, v3

    invoke-virtual {v1, v6}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 521
    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 523
    .end local v0    # "currentValue":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v4    # "summaries":[Ljava/lang/String;
    .end local v5    # "values":[Ljava/lang/String;
    :cond_1
    return-void

    .line 513
    .restart local v0    # "currentValue":Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v4    # "summaries":[Ljava/lang/String;
    .restart local v5    # "values":[Ljava/lang/String;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private updateImmediatelyDestroyActivitiesOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 877
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "always_finish_activities"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 879
    return-void
.end method

.method private updateMsaaOptions()V
    .locals 3

    .prologue
    .line 747
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceMsaa:Landroid/preference/CheckBoxPreference;

    const-string v1, "debug.egl.force_msaa"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 748
    return-void
.end method

.method private updateOpenGLTracesOptions()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 943
    const-string v0, "debug.egl.trace"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 944
    if-nez v0, :cond_0

    .line 945
    const-string v0, ""

    .line 948
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    move v1, v2

    .line 949
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_2

    .line 950
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 951
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 952
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 958
    :goto_1
    return-void

    .line 949
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 956
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 957
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateOverlayDisplayDevicesOptions()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 918
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "overlay_display_devices"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 920
    if-nez v0, :cond_0

    .line 921
    const-string v0, ""

    .line 924
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    move v1, v2

    .line 925
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_2

    .line 926
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 927
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 928
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 934
    :goto_1
    return-void

    .line 925
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 932
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 933
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updatePasswordSummary()V
    .locals 2

    .prologue
    .line 527
    :try_start_0
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBackupManager:Landroid/app/backup/IBackupManager;

    invoke-interface {v0}, Landroid/app/backup/IBackupManager;->hasBackupPassword()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 528
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPassword:Landroid/preference/PreferenceScreen;

    const v1, 0x7f0b05bb

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    .line 535
    :goto_0
    return-void

    .line 530
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPassword:Landroid/preference/PreferenceScreen;

    const v1, 0x7f0b05ba

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setSummary(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 532
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private updatePointerLocationOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 663
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPointerLocation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "pointer_location"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 665
    return-void
.end method

.method private updateShowAllANRsOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 1003
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "anr_show_background"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 1005
    return-void
.end method

.method private updateShowHwLayersUpdatesOptions()V
    .locals 3

    .prologue
    .line 818
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwLayersUpdates:Landroid/preference/CheckBoxPreference;

    const-string v1, "debug.hwui.show_layers_updates"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 820
    return-void
.end method

.method private updateShowHwOverdrawOptions()V
    .locals 3

    .prologue
    .line 829
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwOverdraw:Landroid/preference/CheckBoxPreference;

    const-string v1, "debug.hwui.show_overdraw"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 831
    return-void
.end method

.method private updateShowHwScreenUpdatesOptions()V
    .locals 3

    .prologue
    .line 807
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwScreenUpdates:Landroid/preference/CheckBoxPreference;

    const-string v1, "debug.hwui.show_dirty_regions"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 809
    return-void
.end method

.method private updateShowNonRectClipOptions()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 781
    const-string v0, "debug.hwui.show_non_rect_clip"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 783
    if-nez v0, :cond_0

    .line 784
    const-string v0, "hide"

    .line 787
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    move v1, v2

    .line 788
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_2

    .line 789
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 790
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 791
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 797
    :goto_1
    return-void

    .line 788
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 795
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 796
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateShowTouchesOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 673
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowTouches:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "show_touches"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 675
    return-void
.end method

.method private updateStrictModeVisualOptions()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 654
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mStrictMode:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Lcom/jellybyn/settings/DevelopmentSettings;->currentStrictModeActiveIndex()I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 655
    return-void

    .line 654
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateTrackFrameTimeOptions()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 756
    const-string v0, "debug.hwui.profile"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 757
    if-nez v0, :cond_0

    .line 758
    const-string v0, ""

    .line 761
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    move v1, v2

    .line 762
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_2

    .line 763
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 764
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 765
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 771
    :goto_1
    return-void

    .line 762
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 769
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 770
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateVerifyAppsOverUsbOptions()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 578
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "verifier_verify_adb_installs"

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V

    .line 580
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->enableVerifierSetting()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 581
    return-void

    .line 578
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V
    .locals 2
    .param p1, "which"    # I
    .param p2, "pref"    # Landroid/preference/ListPreference;
    .param p3, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 910
    if-eqz p3, :cond_0

    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 911
    .local v0, "scale":F
    :goto_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowManager:Landroid/view/IWindowManager;

    invoke-interface {v1, p1, v0}, Landroid/view/IWindowManager;->setAnimationScale(IF)V

    .line 912
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAnimationScaleValue(ILandroid/preference/ListPreference;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 915
    .end local v0    # "scale":F
    :goto_1
    return-void

    .line 910
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0

    .line 913
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private writeAppProcessLimitOptions(Ljava/lang/Object;)V
    .locals 2
    .param p1, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 989
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 990
    .local v0, "limit":I
    :goto_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/app/IActivityManager;->setProcessLimit(I)V

    .line 991
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateAppProcessLimitOptions()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 994
    .end local v0    # "limit":I
    :goto_1
    return-void

    .line 989
    :cond_0
    const/4 v0, -0x1

    goto :goto_0

    .line 992
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private writeCpuUsageOptions()V
    .locals 4

    .prologue
    .line 856
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowCpuUsage:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    .line 857
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "show_processes"

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 859
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.LoadAverageService"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 861
    if-eqz v1, :cond_1

    .line 862
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 866
    :goto_1
    return-void

    .line 857
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 864
    :cond_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->stopService(Landroid/content/Intent;)Z

    goto :goto_1
.end method

.method private writeDebugLayoutOptions()V
    .locals 2

    .prologue
    .line 845
    const-string v1, "debug.layout"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugLayout:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 848
    return-void

    .line 845
    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method private writeDebuggerOptions()V
    .locals 4

    .prologue
    .line 539
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/app/IActivityManager;->setDebugApp(Ljava/lang/String;ZZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 543
    :goto_0
    return-void

    .line 541
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private writeDisableOverlaysOption()V
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 722
    :try_start_0
    const-string v1, "SurfaceFlinger"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 723
    if-eqz v1, :cond_1

    .line 724
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 725
    const-string v3, "android.ui.ISurfaceComposer"

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 726
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisableOverlays:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    .line 727
    :cond_0
    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 728
    const/16 v0, 0x3f0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v1, v0, v2, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 729
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 731
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateFlingerOptions()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 735
    :cond_1
    :goto_0
    return-void

    .line 733
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private writeExperimentalWebViewOptions()V
    .locals 2

    .prologue
    .line 1008
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    if-eqz v0, :cond_0

    .line 1009
    const-string v1, "persist.sys.webview.exp"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1011
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 1013
    :cond_0
    return-void

    .line 1009
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeHardwareUiOptions()V
    .locals 2

    .prologue
    .line 742
    const-string v1, "persist.sys.ui.hw"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceHardwareUi:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 744
    return-void

    .line 742
    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method private writeImmediatelyDestroyActivitiesOptions()V
    .locals 2

    .prologue
    .line 870
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->setAlwaysFinish(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 874
    :goto_0
    return-void

    .line 872
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private writeMsaaOptions()V
    .locals 2

    .prologue
    .line 751
    const-string v1, "debug.egl.force_msaa"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceMsaa:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 753
    return-void

    .line 751
    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method

.method private writeOpenGLTracesOptions(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 961
    const-string v1, "debug.egl.trace"

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 962
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 963
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateOpenGLTracesOptions()V

    .line 964
    return-void

    .line 961
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private writeOverlayDisplayDevicesOptions(Ljava/lang/Object;)V
    .locals 2
    .param p1, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 937
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "overlay_display_devices"

    check-cast p1, Ljava/lang/String;

    .end local p1    # "newValue":Ljava/lang/Object;
    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 939
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateOverlayDisplayDevicesOptions()V

    .line 940
    return-void
.end method

.method private writePointerLocationOptions()V
    .locals 3

    .prologue
    .line 658
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "pointer_location"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPointerLocation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 660
    return-void

    .line 658
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowAllANRsOptions()V
    .locals 3

    .prologue
    .line 997
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "anr_show_background"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1000
    return-void

    .line 997
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowHwLayersUpdatesOptions()V
    .locals 2

    .prologue
    .line 823
    const-string v1, "debug.hwui.show_layers_updates"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwLayersUpdates:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 825
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 826
    return-void

    .line 823
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowHwOverdrawOptions()V
    .locals 2

    .prologue
    .line 834
    const-string v1, "debug.hwui.show_overdraw"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwOverdraw:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 836
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 837
    return-void

    .line 834
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowHwScreenUpdatesOptions()V
    .locals 2

    .prologue
    .line 812
    const-string v1, "debug.hwui.show_dirty_regions"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwScreenUpdates:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 814
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 815
    return-void

    .line 812
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowNonRectClipOptions(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 800
    const-string v1, "debug.hwui.show_non_rect_clip"

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 803
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateShowNonRectClipOptions()V

    .line 804
    return-void

    .line 800
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private writeShowTouchesOptions()V
    .locals 3

    .prologue
    .line 668
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "show_touches"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowTouches:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 670
    return-void

    .line 668
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeShowUpdatesOption()V
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 705
    :try_start_0
    const-string v1, "SurfaceFlinger"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 706
    if-eqz v1, :cond_1

    .line 707
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 708
    const-string v3, "android.ui.ISurfaceComposer"

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 709
    iget-object v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowScreenUpdates:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    .line 710
    :cond_0
    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 711
    const/16 v0, 0x3ea

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v1, v0, v2, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 712
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 714
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateFlingerOptions()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 718
    :cond_1
    :goto_0
    return-void

    .line 716
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private writeStrictModeVisualOptions()V
    .locals 2

    .prologue
    .line 647
    :try_start_0
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowManager:Landroid/view/IWindowManager;

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mStrictMode:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/IWindowManager;->setStrictModeVisualIndicatorPreference(Ljava/lang/String;)V

    .line 651
    :goto_1
    return-void

    .line 647
    :cond_0
    const-string v0, ""
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 649
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private writeTrackFrameTimeOptions(Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 774
    const-string v1, "debug.hwui.profile"

    if-nez p1, :cond_0

    const-string v0, ""

    :goto_0
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 777
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateTrackFrameTimeOptions()V

    .line 778
    return-void

    .line 774
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private writeVerifyAppsOverUsbOptions()V
    .locals 3

    .prologue
    .line 584
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "verifier_verify_adb_installs"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 586
    return-void

    .line 584
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 341
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 343
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 344
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    .line 346
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 348
    .local v1, "padding":I
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v4, v4, v1, v4}, Landroid/widget/Switch;->setPaddingRelative(IIII)V

    .line 349
    iget-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mUnavailable:Z

    if-eqz v2, :cond_0

    .line 350
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v4}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 354
    :goto_0
    return-void

    .line 353
    :cond_0
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1051
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_1

    .line 1052
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 1053
    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugApp:Ljava/lang/String;

    .line 1054
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeDebuggerOptions()V

    .line 1055
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateDebuggerOptions()V

    .line 1060
    :cond_0
    :goto_0
    return-void

    .line 1058
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1024
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 1025
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    if-eq p2, v0, :cond_1

    .line 1026
    if-eqz p2, :cond_2

    .line 1027
    iput-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    .line 1028
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->dismissDialogs()V

    .line 1029
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b04d8

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0b04d7

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040013

    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040009

    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    .line 1037
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1047
    :cond_1
    :goto_0
    return-void

    .line 1039
    :cond_2
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->resetDangerousOptions()V

    .line 1040
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "development_settings_enabled"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1042
    iput-boolean p2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    .line 1043
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->setPrefsEnabledState(Z)V

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x1

    .line 1210
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    if-ne p1, v0, :cond_2

    .line 1211
    if-ne p2, v1, :cond_1

    .line 1212
    iput-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    .line 1213
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "adb_enabled"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1215
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 1216
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateVerifyAppsOverUsbOptions()V

    .line 1217
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateBugreportOptions()V

    .line 1244
    :cond_0
    :goto_0
    return-void

    .line 1220
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 1222
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    if-ne p1, v0, :cond_3

    .line 1223
    if-ne p2, v1, :cond_0

    .line 1225
    :try_start_0
    const-string v0, "usb"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1226
    invoke-static {v0}, Landroid/hardware/usb/IUsbManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/usb/IUsbManager;

    move-result-object v0

    .line 1227
    invoke-interface {v0}, Landroid/hardware/usb/IUsbManager;->clearUsbDebuggingKeys()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1228
    :catch_0
    move-exception v0

    .line 1229
    const-string v1, "DevelopmentSettings"

    const-string v2, "Unable to clear adb keys"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1232
    :cond_3
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    if-ne p1, v0, :cond_0

    .line 1233
    if-ne p2, v1, :cond_4

    .line 1234
    iput-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    .line 1235
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "development_settings_enabled"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1237
    iput-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    .line 1238
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/DevelopmentSettings;->setPrefsEnabledState(Z)V

    goto :goto_0

    .line 1241
    :cond_4
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 213
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 215
    const-string v4, "window"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowManager:Landroid/view/IWindowManager;

    .line 216
    const-string v4, "backup"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/app/backup/IBackupManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/backup/IBackupManager;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBackupManager:Landroid/app/backup/IBackupManager;

    .line 218
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string v5, "device_policy"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/admin/DevicePolicyManager;

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDpm:Landroid/app/admin/DevicePolicyManager;

    .line 220
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v4

    if-eqz v4, :cond_0

    .line 221
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mUnavailable:Z

    .line 222
    new-instance v4, Landroid/preference/PreferenceScreen;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Landroid/preference/PreferenceScreen;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->setPreferenceScreen(Landroid/preference/PreferenceScreen;)V

    .line 313
    :goto_0
    return-void

    .line 226
    :cond_0
    const v4, 0x7f05000c

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addPreferencesFromResource(I)V

    .line 228
    const-string v4, "enable_adb"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    .line 229
    const-string v4, "clear_adb_keys"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mClearAdbKeys:Landroid/preference/Preference;

    .line 230
    const-string v4, "ro.adb.secure"

    invoke-static {v4, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    .line 231
    const-string v4, "debug_debugging_category"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    .line 233
    .local v1, "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    if-eqz v1, :cond_1

    .line 234
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mClearAdbKeys:Landroid/preference/Preference;

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 238
    .end local v1    # "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    :cond_1
    const-string v4, "bugreport"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreport:Landroid/preference/Preference;

    .line 239
    const-string v4, "bugreport_in_power"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    .line 240
    const-string v4, "keep_screen_on"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    .line 241
    const-string v4, "keep_screen_always"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenAlways:Landroid/preference/CheckBoxPreference;

    .line 242
    const-string v4, "enforce_read_external"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnforceReadExternal:Landroid/preference/CheckBoxPreference;

    .line 243
    const-string v4, "allow_mock_location"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllowMockLocation:Landroid/preference/CheckBoxPreference;

    .line 244
    const-string v4, "local_backup_password"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceScreen;

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPassword:Landroid/preference/PreferenceScreen;

    .line 245
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPassword:Landroid/preference/PreferenceScreen;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v4

    sget-object v5, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {v4, v5}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 248
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->disableForUser(Landroid/preference/Preference;)V

    .line 249
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mClearAdbKeys:Landroid/preference/Preference;

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->disableForUser(Landroid/preference/Preference;)V

    .line 250
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPassword:Landroid/preference/PreferenceScreen;

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->disableForUser(Landroid/preference/Preference;)V

    .line 253
    :cond_2
    const-string v4, "debug_app"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugAppPref:Landroid/preference/Preference;

    .line 254
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugAppPref:Landroid/preference/Preference;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    const-string v4, "wait_for_debugger"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    .line 256
    const-string v4, "verify_apps_over_usb"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    .line 257
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->showVerifierSetting()Z

    move-result v4

    if-nez v4, :cond_3

    .line 258
    const-string v4, "debug_debugging_category"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    .line 260
    .restart local v1    # "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    if-eqz v1, :cond_6

    .line 261
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 266
    .end local v1    # "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    :cond_3
    :goto_1
    const-string v4, "strict_mode"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mStrictMode:Landroid/preference/CheckBoxPreference;

    .line 267
    const-string v4, "pointer_location"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPointerLocation:Landroid/preference/CheckBoxPreference;

    .line 268
    const-string v4, "show_touches"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowTouches:Landroid/preference/CheckBoxPreference;

    .line 269
    const-string v4, "show_screen_updates"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowScreenUpdates:Landroid/preference/CheckBoxPreference;

    .line 270
    const-string v4, "disable_overlays"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisableOverlays:Landroid/preference/CheckBoxPreference;

    .line 271
    const-string v4, "show_cpu_usage"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowCpuUsage:Landroid/preference/CheckBoxPreference;

    .line 272
    const-string v4, "force_hw_ui"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceHardwareUi:Landroid/preference/CheckBoxPreference;

    .line 273
    const-string v4, "force_msaa"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceMsaa:Landroid/preference/CheckBoxPreference;

    .line 274
    const-string v4, "track_frame_time"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    .line 275
    const-string v4, "show_non_rect_clip"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    .line 276
    const-string v4, "show_hw_screen_udpates"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwScreenUpdates:Landroid/preference/CheckBoxPreference;

    .line 277
    const-string v4, "show_hw_layers_udpates"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwLayersUpdates:Landroid/preference/CheckBoxPreference;

    .line 278
    const-string v4, "show_hw_overdraw"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwOverdraw:Landroid/preference/CheckBoxPreference;

    .line 279
    const-string v4, "debug_layout"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugLayout:Landroid/preference/CheckBoxPreference;

    .line 280
    const-string v4, "window_animation_scale"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowAnimationScale:Landroid/preference/ListPreference;

    .line 281
    const-string v4, "transition_animation_scale"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTransitionAnimationScale:Landroid/preference/ListPreference;

    .line 282
    const-string v4, "animator_duration_scale"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAnimatorDurationScale:Landroid/preference/ListPreference;

    .line 283
    const-string v4, "overlay_display_devices"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    .line 284
    const-string v4, "enable_opengl_traces"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    .line 286
    const-string v4, "immediately_destroy_activities"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    .line 288
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 290
    const-string v4, "app_process_limit"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->addListPreference(Ljava/lang/String;)Landroid/preference/ListPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    .line 292
    const-string v4, "show_all_anrs"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    .line 294
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mResetCbPrefs:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    invoke-static {}, Landroid/webkit/WebViewFactory;->isExperimentalWebViewAvailable()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 298
    const-string v4, "experimental_webview"

    invoke-direct {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findAndInitCheckboxPref(Ljava/lang/String;)Landroid/preference/CheckBoxPreference;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    .line 308
    :cond_4
    :goto_2
    const-string v4, "hdcp_checking"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 309
    .local v3, "hdcpChecking":Landroid/preference/Preference;
    if-eqz v3, :cond_5

    .line 310
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllPrefs:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    :cond_5
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->removeHdcpOptionsForProduction()V

    goto/16 :goto_0

    .line 263
    .end local v3    # "hdcpChecking":Landroid/preference/Preference;
    .restart local v1    # "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    :cond_6
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_1

    .line 300
    .end local v1    # "debugDebuggingCategory":Landroid/preference/PreferenceGroup;
    :cond_7
    const-string v4, "experimental_webview"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 301
    .local v2, "experimentalWebView":Landroid/preference/Preference;
    const-string v4, "debug_applications_category"

    invoke-virtual {p0, v4}, Lcom/jellybyn/settings/DevelopmentSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 303
    .local v0, "debugApplicationsCategory":Landroid/preference/PreferenceGroup;
    if-eqz v0, :cond_4

    .line 304
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_2
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 1263
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->dismissDialogs()V

    .line 1264
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    .line 1265
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1248
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    if-ne p1, v0, :cond_2

    .line 1249
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    if-nez v0, :cond_0

    .line 1250
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 1252
    :cond_0
    iput-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    .line 1259
    :cond_1
    :goto_0
    return-void

    .line 1253
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    if-ne p1, v0, :cond_1

    .line 1254
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    if-nez v0, :cond_3

    .line 1255
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 1257
    :cond_3
    iput-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableDialog:Landroid/app/Dialog;

    goto :goto_0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1161
    const-string v2, "hdcp_checking"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1162
    const-string v1, "persist.sys.hdcp_checking"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateHdcpValues()V

    .line 1164
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->pokeSystemProperties()V

    .line 1191
    :goto_0
    return v0

    .line 1166
    :cond_0
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowAnimationScale:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_1

    .line 1167
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWindowAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v1, v2, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    goto :goto_0

    .line 1169
    :cond_1
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTransitionAnimationScale:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_2

    .line 1170
    iget-object v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTransitionAnimationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v0, v1, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    goto :goto_0

    .line 1172
    :cond_2
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAnimatorDurationScale:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_3

    .line 1173
    const/4 v1, 0x2

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAnimatorDurationScale:Landroid/preference/ListPreference;

    invoke-direct {p0, v1, v2, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAnimationScaleOption(ILandroid/preference/ListPreference;Ljava/lang/Object;)V

    goto :goto_0

    .line 1175
    :cond_3
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOverlayDisplayDevices:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_4

    .line 1176
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeOverlayDisplayDevicesOptions(Ljava/lang/Object;)V

    goto :goto_0

    .line 1178
    :cond_4
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mOpenGLTraces:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_5

    .line 1179
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeOpenGLTracesOptions(Ljava/lang/Object;)V

    goto :goto_0

    .line 1181
    :cond_5
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mTrackFrameTime:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_6

    .line 1182
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeTrackFrameTimeOptions(Ljava/lang/Object;)V

    goto :goto_0

    .line 1184
    :cond_6
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowNonRectClip:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_7

    .line 1185
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowNonRectClipOptions(Ljava/lang/Object;)V

    goto :goto_0

    .line 1187
    :cond_7
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAppProcessLimit:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_8

    .line 1188
    invoke-direct {p0, p2}, Lcom/jellybyn/settings/DevelopmentSettings;->writeAppProcessLimitOptions(Ljava/lang/Object;)V

    goto :goto_0

    :cond_8
    move v0, v1

    .line 1191
    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1065
    invoke-static {}, Lcom/jellybyn/settings/Utils;->isMonkeyRunning()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1156
    :cond_0
    :goto_0
    return v1

    .line 1069
    :cond_1
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_4

    .line 1070
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnableAdb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1071
    iput-boolean v1, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDialogClicked:Z

    .line 1072
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->dismissDialogs()V

    .line 1073
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b04d5

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f0b04d4

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x1010355

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x1040013

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x1040009

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    .line 1080
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbDialog:Landroid/app/Dialog;

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto :goto_0

    .line 1082
    :cond_3
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "adb_enabled"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1084
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 1085
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 1086
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->updateBugreportOptions()V

    goto :goto_0

    .line 1088
    :cond_4
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mClearAdbKeys:Landroid/preference/Preference;

    if-ne p2, v2, :cond_6

    .line 1089
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->dismissDialogs()V

    .line 1090
    :cond_5
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b04d6

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x104000a

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAdbKeysDialog:Landroid/app/Dialog;

    goto/16 :goto_0

    .line 1095
    :cond_6
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_8

    .line 1096
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "bugreport_in_power_menu"

    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mBugreportInPower:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_7

    :goto_1
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_7
    move v0, v1

    goto :goto_1

    .line 1099
    :cond_8
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_a

    .line 1100
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "stay_on_while_plugged_in"

    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x3

    :goto_2
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_9
    move v0, v1

    goto :goto_2

    .line 1104
    :cond_a
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenAlways:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_c

    .line 1105
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "stay_on_always"

    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenAlways:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_b

    :goto_3
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_b
    move v0, v1

    goto :goto_3

    .line 1108
    :cond_c
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnforceReadExternal:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_e

    .line 1109
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnforceReadExternal:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1110
    invoke-static {p0}, Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;->show(Lcom/jellybyn/settings/DevelopmentSettings;)V

    goto/16 :goto_0

    .line 1112
    :cond_d
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v0, v2, v1}, Lcom/jellybyn/settings/DevelopmentSettings;->setPermissionEnforced(Landroid/content/Context;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1114
    :cond_e
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllowMockLocation:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_10

    .line 1115
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "mock_location"

    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mAllowMockLocation:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_f

    :goto_4
    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_f
    move v0, v1

    goto :goto_4

    .line 1118
    :cond_10
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugAppPref:Landroid/preference/Preference;

    if-ne p2, v0, :cond_11

    .line 1119
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/jellybyn/settings/AppPicker;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v2, 0x3e8

    invoke-virtual {p0, v0, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 1120
    :cond_11
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mWaitForDebugger:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_12

    .line 1121
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeDebuggerOptions()V

    goto/16 :goto_0

    .line 1122
    :cond_12
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mVerifyAppsOverUsb:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_13

    .line 1123
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeVerifyAppsOverUsbOptions()V

    goto/16 :goto_0

    .line 1124
    :cond_13
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mStrictMode:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_14

    .line 1125
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeStrictModeVisualOptions()V

    goto/16 :goto_0

    .line 1126
    :cond_14
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mPointerLocation:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_15

    .line 1127
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writePointerLocationOptions()V

    goto/16 :goto_0

    .line 1128
    :cond_15
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowTouches:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_16

    .line 1129
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowTouchesOptions()V

    goto/16 :goto_0

    .line 1130
    :cond_16
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowScreenUpdates:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_17

    .line 1131
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowUpdatesOption()V

    goto/16 :goto_0

    .line 1132
    :cond_17
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisableOverlays:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_18

    .line 1133
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeDisableOverlaysOption()V

    goto/16 :goto_0

    .line 1134
    :cond_18
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowCpuUsage:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_19

    .line 1135
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeCpuUsageOptions()V

    goto/16 :goto_0

    .line 1136
    :cond_19
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mImmediatelyDestroyActivities:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1a

    .line 1137
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeImmediatelyDestroyActivitiesOptions()V

    goto/16 :goto_0

    .line 1138
    :cond_1a
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowAllANRs:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1b

    .line 1139
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowAllANRsOptions()V

    goto/16 :goto_0

    .line 1140
    :cond_1b
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mExperimentalWebView:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1c

    .line 1141
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeExperimentalWebViewOptions()V

    goto/16 :goto_0

    .line 1142
    :cond_1c
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceHardwareUi:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1d

    .line 1143
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeHardwareUiOptions()V

    goto/16 :goto_0

    .line 1144
    :cond_1d
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mForceMsaa:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1e

    .line 1145
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeMsaaOptions()V

    goto/16 :goto_0

    .line 1146
    :cond_1e
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwScreenUpdates:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1f

    .line 1147
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowHwScreenUpdatesOptions()V

    goto/16 :goto_0

    .line 1148
    :cond_1f
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwLayersUpdates:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_20

    .line 1149
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowHwLayersUpdatesOptions()V

    goto/16 :goto_0

    .line 1150
    :cond_20
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mShowHwOverdraw:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_21

    .line 1151
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeShowHwOverdrawOptions()V

    goto/16 :goto_0

    .line 1152
    :cond_21
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDebugLayout:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_0

    .line 1153
    invoke-direct {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->writeDebugLayoutOptions()V

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 397
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 399
    iget-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mUnavailable:Z

    if-eqz v4, :cond_1

    .line 401
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x1020004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 402
    .local v1, "emptyView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 403
    if-eqz v1, :cond_0

    .line 404
    const v2, 0x7f0b04c8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 436
    .end local v1    # "emptyView":Landroid/widget/TextView;
    :cond_0
    :goto_0
    return-void

    .line 409
    :cond_1
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDpm:Landroid/app/admin/DevicePolicyManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/admin/DevicePolicyManager;->getMaximumTimeToLock(Landroid/content/ComponentName;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    .line 414
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisabledPrefs:Ljava/util/HashSet;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 419
    :goto_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 420
    .local v0, "cr":Landroid/content/ContentResolver;
    const-string v4, "development_settings_enabled"

    invoke-static {v0, v4, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_2

    move v2, v3

    :cond_2
    iput-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    .line 422
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    iget-boolean v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-virtual {v2, v4}, Landroid/widget/Switch;->setChecked(Z)V

    .line 423
    iget-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-direct {p0, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->setPrefsEnabledState(Z)V

    .line 425
    iget-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    if-nez v2, :cond_0

    .line 430
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v4, "development_settings_enabled"

    invoke-static {v2, v4, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 432
    iput-boolean v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    .line 433
    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    iget-boolean v3, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 434
    iget-boolean v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mLastEnabledState:Z

    invoke-direct {p0, v2}, Lcom/jellybyn/settings/DevelopmentSettings;->setPrefsEnabledState(Z)V

    goto :goto_0

    .line 416
    .end local v0    # "cr":Landroid/content/ContentResolver;
    :cond_3
    iget-object v4, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDisabledPrefs:Ljava/util/HashSet;

    iget-object v5, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mKeepScreenOn:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public onStart()V
    .locals 6

    .prologue
    const/16 v2, 0x10

    const/4 v5, -0x2

    .line 358
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onStart()V

    .line 359
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 360
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v2, v2}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 362
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mEnabledSwitch:Landroid/widget/Switch;

    new-instance v3, Landroid/app/ActionBar$LayoutParams;

    const v4, 0x800015

    invoke-direct {v3, v5, v5, v4}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 366
    return-void
.end method

.method public onStop()V
    .locals 4

    .prologue
    .line 370
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onStop()V

    .line 371
    invoke-virtual {p0}, Lcom/jellybyn/settings/DevelopmentSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 372
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-virtual {v1, v2, v3}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 373
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 374
    return-void
.end method

.method pokeSystemProperties()V
    .locals 2

    .prologue
    .line 1268
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mDontPokeProperties:Z

    if-nez v0, :cond_0

    .line 1270
    new-instance v0, Lcom/jellybyn/settings/DevelopmentSettings$SystemPropPoker;

    invoke-direct {v0}, Lcom/jellybyn/settings/DevelopmentSettings$SystemPropPoker;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/DevelopmentSettings$SystemPropPoker;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1272
    :cond_0
    return-void
.end method

.method updateCheckBox(Landroid/preference/CheckBoxPreference;Z)V
    .locals 1
    .param p1, "checkBox"    # Landroid/preference/CheckBoxPreference;
    .param p2, "value"    # Z

    .prologue
    .line 439
    invoke-virtual {p1, p2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 440
    iget-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    or-int/2addr v0, p2

    iput-boolean v0, p0, Lcom/jellybyn/settings/DevelopmentSettings;->mHaveDebugSettings:Z

    .line 441
    return-void
.end method
