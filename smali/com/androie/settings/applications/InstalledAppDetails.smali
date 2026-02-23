.class public Lcom/androie/settings/applications/InstalledAppDetails;
.super Landroid/app/Fragment;
.source "InstalledAppDetails.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Lcom/androie/settings/applications/ApplicationsState$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;,
        Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;,
        Lcom/androie/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;,
        Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;,
        Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;,
        Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;
    }
.end annotation


# instance fields
.field private mActivitiesButton:Landroid/widget/Button;

.field private mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

.field private mAppOps:Landroid/app/AppOpsManager;

.field private mAppSize:Landroid/widget/TextView;

.field private mAppVersion:Landroid/widget/TextView;

.field private mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

.field private mAskCompatibilityCB:Landroid/widget/CheckBox;

.field private mCacheSize:Landroid/widget/TextView;

.field private mCanBeOnSdCardChecker:Lcom/androie/settings/applications/CanBeOnSdCardChecker;

.field private mCanClearData:Z

.field private final mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

.field private mClearCacheButton:Landroid/widget/Button;

.field private mClearCacheObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;

.field private mClearDataButton:Landroid/widget/Button;

.field private mClearDataObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;

.field private mComputingStr:Ljava/lang/CharSequence;

.field private mDataSize:Landroid/widget/TextView;

.field private mDisableAfterUninstall:Z

.field private mDpm:Landroid/app/admin/DevicePolicyManager;

.field private mEnableCompatibilityCB:Landroid/widget/CheckBox;

.field private mExternalCodeSize:Landroid/widget/TextView;

.field private mExternalDataSize:Landroid/widget/TextView;

.field private mForceStopButton:Landroid/widget/Button;

.field private mHandler:Landroid/os/Handler;

.field private mHaveSizes:Z

.field private mInitialized:Z

.field private mInvalidSizeStr:Ljava/lang/CharSequence;

.field private mLastCacheSize:J

.field private mLastCodeSize:J

.field private mLastDataSize:J

.field private mLastExternalCodeSize:J

.field private mLastExternalDataSize:J

.field private mLastTotalSize:J

.field private mMoreControlButtons:Landroid/view/View;

.field private mMoveAppButton:Landroid/widget/Button;

.field private mMoveInProgress:Z

.field private mNotificationSwitch:Landroid/widget/CompoundButton;

.field private mPackageInfo:Landroid/content/pm/PackageInfo;

.field private mPackageMoveObserver:Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;

.field private mPm:Landroid/content/pm/PackageManager;

.field private mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

.field private mRootView:Landroid/view/View;

.field private mScreenCompatSection:Landroid/view/View;

.field private mSession:Lcom/androie/settings/applications/ApplicationsState$Session;

.field private mShowUninstalled:Z

.field private mSmsManager:Lcom/android/internal/telephony/ISms;

.field private mSpecialDisableButton:Landroid/widget/Button;

.field private mState:Lcom/androie/settings/applications/ApplicationsState;

.field private mTotalSize:Landroid/widget/TextView;

.field private mUninstallButton:Landroid/widget/Button;

.field private mUpdatedSysApp:Z

