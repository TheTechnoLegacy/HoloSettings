.class public Lcom/androie/settings/applications/ManageApplications;
.super Landroid/app/Fragment;
.source "ManageApplications.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Lcom/androie/settings/applications/AppClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;,
        Lcom/androie/settings/applications/ManageApplications$MyPagerAdapter;,
        Lcom/androie/settings/applications/ManageApplications$TabInfo;
    }
.end annotation


# instance fields
.field private mActivityResumed:Z

.field private mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

.field private mComputingSizeStr:Ljava/lang/CharSequence;

.field private final mContainerConnection:Landroid/content/ServiceConnection;

.field private volatile mContainerService:Lcom/android/internal/app/IMediaContainerService;

.field private mContentContainer:Landroid/view/ViewGroup;

.field mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

.field private mCurrentPkgName:Ljava/lang/String;

.field private mDefaultListType:I

.field private mInflater:Landroid/view/LayoutInflater;

.field mInvalidSizeStr:Ljava/lang/CharSequence;

.field private mNumTabs:I

.field private mOptionsMenu:Landroid/view/Menu;

.field mResetDialog:Landroid/app/AlertDialog;

.field private mRootView:Landroid/view/View;

.field private mShowBackground:Z

.field private mSortOrder:I

.field private final mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/ManageApplications$TabInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 137
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 174
    const/4 v0, 0x4

    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    .line 435
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    .line 437
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 459
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    .line 461
    const/4 v0, -0x1

    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mDefaultListType:I

    .line 1260
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/ManageApplications$2;-><init>(Lcom/androie/settings/applications/ManageApplications;)V

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mContainerConnection:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/applications/ManageApplications;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget v0, p0, Lcom/androie/settings/applications/ManageApplications;->mNumTabs:I

    return v0
.end method

