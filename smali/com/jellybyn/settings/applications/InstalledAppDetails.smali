.class public Lcom/jellybyn/settings/applications/InstalledAppDetails;
.super Landroid/app/Fragment;
.source "InstalledAppDetails.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Lcom/jellybyn/settings/applications/ApplicationsState$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;,
        Lcom/jellybyn/settings/applications/InstalledAppDetails$MyAlertDialogFragment;,
        Lcom/jellybyn/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;,
        Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;,
        Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;,
        Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;
    }
.end annotation


# instance fields
.field private mActivitiesButton:Landroid/widget/Button;

.field private mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

.field private mAppSize:Landroid/widget/TextView;

.field private mAppVersion:Landroid/widget/TextView;

.field private mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

.field private mAskCompatibilityCB:Landroid/widget/CheckBox;

.field private mCacheSize:Landroid/widget/TextView;

.field private mCanBeOnSdCardChecker:Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;

.field private mCanClearData:Z

.field private final mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

.field private mClearCacheButton:Landroid/widget/Button;

.field private mClearCacheObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;

.field private mClearDataButton:Landroid/widget/Button;

.field private mClearDataObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;

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

.field private mPackageMoveObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;

.field private mPm:Landroid/content/pm/PackageManager;

.field private mRootView:Landroid/view/View;

.field private mScreenCompatSection:Landroid/view/View;

.field private mSession:Lcom/jellybyn/settings/applications/ApplicationsState$Session;

.field private mShowUninstalled:Z

.field private mSmsManager:Lcom/android/internal/telephony/ISms;

.field private mSpecialDisableButton:Landroid/widget/Button;