.field private mUsbManager:Landroid/hardware/usb/IUsbManager;

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const-wide/16 v1, -0x1

    .line 98
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 123
    iput-boolean v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 124
    iput-boolean v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanClearData:Z

    .line 152
    iput-boolean v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    .line 153
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 154
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastDataSize:J

    .line 155
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    .line 156
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    .line 157
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    .line 158
    iput-wide v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    .line 195
    new-instance v0, Lcom/androie/settings/applications/InstalledAppDetails$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/InstalledAppDetails$1;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mHandler:Landroid/os/Handler;

    .line 1277
    new-instance v0, Lcom/androie/settings/applications/InstalledAppDetails$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/InstalledAppDetails$2;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    .line 1308
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/applications/InstalledAppDetails;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Landroid/os/Message;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->processClearMsg(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/applications/InstalledAppDetails;)Lcom/androie/settings/applications/ApplicationsState$AppEntry;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/androie/settings/applications/InstalledAppDetails;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # I

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->getMoveErrMsg(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/androie/settings/applications/InstalledAppDetails;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->setNotificationsEnabled(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/androie/settings/applications/InstalledAppDetails;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->setPrivacyGuard(Z)V

    return-void
.end method

.method static synthetic access$1300(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/widget/CompoundButton;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/widget/CompoundButton;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/androie/settings/applications/InstalledAppDetails;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/content/pm/PackageManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/applications/InstalledAppDetails;)Lcom/androie/settings/applications/ApplicationsState;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/applications/InstalledAppDetails;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Landroid/os/Message;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->processMoveMsg(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$400(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/applications/InstalledAppDetails;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initiateClearUserData()V

    return-void
.end method

.method static synthetic access$600(Lcom/androie/settings/applications/InstalledAppDetails;Ljava/lang/String;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 98
    invoke-direct {p0, p1, p2, p3}, Lcom/androie/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$700(Lcom/androie/settings/applications/InstalledAppDetails;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 98
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    return-void
.end method

.method static synthetic access$800(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$900(Lcom/androie/settings/applications/InstalledAppDetails;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/androie/settings/applications/InstalledAppDetails;->forceStopPackage(Ljava/lang/String;)V

    return-void
.end method

.method private checkForceStop()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 1290
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1292
    invoke-direct {p0, v5}, Lcom/androie/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    .line 1306
    :goto_0
    return-void

    .line 1293
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x200000

    and-int/2addr v0, v1

    if-nez v0, :cond_1

    .line 1296
    invoke-direct {p0, v6}, Lcom/androie/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    goto :goto_0

    .line 1298
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.intent.action.QUERY_PACKAGE_RESTART"

    const-string v3, "package"

    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v3, v4, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1300
    const-string v0, "android.intent.extra.PACKAGES"

    new-array v3, v6, [Ljava/lang/String;

    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 1301
    const-string v0, "android.intent.extra.UID"

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1302
    const-string v0, "android.intent.extra.user_handle"

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v3

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1303
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    move-object v4, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/app/Activity;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method private forceStopPackage(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 1266
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1268
    invoke-virtual {v0, p1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 1269
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {v0, p1}, Lcom/androie/settings/applications/ApplicationsState;->invalidatePackage(Ljava/lang/String;)V

    .line 1270
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {v0, p1}, Lcom/androie/settings/applications/ApplicationsState;->getEntry(Ljava/lang/String;)Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    move-result-object v0

    .line 1271
    if-eqz v0, :cond_0

    .line 1272
    iput-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    .line 1274
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 1275
    return-void
.end method

.method private getMoveErrMsg(I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "errCode"    # I

    .prologue
    .line 268
    packed-switch p1, :pswitch_data_0

    .line 282
    const-string v0, ""

    :goto_0
    return-object v0

    .line 270
    :pswitch_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807a8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 272
    :pswitch_1
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807a9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 274
    :pswitch_2
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807aa

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 276
    :pswitch_3
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807ab

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 278
    :pswitch_4
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807ac

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 280
    :pswitch_5
    const-string v0, ""

    goto :goto_0

    .line 268
    nop

    :pswitch_data_0
    .packed-switch -0x6
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getPremiumSmsPermission(Ljava/lang/String;)I
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 1347
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    if-eqz v0, :cond_0

    .line 1348
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ISms;->getPremiumSmsPermission(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1353
    :goto_0
    return v0

    .line 1350
    :catch_0
    move-exception v0

    .line 1353
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getSizeStr(J)Ljava/lang/String;
    .locals 2
    .param p1, "size"    # J

    .prologue
    .line 243
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mInvalidSizeStr:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleDisableable(Landroid/widget/Button;)Z
    .locals 8
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 323
    const/4 v0, 0x0

    .line 328
    .local v0, "disableable":Z
    :try_start_0
    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const-string v6, "android"

    const/16 v7, 0x40

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 330
    .local v4, "sys":Landroid/content/pm/PackageInfo;
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 331
    .local v3, "intent":Landroid/content/Intent;
    const-string v5, "android.intent.category.HOME"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 332
    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 333
    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 334
    .local v2, "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->isThisASystemPackage()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 336
    :cond_1
    const v5, 0x7f08076b

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V

    .line 347
    .end local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "sys":Landroid/content/pm/PackageInfo;
    :goto_0
    return v0

    .line 337
    .restart local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v3    # "intent":Landroid/content/Intent;
    .restart local v4    # "sys":Landroid/content/pm/PackageInfo;
    :cond_2
    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-boolean v5, v5, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v5, :cond_3

    .line 338
    const v5, 0x7f08076b

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V

    .line 339
    const/4 v0, 0x1

    goto :goto_0

    .line 341
    :cond_3
    const v5, 0x7f08076c

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    const/4 v0, 0x1

    goto :goto_0

    .line 344
    .end local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "sys":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    .line 345
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "InstalledAppDetails"

    const-string v6, "Unable to get package info"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private initDataButtons()V
    .locals 4

    .prologue
    const v3, 0x7f08076d

    const/4 v2, 0x0

    .line 250
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x41

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    .line 255
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 256
    iput-boolean v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanClearData:Z

    .line 265
    :goto_0
    return-void

    .line 258
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 259
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v1, 0x7f08077f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 263
    :goto_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 261
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    goto :goto_1
.end method

.method private initMoveButton()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 286
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 287
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 310
    :goto_0
    return-void

    .line 290
    :cond_0
    const/4 v0, 0x0

    .line 291
    .local v0, "dataOnly":Z
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    if-eqz v4, :cond_1

    move v0, v2

    .line 292
    :goto_1
    const/4 v1, 0x1

    .line 293
    .local v1, "moveDisable":Z
    if-eqz v0, :cond_2

    .line 294
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0807a4

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 304
    :goto_2
    if-eqz v1, :cond_5

    .line 305
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .end local v1    # "moveDisable":Z
    :cond_1
    move v0, v3

    .line 291
    goto :goto_1

    .line 295
    .restart local v1    # "moveDisable":Z
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v5, 0x40000

    and-int/2addr v4, v5

    if-eqz v4, :cond_3

    .line 296
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0807a5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 298
    const/4 v1, 0x0

    goto :goto_2

    .line 300
    :cond_3
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0807a6

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 301
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/androie/settings/applications/CanBeOnSdCardChecker;

    invoke-virtual {v4}, Lcom/androie/settings/applications/CanBeOnSdCardChecker;->init()V

    .line 302
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/androie/settings/applications/CanBeOnSdCardChecker;

    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v4, v5}, Lcom/androie/settings/applications/CanBeOnSdCardChecker;->check(Landroid/content/pm/ApplicationInfo;)Z

    move-result v4

    if-nez v4, :cond_4

    move v1, v2

    :goto_3
    goto :goto_2

    :cond_4
    move v1, v3

    goto :goto_3

    .line 307
    :cond_5
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 308
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private initNotificationButton()V
    .locals 4

    .prologue
    .line 389
    const-string v2, "notification"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v1

    .line 391
    .local v1, "nm":Landroid/app/INotificationManager;
    const/4 v0, 0x1

    .line 393
    .local v0, "enabled":Z
    :try_start_0
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-interface {v1, v2, v3}, Landroid/app/INotificationManager;->areNotificationsEnabledForPackage(Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 398
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 399
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->isThisASystemPackage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 400
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 405
    :goto_1
    return-void

    .line 402
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 403
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_1

    .line 395
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private initPrivacyGuardButton()V
    .locals 4

    .prologue
    .line 408
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    if-nez v1, :cond_0

    .line 416
    :goto_0
    return-void

    .line 411
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "appops"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AppOpsManager;

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppOps:Landroid/app/AppOpsManager;

    .line 412
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppOps:Landroid/app/AppOpsManager;

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/app/AppOpsManager;->getPrivacyGuardSettingForPackage(ILjava/lang/String;)Z

    move-result v0

    .line 414
    .local v0, "isEnabled":Z
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 415
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v1, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0
.end method

.method private initUninstallButtons()V
    .locals 6

    .prologue
    const v5, 0x7f080768

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 351
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    .line 352
    const/4 v0, 0x1

    .line 353
    .local v0, "enabled":Z
    iget-boolean v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v2, :cond_5

    .line 354
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    const v5, 0x7f08076e

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    .line 355
    const/4 v1, 0x0

    .line 356
    .local v1, "specialDisable":Z
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 357
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-direct {p0, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->handleDisableable(Landroid/widget/Button;)Z

    move-result v1

    .line 358
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 360
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    if-eqz v1, :cond_4

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 378
    .end local v1    # "specialDisable":Z
    :goto_2
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 379
    const/4 v0, 0x0

    .line 381
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 382
    if-eqz v0, :cond_2

    .line 384
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 386
    :cond_2
    return-void

    .end local v0    # "enabled":Z
    :cond_3
    move v2, v3

    .line 351
    goto :goto_0

    .restart local v0    # "enabled":Z
    .restart local v1    # "specialDisable":Z
    :cond_4
    move v3, v4

    .line 360
    goto :goto_1

    .line 362
    .end local v1    # "specialDisable":Z
    :cond_5
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 363
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_6

    .line 364
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-direct {p0, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->handleDisableable(Landroid/widget/Button;)Z

    move-result v0

    goto :goto_2

    .line 365
    :cond_6
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x800000

    and-int/2addr v2, v3

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_7

    .line 370
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    .line 371
    const/4 v0, 0x0

    goto :goto_2

    .line 373
    :cond_7
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    goto :goto_2
.end method

.method private initiateClearUserData()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1037
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1039
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1040
    const-string v0, "InstalledAppDetails"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Clearing user data for package : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1041
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    if-nez v0, :cond_0

    .line 1042
    new-instance v0, Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    .line 1044
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v2, "activity"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1046
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    invoke-virtual {v0, v1, v2}, Landroid/app/ActivityManager;->clearApplicationUserData(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)Z

    move-result v0

    .line 1047
    if-nez v0, :cond_1

    .line 1049
    const-string v0, "InstalledAppDetails"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldnt clear application user data for package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1050
    const/4 v0, 0x4

    invoke-direct {p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    .line 1054
    :goto_0
    return-void

    .line 1052
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v1, 0x7f08078c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    goto :goto_0
.end method

.method private isThisASystemPackage()Z
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 314
    :try_start_0
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const-string v4, "android"

    const/16 v5, 0x40

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 315
    .local v1, "sys":Landroid/content/pm/PackageInfo;
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v3, :cond_0

    iget-object v3, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v4, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 318
    .end local v1    # "sys":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    return v2

    .line 317
    :catch_0
    move-exception v0

    .line 318
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method private processClearMsg(Landroid/os/Message;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 991
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 992
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 993
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v3, 0x7f08076d

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 994
    if-ne v0, v4, :cond_0

    .line 995
    const-string v0, "InstalledAppDetails"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cleared user data for package : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 996
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/ApplicationsState;->requestSize(Ljava/lang/String;)V

    .line 1000
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 1001
    return-void

    .line 998
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private processMoveMsg(Landroid/os/Message;)V
    .locals 4

    .prologue
    .line 1018
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 1019
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1021
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 1022
    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 1023
    const-string v0, "InstalledAppDetails"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Moved resources for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1025
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/ApplicationsState;->requestSize(Ljava/lang/String;)V

    .line 1029
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshUi()Z

    .line 1030
    return-void

    .line 1027
    :cond_0
    const/4 v1, 0x6

    invoke-direct {p0, v1, v0}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0
.end method

.method private refreshButtons()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1004
    iget-boolean v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    if-nez v0, :cond_0

    .line 1005
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initUninstallButtons()V

    .line 1006
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initDataButtons()V

    .line 1007
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initMoveButton()V

    .line 1008
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initNotificationButton()V

    .line 1015
    :goto_0
    return-void

    .line 1010
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v1, 0x7f0807a7

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 1011
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1012
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1013
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private refreshSizeInfo()V
    .locals 10

    .prologue
    .line 924
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->size:J

    const-wide/16 v8, -0x2

    cmp-long v6, v6, v8

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->size:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-nez v6, :cond_2

    .line 926
    :cond_0
    const-wide/16 v6, -0x1

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastDataSize:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 927
    iget-boolean v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    if-nez v6, :cond_1

    .line 928
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 929
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 930
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 931
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 933
    :cond_1
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 934
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 984
    :goto_0
    return-void

    .line 937
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    .line 938
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v2, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->codeSize:J

    .line 939
    .local v2, "codeSize":J
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v4, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->dataSize:J

    .line 940
    .local v4, "dataSize":J
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 941
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    add-long/2addr v2, v6

    .line 942
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v4, v6

    .line 953
    :cond_3
    :goto_1
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    cmp-long v6, v6, v2

    if-eqz v6, :cond_4

    .line 954
    iput-wide v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 955
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    invoke-direct {p0, v2, v3}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 957
    :cond_4
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastDataSize:J

    cmp-long v6, v6, v4

    if-eqz v6, :cond_5

    .line 958
    iput-wide v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastDataSize:J

    .line 959
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    invoke-direct {p0, v4, v5}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 961
    :cond_5
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->cacheSize:J

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalCacheSize:J

    add-long v0, v6, v8

    .line 962
    .local v0, "cacheSize":J
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    cmp-long v6, v6, v0

    if-eqz v6, :cond_6

    .line 963
    iput-wide v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    .line 964
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 966
    :cond_6
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->size:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_7

    .line 967
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->size:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    .line 968
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->size:J

    invoke-direct {p0, v7, v8}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 971
    :cond_7
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->dataSize:J

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_8

    iget-boolean v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanClearData:Z

    if-nez v6, :cond_b

    .line 972
    :cond_8
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 977
    :goto_2
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-gtz v6, :cond_c

    .line 978
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 944
    .end local v0    # "cacheSize":J
    :cond_9
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_a

    .line 945
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    .line 946
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    invoke-direct {p0, v7, v8}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 948
    :cond_a
    iget-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_3

    .line 949
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    iput-wide v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    .line 950
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    invoke-direct {p0, v7, v8}, Lcom/androie/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 974
    .restart local v0    # "cacheSize":J
    :cond_b
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 975
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    .line 980
    :cond_c
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 981
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0
.end method

.method private refreshUi()Z
    .locals 14

    .prologue
    const/4 v13, 0x3

    const/16 v12, 0x8

    const/4 v11, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 660
    iget-boolean v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    if-eqz v0, :cond_1

    .line 869
    :cond_0
    :goto_0
    return v4

    .line 663
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->retrieveAppEntry()Ljava/lang/String;

    move-result-object v6

    .line 665
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    if-nez v0, :cond_2

    move v4, v3

    .line 666
    goto :goto_0

    .line 669
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v0, :cond_3

    move v4, v3

    .line 670
    goto :goto_0

    .line 674
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 677
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 678
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v0, v5, v6}, Landroid/content/pm/PackageManager;->getPreferredActivities(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)I

    .line 683
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-interface {v0, v6, v1}, Landroid/hardware/usb/IUsbManager;->hasDefaults(Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    move v2, v0

    .line 687
    :goto_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->hasBindAppWidgetPermission(Ljava/lang/String;)Z

    move-result v7

    .line 690
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f0c00d5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 691
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v8, 0x7f0c00d6

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 692
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    move v5, v4

    .line 693
    :goto_2
    if-nez v5, :cond_7

    if-nez v7, :cond_7

    .line 694
    invoke-direct {p0, v0, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 733
    :goto_3
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 735
    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->getPackageScreenCompatMode(Ljava/lang/String;)I

    .line 746
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mScreenCompatSection:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 750
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f0c00db

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 751
    new-instance v5, Landroid/widget/AppSecurityPermissions;

    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v5, v1, v6}, Landroid/widget/AppSecurityPermissions;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 752
    invoke-direct {p0, v6}, Lcom/androie/settings/applications/InstalledAppDetails;->getPremiumSmsPermission(Ljava/lang/String;)I

    move-result v7

    .line 756
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionCount()I

    move-result v1

    if-gtz v1, :cond_5

    if-eqz v7, :cond_10

    .line 758
    :cond_5
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 763
    :goto_4
    const v1, 0x7f0c00dc

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 765
    const v2, 0x7f0c00dd

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 767
    if-eqz v7, :cond_11

    .line 769
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 770
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 771
    const v1, 0x7f0c00de

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 773
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v8, 0x7f0b0050

    const v9, 0x1090008

    invoke-static {v2, v8, v9}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v2

    .line 776
    const v8, 0x1090009

    invoke-virtual {v2, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 777
    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 779
    add-int/lit8 v2, v7, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 780
    new-instance v2, Lcom/androie/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;

    iget-object v7, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    invoke-direct {v2, v6, v7}, Lcom/androie/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;-><init>(Ljava/lang/String;Lcom/android/internal/telephony/ISms;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 788
    :goto_5
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionCount()I

    move-result v1

    if-lez v1, :cond_14

    .line 790
    const v1, 0x7f0c00e0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 792
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 793
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionsViewWithRevokeButtons()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 796
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v1

    .line 797
    if-eqz v1, :cond_14

    array-length v0, v1

    if-le v0, v4, :cond_14

    .line 798
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move v0, v3

    .line 799
    :goto_6
    array-length v2, v1

    if-ge v0, v2, :cond_13

    .line 800
    aget-object v2, v1, v0

    .line 801
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 799
    :goto_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 684
    :catch_0
    move-exception v0

    .line 685
    const-string v1, "InstalledAppDetails"

    const-string v2, "mUsbManager.hasDefaults"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v2, v3

    goto/16 :goto_1

    :cond_6
    move v5, v3

    .line 692
    goto/16 :goto_2

    .line 696
    :cond_7
    if-eqz v7, :cond_c

    if-eqz v5, :cond_c

    move v2, v4

    .line 698
    :goto_8
    if-eqz v7, :cond_d

    .line 699
    const v8, 0x7f08075b

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(I)V

    .line 704
    :goto_9
    const/4 v0, 0x0

    .line 705
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07001d

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    .line 707
    if-eqz v5, :cond_9

    .line 708
    const v5, 0x7f08076f

    invoke-virtual {p0, v5}, Lcom/androie/settings/applications/InstalledAppDetails;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 709
    new-instance v9, Landroid/text/SpannableString;

    invoke-direct {v9, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 710
    if-eqz v2, :cond_8

    .line 711
    new-instance v10, Landroid/text/style/BulletSpan;

    invoke-direct {v10, v8}, Landroid/text/style/BulletSpan;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v9, v10, v3, v5, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 713
    :cond_8
    if-nez v0, :cond_e

    new-array v0, v11, [Ljava/lang/CharSequence;

    aput-object v9, v0, v3

    const-string v5, "\n"

    aput-object v5, v0, v4

    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 716
    :cond_9
    :goto_a
    if-eqz v7, :cond_b

    .line 717
    const v5, 0x7f080770

    invoke-virtual {p0, v5}, Lcom/androie/settings/applications/InstalledAppDetails;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 719
    new-instance v7, Landroid/text/SpannableString;

    invoke-direct {v7, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 720
    if-eqz v2, :cond_a

    .line 721
    new-instance v2, Landroid/text/style/BulletSpan;

    invoke-direct {v2, v8}, Landroid/text/style/BulletSpan;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v7, v2, v3, v5, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 724
    :cond_a
    if-nez v0, :cond_f

    new-array v0, v11, [Ljava/lang/CharSequence;

    aput-object v7, v0, v3

    const-string v2, "\n"

    aput-object v2, v0, v4

    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 727
    :cond_b
    :goto_b
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 728
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 729
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_3

    :cond_c
    move v2, v3

    .line 696
    goto :goto_8

    .line 701
    :cond_d
    const v8, 0x7f08075a

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(I)V

    goto :goto_9

    .line 713
    :cond_e
    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/CharSequence;

    aput-object v0, v5, v3

    const-string v0, "\n"

    aput-object v0, v5, v4

    aput-object v9, v5, v11

    const-string v0, "\n"

    aput-object v0, v5, v13

    invoke-static {v5}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_a

    .line 724
    :cond_f
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/CharSequence;

    aput-object v0, v2, v3

    const-string v0, "\n"

    aput-object v0, v2, v4

    aput-object v7, v2, v11

    const-string v0, "\n"

    aput-object v0, v2, v13

    invoke-static {v2}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_b

    .line 760
    :cond_10
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_4

    .line 784
    :cond_11
    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 785
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_5

    .line 805
    :cond_12
    :try_start_1
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const/4 v7, 0x0

    invoke-virtual {v6, v2, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 806
    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v6}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_7

    .line 807
    :catch_1
    move-exception v2

    goto/16 :goto_7

    .line 810
    :cond_13
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 811
    if-lez v6, :cond_14

    .line 812
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 814
    if-ne v6, v4, :cond_17

    .line 815
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 828
    :goto_c
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v2, 0x7f0c00df

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 830
    const v2, 0x7f080799

    new-array v5, v11, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v8, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v6, v8}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v1, v5, v4

    invoke-virtual {v7, v2, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 836
    :cond_14
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 837
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {p0, v0}, Lcom/androie/settings/applications/InstalledAppDetails;->setAppLabelAndIcon(Landroid/content/pm/PackageInfo;)V

    .line 838
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshButtons()V

    .line 839
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshSizeInfo()V

    .line 841
    iget-boolean v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mInitialized:Z

    if-nez v0, :cond_1b

    .line 843
    iput-boolean v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mInitialized:Z

    .line 844
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x800000

    and-int/2addr v0, v1

    if-nez v0, :cond_15

    move v3, v4

    :cond_15
    iput-boolean v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mShowUninstalled:Z

    .line 865
    :cond_16
    iget-boolean v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    if-nez v0, :cond_0

    .line 866
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->initPrivacyGuardButton()V

    goto/16 :goto_0

    .line 816
    :cond_17
    if-ne v6, v11, :cond_18

    .line 817
    const v0, 0x7f08079a

    new-array v1, v11, [Ljava/lang/Object;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v7, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_c

    .line 820
    :cond_18
    add-int/lit8 v0, v6, -0x2

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 821
    add-int/lit8 v0, v6, -0x3

    move-object v2, v1

    move v1, v0

    :goto_d
    if-ltz v1, :cond_1a

    .line 822
    if-nez v1, :cond_19

    const v0, 0x7f08079c

    :goto_e
    new-array v8, v11, [Ljava/lang/Object;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v8, v3

    aput-object v2, v8, v4

    invoke-virtual {v7, v0, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 821
    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_d

    .line 822
    :cond_19
    const v0, 0x7f08079d

    goto :goto_e

    .line 825
    :cond_1a
    const v0, 0x7f08079b

    new-array v1, v11, [Ljava/lang/Object;

    aput-object v2, v1, v3

    add-int/lit8 v2, v6, -0x1

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v7, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto/16 :goto_c

    .line 849
    :cond_1b
    :try_start_2
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v2, 0x2200

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 852
    iget-boolean v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mShowUninstalled:Z

    if-nez v1, :cond_16

    .line 856
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    const/high16 v1, 0x800000

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    move v4, v3

    goto/16 :goto_0

    .line 858
    :catch_2
    move-exception v0

    move v4, v3

    .line 859
    goto/16 :goto_0
.end method

.method private resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 2

    .prologue
    .line 909
    const v0, 0x7f08075a

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 910
    const v0, 0x7f080771

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 912
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 913
    return-void
.end method

.method private retrieveAppEntry()Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 631
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 632
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_1

    const-string v4, "package"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 633
    .local v3, "packageName":Ljava/lang/String;
    :goto_0
    if-nez v3, :cond_0

    .line 634
    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 636
    .local v2, "intent":Landroid/content/Intent;
    :goto_1
    if-eqz v2, :cond_0

    .line 637
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v3

    .line 640
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_0
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {v4, v3}, Lcom/androie/settings/applications/ApplicationsState;->getEntry(Ljava/lang/String;)Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    .line 641
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    if-eqz v4, :cond_3

    .line 644
    :try_start_0
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v6, 0x2240

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    :goto_2
    return-object v3

    .end local v3    # "packageName":Ljava/lang/String;
    :cond_1
    move-object v3, v5

    .line 632
    goto :goto_0

    .line 634
    .restart local v3    # "packageName":Ljava/lang/String;
    :cond_2
    const-string v4, "intent"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    move-object v2, v4

    goto :goto_1

    .line 648
    :catch_0
    move-exception v1

    .line 649
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "InstalledAppDetails"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception when retrieving package:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v6, v6, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 652
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_3
    const-string v4, "InstalledAppDetails"

    const-string v6, "Missing AppEntry; maybe reinstalling?"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    iput-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    goto :goto_2
.end method

.method private setAppLabelAndIcon(Landroid/content/pm/PackageInfo;)V
    .locals 10
    .param p1, "pkgInfo"    # Landroid/content/pm/PackageInfo;

    .prologue
    const/4 v9, 0x0

    .line 561
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v5, 0x7f0c000f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 562
    .local v0, "appSnippet":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v0, v9, v4, v9, v5}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 564
    const v4, 0x7f0c0016

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 565
    .local v1, "icon":Landroid/widget/ImageView;
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    invoke-virtual {v4, v5}, Lcom/androie/settings/applications/ApplicationsState;->ensureIcon(Lcom/androie/settings/applications/ApplicationsState$AppEntry;)V

    .line 566
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 568
    const v4, 0x7f0c0017

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 569
    .local v2, "label":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->label:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 571
    const v4, 0x7f0c00ff

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 572
    .local v3, "packageName":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 573
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 575
    const v4, 0x7f0c0100

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    .line 577
    if-eqz p1, :cond_0

    iget-object v4, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 578
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 579
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const v6, 0x7f0807a3

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 584
    :goto_0
    return-void

    .line 582
    :cond_0
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setIntentAndFinish(ZZ)V
    .locals 3

    .prologue
    .line 917
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 918
    const-string v0, "chg"

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 919
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 920
    const/4 v2, -0x1

    invoke-virtual {v0, p0, v2, v1}, Landroid/preference/PreferenceActivity;->finishPreferencePanel(Landroid/app/Fragment;ILandroid/content/Intent;)V

    .line 921
    return-void
.end method

.method private setNotificationsEnabled(Z)V
    .locals 6
    .param p1, "enabled"    # Z

    .prologue
    .line 1329
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1330
    .local v3, "packageName":Ljava/lang/String;
    const-string v4, "notification"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v2

    .line 1333
    .local v2, "nm":Landroid/app/INotificationManager;
    :try_start_0
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v4}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    .line 1334
    .local v0, "enable":Z
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-interface {v2, v3, v4, p1}, Landroid/app/INotificationManager;->setNotificationsEnabledForPackage(Ljava/lang/String;IZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1338
    .end local v0    # "enable":Z
    :goto_0
    return-void

    .line 1335
    :catch_0
    move-exception v1

    .line 1336
    .local v1, "ex":Landroid/os/RemoteException;
    iget-object v5, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    if-nez p1, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private setPrivacyGuard(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    .prologue
    .line 1341
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppOps:Landroid/app/AppOpsManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1}, Landroid/app/AppOpsManager;->setPrivacyGuardSettingForPackage(ILjava/lang/String;Z)V

    .line 1343
    return-void
.end method

.method private showDialogInner(II)V
    .locals 4

    .prologue
    .line 1057
    invoke-static {p1, p2}, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->newInstance(II)Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    move-result-object v0

    .line 1058
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/app/DialogFragment;->setTargetFragment(Landroid/app/Fragment;I)V

    .line 1059
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dialog "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 1060
    return-void
.end method

.method private uninstallPkg(Ljava/lang/String;ZZ)V
    .locals 3

    .prologue
    .line 1258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "package:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 1259
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.UNINSTALL_PACKAGE"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1260
    const-string v0, "android.intent.extra.UNINSTALL_ALL_USERS"

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1261
    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/androie/settings/applications/InstalledAppDetails;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1262
    iput-boolean p3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    .line 1263
    return-void
.end method

.method private updateForceStopButton(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 1285
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1286
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1287
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x1

    .line 537
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 538
    if-ne p1, v5, :cond_1

    .line 539
    iget-boolean v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    if-eqz v1, :cond_0

    .line 540
    iput-boolean v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    .line 542
    :try_start_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v3, 0x2200

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 545
    .local v0, "ainfo":Landroid/content/pm/ApplicationInfo;
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    .line 546
    new-instance v2, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v1, v3}, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;Landroid/content/pm/ApplicationInfo;I)V

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Object;

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 553
    .end local v0    # "ainfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshUi()Z

    move-result v1

    if-nez v1, :cond_1

    .line 554
    invoke-direct {p0, v5, v5}, Lcom/androie/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    .line 557
    :cond_1
    return-void

    .line 550
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onAllSizesComputed()V
    .locals 0

    .prologue
    .line 604
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1428
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1429
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v4, "activity"

    invoke-virtual {v0, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1431
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAskCompatibilityCB:Landroid/widget/CheckBox;

    if-ne p1, v4, :cond_1

    .line 1432
    invoke-virtual {v0, v3, p2}, Landroid/app/ActivityManager;->setPackageAskScreenCompat(Ljava/lang/String;Z)V

    .line 1449
    :cond_0
    :goto_0
    return-void

    .line 1433
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mEnableCompatibilityCB:Landroid/widget/CheckBox;

    if-ne p1, v4, :cond_3

    .line 1434
    if-eqz p2, :cond_2

    :goto_1
    invoke-virtual {v0, v3, v1}, Landroid/app/ActivityManager;->setPackageScreenCompatMode(Ljava/lang/String;I)V

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 1436
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    if-ne p1, v0, :cond_5

    .line 1437
    if-nez p2, :cond_4

    .line 1438
    const/16 v0, 0x8

    invoke-direct {p0, v0, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1440
    :cond_4
    invoke-direct {p0, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->setNotificationsEnabled(Z)V

    goto :goto_0

    .line 1442
    :cond_5
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    if-ne p1, v0, :cond_0

    .line 1443
    if-eqz p2, :cond_6

    .line 1444
    const/16 v0, 0xa

    invoke-direct {p0, v0, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1446
    :cond_6
    invoke-direct {p0, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->setPrivacyGuard(Z)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .prologue
    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 1361
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1362
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_5

    .line 1363
    iget-boolean v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v3, :cond_1

    .line 1364
    invoke-direct {p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    .line 1424
    :cond_0
    :goto_0
    return-void

    .line 1366
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    .line 1367
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v0, :cond_2

    .line 1368
    const/4 v0, 0x7

    invoke-direct {p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1370
    :cond_2
    new-instance v2, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;

    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-direct {v2, p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;Landroid/content/pm/ApplicationInfo;I)V

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Object;

    aput-object v0, v1, v4

    invoke-virtual {v2, v1}, Lcom/androie/settings/applications/InstalledAppDetails$DisableChanger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 1374
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x800000

    and-int/2addr v0, v3

    if-nez v0, :cond_4

    .line 1375
    invoke-direct {p0, v2, v1, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 1377
    :cond_4
    invoke-direct {p0, v2, v4, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 1380
    :cond_5
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_6

    .line 1381
    const/16 v0, 0x9

    invoke-direct {p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1382
    :cond_6
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_7

    .line 1383
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->clearPackagePreferredActivities(Ljava/lang/String;)V

    .line 1385
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-interface {v0, v2, v1}, Landroid/hardware/usb/IUsbManager;->clearDefaults(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1389
    :goto_1
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    invoke-virtual {v0, v2, v4}, Landroid/appwidget/AppWidgetManager;->setBindAppWidgetPermission(Ljava/lang/String;Z)V

    .line 1390
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f0c00d5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1392
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v2, 0x7f0c00d6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1393
    invoke-direct {p0, v0, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V

    goto :goto_0

    .line 1386
    :catch_0
    move-exception v0

    .line 1387
    const-string v1, "InstalledAppDetails"

    const-string v3, "mUsbManager.clearDefaults"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1394
    :cond_7
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_9

    .line 1395
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    if-eqz v2, :cond_8

    .line 1396
    invoke-static {}, Lcom/androie/settings/Utils;->isMonkeyRunning()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1397
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1398
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1400
    invoke-virtual {p0, v1, v0}, Lcom/androie/settings/applications/InstalledAppDetails;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 1403
    :cond_8
    invoke-direct {p0, v1, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto/16 :goto_0

    .line 1405
    :cond_9
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_b

    .line 1407
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;

    if-nez v0, :cond_a

    .line 1408
    new-instance v0, Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;

    .line 1410
    :cond_a
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/androie/settings/applications/InstalledAppDetails$ClearCacheObserver;

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->deleteApplicationCacheFiles(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)V

    goto/16 :goto_0

    .line 1411
    :cond_b
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    if-ne p1, v2, :cond_c

    .line 1412
    const/4 v0, 0x5

    invoke-direct {p0, v0, v4}, Lcom/androie/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto/16 :goto_0

    .line 1414
    :cond_c
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    if-ne p1, v2, :cond_0

    .line 1415
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;

    if-nez v2, :cond_d

    .line 1416
    new-instance v2, Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;

    invoke-direct {v2, p0}, Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;-><init>(Lcom/androie/settings/applications/InstalledAppDetails;)V

    iput-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;

    .line 1418
    :cond_d
    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x40000

    and-int/2addr v2, v3

    if-eqz v2, :cond_e

    move v0, v1

    .line 1420
    :cond_e
    iput-boolean v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 1421
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshButtons()V

    .line 1422
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/androie/settings/applications/InstalledAppDetails$PackageMoveObserver;

    invoke-virtual {v1, v2, v3, v0}, Landroid/content/pm/PackageManager;->movePackage(Ljava/lang/String;Landroid/content/pm/IPackageMoveObserver;I)V

    goto/16 :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 421
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 423
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/applications/ApplicationsState;->getInstance(Landroid/app/Application;)Lcom/androie/settings/applications/ApplicationsState;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    .line 424
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {v1, p0}, Lcom/androie/settings/applications/ApplicationsState;->newSession(Lcom/androie/settings/applications/ApplicationsState$Callbacks;)Lcom/androie/settings/applications/ApplicationsState$Session;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSession:Lcom/androie/settings/applications/ApplicationsState$Session;

    .line 425
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    .line 426
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    .line 427
    const-string v1, "usb"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 428
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Landroid/hardware/usb/IUsbManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/usb/IUsbManager;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    .line 429
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    .line 430
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "device_policy"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    .line 431
    const-string v1, "isms"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    .line 433
    new-instance v1, Lcom/androie/settings/applications/CanBeOnSdCardChecker;

    invoke-direct {v1}, Lcom/androie/settings/applications/CanBeOnSdCardChecker;-><init>()V

    iput-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/androie/settings/applications/CanBeOnSdCardChecker;

    .line 436
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSession:Lcom/androie/settings/applications/ApplicationsState$Session;

    invoke-virtual {v1}, Lcom/androie/settings/applications/ApplicationsState$Session;->resume()V

    .line 438
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->retrieveAppEntry()Ljava/lang/String;

    .line 440
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->setHasOptionsMenu(Z)V

    .line 441
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 502
    const v0, 0x7f080769

    invoke-interface {p1, v1, v2, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 504
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v8, 0x7f0c01ea

    const v7, 0x7f0c01e9

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 446
    const v3, 0x7f04004b

    invoke-virtual {p1, v3, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 447
    .local v2, "view":Landroid/view/View;
    invoke-static {p2, v2, v2, v5}, Lcom/androie/settings/Utils;->prepareCustomPreferencesList(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Z)V

    .line 449
    iput-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    .line 450
    invoke-virtual {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0807a0

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    .line 453
    const v3, 0x7f0c00c5

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    .line 454
    const v3, 0x7f0c00c7

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    .line 455
    const v3, 0x7f0c00cc

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    .line 456
    const v3, 0x7f0c00c9

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    .line 457
    const v3, 0x7f0c00ce

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    .line 459
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 460
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 461
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 465
    :cond_0
    const v3, 0x7f0c00bf

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 466
    .local v0, "btnPanel":Landroid/view/View;
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    .line 467
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    const v4, 0x7f080762

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 468
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    .line 469
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 472
    const v3, 0x7f0c00c0

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    .line 473
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 474
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    .line 475
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 478
    const v3, 0x7f0c00cf

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 479
    .local v1, "data_buttons_panel":Landroid/view/View;
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    .line 480
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    .line 483
    const v3, 0x7f0c00d3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    .line 484
    const v3, 0x7f0c00d4

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    .line 486
    const v3, 0x7f0c00d7

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    .line 489
    const v3, 0x7f0c00d8

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mScreenCompatSection:Landroid/view/View;

    .line 490
    const v3, 0x7f0c00d9

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAskCompatibilityCB:Landroid/widget/CheckBox;

    .line 491
    const v3, 0x7f0c00da

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mEnableCompatibilityCB:Landroid/widget/CheckBox;

    .line 493
    const v3, 0x7f0c00c1

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CompoundButton;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    .line 495
    const v3, 0x7f0c00c2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CompoundButton;

    iput-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPrivacyGuardSwitch:Landroid/widget/CompoundButton;

    .line 497
    return-object v2
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 527
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 528
    .local v0, "menuId":I
    if-ne v0, v1, :cond_0

    .line 529
    iget-object v3, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v3, v1, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    .line 532
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public onPackageIconChanged()V
    .locals 0

    .prologue
    .line 608
    return-void
.end method

.method public onPackageListChanged()V
    .locals 0

    .prologue
    .line 612
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshUi()Z

    .line 613
    return-void
.end method

.method public onPackageSizeChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 621
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 622
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshSizeInfo()V

    .line 624
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 598
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 599
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSession:Lcom/androie/settings/applications/ApplicationsState$Session;

    invoke-virtual {v0}, Lcom/androie/settings/applications/ApplicationsState$Session;->pause()V

    .line 600
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 508
    const/4 v0, 0x1

    .line 509
    .local v0, "showIt":Z
    iget-boolean v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v1, :cond_1

    .line 510
    const/4 v0, 0x0

    .line 522
    :cond_0
    :goto_0
    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 523
    return-void

    .line 511
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    if-nez v1, :cond_2

    .line 512
    const/4 v0, 0x0

    goto :goto_0

    .line 513
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    .line 514
    const/4 v0, 0x0

    goto :goto_0

    .line 515
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v2, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 516
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    .line 517
    :cond_5
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-eqz v1, :cond_6

    .line 518
    const/4 v0, 0x0

    goto :goto_0

    .line 519
    :cond_6
    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v1}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 520
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onRebuildComplete(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/ApplicationsState$AppEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 617
    .local p1, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/ApplicationsState$AppEntry;>;"
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 588
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 590
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails;->mSession:Lcom/androie/settings/applications/ApplicationsState$Session;

    invoke-virtual {v0}, Lcom/androie/settings/applications/ApplicationsState$Session;->resume()V

    .line 591
    invoke-direct {p0}, Lcom/androie/settings/applications/InstalledAppDetails;->refreshUi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 592
    invoke-direct {p0, v1, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    .line 594
    :cond_0
    return-void
.end method

.method public onRunningStateChanged(Z)V
    .locals 0
    .param p1, "running"    # Z

    .prologue
    .line 628
    return-void
.end method
