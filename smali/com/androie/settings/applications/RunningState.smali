.class public Lcom/androie/settings/applications/RunningState;
.super Ljava/lang/Object;
.source "RunningState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;,
        Lcom/androie/settings/applications/RunningState$MergedItem;,
        Lcom/androie/settings/applications/RunningState$ProcessItem;,
        Lcom/androie/settings/applications/RunningState$ServiceItem;,
        Lcom/androie/settings/applications/RunningState$BaseItem;,
        Lcom/androie/settings/applications/RunningState$UserState;,
        Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;,
        Lcom/androie/settings/applications/RunningState$BackgroundHandler;,
        Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    }
.end annotation


# static fields
.field static sGlobalLock:Ljava/lang/Object;

.field static sInstance:Lcom/androie/settings/applications/RunningState;


# instance fields
.field final mAllProcessItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;"
        }
    .end annotation
.end field

.field final mAm:Landroid/app/ActivityManager;

.field final mApplicationContext:Landroid/content/Context;

.field final mBackgroundComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field final mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

.field mBackgroundItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field mBackgroundProcessMemory:J

.field final mBackgroundThread:Landroid/os/HandlerThread;

.field mForegroundProcessMemory:J

.field final mHandler:Landroid/os/Handler;

.field mHaveData:Z

.field final mInterestingConfigChanges:Lcom/androie/settings/applications/InterestingConfigChanges;

.field final mInterestingProcesses:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;"
        }
    .end annotation
.end field

.field mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$BaseItem;",
            ">;"
        }
    .end annotation
.end field

.field final mLock:Ljava/lang/Object;

.field mMergedItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field final mMyUserId:I

.field mNumBackgroundProcesses:I

.field mNumForegroundProcesses:I

.field mNumServiceProcesses:I

.field final mOtherUserBackgroundItems:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field final mOtherUserMergedItems:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field final mPm:Landroid/content/pm/PackageManager;

.field final mProcessItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;"
        }
    .end annotation
.end field

.field mRefreshUiListener:Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;

.field mResumed:Z

.field final mRunningProcesses:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;"
        }
    .end annotation
.end field

.field mSequence:I

.field final mServiceProcessComparator:Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;

.field mServiceProcessMemory:J

.field final mServiceProcessesByName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;>;"
        }
    .end annotation
.end field

.field final mServiceProcessesByPid:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$ProcessItem;",
            ">;"
        }
    .end annotation
.end field

.field final mTmpAppProcesses:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$AppProcessInfo;",
            ">;"
        }
    .end annotation
.end field

.field final mUm:Landroid/os/UserManager;

.field mUserBackgroundItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation
.end field

.field final mUsers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$UserState;",
            ">;"
        }
    .end annotation
.end field