.method static synthetic access$100(Lcom/androie/settings/applications/ManageApplications;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/androie/settings/applications/ManageApplications;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mCurrentPkgName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/androie/settings/applications/ManageApplications;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-boolean v0, p0, Lcom/androie/settings/applications/ManageApplications;->mActivityResumed:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/androie/settings/applications/ManageApplications;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget v0, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    return v0
.end method

.method static synthetic access$1400(Lcom/androie/settings/applications/ManageApplications;)Lcom/android/internal/app/IMediaContainerService;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    return-object v0
.end method

.method static synthetic access$1402(Lcom/androie/settings/applications/ManageApplications;Lcom/android/internal/app/IMediaContainerService;)Lcom/android/internal/app/IMediaContainerService;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;
    .param p1, "x1"    # Lcom/android/internal/app/IMediaContainerService;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/androie/settings/applications/ManageApplications;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    return-object p1
.end method

.method static synthetic access$200(Lcom/androie/settings/applications/ManageApplications;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/applications/ManageApplications;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mContentContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$400(Lcom/androie/settings/applications/ManageApplications;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/ManageApplications;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mRootView:Landroid/view/View;

    return-object v0
.end method

.method private startApplicationDetailsActivity()V
    .locals 7

    .prologue
    .line 1032
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 1033
    const-string v0, "package"

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurrentPkgName:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1035
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 1036
    const-class v1, Lcom/androie/settings/applications/InstalledAppDetails;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f080758

    const/4 v4, 0x0

    const/4 v6, 0x1

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 1038
    return-void
.end method

.method private updateNumTabs()V
    .locals 2

    .prologue
    .line 1010
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {v1}, Lcom/androie/settings/applications/ApplicationsState;->haveDisabledApps()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1011
    .local v0, "newNum":I
    :goto_0
    iget v1, p0, Lcom/androie/settings/applications/ManageApplications;->mNumTabs:I

    if-eq v0, v1, :cond_0

    .line 1012
    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mNumTabs:I

    .line 1013
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_0

    .line 1014
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->notifyDataSetChanged()V

    .line 1017
    :cond_0
    return-void

    .line 1010
    .end local v0    # "newNum":I
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    goto :goto_0
.end method


# virtual methods
.method buildResetDialog()V
    .locals 3

    .prologue
    .line 1105
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_0

    .line 1106
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1107
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f08077c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1108
    const v1, 0x7f08077d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1109
    const v1, 0x7f08077e

    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1110
    const v1, 0x7f080458

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1111
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    .line 1112
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1114
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1004
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mCurrentPkgName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1005
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurrentPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/ApplicationsState;->requestSize(Ljava/lang/String;)V

    .line 1007
    :cond_0
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1126
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    if-ne v0, p1, :cond_0

    .line 1127
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1128
    .local v2, "pm":Landroid/content/pm/PackageManager;
    const-string v0, "package"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v4

    .line 1130
    .local v4, "mIPm":Landroid/content/pm/IPackageManager;
    const-string v0, "notification"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v3

    .line 1132
    .local v3, "nm":Landroid/app/INotificationManager;
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/net/NetworkPolicyManager;->from(Landroid/content/Context;)Landroid/net/NetworkPolicyManager;

    move-result-object v6

    .line 1133
    .local v6, "npm":Landroid/net/NetworkPolicyManager;
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "appops"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/AppOpsManager;

    .line 1135
    .local v5, "aom":Landroid/app/AppOpsManager;
    new-instance v7, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v7, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1136
    .local v7, "handler":Landroid/os/Handler;
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/androie/settings/applications/ManageApplications$1;-><init>(Lcom/androie/settings/applications/ManageApplications;Landroid/content/pm/PackageManager;Landroid/app/INotificationManager;Landroid/content/pm/IPackageManager;Landroid/app/AppOpsManager;Landroid/net/NetworkPolicyManager;Landroid/os/Handler;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/ManageApplications$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1193
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    .end local v3    # "nm":Landroid/app/INotificationManager;
    .end local v4    # "mIPm":Landroid/content/pm/IPackageManager;
    .end local v5    # "aom":Landroid/app/AppOpsManager;
    .end local v6    # "npm":Landroid/net/NetworkPolicyManager;
    .end local v7    # "handler":Landroid/os/Handler;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    .prologue
    const/4 v5, -0x1

    const/4 v7, 0x3

    const/4 v4, 0x0

    const/4 v8, 0x1

    .line 827
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 829
    invoke-virtual {p0, v8}, Lcom/androie/settings/applications/ManageApplications;->setHasOptionsMenu(Z)V

    .line 831
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/applications/ApplicationsState;->getInstance(Landroid/app/Application;)Lcom/androie/settings/applications/ApplicationsState;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    .line 832
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 833
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    .line 835
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "classname"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 837
    :goto_0
    if-nez v0, :cond_0

    .line 838
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 840
    :cond_0
    const-class v1, Lcom/androie/settings/Settings$RunningServicesActivity;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, ".RunningServices"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_1
    move v1, v8

    .line 853
    :goto_1
    if-eqz p1, :cond_8

    .line 854
    const-string v0, "sortOrder"

    iget v2, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    .line 855
    const-string v0, "defaultListType"

    invoke-virtual {p1, v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 856
    if-eq v0, v5, :cond_7

    .line 857
    :goto_2
    const-string v1, "showBackground"

    invoke-virtual {p1, v1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    .line 860
    :goto_3
    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mDefaultListType:I

    .line 862
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Lcom/androie/settings/deviceinfo/StorageMeasurement;->DEFAULT_CONTAINER_COMPONENT:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    .line 864
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mContainerConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v0, v2, v8}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 866
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807a1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mInvalidSizeStr:Ljava/lang/CharSequence;

    .line 867
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0807a0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mComputingSizeStr:Ljava/lang/CharSequence;

    .line 869
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v3, 0x7f080784

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/applications/ManageApplications$TabInfo;-><init>(Lcom/androie/settings/applications/ManageApplications;Lcom/androie/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/androie/settings/applications/AppClickListener;Landroid/os/Bundle;)V

    .line 872
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 874
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v0

    if-nez v0, :cond_2

    .line 875
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v3, 0x7f080786

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    move-object v1, p0

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/applications/ManageApplications$TabInfo;-><init>(Lcom/androie/settings/applications/ManageApplications;Lcom/androie/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/androie/settings/applications/AppClickListener;Landroid/os/Bundle;)V

    .line 878
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 881
    :cond_2
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v3, 0x7f080785

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move v4, v8

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/applications/ManageApplications$TabInfo;-><init>(Lcom/androie/settings/applications/ManageApplications;Lcom/androie/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/androie/settings/applications/AppClickListener;Landroid/os/Bundle;)V

    .line 884
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 886
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v3, 0x7f080782

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move v4, v7

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/applications/ManageApplications$TabInfo;-><init>(Lcom/androie/settings/applications/ManageApplications;Lcom/androie/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/androie/settings/applications/AppClickListener;Landroid/os/Bundle;)V

    .line 889
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 891
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mApplicationsState:Lcom/androie/settings/applications/ApplicationsState;

    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v3, 0x7f080783

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    move-object v1, p0

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/androie/settings/applications/ManageApplications$TabInfo;-><init>(Lcom/androie/settings/applications/ManageApplications;Lcom/androie/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/androie/settings/applications/AppClickListener;Landroid/os/Bundle;)V

    .line 894
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 896
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mNumTabs:I

    .line 897
    return-void

    .line 835
    :cond_3
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 843
    :cond_4
    const-class v1, Lcom/androie/settings/Settings$StorageUseActivity;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "android.intent.action.MANAGE_PACKAGE_STORAGE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, ".StorageUse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 846
    :cond_5
    const/4 v0, 0x5

    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    move v1, v7

    .line 847
    goto/16 :goto_1

    .line 848
    :cond_6
    const-string v0, "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    move v1, v7

    .line 850
    goto/16 :goto_1

    :cond_7
    move v0, v1

    goto/16 :goto_2

    :cond_8
    move v0, v1

    goto/16 :goto_3

    :cond_9
    move v1, v4

    goto/16 :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1042
    iput-object p1, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    .line 1045
    const v0, 0x7f080777

    invoke-interface {p1, v3, v6, v4, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 1048
    const/4 v0, 0x5

    const/4 v1, 0x2

    const v2, 0x7f080778

    invoke-interface {p1, v3, v0, v1, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 1051
    const/4 v0, 0x6

    const v1, 0x7f080779

    invoke-interface {p1, v3, v0, v5, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 1053
    const/4 v0, 0x7

    const v1, 0x7f08077a

    invoke-interface {p1, v3, v0, v5, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 1055
    const/16 v0, 0x8

    const v1, 0x7f08077b

    invoke-interface {p1, v3, v0, v6, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 1057
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->updateOptionsMenu()V

    .line 1058
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 902
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v5

    invoke-virtual {p2, v5}, Landroid/view/ViewGroup;->setLayoutDirection(I)V

    .line 904
    iput-object p1, p0, Lcom/androie/settings/applications/ManageApplications;->mInflater:Landroid/view/LayoutInflater;

    .line 906
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mInflater:Landroid/view/LayoutInflater;

    const v6, 0x7f040061

    const/4 v7, 0x0

    invoke-virtual {v5, v6, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 908
    .local v2, "rootView":Landroid/view/View;
    iput-object p2, p0, Lcom/androie/settings/applications/ManageApplications;->mContentContainer:Landroid/view/ViewGroup;

    .line 909
    iput-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mRootView:Landroid/view/View;

    .line 911
    const v5, 0x7f0c0018

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager;

    iput-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 912
    new-instance v0, Lcom/androie/settings/applications/ManageApplications$MyPagerAdapter;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/ManageApplications$MyPagerAdapter;-><init>(Lcom/androie/settings/applications/ManageApplications;)V

    .line 913
    .local v0, "adapter":Lcom/androie/settings/applications/ManageApplications$MyPagerAdapter;
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v0}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 914
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 915
    const v5, 0x7f0c0019

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/PagerTabStrip;

    .line 916
    .local v4, "tabs":Landroid/support/v4/view/PagerTabStrip;
    const v5, 0x1060012

    invoke-virtual {v4, v5}, Landroid/support/v4/view/PagerTabStrip;->setTabIndicatorColorResource(I)V

    .line 920
    instance-of v5, p2, Landroid/preference/PreferenceFrameLayout;

    if-eqz v5, :cond_0

    .line 921
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/preference/PreferenceFrameLayout$LayoutParams;

    const/4 v6, 0x1

    iput-boolean v6, v5, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 924
    :cond_0
    if-eqz p3, :cond_1

    const-string v5, "resetDialog"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 925
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->buildResetDialog()V

    .line 928
    :cond_1
    if-nez p3, :cond_3

    .line 930
    invoke-virtual {p2}, Landroid/view/ViewGroup;->isLayoutRtl()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 931
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 934
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_3

    .line 935
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 936
    .local v3, "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    iget v5, v3, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mListType:I

    iget v6, p0, Lcom/androie/settings/applications/ManageApplications;->mDefaultListType:I

    if-ne v5, v6, :cond_4

    .line 937
    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 943
    .end local v1    # "i":I
    .end local v3    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_3
    return-object v2

    .line 934
    .restart local v1    # "i":I
    .restart local v3    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 1072
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mContainerConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1073
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 1074
    return-void
.end method

.method public onDestroyOptionsMenu()V
    .locals 1

    .prologue
    .line 1067
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    .line 1068
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 993
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 997
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 998
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-virtual {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->detachView()V

    .line 997
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1000
    :cond_0
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1118
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    if-ne v0, p1, :cond_0

    .line 1119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    .line 1121
    :cond_0
    return-void
.end method

.method public onItemClick(Lcom/androie/settings/applications/ManageApplications$TabInfo;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p1, "tab"    # Lcom/androie/settings/applications/ManageApplications$TabInfo;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "position"    # I
    .param p5, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/androie/settings/applications/ManageApplications$TabInfo;",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1225
    .local p2, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->getCount()I

    move-result v1

    if-le v1, p4, :cond_0

    .line 1226
    iget-object v1, p1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v1, p4}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->getAppEntry(I)Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    move-result-object v0

    .line 1227
    .local v0, "entry":Lcom/androie/settings/applications/ApplicationsState$AppEntry;
    iget-object v1, v0, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iput-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurrentPkgName:Ljava/lang/String;

    .line 1228
    invoke-direct {p0}, Lcom/androie/settings/applications/ManageApplications;->startApplicationDetailsActivity()V

    .line 1230
    .end local v0    # "entry":Lcom/androie/settings/applications/ApplicationsState$AppEntry;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1197
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 1198
    .local v0, "menuId":I
    const/4 v3, 0x4

    if-eq v0, v3, :cond_0

    const/4 v3, 0x5

    if-ne v0, v3, :cond_3

    .line 1199
    :cond_0
    iput v0, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    .line 1200
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v1, v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v1, :cond_1

    .line 1201
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v1, v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;

    iget v3, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    invoke-virtual {v1, v3}, Lcom/androie/settings/applications/ManageApplications$ApplicationsAdapter;->rebuild(I)V

    .line 1219
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->updateOptionsMenu()V

    move v1, v2

    .line 1220
    :cond_2
    return v1

    .line 1203
    :cond_3
    const/4 v3, 0x6

    if-ne v0, v3, :cond_4

    .line 1204
    iput-boolean v1, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    .line 1205
    iget-object v3, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-static {v3}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1206
    iget-object v3, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-static {v3}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v3

    iget-object v3, v3, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    invoke-virtual {v3, v1}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->setShowBackground(Z)V

    goto :goto_0

    .line 1208
    :cond_4
    const/4 v3, 0x7

    if-ne v0, v3, :cond_5

    .line 1209
    iput-boolean v2, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    .line 1210
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1211
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    invoke-virtual {v1, v2}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->setShowBackground(Z)V

    goto :goto_0

    .line 1213
    :cond_5
    const/16 v3, 0x8

    if-ne v0, v3, :cond_2

    .line 1214
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->buildResetDialog()V

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 975
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 976
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/androie/settings/applications/ManageApplications;->mActivityResumed:Z

    .line 977
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 978
    iget-object v1, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-virtual {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->pause()V

    .line 977
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 980
    :cond_0
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1062
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->updateOptionsMenu()V

    .line 1063
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 953
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 954
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/applications/ManageApplications;->mActivityResumed:Z

    .line 955
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/applications/ManageApplications;->updateCurrentTab(I)V

    .line 956
    invoke-direct {p0}, Lcom/androie/settings/applications/ManageApplications;->updateNumTabs()V

    .line 957
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->updateOptionsMenu()V

    .line 958
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 962
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 963
    const-string v0, "sortOrder"

    iget v1, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 964
    iget v0, p0, Lcom/androie/settings/applications/ManageApplications;->mDefaultListType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 965
    const-string v0, "defaultListType"

    iget v1, p0, Lcom/androie/settings/applications/ManageApplications;->mDefaultListType:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 967
    :cond_0
    const-string v0, "showBackground"

    iget-boolean v1, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 968
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 969
    const-string v0, "resetDialog"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 971
    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 948
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 949
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 984
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 985
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 986
    iget-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 987
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/applications/ManageApplications;->mResetDialog:Landroid/app/AlertDialog;

    .line 989
    :cond_0
    return-void
.end method

.method tabForType(I)Lcom/androie/settings/applications/ManageApplications$TabInfo;
    .locals 3
    .param p1, "type"    # I

    .prologue
    .line 1020
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1021
    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 1022
    .local v1, "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    iget v2, v1, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mListType:I

    if-ne v2, p1, :cond_0

    .line 1026
    .end local v1    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :goto_1
    return-object v1

    .line 1020
    .restart local v1    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1026
    .end local v1    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public updateCurrentTab(I)V
    .locals 8
    .param p1, "position"    # I

    .prologue
    .line 1233
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 1234
    .local v3, "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    iput-object v3, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 1237
    iget-boolean v4, p0, Lcom/androie/settings/applications/ManageApplications;->mActivityResumed:Z

    if-eqz v4, :cond_1

    .line 1238
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget-object v5, p0, Lcom/androie/settings/applications/ManageApplications;->mInflater:Landroid/view/LayoutInflater;

    iget-object v6, p0, Lcom/androie/settings/applications/ManageApplications;->mContentContainer:Landroid/view/ViewGroup;

    iget-object v7, p0, Lcom/androie/settings/applications/ManageApplications;->mRootView:Landroid/view/View;

    invoke-virtual {v4, v5, v6, v7}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->build(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    .line 1239
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget v5, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    invoke-virtual {v4, v5}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->resume(I)V

    .line 1243
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 1244
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/applications/ManageApplications$TabInfo;

    .line 1245
    .local v2, "t":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    if-eq v2, v4, :cond_0

    .line 1246
    invoke-virtual {v2}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->pause()V

    .line 1243
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1241
    .end local v1    # "i":I
    .end local v2    # "t":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-virtual {v4}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->pause()V

    goto :goto_0

    .line 1250
    .restart local v1    # "i":I
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    invoke-virtual {v4}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->updateStorageUsage()V

    .line 1251
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->updateOptionsMenu()V

    .line 1252
    invoke-virtual {p0}, Lcom/androie/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1253
    .local v0, "host":Landroid/app/Activity;
    if-eqz v0, :cond_3

    .line 1254
    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 1256
    :cond_3
    return-void
.end method

.method updateOptionsMenu()V
    .locals 9

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1077
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    if-nez v4, :cond_0

    .line 1102
    :goto_0
    return-void

    .line 1085
    :cond_0
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mCurTab:Lcom/androie/settings/applications/ManageApplications$TabInfo;

    iget v4, v4, Lcom/androie/settings/applications/ManageApplications$TabInfo;->mListType:I

    if-ne v4, v3, :cond_3

    .line 1086
    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/ManageApplications;->tabForType(I)Lcom/androie/settings/applications/ManageApplications$TabInfo;

    move-result-object v1

    .line 1087
    .local v1, "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-static {v1}, Lcom/androie/settings/applications/ManageApplications$TabInfo;->access$1100(Lcom/androie/settings/applications/ManageApplications$TabInfo;)Lcom/androie/settings/applications/RunningProcessesView;

    move-result-object v4

    iget-object v4, v4, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    invoke-virtual {v4}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->getShowBackground()Z

    move-result v0

    .line 1089
    .local v0, "showingBackground":Z
    :goto_1
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1090
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1091
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1092
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    const/4 v5, 0x7

    invoke-interface {v4, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    if-nez v0, :cond_2

    :goto_2
    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1093
    iget-object v3, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    const/16 v4, 0x8

    invoke-interface {v3, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1094
    iput-boolean v0, p0, Lcom/androie/settings/applications/ManageApplications;->mShowBackground:Z

    goto :goto_0

    .end local v0    # "showingBackground":Z
    :cond_1
    move v0, v2

    .line 1087
    goto :goto_1

    .restart local v0    # "showingBackground":Z
    :cond_2
    move v3, v2

    .line 1092
    goto :goto_2

    .line 1096
    .end local v0    # "showingBackground":Z
    .end local v1    # "tab":Lcom/androie/settings/applications/ManageApplications$TabInfo;
    :cond_3
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    iget v4, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    if-eq v4, v6, :cond_4

    move v4, v3

    :goto_3
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1097
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    iget v4, p0, Lcom/androie/settings/applications/ManageApplications;->mSortOrder:I

    if-eq v4, v7, :cond_5

    move v4, v3

    :goto_4
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1098
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    invoke-interface {v4, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1099
    iget-object v4, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    const/4 v5, 0x7

    invoke-interface {v4, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1100
    iget-object v2, p0, Lcom/androie/settings/applications/ManageApplications;->mOptionsMenu:Landroid/view/Menu;

    const/16 v4, 0x8

    invoke-interface {v2, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    :cond_4
    move v4, v2

    .line 1096
    goto :goto_3

    :cond_5
    move v4, v2

    .line 1097
    goto :goto_4
.end method