.field private mState:Lcom/jellybyn/settings/applications/ApplicationsState;

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

    .line 96
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 121
    iput-boolean v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 122
    iput-boolean v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanClearData:Z

    .line 148
    iput-boolean v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    .line 149
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 150
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastDataSize:J

    .line 151
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    .line 152
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    .line 153
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    .line 154
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    .line 190
    new-instance v0, Lcom/jellybyn/settings/applications/InstalledAppDetails$1;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails$1;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mHandler:Landroid/os/Handler;

    .line 1210
    new-instance v0, Lcom/jellybyn/settings/applications/InstalledAppDetails$2;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails$2;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    .line 1241
    return-void
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/applications/InstalledAppDetails;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Landroid/os/Message;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->processClearMsg(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$100(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/jellybyn/settings/applications/InstalledAppDetails;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # I

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getMoveErrMsg(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Landroid/widget/CompoundButton;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/jellybyn/settings/applications/InstalledAppDetails;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setNotificationsEnabled(Z)V

    return-void
.end method

.method static synthetic access$1300(Lcom/jellybyn/settings/applications/InstalledAppDetails;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    return-void
.end method

.method static synthetic access$1400(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Landroid/content/pm/PackageManager;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Lcom/jellybyn/settings/applications/ApplicationsState;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    return-object v0
.end method

.method static synthetic access$300(Lcom/jellybyn/settings/applications/InstalledAppDetails;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Landroid/os/Message;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->processMoveMsg(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$400(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->initiateClearUserData()V

    return-void
.end method

.method static synthetic access$600(Lcom/jellybyn/settings/applications/InstalledAppDetails;Ljava/lang/String;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .prologue
    .line 96
    invoke-direct {p0, p1, p2, p3}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$700(Lcom/jellybyn/settings/applications/InstalledAppDetails;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    return-void
.end method

.method static synthetic access$800(Lcom/jellybyn/settings/applications/InstalledAppDetails;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$900(Lcom/jellybyn/settings/applications/InstalledAppDetails;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/InstalledAppDetails;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->forceStopPackage(Ljava/lang/String;)V

    return-void
.end method

.method private checkForceStop()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 1223
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1225
    invoke-direct {p0, v5}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    .line 1239
    :goto_0
    return-void

    .line 1226
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x200000

    and-int/2addr v0, v1

    if-nez v0, :cond_1

    .line 1229
    invoke-direct {p0, v6}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->updateForceStopButton(Z)V

    goto :goto_0

    .line 1231
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.intent.action.QUERY_PACKAGE_RESTART"

    const-string v3, "package"

    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v3, v4, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1233
    const-string v0, "android.intent.extra.PACKAGES"

    new-array v3, v6, [Ljava/lang/String;

    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 1234
    const-string v0, "android.intent.extra.UID"

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1235
    const-string v0, "android.intent.extra.user_handle"

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v3}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v3

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1236
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    move-object v4, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/app/Activity;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method private forceStopPackage(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 1199
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1201
    invoke-virtual {v0, p1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 1202
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    invoke-virtual {v0, p1}, Lcom/jellybyn/settings/applications/ApplicationsState;->invalidatePackage(Ljava/lang/String;)V

    .line 1203
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    invoke-virtual {v0, p1}, Lcom/jellybyn/settings/applications/ApplicationsState;->getEntry(Ljava/lang/String;)Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    move-result-object v0

    .line 1204
    if-eqz v0, :cond_0

    .line 1205
    iput-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    .line 1207
    :cond_0
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 1208
    return-void
.end method

.method private getMoveErrMsg(I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "errCode"    # I

    .prologue
    .line 263
    packed-switch p1, :pswitch_data_0

    .line 277
    const-string v0, ""

    :goto_0
    return-object v0

    .line 265
    :pswitch_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b043e

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 267
    :pswitch_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b043f

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 269
    :pswitch_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0440

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 271
    :pswitch_3
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0441

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 273
    :pswitch_4
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0442

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 275
    :pswitch_5
    const-string v0, ""

    goto :goto_0

    .line 263
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
    .line 1275
    :try_start_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    if-eqz v0, :cond_0

    .line 1276
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ISms;->getPremiumSmsPermission(Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1281
    :goto_0
    return v0

    .line 1278
    :catch_0
    move-exception v0

    .line 1281
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getSizeStr(J)Ljava/lang/String;
    .locals 2
    .param p1, "size"    # J

    .prologue
    .line 238
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mInvalidSizeStr:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private handleDisableable(Landroid/widget/Button;)Z
    .locals 8
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 318
    const/4 v0, 0x0

    .line 323
    .local v0, "disableable":Z
    :try_start_0
    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const-string v6, "android"

    const/16 v7, 0x40

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 325
    .local v4, "sys":Landroid/content/pm/PackageInfo;
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 326
    .local v3, "intent":Landroid/content/Intent;
    const-string v5, "android.intent.category.HOME"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 327
    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 328
    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 329
    .local v2, "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->isThisASystemPackage()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 331
    :cond_1
    const v5, 0x7f0b0401

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V

    .line 342
    .end local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "sys":Landroid/content/pm/PackageInfo;
    :goto_0
    return v0

    .line 332
    .restart local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v3    # "intent":Landroid/content/Intent;
    .restart local v4    # "sys":Landroid/content/pm/PackageInfo;
    :cond_2
    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-boolean v5, v5, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v5, :cond_3

    .line 333
    const v5, 0x7f0b0401

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V

    .line 334
    const/4 v0, 0x1

    goto :goto_0

    .line 336
    :cond_3
    const v5, 0x7f0b0402

    invoke-virtual {p1, v5}, Landroid/widget/Button;->setText(I)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    const/4 v0, 0x1

    goto :goto_0

    .line 339
    .end local v2    # "homes":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "sys":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    .line 340
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "InstalledAppDetails"

    const-string v6, "Unable to get package info"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private initDataButtons()V
    .locals 4

    .prologue
    const v3, 0x7f0b0403

    const/4 v2, 0x0

    .line 245
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x41

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    .line 250
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 251
    iput-boolean v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanClearData:Z

    .line 260
    :goto_0
    return-void

    .line 253
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 254
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v1, 0x7f0b0415

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 258
    :goto_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 256
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    goto :goto_1
.end method

.method private initMoveButton()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 281
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 282
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 305
    :goto_0
    return-void

    .line 285
    :cond_0
    const/4 v0, 0x0

    .line 286
    .local v0, "dataOnly":Z
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    if-eqz v4, :cond_1

    move v0, v2

    .line 287
    :goto_1
    const/4 v1, 0x1

    .line 288
    .local v1, "moveDisable":Z
    if-eqz v0, :cond_2

    .line 289
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0b043a

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 299
    :goto_2
    if-eqz v1, :cond_5

    .line 300
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .end local v1    # "moveDisable":Z
    :cond_1
    move v0, v3

    .line 286
    goto :goto_1

    .line 290
    .restart local v1    # "moveDisable":Z
    :cond_2
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v5, 0x40000

    and-int/2addr v4, v5

    if-eqz v4, :cond_3

    .line 291
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0b043b

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 293
    const/4 v1, 0x0

    goto :goto_2

    .line 295
    :cond_3
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v5, 0x7f0b043c

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 296
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;

    invoke-virtual {v4}, Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;->init()V

    .line 297
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;

    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v4, v5}, Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;->check(Landroid/content/pm/ApplicationInfo;)Z

    move-result v4

    if-nez v4, :cond_4

    move v1, v2

    :goto_3
    goto :goto_2

    :cond_4
    move v1, v3

    goto :goto_3

    .line 302
    :cond_5
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 303
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private initNotificationButton()V
    .locals 4

    .prologue
    .line 384
    const-string v2, "notification"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v1

    .line 386
    .local v1, "nm":Landroid/app/INotificationManager;
    const/4 v0, 0x1

    .line 388
    .local v0, "enabled":Z
    :try_start_0
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-interface {v1, v2, v3}, Landroid/app/INotificationManager;->areNotificationsEnabledForPackage(Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 393
    :goto_0
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 394
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->isThisASystemPackage()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 395
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 400
    :goto_1
    return-void

    .line 397
    :cond_0
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 398
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_1

    .line 390
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private initUninstallButtons()V
    .locals 6

    .prologue
    const v5, 0x7f0b03fe

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 346
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    .line 347
    const/4 v0, 0x1

    .line 348
    .local v0, "enabled":Z
    iget-boolean v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v2, :cond_5

    .line 349
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    const v5, 0x7f0b0404

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    .line 350
    const/4 v1, 0x0

    .line 351
    .local v1, "specialDisable":Z
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 352
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-direct {p0, v2}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->handleDisableable(Landroid/widget/Button;)Z

    move-result v1

    .line 353
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 355
    :cond_0
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    if-eqz v1, :cond_4

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 373
    .end local v1    # "specialDisable":Z
    :goto_2
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 374
    const/4 v0, 0x0

    .line 376
    :cond_1
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 377
    if-eqz v0, :cond_2

    .line 379
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 381
    :cond_2
    return-void

    .end local v0    # "enabled":Z
    :cond_3
    move v2, v3

    .line 346
    goto :goto_0

    .restart local v0    # "enabled":Z
    .restart local v1    # "specialDisable":Z
    :cond_4
    move v3, v4

    .line 355
    goto :goto_1

    .line 357
    .end local v1    # "specialDisable":Z
    :cond_5
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 358
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_6

    .line 359
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-direct {p0, v2}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->handleDisableable(Landroid/widget/Button;)Z

    move-result v0

    goto :goto_2

    .line 360
    :cond_6
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x800000

    and-int/2addr v2, v3

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_7

    .line 365
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    .line 366
    const/4 v0, 0x0

    goto :goto_2

    .line 368
    :cond_7
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setText(I)V

    goto :goto_2
.end method

.method private initiateClearUserData()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1009
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1011
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1012
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

    .line 1013
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    if-nez v0, :cond_0

    .line 1014
    new-instance v0, Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    .line 1016
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v2, "activity"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1018
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearUserDataObserver;

    invoke-virtual {v0, v1, v2}, Landroid/app/ActivityManager;->clearApplicationUserData(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)Z

    move-result v0

    .line 1019
    if-nez v0, :cond_1

    .line 1021
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

    .line 1022
    const/4 v0, 0x4

    invoke-direct {p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    .line 1026
    :goto_0
    return-void

    .line 1024
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v1, 0x7f0b0422

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    goto :goto_0
.end method

.method private isThisASystemPackage()Z
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 309
    :try_start_0
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const-string v4, "android"

    const/16 v5, 0x40

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 310
    .local v1, "sys":Landroid/content/pm/PackageInfo;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v3, :cond_0

    iget-object v3, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v4, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 313
    .end local v1    # "sys":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    return v2

    .line 312
    :catch_0
    move-exception v0

    .line 313
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method

.method private processClearMsg(Landroid/os/Message;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 963
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 964
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 965
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const v3, 0x7f0b0403

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 966
    if-ne v0, v4, :cond_0

    .line 967
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

    .line 968
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/ApplicationsState;->requestSize(Ljava/lang/String;)V

    .line 972
    :goto_0
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 973
    return-void

    .line 970
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private processMoveMsg(Landroid/os/Message;)V
    .locals 4

    .prologue
    .line 990
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 991
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 993
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 994
    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 995
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

    .line 997
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/ApplicationsState;->requestSize(Ljava/lang/String;)V

    .line 1001
    :goto_0
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshUi()Z

    .line 1002
    return-void

    .line 999
    :cond_0
    const/4 v1, 0x6

    invoke-direct {p0, v1, v0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0
.end method

.method private refreshButtons()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 976
    iget-boolean v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    if-nez v0, :cond_0

    .line 977
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->initUninstallButtons()V

    .line 978
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->initDataButtons()V

    .line 979
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->initMoveButton()V

    .line 980
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->initNotificationButton()V

    .line 987
    :goto_0
    return-void

    .line 982
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    const v1, 0x7f0b043d

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 983
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 984
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 985
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private refreshSizeInfo()V
    .locals 10

    .prologue
    .line 896
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->size:J

    const-wide/16 v8, -0x2

    cmp-long v6, v6, v8

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->size:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-nez v6, :cond_2

    .line 898
    :cond_0
    const-wide/16 v6, -0x1

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastDataSize:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 899
    iget-boolean v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    if-nez v6, :cond_1

    .line 900
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 901
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 902
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 903
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 905
    :cond_1
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 906
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 956
    :goto_0
    return-void

    .line 909
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mHaveSizes:Z

    .line 910
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v2, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->codeSize:J

    .line 911
    .local v2, "codeSize":J
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v4, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->dataSize:J

    .line 912
    .local v4, "dataSize":J
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 913
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    add-long/2addr v2, v6

    .line 914
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v4, v6

    .line 925
    :cond_3
    :goto_1
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    cmp-long v6, v6, v2

    if-eqz v6, :cond_4

    .line 926
    iput-wide v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCodeSize:J

    .line 927
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    invoke-direct {p0, v2, v3}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 929
    :cond_4
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastDataSize:J

    cmp-long v6, v6, v4

    if-eqz v6, :cond_5

    .line 930
    iput-wide v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastDataSize:J

    .line 931
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    invoke-direct {p0, v4, v5}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 933
    :cond_5
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->cacheSize:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCacheSize:J

    add-long v0, v6, v8

    .line 934
    .local v0, "cacheSize":J
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    cmp-long v6, v6, v0

    if-eqz v6, :cond_6

    .line 935
    iput-wide v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastCacheSize:J

    .line 936
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 938
    :cond_6
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->size:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_7

    .line 939
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->size:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastTotalSize:J

    .line 940
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->size:J

    invoke-direct {p0, v7, v8}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 943
    :cond_7
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->dataSize:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_8

    iget-boolean v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanClearData:Z

    if-nez v6, :cond_b

    .line 944
    :cond_8
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 949
    :goto_2
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-gtz v6, :cond_c

    .line 950
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 916
    .end local v0    # "cacheSize":J
    :cond_9
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_a

    .line 917
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalCodeSize:J

    .line 918
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    invoke-direct {p0, v7, v8}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 920
    :cond_a
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v8, v8, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_3

    .line 921
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mLastExternalDataSize:J

    .line 922
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-wide v7, v7, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    invoke-direct {p0, v7, v8}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getSizeStr(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 946
    .restart local v0    # "cacheSize":J
    :cond_b
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 947
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    .line 952
    :cond_c
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 953
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

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

    .line 638
    iget-boolean v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    if-eqz v0, :cond_1

    .line 841
    :cond_0
    :goto_0
    return v4

    .line 641
    :cond_1
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->retrieveAppEntry()Ljava/lang/String;

    move-result-object v6

    .line 643
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    if-nez v0, :cond_2

    move v4, v3

    .line 644
    goto :goto_0

    .line 647
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v0, :cond_3

    move v4, v3

    .line 648
    goto :goto_0

    .line 652
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 655
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 656
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v0, v5, v6}, Landroid/content/pm/PackageManager;->getPreferredActivities(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)I

    .line 661
    :try_start_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-interface {v0, v6, v1}, Landroid/hardware/usb/IUsbManager;->hasDefaults(Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    move v2, v0

    .line 665
    :goto_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->hasBindAppWidgetPermission(Ljava/lang/String;)Z

    move-result v7

    .line 668
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f080094

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 669
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v8, 0x7f080095

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 670
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    move v5, v4

    .line 671
    :goto_2
    if-nez v5, :cond_7

    if-nez v7, :cond_7

    .line 672
    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 711
    :goto_3
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 713
    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->getPackageScreenCompatMode(Ljava/lang/String;)I

    .line 724
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mScreenCompatSection:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 728
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f08009a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 729
    new-instance v5, Landroid/widget/AppSecurityPermissions;

    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v5, v1, v6}, Landroid/widget/AppSecurityPermissions;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 730
    invoke-direct {p0, v6}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getPremiumSmsPermission(Ljava/lang/String;)I

    move-result v7

    .line 734
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionCount()I

    move-result v1

    if-gtz v1, :cond_5

    if-eqz v7, :cond_10

    .line 736
    :cond_5
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 741
    :goto_4
    const v1, 0x7f08009b

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 743
    const v2, 0x7f08009c

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 745
    if-eqz v7, :cond_11

    .line 747
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 748
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 749
    const v1, 0x7f08009d

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 751
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v8, 0x7f070050

    const v9, 0x1090008

    invoke-static {v2, v8, v9}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v2

    .line 754
    const v8, 0x1090009

    invoke-virtual {v2, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 755
    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 757
    add-int/lit8 v2, v7, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 758
    new-instance v2, Lcom/jellybyn/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;

    iget-object v7, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    invoke-direct {v2, v6, v7}, Lcom/jellybyn/settings/applications/InstalledAppDetails$PremiumSmsSelectionListener;-><init>(Ljava/lang/String;Lcom/android/internal/telephony/ISms;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 766
    :goto_5
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionCount()I

    move-result v1

    if-lez v1, :cond_14

    .line 768
    const v1, 0x7f08009f

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 770
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 771
    invoke-virtual {v5}, Landroid/widget/AppSecurityPermissions;->getPermissionsViewWithRevokeButtons()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 774
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v1

    .line 775
    if-eqz v1, :cond_14

    array-length v0, v1

    if-le v0, v4, :cond_14

    .line 776
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move v0, v3

    .line 777
    :goto_6
    array-length v2, v1

    if-ge v0, v2, :cond_13

    .line 778
    aget-object v2, v1, v0

    .line 779
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 777
    :goto_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 662
    :catch_0
    move-exception v0

    .line 663
    const-string v1, "InstalledAppDetails"

    const-string v2, "mUsbManager.hasDefaults"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v2, v3

    goto/16 :goto_1

    :cond_6
    move v5, v3

    .line 670
    goto/16 :goto_2

    .line 674
    :cond_7
    if-eqz v7, :cond_c

    if-eqz v5, :cond_c

    move v2, v4

    .line 676
    :goto_8
    if-eqz v7, :cond_d

    .line 677
    const v8, 0x7f0b03f1

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(I)V

    .line 682
    :goto_9
    const/4 v0, 0x0

    .line 683
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0d000b

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    .line 685
    if-eqz v5, :cond_9

    .line 686
    const v5, 0x7f0b0405

    invoke-virtual {p0, v5}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 687
    new-instance v9, Landroid/text/SpannableString;

    invoke-direct {v9, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 688
    if-eqz v2, :cond_8

    .line 689
    new-instance v10, Landroid/text/style/BulletSpan;

    invoke-direct {v10, v8}, Landroid/text/style/BulletSpan;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v9, v10, v3, v5, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 691
    :cond_8
    if-nez v0, :cond_e

    new-array v0, v11, [Ljava/lang/CharSequence;

    aput-object v9, v0, v3

    const-string v5, "\n"

    aput-object v5, v0, v4

    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 694
    :cond_9
    :goto_a
    if-eqz v7, :cond_b

    .line 695
    const v5, 0x7f0b0406

    invoke-virtual {p0, v5}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 697
    new-instance v7, Landroid/text/SpannableString;

    invoke-direct {v7, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 698
    if-eqz v2, :cond_a

    .line 699
    new-instance v2, Landroid/text/style/BulletSpan;

    invoke-direct {v2, v8}, Landroid/text/style/BulletSpan;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v7, v2, v3, v5, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 702
    :cond_a
    if-nez v0, :cond_f

    new-array v0, v11, [Ljava/lang/CharSequence;

    aput-object v7, v0, v3

    const-string v2, "\n"

    aput-object v2, v0, v4

    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 705
    :cond_b
    :goto_b
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 707
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_3

    :cond_c
    move v2, v3

    .line 674
    goto :goto_8

    .line 679
    :cond_d
    const v8, 0x7f0b03f0

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(I)V

    goto :goto_9

    .line 691
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

    .line 702
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

    .line 738
    :cond_10
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_4

    .line 762
    :cond_11
    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 763
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_5

    .line 783
    :cond_12
    :try_start_1
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    const/4 v7, 0x0

    invoke-virtual {v6, v2, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 784
    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v6}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_7

    .line 785
    :catch_1
    move-exception v2

    goto/16 :goto_7

    .line 788
    :cond_13
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 789
    if-lez v6, :cond_14

    .line 790
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 792
    if-ne v6, v4, :cond_16

    .line 793
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 806
    :goto_c
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v2, 0x7f08009e

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 808
    const v2, 0x7f0b042f

    new-array v5, v11, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v8, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v6, v8}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v1, v5, v4

    invoke-virtual {v7, v2, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 814
    :cond_14
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->checkForceStop()V

    .line 815
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setAppLabelAndIcon(Landroid/content/pm/PackageInfo;)V

    .line 816
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshButtons()V

    .line 817
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshSizeInfo()V

    .line 819
    iget-boolean v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mInitialized:Z

    if-nez v0, :cond_1a

    .line 821
    iput-boolean v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mInitialized:Z

    .line 822
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x800000

    and-int/2addr v0, v1

    if-nez v0, :cond_15

    move v3, v4

    :cond_15
    iput-boolean v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mShowUninstalled:Z

    goto/16 :goto_0

    .line 794
    :cond_16
    if-ne v6, v11, :cond_17

    .line 795
    const v0, 0x7f0b0430

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

    .line 798
    :cond_17
    add-int/lit8 v0, v6, -0x2

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 799
    add-int/lit8 v0, v6, -0x3

    move-object v2, v1

    move v1, v0

    :goto_d
    if-ltz v1, :cond_19

    .line 800
    if-nez v1, :cond_18

    const v0, 0x7f0b0432

    :goto_e
    new-array v8, v11, [Ljava/lang/Object;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v8, v3

    aput-object v2, v8, v4

    invoke-virtual {v7, v0, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 799
    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_d

    .line 800
    :cond_18
    const v0, 0x7f0b0433

    goto :goto_e

    .line 803
    :cond_19
    const v0, 0x7f0b0431

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

    .line 827
    :cond_1a
    :try_start_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v2, 0x2200

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 830
    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mShowUninstalled:Z

    if-nez v1, :cond_0

    .line 834
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    const/high16 v1, 0x800000

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    move v4, v3

    goto/16 :goto_0

    .line 836
    :catch_2
    move-exception v0

    move v4, v3

    .line 837
    goto/16 :goto_0
.end method

.method private resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 2

    .prologue
    .line 881
    const v0, 0x7f0b03f0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 882
    const v0, 0x7f0b0407

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 884
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 885
    return-void
.end method

.method private retrieveAppEntry()Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 609
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 610
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_1

    const-string v4, "package"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 611
    .local v3, "packageName":Ljava/lang/String;
    :goto_0
    if-nez v3, :cond_0

    .line 612
    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 614
    .local v2, "intent":Landroid/content/Intent;
    :goto_1
    if-eqz v2, :cond_0

    .line 615
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v3

    .line 618
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_0
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    invoke-virtual {v4, v3}, Lcom/jellybyn/settings/applications/ApplicationsState;->getEntry(Ljava/lang/String;)Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    .line 619
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    if-eqz v4, :cond_3

    .line 622
    :try_start_0
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v6, 0x2240

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iput-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 634
    :goto_2
    return-object v3

    .end local v3    # "packageName":Ljava/lang/String;
    :cond_1
    move-object v3, v5

    .line 610
    goto :goto_0

    .line 612
    .restart local v3    # "packageName":Ljava/lang/String;
    :cond_2
    const-string v4, "intent"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    move-object v2, v4

    goto :goto_1

    .line 626
    :catch_0
    move-exception v1

    .line 627
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "InstalledAppDetails"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception when retrieving package:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v6, v6, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 630
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_3
    const-string v4, "InstalledAppDetails"

    const-string v6, "Missing AppEntry; maybe reinstalling?"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    iput-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    goto :goto_2
.end method

.method private setAppLabelAndIcon(Landroid/content/pm/PackageInfo;)V
    .locals 9
    .param p1, "pkgInfo"    # Landroid/content/pm/PackageInfo;

    .prologue
    const/4 v8, 0x0

    .line 543
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v4, 0x7f080009

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 544
    .local v0, "appSnippet":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v8, v3, v8, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 546
    const v3, 0x7f08000f

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 547
    .local v1, "icon":Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    invoke-virtual {v3, v4}, Lcom/jellybyn/settings/applications/ApplicationsState;->ensureIcon(Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;)V

    .line 548
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 550
    const v3, 0x7f080010

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 551
    .local v2, "label":Landroid/widget/TextView;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 553
    const v3, 0x7f0800b1

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    .line 555
    if-eqz p1, :cond_0

    iget-object v3, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 556
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 557
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0b0439

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v4, v5, v6}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 562
    :goto_0
    return-void

    .line 560
    :cond_0
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppVersion:Landroid/widget/TextView;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setIntentAndFinish(ZZ)V
    .locals 3

    .prologue
    .line 889
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 890
    const-string v0, "chg"

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 891
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 892
    const/4 v2, -0x1

    invoke-virtual {v0, p0, v2, v1}, Landroid/preference/PreferenceActivity;->finishPreferencePanel(Landroid/app/Fragment;ILandroid/content/Intent;)V

    .line 893
    return-void
.end method

.method private setNotificationsEnabled(Z)V
    .locals 6
    .param p1, "enabled"    # Z

    .prologue
    .line 1262
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1263
    .local v3, "packageName":Ljava/lang/String;
    const-string v4, "notification"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v2

    .line 1266
    .local v2, "nm":Landroid/app/INotificationManager;
    :try_start_0
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    invoke-virtual {v4}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    .line 1267
    .local v0, "enable":Z
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-interface {v2, v3, v4, p1}, Landroid/app/INotificationManager;->setNotificationsEnabledForPackage(Ljava/lang/String;IZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1271
    .end local v0    # "enable":Z
    :goto_0
    return-void

    .line 1268
    :catch_0
    move-exception v1

    .line 1269
    .local v1, "ex":Landroid/os/RemoteException;
    iget-object v5, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    if-nez p1, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private showDialogInner(II)V
    .locals 4

    .prologue
    .line 1029
    invoke-static {p1, p2}, Lcom/jellybyn/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->newInstance(II)Lcom/jellybyn/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    move-result-object v0

    .line 1030
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/app/DialogFragment;->setTargetFragment(Landroid/app/Fragment;I)V

    .line 1031
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getFragmentManager()Landroid/app/FragmentManager;

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

    .line 1032
    return-void
.end method

.method private uninstallPkg(Ljava/lang/String;ZZ)V
    .locals 3

    .prologue
    .line 1191
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

    .line 1192
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.UNINSTALL_PACKAGE"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1193
    const-string v0, "android.intent.extra.UNINSTALL_ALL_USERS"

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1194
    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1195
    iput-boolean p3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    .line 1196
    return-void
.end method

.method private updateForceStopButton(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 1218
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1219
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1220
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

    .line 519
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 520
    if-ne p1, v5, :cond_1

    .line 521
    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    if-eqz v1, :cond_0

    .line 522
    iput-boolean v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDisableAfterUninstall:Z

    .line 524
    :try_start_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v3, 0x2200

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 527
    .local v0, "ainfo":Landroid/content/pm/ApplicationInfo;
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    .line 528
    new-instance v2, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v1, v3}, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;Landroid/content/pm/ApplicationInfo;I)V

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Object;

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 535
    .end local v0    # "ainfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshUi()Z

    move-result v1

    if-nez v1, :cond_1

    .line 536
    invoke-direct {p0, v5, v5}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    .line 539
    :cond_1
    return-void

    .line 532
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onAllSizesComputed()V
    .locals 0

    .prologue
    .line 582
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1356
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1357
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v4, "activity"

    invoke-virtual {v0, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 1359
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAskCompatibilityCB:Landroid/widget/CheckBox;

    if-ne p1, v4, :cond_1

    .line 1360
    invoke-virtual {v0, v3, p2}, Landroid/app/ActivityManager;->setPackageAskScreenCompat(Ljava/lang/String;Z)V

    .line 1371
    :cond_0
    :goto_0
    return-void

    .line 1361
    :cond_1
    iget-object v4, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mEnableCompatibilityCB:Landroid/widget/CheckBox;

    if-ne p1, v4, :cond_3

    .line 1362
    if-eqz p2, :cond_2

    :goto_1
    invoke-virtual {v0, v3, v1}, Landroid/app/ActivityManager;->setPackageScreenCompatMode(Ljava/lang/String;I)V

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 1364
    :cond_3
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    if-ne p1, v0, :cond_0

    .line 1365
    if-nez p2, :cond_4

    .line 1366
    const/16 v0, 0x8

    invoke-direct {p0, v0, v2}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1368
    :cond_4
    invoke-direct {p0, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setNotificationsEnabled(Z)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .prologue
    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 1289
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 1290
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_5

    .line 1291
    iget-boolean v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v3, :cond_1

    .line 1292
    invoke-direct {p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    .line 1352
    :cond_0
    :goto_0
    return-void

    .line 1294
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    .line 1295
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v0, :cond_2

    .line 1296
    const/4 v0, 0x7

    invoke-direct {p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1298
    :cond_2
    new-instance v2, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;

    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-direct {v2, p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;Landroid/content/pm/ApplicationInfo;I)V

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Object;

    aput-object v0, v1, v4

    invoke-virtual {v2, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails$DisableChanger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 1302
    :cond_3
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x800000

    and-int/2addr v0, v3

    if-nez v0, :cond_4

    .line 1303
    invoke-direct {p0, v2, v1, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 1305
    :cond_4
    invoke-direct {p0, v2, v4, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 1308
    :cond_5
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_6

    .line 1309
    const/16 v0, 0x9

    invoke-direct {p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto :goto_0

    .line 1310
    :cond_6
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_7

    .line 1311
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->clearPackagePreferredActivities(Ljava/lang/String;)V

    .line 1313
    :try_start_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-interface {v0, v2, v1}, Landroid/hardware/usb/IUsbManager;->clearDefaults(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1317
    :goto_1
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    invoke-virtual {v0, v2, v4}, Landroid/appwidget/AppWidgetManager;->setBindAppWidgetPermission(Ljava/lang/String;Z)V

    .line 1318
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v1, 0x7f080094

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1320
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    const v2, 0x7f080095

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1321
    invoke-direct {p0, v0, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->resetLaunchDefaultsUi(Landroid/widget/TextView;Landroid/widget/TextView;)V

    goto :goto_0

    .line 1314
    :catch_0
    move-exception v0

    .line 1315
    const-string v1, "InstalledAppDetails"

    const-string v3, "mUsbManager.clearDefaults"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1322
    :cond_7
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_9

    .line 1323
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    if-eqz v2, :cond_8

    .line 1324
    invoke-static {}, Lcom/jellybyn/settings/Utils;->isMonkeyRunning()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1325
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1326
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->manageSpaceActivityName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1328
    invoke-virtual {p0, v1, v0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 1331
    :cond_8
    invoke-direct {p0, v1, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto/16 :goto_0

    .line 1333
    :cond_9
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    if-ne p1, v3, :cond_b

    .line 1335
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;

    if-nez v0, :cond_a

    .line 1336
    new-instance v0, Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;

    .line 1338
    :cond_a
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$ClearCacheObserver;

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->deleteApplicationCacheFiles(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;)V

    goto/16 :goto_0

    .line 1339
    :cond_b
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    if-ne p1, v2, :cond_c

    .line 1340
    const/4 v0, 0x5

    invoke-direct {p0, v0, v4}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->showDialogInner(II)V

    goto/16 :goto_0

    .line 1342
    :cond_c
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    if-ne p1, v2, :cond_0

    .line 1343
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;

    if-nez v2, :cond_d

    .line 1344
    new-instance v2, Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;

    invoke-direct {v2, p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;-><init>(Lcom/jellybyn/settings/applications/InstalledAppDetails;)V

    iput-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;

    .line 1346
    :cond_d
    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x40000

    and-int/2addr v2, v3

    if-eqz v2, :cond_e

    move v0, v1

    .line 1348
    :cond_e
    iput-boolean v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveInProgress:Z

    .line 1349
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshButtons()V

    .line 1350
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageMoveObserver:Lcom/jellybyn/settings/applications/InstalledAppDetails$PackageMoveObserver;

    invoke-virtual {v1, v2, v3, v0}, Landroid/content/pm/PackageManager;->movePackage(Ljava/lang/String;Landroid/content/pm/IPackageMoveObserver;I)V

    goto/16 :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 405
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 407
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-static {v1}, Lcom/jellybyn/settings/applications/ApplicationsState;->getInstance(Landroid/app/Application;)Lcom/jellybyn/settings/applications/ApplicationsState;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    .line 408
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mState:Lcom/jellybyn/settings/applications/ApplicationsState;

    invoke-virtual {v1, p0}, Lcom/jellybyn/settings/applications/ApplicationsState;->newSession(Lcom/jellybyn/settings/applications/ApplicationsState$Callbacks;)Lcom/jellybyn/settings/applications/ApplicationsState$Session;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSession:Lcom/jellybyn/settings/applications/ApplicationsState$Session;

    .line 409
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPm:Landroid/content/pm/PackageManager;

    .line 410
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    .line 411
    const-string v1, "usb"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 412
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Landroid/hardware/usb/IUsbManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/usb/IUsbManager;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUsbManager:Landroid/hardware/usb/IUsbManager;

    .line 413
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    .line 414
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "device_policy"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    .line 415
    const-string v1, "isms"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSmsManager:Lcom/android/internal/telephony/ISms;

    .line 417
    new-instance v1, Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;

    invoke-direct {v1}, Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;-><init>()V

    iput-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCanBeOnSdCardChecker:Lcom/jellybyn/settings/applications/CanBeOnSdCardChecker;

    .line 420
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSession:Lcom/jellybyn/settings/applications/ApplicationsState$Session;

    invoke-virtual {v1}, Lcom/jellybyn/settings/applications/ApplicationsState$Session;->resume()V

    .line 422
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->retrieveAppEntry()Ljava/lang/String;

    .line 424
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setHasOptionsMenu(Z)V

    .line 425
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 484
    const v0, 0x7f0b03ff

    invoke-interface {p1, v1, v2, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 486
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v8, 0x7f08015c

    const v7, 0x7f08015b

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 430
    const v3, 0x7f040037

    invoke-virtual {p1, v3, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 431
    .local v2, "view":Landroid/view/View;
    invoke-static {p2, v2, v2, v5}, Lcom/jellybyn/settings/Utils;->prepareCustomPreferencesList(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Z)V

    .line 433
    iput-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mRootView:Landroid/view/View;

    .line 434
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0b0436

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mComputingStr:Ljava/lang/CharSequence;

    .line 437
    const v3, 0x7f080084

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mTotalSize:Landroid/widget/TextView;

    .line 438
    const v3, 0x7f080086

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppSize:Landroid/widget/TextView;

    .line 439
    const v3, 0x7f08008b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDataSize:Landroid/widget/TextView;

    .line 440
    const v3, 0x7f080088

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    .line 441
    const v3, 0x7f08008d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    .line 443
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 444
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalCodeSize:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 445
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mExternalDataSize:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 449
    :cond_0
    const v3, 0x7f08007f

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 450
    .local v0, "btnPanel":Landroid/view/View;
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    .line 451
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    const v4, 0x7f0b03f8

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 452
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUninstallButton:Landroid/widget/Button;

    .line 453
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mForceStopButton:Landroid/widget/Button;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 456
    const v3, 0x7f080080

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    .line 457
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 458
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSpecialDisableButton:Landroid/widget/Button;

    .line 459
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoreControlButtons:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 462
    const v3, 0x7f08008e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 463
    .local v1, "data_buttons_panel":Landroid/view/View;
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearDataButton:Landroid/widget/Button;

    .line 464
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mMoveAppButton:Landroid/widget/Button;

    .line 467
    const v3, 0x7f080092

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mCacheSize:Landroid/widget/TextView;

    .line 468
    const v3, 0x7f080093

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mClearCacheButton:Landroid/widget/Button;

    .line 470
    const v3, 0x7f080096

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mActivitiesButton:Landroid/widget/Button;

    .line 473
    const v3, 0x7f080097

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mScreenCompatSection:Landroid/view/View;

    .line 474
    const v3, 0x7f080098

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAskCompatibilityCB:Landroid/widget/CheckBox;

    .line 475
    const v3, 0x7f080099

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mEnableCompatibilityCB:Landroid/widget/CheckBox;

    .line 477
    const v3, 0x7f080081

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CompoundButton;

    iput-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mNotificationSwitch:Landroid/widget/CompoundButton;

    .line 479
    return-object v2
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 509
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 510
    .local v0, "menuId":I
    if-ne v0, v1, :cond_0

    .line 511
    iget-object v3, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v3, v1, v2}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->uninstallPkg(Ljava/lang/String;ZZ)V

    .line 514
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public onPackageIconChanged()V
    .locals 0

    .prologue
    .line 586
    return-void
.end method

.method public onPackageListChanged()V
    .locals 0

    .prologue
    .line 590
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshUi()Z

    .line 591
    return-void
.end method

.method public onPackageSizeChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 599
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 600
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshSizeInfo()V

    .line 602
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 576
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 577
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSession:Lcom/jellybyn/settings/applications/ApplicationsState$Session;

    invoke-virtual {v0}, Lcom/jellybyn/settings/applications/ApplicationsState$Session;->pause()V

    .line 578
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 490
    const/4 v0, 0x1

    .line 491
    .local v0, "showIt":Z
    iget-boolean v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUpdatedSysApp:Z

    if-eqz v1, :cond_1

    .line 492
    const/4 v0, 0x0

    .line 504
    :cond_0
    :goto_0
    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 505
    return-void

    .line 493
    :cond_1
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    if-nez v1, :cond_2

    .line 494
    const/4 v0, 0x0

    goto :goto_0

    .line 495
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mAppEntry:Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    .line 496
    const/4 v0, 0x0

    goto :goto_0

    .line 497
    :cond_3
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v2, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 498
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    .line 499
    :cond_5
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-eqz v1, :cond_6

    .line 500
    const/4 v0, 0x0

    goto :goto_0

    .line 501
    :cond_6
    iget-object v1, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v1}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 502
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
            "Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 595
    .local p1, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;>;"
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 566
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 568
    iget-object v0, p0, Lcom/jellybyn/settings/applications/InstalledAppDetails;->mSession:Lcom/jellybyn/settings/applications/ApplicationsState$Session;

    invoke-virtual {v0}, Lcom/jellybyn/settings/applications/ApplicationsState$Session;->resume()V

    .line 569
    invoke-direct {p0}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->refreshUi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 570
    invoke-direct {p0, v1, v1}, Lcom/jellybyn/settings/applications/InstalledAppDetails;->setIntentAndFinish(ZZ)V

    .line 572
    :cond_0
    return-void
.end method

.method public onRunningStateChanged(Z)V
    .locals 0
    .param p1, "running"    # Z

    .prologue
    .line 606
    return-void
.end method