.field mWatchingBackgroundItems:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/androie/settings/applications/RunningState;->sGlobalLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 732
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Lcom/androie/settings/applications/InterestingConfigChanges;

    invoke-direct {v0}, Lcom/androie/settings/applications/InterestingConfigChanges;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mInterestingConfigChanges:Lcom/androie/settings/applications/InterestingConfigChanges;

    .line 88
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    .line 93
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    .line 97
    new-instance v0, Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;-><init>(Lcom/androie/settings/applications/RunningState;)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mServiceProcessComparator:Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    .line 105
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    .line 116
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mOtherUserMergedItems:Landroid/util/SparseArray;

    .line 120
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mOtherUserBackgroundItems:Landroid/util/SparseArray;

    .line 123
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mUsers:Landroid/util/SparseArray;

    .line 136
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    .line 138
    iput v2, p0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    .line 140
    new-instance v0, Lcom/androie/settings/applications/RunningState$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/RunningState$1;-><init>(Lcom/androie/settings/applications/RunningState;)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundComparator:Ljava/util/Comparator;

    .line 201
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    .line 207
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mItems:Ljava/util/ArrayList;

    .line 208
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mMergedItems:Ljava/util/ArrayList;

    .line 209
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    .line 210
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mUserBackgroundItems:Ljava/util/ArrayList;

    .line 252
    new-instance v0, Lcom/androie/settings/applications/RunningState$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/RunningState$2;-><init>(Lcom/androie/settings/applications/RunningState;)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mHandler:Landroid/os/Handler;

    .line 733
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mApplicationContext:Landroid/content/Context;

    .line 734
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mApplicationContext:Landroid/content/Context;

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mAm:Landroid/app/ActivityManager;

    .line 735
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mPm:Landroid/content/pm/PackageManager;

    .line 736
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mApplicationContext:Landroid/content/Context;

    const-string v1, "user"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mUm:Landroid/os/UserManager;

    .line 737
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    .line 738
    iput-boolean v2, p0, Lcom/androie/settings/applications/RunningState;->mResumed:Z

    .line 739
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "RunningState:Background"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundThread:Landroid/os/HandlerThread;

    .line 740
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 741
    new-instance v0, Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;-><init>(Lcom/androie/settings/applications/RunningState;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    .line 742
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/applications/RunningState;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/RunningState;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/androie/settings/applications/RunningState;->reset()V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/applications/RunningState;Landroid/content/Context;Landroid/app/ActivityManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/applications/RunningState;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Landroid/app/ActivityManager;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/applications/RunningState;->update(Landroid/content/Context;Landroid/app/ActivityManager;)Z

    move-result v0

    return v0
.end method

.method private addOtherUserItem(Landroid/content/Context;Ljava/util/ArrayList;Landroid/util/SparseArray;Lcom/androie/settings/applications/RunningState$MergedItem;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p4, "newItem"    # Lcom/androie/settings/applications/RunningState$MergedItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "newMergedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .local p3, "userItems":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 819
    iget v4, p4, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-virtual {p3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 820
    .local v3, "userItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    if-eqz v3, :cond_0

    iget v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mCurSeq:I

    iget v7, p0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    if-eq v4, v7, :cond_5

    :cond_0
    move v0, v6

    .line 821
    .local v0, "first":Z
    :goto_0
    if-eqz v0, :cond_4

    .line 822
    if-nez v3, :cond_6

    .line 823
    new-instance v3, Lcom/androie/settings/applications/RunningState$MergedItem;

    .end local v3    # "userItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    iget v4, p4, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-direct {v3, v4}, Lcom/androie/settings/applications/RunningState$MergedItem;-><init>(I)V

    .line 824
    .restart local v3    # "userItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    iget v4, p4, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-virtual {p3, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 828
    :goto_1
    iget v4, p0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    iput v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mCurSeq:I

    .line 829
    iget-object v4, p0, Lcom/androie/settings/applications/RunningState;->mUsers:Landroid/util/SparseArray;

    iget v7, p4, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-virtual {v4, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/androie/settings/applications/RunningState$UserState;

    iput-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mUser:Lcom/androie/settings/applications/RunningState$UserState;

    if-nez v4, :cond_3

    .line 830
    new-instance v4, Lcom/androie/settings/applications/RunningState$UserState;

    invoke-direct {v4}, Lcom/androie/settings/applications/RunningState$UserState;-><init>()V

    iput-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mUser:Lcom/androie/settings/applications/RunningState$UserState;

    .line 831
    iget-object v4, p0, Lcom/androie/settings/applications/RunningState;->mUm:Landroid/os/UserManager;

    iget v7, p4, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-virtual {v4, v7}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v1

    .line 832
    .local v1, "info":Landroid/content/pm/UserInfo;
    iget-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mUser:Lcom/androie/settings/applications/RunningState$UserState;

    iput-object v1, v4, Lcom/androie/settings/applications/RunningState$UserState;->mInfo:Landroid/content/pm/UserInfo;

    .line 833
    if-eqz v1, :cond_1

    .line 834
    iget-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mUser:Lcom/androie/settings/applications/RunningState$UserState;

    iget-object v7, p0, Lcom/androie/settings/applications/RunningState;->mUm:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v7, v1, v8}, Lcom/androie/settings/users/UserUtils;->getUserIcon(Landroid/os/UserManager;Landroid/content/pm/UserInfo;Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    iput-object v7, v4, Lcom/androie/settings/applications/RunningState$UserState;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 837
    :cond_1
    if-eqz v1, :cond_7

    iget-object v2, v1, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    .line 838
    .local v2, "name":Ljava/lang/String;
    :goto_2
    if-nez v2, :cond_2

    .line 839
    iget v4, v1, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 841
    :cond_2
    iget-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mUser:Lcom/androie/settings/applications/RunningState$UserState;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0807c7

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v2, v6, v5

    invoke-virtual {v7, v8, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/androie/settings/applications/RunningState$UserState;->mLabel:Ljava/lang/String;

    .line 844
    .end local v1    # "info":Landroid/content/pm/UserInfo;
    .end local v2    # "name":Ljava/lang/String;
    :cond_3
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 846
    :cond_4
    iget-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 847
    return-void

    .end local v0    # "first":Z
    :cond_5
    move v0, v5

    .line 820
    goto :goto_0

    .line 826
    .restart local v0    # "first":Z
    :cond_6
    iget-object v4, v3, Lcom/androie/settings/applications/RunningState$MergedItem;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    goto :goto_1

    .line 837
    .restart local v1    # "info":Landroid/content/pm/UserInfo;
    :cond_7
    const/4 v2, 0x0

    goto :goto_2
.end method

.method static getInstance(Landroid/content/Context;)Lcom/androie/settings/applications/RunningState;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 724
    sget-object v1, Lcom/androie/settings/applications/RunningState;->sGlobalLock:Ljava/lang/Object;

    monitor-enter v1

    .line 725
    :try_start_0
    sget-object v0, Lcom/androie/settings/applications/RunningState;->sInstance:Lcom/androie/settings/applications/RunningState;

    if-nez v0, :cond_0

    .line 726
    new-instance v0, Lcom/androie/settings/applications/RunningState;

    invoke-direct {v0, p0}, Lcom/androie/settings/applications/RunningState;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/androie/settings/applications/RunningState;->sInstance:Lcom/androie/settings/applications/RunningState;

    .line 728
    :cond_0
    sget-object v0, Lcom/androie/settings/applications/RunningState;->sInstance:Lcom/androie/settings/applications/RunningState;

    monitor-exit v1

    return-object v0

    .line 729
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private isInterestingProcess(Landroid/app/ActivityManager$RunningAppProcessInfo;)Z
    .locals 3
    .param p1, "pi"    # Landroid/app/ActivityManager$RunningAppProcessInfo;

    .prologue
    const/4 v0, 0x1

    .line 794
    iget v1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 804
    :cond_0
    :goto_0
    return v0

    .line 797
    :cond_1
    iget v1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2

    iget v1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v2, 0x64

    if-lt v1, v2, :cond_2

    iget v1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v2, 0xaa

    if-ge v1, v2, :cond_2

    iget v1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importanceReasonCode:I

    if-eqz v1, :cond_0

    .line 804
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static makeLabel(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageItemInfo;)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "pm"    # Landroid/content/pm/PackageManager;
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "item"    # Landroid/content/pm/PackageItemInfo;

    .prologue
    .line 707
    if-eqz p2, :cond_2

    iget v2, p2, Landroid/content/pm/PackageItemInfo;->labelRes:I

    if-nez v2, :cond_0

    iget-object v2, p2, Landroid/content/pm/PackageItemInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    if-eqz v2, :cond_2

    .line 709
    :cond_0
    invoke-virtual {p2, p0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 710
    .local v0, "label":Ljava/lang/CharSequence;
    if-eqz v0, :cond_2

    .line 720
    .end local v0    # "label":Ljava/lang/CharSequence;
    :cond_1
    :goto_0
    return-object v0

    .line 715
    :cond_2
    move-object v0, p1

    .line 716
    .local v0, "label":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 717
    .local v1, "tail":I
    if-ltz v1, :cond_1

    .line 718
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private reset()V
    .locals 1

    .prologue
    .line 808
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 809
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 810
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 811
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 812
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 813
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 814
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mUsers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 815
    return-void
.end method

.method private update(Landroid/content/Context;Landroid/app/ActivityManager;)Z
    .locals 64
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "am"    # Landroid/app/ActivityManager;

    .prologue
    .line 850
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v45

    .line 852
    .local v45, "pm":Landroid/content/pm/PackageManager;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v60, v0

    add-int/lit8 v60, v60, 0x1

    move/from16 v0, v60

    move-object/from16 v1, p0

    iput v0, v1, Lcom/androie/settings/applications/RunningState;->mSequence:I

    .line 854
    const/16 v17, 0x0

    .line 858
    .local v17, "changed":Z
    const/16 v60, 0x64

    move-object/from16 v0, p2

    move/from16 v1, v60

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v52

    .line 860
    .local v52, "services":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningServiceInfo;>;"
    if-eqz v52, :cond_1

    invoke-interface/range {v52 .. v52}, Ljava/util/List;->size()I

    move-result v10

    .line 861
    .local v10, "NS":I
    :goto_0
    const/16 v25, 0x0

    .local v25, "i":I
    :goto_1
    move/from16 v0, v25

    if-ge v0, v10, :cond_3

    .line 862
    move-object/from16 v0, v52

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 866
    .local v53, "si":Landroid/app/ActivityManager$RunningServiceInfo;
    move-object/from16 v0, v53

    iget-boolean v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->started:Z

    move/from16 v60, v0

    if-nez v60, :cond_2

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->clientLabel:I

    move/from16 v60, v0

    if-nez v60, :cond_2

    .line 867
    move-object/from16 v0, v52

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 868
    add-int/lit8 v25, v25, -0x1

    .line 869
    add-int/lit8 v10, v10, -0x1

    .line 861
    :cond_0
    :goto_2
    add-int/lit8 v25, v25, 0x1

    goto :goto_1

    .line 860
    .end local v10    # "NS":I
    .end local v25    # "i":I
    .end local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_1
    const/4 v10, 0x0

    goto :goto_0

    .line 874
    .restart local v10    # "NS":I
    .restart local v25    # "i":I
    .restart local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_2
    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->flags:I

    move/from16 v60, v0

    and-int/lit8 v60, v60, 0x8

    if-eqz v60, :cond_0

    .line 876
    move-object/from16 v0, v52

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 877
    add-int/lit8 v25, v25, -0x1

    .line 878
    add-int/lit8 v10, v10, -0x1

    .line 879
    goto :goto_2

    .line 885
    .end local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v47

    .line 887
    .local v47, "processes":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v47, :cond_4

    invoke-interface/range {v47 .. v47}, Ljava/util/List;->size()I

    move-result v8

    .line 888
    .local v8, "NP":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->clear()V

    .line 889
    const/16 v25, 0x0

    :goto_4
    move/from16 v0, v25

    if-ge v0, v8, :cond_5

    .line 890
    move-object/from16 v0, v47

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 891
    .local v41, "pi":Landroid/app/ActivityManager$RunningAppProcessInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v61, v0

    new-instance v62, Lcom/androie/settings/applications/RunningState$AppProcessInfo;

    move-object/from16 v0, v62

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState$AppProcessInfo;-><init>(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    invoke-virtual/range {v60 .. v62}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 889
    add-int/lit8 v25, v25, 0x1

    goto :goto_4

    .line 887
    .end local v8    # "NP":I
    .end local v41    # "pi":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_4
    const/4 v8, 0x0

    goto :goto_3

    .line 896
    .restart local v8    # "NP":I
    :cond_5
    const/16 v25, 0x0

    :goto_5
    move/from16 v0, v25

    if-ge v0, v10, :cond_7

    .line 897
    move-object/from16 v0, v52

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 898
    .restart local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    move-object/from16 v0, v53

    iget-wide v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->restarting:J

    move-wide/from16 v60, v0

    const-wide/16 v62, 0x0

    cmp-long v60, v60, v62

    if-nez v60, :cond_6

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    move/from16 v60, v0

    if-lez v60, :cond_6

    .line 899
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;

    .line 900
    .local v12, "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    if-eqz v12, :cond_6

    .line 901
    const/16 v60, 0x1

    move/from16 v0, v60

    iput-boolean v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->hasServices:Z

    .line 902
    move-object/from16 v0, v53

    iget-boolean v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->foreground:Z

    move/from16 v60, v0

    if-eqz v60, :cond_6

    .line 903
    const/16 v60, 0x1

    move/from16 v0, v60

    iput-boolean v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->hasForegroundServices:Z

    .line 896
    .end local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    :cond_6
    add-int/lit8 v25, v25, 0x1

    goto :goto_5

    .line 910
    .end local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_7
    const/16 v25, 0x0

    :goto_6
    move/from16 v0, v25

    if-ge v0, v10, :cond_13

    .line 911
    move-object/from16 v0, v52

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 918
    .restart local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    move-object/from16 v0, v53

    iget-wide v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->restarting:J

    move-wide/from16 v60, v0

    const-wide/16 v62, 0x0

    cmp-long v60, v60, v62

    if-nez v60, :cond_b

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    move/from16 v60, v0

    if-lez v60, :cond_b

    .line 919
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;

    .line 920
    .restart local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    if-eqz v12, :cond_b

    iget-boolean v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->hasForegroundServices:Z

    move/from16 v60, v0

    if-nez v60, :cond_b

    .line 926
    iget-object v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->info:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    move/from16 v60, v0

    const/16 v61, 0x12c

    move/from16 v0, v60

    move/from16 v1, v61

    if-ge v0, v1, :cond_b

    .line 930
    const/16 v55, 0x0

    .line 931
    .local v55, "skip":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    iget-object v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->info:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v61, v0

    move-object/from16 v0, v61

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importanceReasonPid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    check-cast v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;

    .line 932
    .restart local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    :goto_7
    if-eqz v12, :cond_9

    .line 933
    iget-boolean v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->hasServices:Z

    move/from16 v60, v0

    if-nez v60, :cond_8

    iget-object v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->info:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v60

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState;->isInterestingProcess(Landroid/app/ActivityManager$RunningAppProcessInfo;)Z

    move-result v60

    if-eqz v60, :cond_a

    .line 934
    :cond_8
    const/16 v55, 0x1

    .line 939
    :cond_9
    if-eqz v55, :cond_b

    .line 910
    .end local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    .end local v55    # "skip":Z
    :goto_8
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_6

    .line 937
    .restart local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    .restart local v55    # "skip":Z
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mTmpAppProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    iget-object v0, v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;->info:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v61, v0

    move-object/from16 v0, v61

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importanceReasonPid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    check-cast v12, Lcom/androie/settings/applications/RunningState$AppProcessInfo;

    .restart local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    goto :goto_7

    .line 946
    .end local v12    # "ainfo":Lcom/androie/settings/applications/RunningState$AppProcessInfo;
    .end local v55    # "skip":Z
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->uid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/util/HashMap;

    .line 947
    .local v48, "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    if-nez v48, :cond_c

    .line 948
    new-instance v48, Ljava/util/HashMap;

    .end local v48    # "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    invoke-direct/range {v48 .. v48}, Ljava/util/HashMap;-><init>()V

    .line 949
    .restart local v48    # "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->uid:I

    move/from16 v61, v0

    move-object/from16 v0, v60

    move/from16 v1, v61

    move-object/from16 v2, v48

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 951
    :cond_c
    move-object/from16 v0, v53

    iget-object v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->process:Ljava/lang/String;

    move-object/from16 v60, v0

    move-object/from16 v0, v48

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 952
    .local v46, "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    if-nez v46, :cond_d

    .line 953
    const/16 v17, 0x1

    .line 954
    new-instance v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->uid:I

    move/from16 v60, v0

    move-object/from16 v0, v53

    iget-object v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->process:Ljava/lang/String;

    move-object/from16 v61, v0

    move-object/from16 v0, v46

    move-object/from16 v1, p1

    move/from16 v2, v60

    move-object/from16 v3, v61

    invoke-direct {v0, v1, v2, v3}, Lcom/androie/settings/applications/RunningState$ProcessItem;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    .line 955
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v53

    iget-object v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->process:Ljava/lang/String;

    move-object/from16 v60, v0

    move-object/from16 v0, v48

    move-object/from16 v1, v60

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 958
    :cond_d
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_11

    .line 959
    move-object/from16 v0, v53

    iget-wide v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->restarting:J

    move-wide/from16 v60, v0

    const-wide/16 v62, 0x0

    cmp-long v60, v60, v62

    if-nez v60, :cond_12

    move-object/from16 v0, v53

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    move/from16 v42, v0

    .line 960
    .local v42, "pid":I
    :goto_9
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    move/from16 v0, v42

    move/from16 v1, v60

    if-eq v0, v1, :cond_10

    .line 961
    const/16 v17, 0x1

    .line 962
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    move/from16 v0, v60

    move/from16 v1, v42

    if-eq v0, v1, :cond_10

    .line 963
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    if-eqz v60, :cond_e

    .line 964
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->remove(I)V

    .line 966
    :cond_e
    if-eqz v42, :cond_f

    .line 967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v42

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 969
    :cond_f
    move/from16 v0, v42

    move-object/from16 v1, v46

    iput v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    .line 972
    :cond_10
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mDependentProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->clear()V

    .line 973
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v60, v0

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    .line 975
    .end local v42    # "pid":I
    :cond_11
    move-object/from16 v0, v46

    move-object/from16 v1, p1

    move-object/from16 v2, v53

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$ProcessItem;->updateService(Landroid/content/Context;Landroid/app/ActivityManager$RunningServiceInfo;)Z

    move-result v60

    or-int v17, v17, v60

    goto/16 :goto_8

    .line 959
    :cond_12
    const/16 v42, 0x0

    goto :goto_9

    .line 980
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    .end local v48    # "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    .end local v53    # "si":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_13
    const/16 v25, 0x0

    :goto_a
    move/from16 v0, v25

    if-ge v0, v8, :cond_18

    .line 981
    move-object/from16 v0, v47

    move/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 982
    .restart local v41    # "pi":Landroid/app/ActivityManager$RunningAppProcessInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 983
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    if-nez v46, :cond_15

    .line 987
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v46

    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 988
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    if-nez v46, :cond_14

    .line 989
    const/16 v17, 0x1

    .line 990
    new-instance v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    move/from16 v60, v0

    move-object/from16 v0, v41

    iget-object v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    move-object/from16 v61, v0

    move-object/from16 v0, v46

    move-object/from16 v1, p1

    move/from16 v2, v60

    move-object/from16 v3, v61

    invoke-direct {v0, v1, v2, v3}, Lcom/androie/settings/applications/RunningState$ProcessItem;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    .line 991
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v60, v0

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    .line 992
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v61, v0

    move-object/from16 v0, v60

    move/from16 v1, v61

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 994
    :cond_14
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mDependentProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->clear()V

    .line 997
    :cond_15
    move-object/from16 v0, p0

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState;->isInterestingProcess(Landroid/app/ActivityManager$RunningAppProcessInfo;)Z

    move-result v60

    if-eqz v60, :cond_17

    .line 998
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v60

    if-nez v60, :cond_16

    .line 999
    const/16 v17, 0x1

    .line 1000
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1002
    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v60, v0

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    .line 1003
    const/16 v60, 0x1

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mInteresting:Z

    .line 1004
    move-object/from16 v0, v46

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/RunningState$ProcessItem;->ensureLabel(Landroid/content/pm/PackageManager;)V

    .line 1009
    :goto_b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v60, v0

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningSeq:I

    .line 1010
    move-object/from16 v0, v41

    move-object/from16 v1, v46

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 980
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_a

    .line 1006
    :cond_17
    const/16 v60, 0x0

    move/from16 v0, v60

    move-object/from16 v1, v46

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mInteresting:Z

    goto :goto_b

    .line 1015
    .end local v41    # "pi":Landroid/app/ActivityManager$RunningAppProcessInfo;
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v9

    .line 1016
    .local v9, "NRP":I
    const/16 v25, 0x0

    :goto_c
    move/from16 v0, v25

    if-ge v0, v9, :cond_1d

    .line 1017
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1018
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_1c

    .line 1019
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importanceReasonPid:I

    move/from16 v19, v0

    .line 1020
    .local v19, "clientPid":I
    if-eqz v19, :cond_1b

    .line 1021
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1022
    .local v18, "client":Lcom/androie/settings/applications/RunningState$ProcessItem;
    if-nez v18, :cond_19

    .line 1023
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v18

    .end local v18    # "client":Lcom/androie/settings/applications/RunningState$ProcessItem;
    check-cast v18, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1025
    .restart local v18    # "client":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_19
    if-eqz v18, :cond_1a

    .line 1026
    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mDependentProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v61, v0

    move-object/from16 v0, v60

    move/from16 v1, v61

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1034
    .end local v18    # "client":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_1a
    :goto_d
    add-int/lit8 v25, v25, 0x1

    .line 1035
    goto :goto_c

    .line 1032
    :cond_1b
    const/16 v60, 0x0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mClient:Lcom/androie/settings/applications/RunningState$ProcessItem;

    goto :goto_d

    .line 1036
    .end local v19    # "clientPid":I
    :cond_1c
    const/16 v17, 0x1

    .line 1037
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v61, v0

    move-object/from16 v0, v61

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v61

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->remove(I)V

    .line 1038
    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_c

    .line 1043
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 1044
    .local v7, "NHP":I
    const/16 v25, 0x0

    :goto_e
    move/from16 v0, v25

    if-ge v0, v7, :cond_20

    .line 1045
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1046
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v46

    iget-boolean v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mInteresting:Z

    move/from16 v60, v0

    if-eqz v60, :cond_1e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v60

    if-nez v60, :cond_1f

    .line 1047
    :cond_1e
    const/16 v17, 0x1

    .line 1048
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1049
    add-int/lit8 v25, v25, -0x1

    .line 1050
    add-int/lit8 v7, v7, -0x1

    .line 1044
    :cond_1f
    add-int/lit8 v25, v25, 0x1

    goto :goto_e

    .line 1057
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 1058
    .local v5, "NAP":I
    const/16 v25, 0x0

    :goto_f
    move/from16 v0, v25

    if-ge v0, v5, :cond_22

    .line 1059
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1060
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_21

    .line 1061
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v60, v0

    move-object/from16 v0, v46

    move-object/from16 v1, p1

    move-object/from16 v2, v45

    move/from16 v3, v60

    invoke-virtual {v0, v1, v2, v3}, Lcom/androie/settings/applications/RunningState$ProcessItem;->buildDependencyChain(Landroid/content/Context;Landroid/content/pm/PackageManager;I)Z

    move-result v60

    or-int v17, v17, v60

    .line 1058
    :cond_21
    add-int/lit8 v25, v25, 0x1

    goto :goto_f

    .line 1066
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_22
    const/16 v58, 0x0

    .line 1067
    .local v58, "uidToDelete":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/16 v25, 0x0

    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v60

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_2a

    .line 1068
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/util/HashMap;

    .line 1069
    .restart local v48    # "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v44

    .line 1070
    .local v44, "pit":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    :cond_23
    :goto_11
    invoke-interface/range {v44 .. v44}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_29

    .line 1071
    invoke-interface/range {v44 .. v44}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1072
    .local v41, "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_26

    .line 1073
    move-object/from16 v0, v41

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/RunningState$ProcessItem;->ensureLabel(Landroid/content/pm/PackageManager;)V

    .line 1074
    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    if-nez v60, :cond_24

    .line 1077
    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mDependentProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->clear()V

    .line 1093
    :cond_24
    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v54

    .line 1094
    .local v54, "sit":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/androie/settings/applications/RunningState$ServiceItem;>;"
    :cond_25
    :goto_12
    invoke-interface/range {v54 .. v54}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_23

    .line 1095
    invoke-interface/range {v54 .. v54}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lcom/androie/settings/applications/RunningState$ServiceItem;

    .line 1096
    .local v53, "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    move-object/from16 v0, v53

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_25

    .line 1097
    const/16 v17, 0x1

    .line 1098
    invoke-interface/range {v54 .. v54}, Ljava/util/Iterator;->remove()V

    goto :goto_12

    .line 1080
    .end local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    .end local v54    # "sit":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/androie/settings/applications/RunningState$ServiceItem;>;"
    :cond_26
    const/16 v17, 0x1

    .line 1081
    invoke-interface/range {v44 .. v44}, Ljava/util/Iterator;->remove()V

    .line 1082
    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->size()I

    move-result v60

    if-nez v60, :cond_28

    .line 1083
    if-nez v58, :cond_27

    .line 1084
    new-instance v58, Ljava/util/ArrayList;

    .end local v58    # "uidToDelete":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-direct/range {v58 .. v58}, Ljava/util/ArrayList;-><init>()V

    .line 1086
    .restart local v58    # "uidToDelete":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v60

    invoke-static/range {v60 .. v60}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v60

    move-object/from16 v0, v58

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1088
    :cond_28
    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    if-eqz v60, :cond_23

    .line 1089
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByPid:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Landroid/util/SparseArray;->remove(I)V

    goto/16 :goto_11

    .line 1067
    .end local v41    # "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_29
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_10

    .line 1104
    .end local v44    # "pit":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    .end local v48    # "procs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    :cond_2a
    if-eqz v58, :cond_2b

    .line 1105
    const/16 v25, 0x0

    :goto_13
    invoke-virtual/range {v58 .. v58}, Ljava/util/ArrayList;->size()I

    move-result v60

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_2b

    .line 1106
    move-object/from16 v0, v58

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Ljava/lang/Integer;

    invoke-virtual/range {v60 .. v60}, Ljava/lang/Integer;->intValue()I

    move-result v57

    .line 1107
    .local v57, "uid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 1105
    add-int/lit8 v25, v25, 0x1

    goto :goto_13

    .line 1111
    .end local v57    # "uid":I
    :cond_2b
    if-eqz v17, :cond_40

    .line 1113
    new-instance v56, Ljava/util/ArrayList;

    invoke-direct/range {v56 .. v56}, Ljava/util/ArrayList;-><init>()V

    .line 1114
    .local v56, "sortedProcesses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    const/16 v25, 0x0

    :goto_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v60

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_30

    .line 1115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessesByName:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Ljava/util/HashMap;

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :goto_15
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_2f

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1116
    .restart local v41    # "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    const/16 v60, 0x0

    move/from16 v0, v60

    move-object/from16 v1, v41

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mIsSystem:Z

    .line 1117
    const/16 v60, 0x1

    move/from16 v0, v60

    move-object/from16 v1, v41

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mIsStarted:Z

    .line 1118
    const-wide v60, 0x7fffffffffffffffL

    move-wide/from16 v0, v60

    move-object/from16 v2, v41

    iput-wide v0, v2, Lcom/androie/settings/applications/RunningState$ProcessItem;->mActiveSince:J

    .line 1119
    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .local v27, "i$":Ljava/util/Iterator;
    :cond_2c
    :goto_16
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_2e

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lcom/androie/settings/applications/RunningState$ServiceItem;

    .line 1120
    .restart local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mServiceInfo:Landroid/content/pm/ServiceInfo;

    move-object/from16 v60, v0

    if-eqz v60, :cond_2d

    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mServiceInfo:Landroid/content/pm/ServiceInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v60, v0

    and-int/lit8 v60, v60, 0x1

    if-eqz v60, :cond_2d

    .line 1123
    const/16 v60, 0x1

    move/from16 v0, v60

    move-object/from16 v1, v41

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mIsSystem:Z

    .line 1125
    :cond_2d
    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mRunningService:Landroid/app/ActivityManager$RunningServiceInfo;

    move-object/from16 v60, v0

    if-eqz v60, :cond_2c

    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mRunningService:Landroid/app/ActivityManager$RunningServiceInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->clientLabel:I

    move/from16 v60, v0

    if-eqz v60, :cond_2c

    .line 1127
    const/16 v60, 0x0

    move/from16 v0, v60

    move-object/from16 v1, v41

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mIsStarted:Z

    .line 1128
    move-object/from16 v0, v41

    iget-wide v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mActiveSince:J

    move-wide/from16 v60, v0

    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mRunningService:Landroid/app/ActivityManager$RunningServiceInfo;

    move-object/from16 v62, v0

    move-object/from16 v0, v62

    iget-wide v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->activeSince:J

    move-wide/from16 v62, v0

    cmp-long v60, v60, v62

    if-lez v60, :cond_2c

    .line 1129
    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mRunningService:Landroid/app/ActivityManager$RunningServiceInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget-wide v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->activeSince:J

    move-wide/from16 v60, v0

    move-wide/from16 v0, v60

    move-object/from16 v2, v41

    iput-wide v0, v2, Lcom/androie/settings/applications/RunningState$ProcessItem;->mActiveSince:J

    goto :goto_16

    .line 1133
    .end local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    :cond_2e
    move-object/from16 v0, v56

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_15

    .line 1114
    .end local v27    # "i$":Ljava/util/Iterator;
    .end local v41    # "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_2f
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_14

    .line 1137
    :cond_30
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mServiceProcessComparator:Lcom/androie/settings/applications/RunningState$ServiceProcessComparator;

    move-object/from16 v60, v0

    move-object/from16 v0, v56

    move-object/from16 v1, v60

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1139
    new-instance v33, Ljava/util/ArrayList;

    invoke-direct/range {v33 .. v33}, Ljava/util/ArrayList;-><init>()V

    .line 1140
    .local v33, "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$BaseItem;>;"
    new-instance v34, Ljava/util/ArrayList;

    invoke-direct/range {v34 .. v34}, Ljava/util/ArrayList;-><init>()V

    .line 1141
    .local v34, "newMergedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/16 v40, 0x0

    .line 1142
    .local v40, "otherUsers":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->clear()V

    .line 1143
    const/16 v25, 0x0

    :goto_17
    invoke-virtual/range {v56 .. v56}, Ljava/util/ArrayList;->size()I

    move-result v60

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_39

    .line 1144
    move-object/from16 v0, v56

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1145
    .restart local v41    # "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    const/16 v60, 0x0

    move/from16 v0, v60

    move-object/from16 v1, v41

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mNeedDivider:Z

    .line 1147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v21

    .line 1149
    .local v21, "firstProc":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v33

    move-object/from16 v2, v60

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$ProcessItem;->addDependentProcesses(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1151
    move-object/from16 v0, v33

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1152
    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    if-lez v60, :cond_31

    .line 1153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1157
    :cond_31
    const/16 v28, 0x0

    .line 1158
    .local v28, "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    const/16 v24, 0x0

    .line 1159
    .local v24, "haveAllMerged":Z
    const/16 v30, 0x0

    .line 1160
    .local v30, "needDivider":Z
    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v26

    .local v26, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_34

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lcom/androie/settings/applications/RunningState$ServiceItem;

    .line 1161
    .restart local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    move/from16 v0, v30

    move-object/from16 v1, v53

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState$ServiceItem;->mNeedDivider:Z

    .line 1162
    const/16 v30, 0x1

    .line 1163
    move-object/from16 v0, v33

    move-object/from16 v1, v53

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1164
    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    if-eqz v60, :cond_33

    .line 1165
    if-eqz v28, :cond_32

    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v60

    if-eq v0, v1, :cond_32

    .line 1166
    const/16 v24, 0x0

    .line 1168
    :cond_32
    move-object/from16 v0, v53

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ServiceItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v28, v0

    goto :goto_18

    .line 1170
    :cond_33
    const/16 v24, 0x0

    goto :goto_18

    .line 1174
    .end local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    :cond_34
    if-eqz v24, :cond_35

    if-eqz v28, :cond_35

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mServices:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v60

    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v61, v0

    invoke-virtual/range {v61 .. v61}, Ljava/util/HashMap;->size()I

    move-result v61

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_37

    .line 1177
    :cond_35
    new-instance v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v41

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, v28

    move/from16 v1, v60

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;-><init>(I)V

    .line 1178
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v60

    invoke-interface/range {v60 .. v60}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :goto_19
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_36

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lcom/androie/settings/applications/RunningState$ServiceItem;

    .line 1179
    .restart local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mServices:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v53

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1180
    move-object/from16 v0, v28

    move-object/from16 v1, v53

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ServiceItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    goto :goto_19

    .line 1182
    .end local v53    # "si":Lcom/androie/settings/applications/RunningState$ServiceItem;
    :cond_36
    move-object/from16 v0, v41

    move-object/from16 v1, v28

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1183
    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mOtherProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->clear()V

    .line 1184
    move/from16 v29, v21

    .local v29, "mpi":I
    :goto_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v60

    add-int/lit8 v60, v60, -0x1

    move/from16 v0, v29

    move/from16 v1, v60

    if-ge v0, v1, :cond_37

    .line 1185
    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mOtherProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v61, v0

    move-object/from16 v0, v61

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v61

    invoke-virtual/range {v60 .. v61}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1184
    add-int/lit8 v29, v29, 0x1

    goto :goto_1a

    .line 1189
    .end local v29    # "mpi":I
    :cond_37
    const/16 v60, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move/from16 v2, v60

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$MergedItem;->update(Landroid/content/Context;Z)Z

    .line 1190
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_38

    .line 1191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserMergedItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v34

    move-object/from16 v3, v60

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/androie/settings/applications/RunningState;->addOtherUserItem(Landroid/content/Context;Ljava/util/ArrayList;Landroid/util/SparseArray;Lcom/androie/settings/applications/RunningState$MergedItem;)V

    .line 1143
    :goto_1b
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_17

    .line 1193
    :cond_38
    move-object/from16 v0, v34

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 1199
    .end local v21    # "firstProc":I
    .end local v24    # "haveAllMerged":Z
    .end local v26    # "i$":Ljava/util/Iterator;
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    .end local v30    # "needDivider":Z
    .end local v41    # "pi":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 1200
    const/16 v25, 0x0

    :goto_1c
    move/from16 v0, v25

    if-ge v0, v7, :cond_3d

    .line 1201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mInterestingProcesses:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1202
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mClient:Lcom/androie/settings/applications/RunningState$ProcessItem;

    move-object/from16 v60, v0

    if-nez v60, :cond_3b

    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mServices:Ljava/util/HashMap;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->size()I

    move-result v60

    if-gtz v60, :cond_3b

    .line 1203
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    if-nez v60, :cond_3a

    .line 1204
    new-instance v60, Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mUserId:I

    move/from16 v61, v0

    invoke-direct/range {v60 .. v61}, Lcom/androie/settings/applications/RunningState$MergedItem;-><init>(I)V

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1205
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v60

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1207
    :cond_3a
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    const/16 v61, 0x0

    move-object/from16 v0, v60

    move-object/from16 v1, p1

    move/from16 v2, v61

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$MergedItem;->update(Landroid/content/Context;Z)Z

    .line 1208
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_3c

    .line 1209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserMergedItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v61, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v34

    move-object/from16 v3, v60

    move-object/from16 v4, v61

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/androie/settings/applications/RunningState;->addOtherUserItem(Landroid/content/Context;Ljava/util/ArrayList;Landroid/util/SparseArray;Lcom/androie/settings/applications/RunningState$MergedItem;)V

    .line 1214
    :goto_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1200
    :cond_3b
    add-int/lit8 v25, v25, 0x1

    goto/16 :goto_1c

    .line 1212
    :cond_3c
    const/16 v60, 0x0

    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v61, v0

    move-object/from16 v0, v34

    move/from16 v1, v60

    move-object/from16 v2, v61

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1d

    .line 1220
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_3d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserMergedItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v11

    .line 1221
    .local v11, "NU":I
    const/16 v25, 0x0

    :goto_1e
    move/from16 v0, v25

    if-ge v0, v11, :cond_3f

    .line 1222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserMergedItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v59

    check-cast v59, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1223
    .local v59, "user":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v59

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_3e

    .line 1224
    const/16 v60, 0x0

    move-object/from16 v0, v59

    move-object/from16 v1, p1

    move/from16 v2, v60

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$MergedItem;->update(Landroid/content/Context;Z)Z

    .line 1221
    :cond_3e
    add-int/lit8 v25, v25, 0x1

    goto :goto_1e

    .line 1228
    .end local v59    # "user":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_3f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    move-object/from16 v61, v0

    monitor-enter v61

    .line 1229
    :try_start_0
    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState;->mItems:Ljava/util/ArrayList;

    .line 1230
    move-object/from16 v0, v34

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState;->mMergedItems:Ljava/util/ArrayList;

    .line 1231
    monitor-exit v61
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1236
    .end local v11    # "NU":I
    .end local v33    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$BaseItem;>;"
    .end local v34    # "newMergedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .end local v40    # "otherUsers":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .end local v56    # "sortedProcesses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    :cond_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->clear()V

    .line 1237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mProcessItems:Ljava/util/ArrayList;

    move-object/from16 v61, v0

    invoke-virtual/range {v60 .. v61}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1238
    const/16 v36, 0x0

    .line 1239
    .local v36, "numBackgroundProcesses":I
    const/16 v37, 0x0

    .line 1240
    .local v37, "numForegroundProcesses":I
    const/16 v39, 0x0

    .line 1241
    .local v39, "numServiceProcesses":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v9

    .line 1242
    const/16 v25, 0x0

    :goto_1f
    move/from16 v0, v25

    if-ge v0, v9, :cond_44

    .line 1243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mRunningProcesses:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1244
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_43

    .line 1247
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    move/from16 v60, v0

    const/16 v61, 0x190

    move/from16 v0, v60

    move/from16 v1, v61

    if-lt v0, v1, :cond_41

    .line 1249
    add-int/lit8 v36, v36, 0x1

    .line 1250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1242
    :goto_20
    add-int/lit8 v25, v25, 0x1

    goto :goto_1f

    .line 1231
    .end local v36    # "numBackgroundProcesses":I
    .end local v37    # "numForegroundProcesses":I
    .end local v39    # "numServiceProcesses":I
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    .restart local v11    # "NU":I
    .restart local v33    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$BaseItem;>;"
    .restart local v34    # "newMergedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v40    # "otherUsers":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v56    # "sortedProcesses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    :catchall_0
    move-exception v60

    :try_start_1
    monitor-exit v61
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v60

    .line 1251
    .end local v11    # "NU":I
    .end local v33    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$BaseItem;>;"
    .end local v34    # "newMergedItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .end local v40    # "otherUsers":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .end local v56    # "sortedProcesses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$ProcessItem;>;"
    .restart local v36    # "numBackgroundProcesses":I
    .restart local v37    # "numForegroundProcesses":I
    .restart local v39    # "numServiceProcesses":I
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_41
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    move/from16 v60, v0

    const/16 v61, 0xc8

    move/from16 v0, v60

    move/from16 v1, v61

    if-gt v0, v1, :cond_42

    .line 1253
    add-int/lit8 v37, v37, 0x1

    .line 1254
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    .line 1256
    :cond_42
    const-string v60, "RunningState"

    new-instance v61, Ljava/lang/StringBuilder;

    invoke-direct/range {v61 .. v61}, Ljava/lang/StringBuilder;-><init>()V

    const-string v62, "Unknown non-service process: "

    invoke-virtual/range {v61 .. v62}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v61

    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mProcessName:Ljava/lang/String;

    move-object/from16 v62, v0

    invoke-virtual/range {v61 .. v62}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v61

    const-string v62, " #"

    invoke-virtual/range {v61 .. v62}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v61

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v62, v0

    invoke-virtual/range {v61 .. v62}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v61

    invoke-virtual/range {v61 .. v61}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v61

    invoke-static/range {v60 .. v61}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 1260
    :cond_43
    add-int/lit8 v39, v39, 0x1

    goto :goto_20

    .line 1264
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_44
    const-wide/16 v13, 0x0

    .line 1265
    .local v13, "backgroundProcessMemory":J
    const-wide/16 v22, 0x0

    .line 1266
    .local v22, "foregroundProcessMemory":J
    const-wide/16 v50, 0x0

    .line 1267
    .local v50, "serviceProcessMemory":J
    const/16 v31, 0x0

    .line 1268
    .local v31, "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/16 v35, 0x0

    .line 1269
    .local v35, "newUserBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/16 v20, 0x0

    .line 1271
    .local v20, "diffUsers":Z
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v38

    .line 1272
    .local v38, "numProc":I
    move/from16 v0, v38

    new-array v0, v0, [I

    move-object/from16 v43, v0

    .line 1273
    .local v43, "pids":[I
    const/16 v25, 0x0

    :goto_21
    move/from16 v0, v25

    move/from16 v1, v38

    if-ge v0, v1, :cond_45

    .line 1274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Lcom/androie/settings/applications/RunningState$ProcessItem;

    move-object/from16 v0, v60

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mPid:I

    move/from16 v60, v0

    aput v60, v43, v25

    .line 1273
    add-int/lit8 v25, v25, 0x1

    goto :goto_21

    .line 1276
    :cond_45
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v60

    move-object/from16 v0, v60

    move-object/from16 v1, v43

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->getProcessPss([I)[J
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v49

    .line 1278
    .local v49, "pss":[J
    const/4 v15, 0x0

    .line 1279
    .local v15, "bgIndex":I
    const/16 v25, 0x0

    move-object/from16 v32, v31

    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .local v32, "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :goto_22
    :try_start_3
    move-object/from16 v0, v43

    array-length v0, v0

    move/from16 v60, v0

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_4f

    .line 1280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mAllProcessItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1281
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    aget-wide v60, v49, v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v62, v0

    move-object/from16 v0, v46

    move-object/from16 v1, p1

    move-wide/from16 v2, v60

    move/from16 v4, v62

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/androie/settings/applications/RunningState$ProcessItem;->updateSize(Landroid/content/Context;JI)Z

    move-result v60

    or-int v17, v17, v60

    .line 1282
    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_46

    .line 1283
    move-object/from16 v0, v46

    iget-wide v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mSize:J

    move-wide/from16 v60, v0

    add-long v50, v50, v60

    move-object/from16 v31, v32

    .line 1279
    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :goto_23
    add-int/lit8 v25, v25, 0x1

    move-object/from16 v32, v31

    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto :goto_22

    .line 1284
    :cond_46
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    move/from16 v60, v0

    const/16 v61, 0x190

    move/from16 v0, v60

    move/from16 v1, v61

    if-lt v0, v1, :cond_4e

    .line 1286
    move-object/from16 v0, v46

    iget-wide v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mSize:J

    move-wide/from16 v60, v0

    add-long v13, v13, v60

    .line 1288
    if-eqz v32, :cond_48

    .line 1289
    new-instance v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, v28

    move/from16 v1, v60

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;-><init>(I)V

    move-object/from16 v0, v28

    move-object/from16 v1, v46

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1290
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v60

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1291
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_47

    const/16 v60, 0x1

    :goto_24
    or-int v20, v20, v60

    .line 1292
    move-object/from16 v0, v32

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    move-object/from16 v31, v32

    .line 1310
    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :goto_25
    const/16 v60, 0x1

    :try_start_4
    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move/from16 v2, v60

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$MergedItem;->update(Landroid/content/Context;Z)Z

    .line 1311
    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;->updateSize(Landroid/content/Context;)Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    .line 1312
    add-int/lit8 v15, v15, 0x1

    .line 1313
    goto :goto_23

    .line 1291
    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :cond_47
    const/16 v60, 0x0

    goto :goto_24

    .line 1294
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_48
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v60

    move/from16 v0, v60

    if-ge v15, v0, :cond_49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v0, v60

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v46

    if-eq v0, v1, :cond_4d

    .line 1296
    :cond_49
    new-instance v31, Ljava/util/ArrayList;

    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 1297
    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/16 v16, 0x0

    .local v16, "bgi":I
    :goto_26
    move/from16 v0, v16

    if-ge v0, v15, :cond_4b

    .line 1298
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1299
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_4a

    const/16 v60, 0x1

    :goto_27
    or-int v20, v20, v60

    .line 1300
    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1297
    add-int/lit8 v16, v16, 0x1

    goto :goto_26

    .line 1299
    :cond_4a
    const/16 v60, 0x0

    goto :goto_27

    .line 1302
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_4b
    new-instance v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v0, v46

    iget v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, v28

    move/from16 v1, v60

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;-><init>(I)V

    move-object/from16 v0, v28

    move-object/from16 v1, v46

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1303
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mMergedItem:Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v60, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v60

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    .line 1304
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_4c

    const/16 v60, 0x1

    :goto_28
    or-int v20, v20, v60

    .line 1305
    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_25

    .line 1318
    .end local v15    # "bgIndex":I
    .end local v16    # "bgi":I
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    .end local v38    # "numProc":I
    .end local v43    # "pids":[I
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    .end local v49    # "pss":[J
    :catch_0
    move-exception v60

    .line 1321
    :goto_29
    if-nez v31, :cond_51

    .line 1323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v60

    move/from16 v0, v60

    move/from16 v1, v36

    if-le v0, v1, :cond_51

    .line 1324
    new-instance v31, Ljava/util/ArrayList;

    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    move-object/from16 v0, v31

    move/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1325
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    const/16 v16, 0x0

    .restart local v16    # "bgi":I
    :goto_2a
    move/from16 v0, v16

    move/from16 v1, v36

    if-ge v0, v1, :cond_51

    .line 1326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1327
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_50

    const/16 v60, 0x1

    :goto_2b
    or-int v20, v20, v60

    .line 1328
    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1325
    add-int/lit8 v16, v16, 0x1

    goto :goto_2a

    .line 1304
    .restart local v15    # "bgIndex":I
    .restart local v38    # "numProc":I
    .restart local v43    # "pids":[I
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    .restart local v49    # "pss":[J
    :cond_4c
    const/16 v60, 0x0

    goto :goto_28

    .line 1307
    .end local v16    # "bgi":I
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :cond_4d
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v31, v32

    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto/16 :goto_25

    .line 1313
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :cond_4e
    move-object/from16 v0, v46

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mRunningProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    move/from16 v60, v0

    const/16 v61, 0xc8

    move/from16 v0, v60

    move/from16 v1, v61

    if-gt v0, v1, :cond_5a

    .line 1315
    move-object/from16 v0, v46

    iget-wide v0, v0, Lcom/androie/settings/applications/RunningState$ProcessItem;->mSize:J

    move-wide/from16 v60, v0
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1

    add-long v22, v22, v60

    move-object/from16 v31, v32

    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto/16 :goto_23

    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .end local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    :cond_4f
    move-object/from16 v31, v32

    .line 1319
    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto/16 :goto_29

    .line 1327
    .end local v15    # "bgIndex":I
    .end local v38    # "numProc":I
    .end local v43    # "pids":[I
    .end local v49    # "pss":[J
    .restart local v16    # "bgi":I
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_50
    const/16 v60, 0x0

    goto :goto_2b

    .line 1333
    .end local v16    # "bgi":I
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_51
    if-eqz v31, :cond_52

    .line 1336
    if-nez v20, :cond_53

    .line 1338
    move-object/from16 v35, v31

    .line 1366
    :cond_52
    const/16 v25, 0x0

    :goto_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mMergedItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/util/ArrayList;->size()I

    move-result v60

    move/from16 v0, v25

    move/from16 v1, v60

    if-ge v0, v1, :cond_57

    .line 1367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mMergedItems:Ljava/util/ArrayList;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Lcom/androie/settings/applications/RunningState$MergedItem;

    move-object/from16 v0, v60

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;->updateSize(Landroid/content/Context;)Z

    .line 1366
    add-int/lit8 v25, v25, 0x1

    goto :goto_2c

    .line 1342
    :cond_53
    new-instance v35, Ljava/util/ArrayList;

    .end local v35    # "newUserBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    .line 1343
    .restart local v35    # "newUserBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1344
    .local v6, "NB":I
    const/16 v25, 0x0

    :goto_2d
    move/from16 v0, v25

    if-ge v0, v6, :cond_55

    .line 1345
    move-object/from16 v0, v31

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1346
    .restart local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v28

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mMyUserId:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-eq v0, v1, :cond_54

    .line 1347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserBackgroundItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v35

    move-object/from16 v3, v60

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/androie/settings/applications/RunningState;->addOtherUserItem(Landroid/content/Context;Ljava/util/ArrayList;Landroid/util/SparseArray;Lcom/androie/settings/applications/RunningState$MergedItem;)V

    .line 1344
    :goto_2e
    add-int/lit8 v25, v25, 0x1

    goto :goto_2d

    .line 1350
    :cond_54
    move-object/from16 v0, v35

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    .line 1355
    .end local v28    # "mergedItem":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_55
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserBackgroundItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/util/SparseArray;->size()I

    move-result v11

    .line 1356
    .restart local v11    # "NU":I
    const/16 v25, 0x0

    :goto_2f
    move/from16 v0, v25

    if-ge v0, v11, :cond_52

    .line 1357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mOtherUserBackgroundItems:Landroid/util/SparseArray;

    move-object/from16 v60, v0

    move-object/from16 v0, v60

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v59

    check-cast v59, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 1358
    .restart local v59    # "user":Lcom/androie/settings/applications/RunningState$MergedItem;
    move-object/from16 v0, v59

    iget v0, v0, Lcom/androie/settings/applications/RunningState$MergedItem;->mCurSeq:I

    move/from16 v60, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/applications/RunningState;->mSequence:I

    move/from16 v61, v0

    move/from16 v0, v60

    move/from16 v1, v61

    if-ne v0, v1, :cond_56

    .line 1359
    const/16 v60, 0x1

    move-object/from16 v0, v59

    move-object/from16 v1, p1

    move/from16 v2, v60

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/applications/RunningState$MergedItem;->update(Landroid/content/Context;Z)Z

    .line 1360
    move-object/from16 v0, v59

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/androie/settings/applications/RunningState$MergedItem;->updateSize(Landroid/content/Context;)Z

    .line 1356
    :cond_56
    add-int/lit8 v25, v25, 0x1

    goto :goto_2f

    .line 1370
    .end local v6    # "NB":I
    .end local v11    # "NU":I
    .end local v59    # "user":Lcom/androie/settings/applications/RunningState$MergedItem;
    :cond_57
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    move-object/from16 v61, v0

    monitor-enter v61

    .line 1371
    :try_start_8
    move/from16 v0, v36

    move-object/from16 v1, p0

    iput v0, v1, Lcom/androie/settings/applications/RunningState;->mNumBackgroundProcesses:I

    .line 1372
    move/from16 v0, v37

    move-object/from16 v1, p0

    iput v0, v1, Lcom/androie/settings/applications/RunningState;->mNumForegroundProcesses:I

    .line 1373
    move/from16 v0, v39

    move-object/from16 v1, p0

    iput v0, v1, Lcom/androie/settings/applications/RunningState;->mNumServiceProcesses:I

    .line 1374
    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/androie/settings/applications/RunningState;->mBackgroundProcessMemory:J

    .line 1375
    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/androie/settings/applications/RunningState;->mForegroundProcessMemory:J

    .line 1376
    move-wide/from16 v0, v50

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/androie/settings/applications/RunningState;->mServiceProcessMemory:J

    .line 1377
    if-eqz v31, :cond_58

    .line 1378
    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState;->mBackgroundItems:Ljava/util/ArrayList;

    .line 1379
    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/androie/settings/applications/RunningState;->mUserBackgroundItems:Ljava/util/ArrayList;

    .line 1380
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/applications/RunningState;->mWatchingBackgroundItems:Z

    move/from16 v60, v0

    if-eqz v60, :cond_58

    .line 1381
    const/16 v17, 0x1

    .line 1384
    :cond_58
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/androie/settings/applications/RunningState;->mHaveData:Z

    move/from16 v60, v0

    if-nez v60, :cond_59

    .line 1385
    const/16 v60, 0x1

    move/from16 v0, v60

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/androie/settings/applications/RunningState;->mHaveData:Z

    .line 1386
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/lang/Object;->notifyAll()V

    .line 1388
    :cond_59
    monitor-exit v61

    .line 1390
    return v17

    .line 1388
    :catchall_1
    move-exception v60

    monitor-exit v61
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v60

    .line 1318
    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v15    # "bgIndex":I
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v38    # "numProc":I
    .restart local v43    # "pids":[I
    .restart local v49    # "pss":[J
    :catch_1
    move-exception v60

    move-object/from16 v31, v32

    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto/16 :goto_29

    .end local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v46    # "proc":Lcom/androie/settings/applications/RunningState$ProcessItem;
    :cond_5a
    move-object/from16 v31, v32

    .end local v32    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    .restart local v31    # "newBackgroundItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/androie/settings/applications/RunningState$MergedItem;>;"
    goto/16 :goto_23
.end method


# virtual methods
.method getCurrentBackgroundItems()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1412
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1413
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mUserBackgroundItems:Ljava/util/ArrayList;

    monitor-exit v1

    return-object v0

    .line 1414
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getCurrentMergedItems()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/applications/RunningState$MergedItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1406
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1407
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mMergedItems:Ljava/util/ArrayList;

    monitor-exit v1

    return-object v0

    .line 1408
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method hasData()Z
    .locals 2

    .prologue
    .line 769
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 770
    :try_start_0
    iget-boolean v0, p0, Lcom/androie/settings/applications/RunningState;->mHaveData:Z

    monitor-exit v1

    return v0

    .line 771
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method pause()V
    .locals 3

    .prologue
    .line 786
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 787
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/androie/settings/applications/RunningState;->mResumed:Z

    .line 788
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/applications/RunningState;->mRefreshUiListener:Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;

    .line 789
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 790
    monitor-exit v1

    .line 791
    return-void

    .line 790
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method resume(Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;

    .prologue
    .line 745
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 746
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/androie/settings/applications/RunningState;->mResumed:Z

    .line 747
    iput-object p1, p0, Lcom/androie/settings/applications/RunningState;->mRefreshUiListener:Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;

    .line 748
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mInterestingConfigChanges:Lcom/androie/settings/applications/InterestingConfigChanges;

    iget-object v2, p0, Lcom/androie/settings/applications/RunningState;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/InterestingConfigChanges;->applyNewConfig(Landroid/content/res/Resources;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 749
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/applications/RunningState;->mHaveData:Z

    .line 750
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->removeMessages(I)V

    .line 751
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->removeMessages(I)V

    .line 752
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->sendEmptyMessage(I)Z

    .line 754
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 755
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->sendEmptyMessage(I)Z

    .line 757
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 758
    monitor-exit v1

    .line 759
    return-void

    .line 758
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setWatchingBackgroundItems(Z)V
    .locals 2
    .param p1, "watching"    # Z

    .prologue
    .line 1400
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1401
    :try_start_0
    iput-boolean p1, p0, Lcom/androie/settings/applications/RunningState;->mWatchingBackgroundItems:Z

    .line 1402
    monitor-exit v1

    .line 1403
    return-void

    .line 1402
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method updateNow()V
    .locals 3

    .prologue
    .line 762
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 763
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->removeMessages(I)V

    .line 764
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mBackgroundHandler:Lcom/androie/settings/applications/RunningState$BackgroundHandler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/androie/settings/applications/RunningState$BackgroundHandler;->sendEmptyMessage(I)Z

    .line 765
    monitor-exit v1

    .line 766
    return-void

    .line 765
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method waitForData()V
    .locals 4

    .prologue
    .line 775
    iget-object v1, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 776
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/androie/settings/applications/RunningState;->mHaveData:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 778
    :try_start_1
    iget-object v0, p0, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 779
    :catch_0
    move-exception v0

    goto :goto_0

    .line 782
    :cond_0
    :try_start_2
    monitor-exit v1

    .line 783
    return-void

    .line 782
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
