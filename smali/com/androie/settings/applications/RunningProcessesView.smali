.class public Lcom/androie/settings/applications/RunningProcessesView;
.super Landroid/widget/FrameLayout;
.source "RunningProcessesView.java"

# interfaces
.implements Landroid/widget/AbsListView$RecyclerListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;,
        Lcom/androie/settings/applications/RunningProcessesView$TimeTicker;,
        Lcom/androie/settings/applications/RunningProcessesView$ViewHolder;,
        Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;
    }
.end annotation


# instance fields
.field SECONDARY_SERVER_MEM:J

.field final mActiveItems:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;",
            ">;"
        }
    .end annotation
.end field

.field mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

.field mAm:Landroid/app/ActivityManager;

.field mBackgroundProcessText:Landroid/widget/TextView;

.field mBuilder:Ljava/lang/StringBuilder;

.field mColorBar:Lcom/androie/settings/applications/LinearColorBar;

.field mCurSelected:Lcom/androie/settings/applications/RunningState$BaseItem;

.field mDataAvail:Ljava/lang/Runnable;

.field mForegroundProcessText:Landroid/widget/TextView;

.field mLastAvailMemory:J

.field mLastBackgroundProcessMemory:J

.field mLastForegroundProcessMemory:J

.field mLastNumBackgroundProcesses:I

.field mLastNumForegroundProcesses:I

.field mLastNumServiceProcesses:I

.field mLastServiceProcessMemory:J

.field mListView:Landroid/widget/ListView;

.field mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

.field final mMyUserId:I

.field mOwner:Landroid/app/Fragment;

.field mState:Lcom/androie/settings/applications/RunningState;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, -0x1

    const-wide/16 v2, -0x1

    .line 408
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mActiveItems:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mBuilder:Ljava/lang/StringBuilder;

    .line 78
    iput v4, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumBackgroundProcesses:I

    .line 79
    iput v4, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumForegroundProcesses:I

    .line 80
    iput v4, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumServiceProcesses:I

    .line 81
    iput-wide v2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    .line 82
    iput-wide v2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastForegroundProcessMemory:J

    .line 83
    iput-wide v2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastServiceProcessMemory:J

    .line 84
    iput-wide v2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastAvailMemory:J

    .line 88
    new-instance v0, Lcom/android/internal/util/MemInfoReader;

    invoke-direct {v0}, Lcom/android/internal/util/MemInfoReader;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    .line 409
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMyUserId:I

    .line 410
    return-void
.end method

.method private startServiceDetailsActivity(Lcom/androie/settings/applications/RunningState$MergedItem;)V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 387
    iget-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mOwner:Landroid/app/Fragment;

    if-eqz v0, :cond_1

    .line 389
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 390
    iget-object v0, p1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    if-eqz v0, :cond_0

    .line 391
    const-string v0, "uid"

    iget-object v1, p1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    iget v1, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mUid:I

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 392
    const-string v0, "process"

    iget-object v1, p1, Lcom/androie/settings/applications/RunningState$MergedItem;->mProcess:Lcom/androie/settings/applications/RunningState$ProcessItem;

    iget-object v1, v1, Lcom/androie/settings/applications/RunningState$ProcessItem;->mProcessName:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    :cond_0
    const-string v0, "user_id"

    iget v1, p1, Lcom/androie/settings/applications/RunningState$MergedItem;->mUserId:I

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 395
    const-string v0, "background"

    iget-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    iget-boolean v1, v1, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->mShowBackground:Z

    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 397
    iget-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mOwner:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 398
    const-class v1, Lcom/androie/settings/applications/RunningServiceDetails;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0807cd

    const/4 v6, 0x0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 401
    :cond_1
    return-void
.end method


# virtual methods
.method public doCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 413
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "activity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mAm:Landroid/app/ActivityManager;

    .line 414
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/androie/settings/applications/RunningState;->getInstance(Landroid/content/Context;)Lcom/androie/settings/applications/RunningState;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    .line 415
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "layout_inflater"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 417
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v3, 0x7f0400ad

    invoke-virtual {v1, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 418
    const v3, 0x102000a

    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/RunningProcessesView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    .line 419
    const v3, 0x1020004

    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/RunningProcessesView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 420
    .local v0, "emptyView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 421
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 423
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 424
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, p0}, Landroid/widget/ListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 425
    new-instance v3, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    iget-object v4, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    invoke-direct {v3, p0, v4}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;-><init>(Lcom/androie/settings/applications/RunningProcessesView;Lcom/androie/settings/applications/RunningState;)V

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    .line 426
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/androie/settings/applications/RunningProcessesView;->mAdapter:Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 427
    const v3, 0x7f0c01b5

    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/RunningProcessesView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/applications/LinearColorBar;

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mColorBar:Lcom/androie/settings/applications/LinearColorBar;

    .line 428
    const v3, 0x7f0c01b7

    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/RunningProcessesView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mBackgroundProcessText:Landroid/widget/TextView;

    .line 429
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mBackgroundProcessText:Landroid/widget/TextView;

    new-instance v4, Lcom/androie/settings/applications/RunningProcessesView$1;

    invoke-direct {v4, p0}, Lcom/androie/settings/applications/RunningProcessesView$1;-><init>(Lcom/androie/settings/applications/RunningProcessesView;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 438
    const v3, 0x7f0c01b6

    invoke-virtual {p0, v3}, Lcom/androie/settings/applications/RunningProcessesView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mForegroundProcessText:Landroid/widget/TextView;

    .line 439
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mForegroundProcessText:Landroid/widget/TextView;

    new-instance v4, Lcom/androie/settings/applications/RunningProcessesView$2;

    invoke-direct {v4, p0}, Lcom/androie/settings/applications/RunningProcessesView$2;-><init>(Lcom/androie/settings/applications/RunningProcessesView;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 449
    new-instance v2, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v2}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 450
    .local v2, "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mAm:Landroid/app/ActivityManager;

    invoke-virtual {v3, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 451
    iget-wide v3, v2, Landroid/app/ActivityManager$MemoryInfo;->secondaryServerThreshold:J

    iput-wide v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->SECONDARY_SERVER_MEM:J

    .line 452
    return-void
.end method

.method public doPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 455
    iget-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    invoke-virtual {v0}, Lcom/androie/settings/applications/RunningState;->pause()V

    .line 456
    iput-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mDataAvail:Ljava/lang/Runnable;

    .line 457
    iput-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mOwner:Landroid/app/Fragment;

    .line 458
    return-void
.end method

.method public doResume(Landroid/app/Fragment;Ljava/lang/Runnable;)Z
    .locals 2
    .param p1, "owner"    # Landroid/app/Fragment;
    .param p2, "dataAvail"    # Ljava/lang/Runnable;

    .prologue
    const/4 v0, 0x1

    .line 461
    iput-object p1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mOwner:Landroid/app/Fragment;

    .line 462
    iget-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    invoke-virtual {v1, p0}, Lcom/androie/settings/applications/RunningState;->resume(Lcom/androie/settings/applications/RunningState$OnRefreshUiListener;)V

    .line 463
    iget-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    invoke-virtual {v1}, Lcom/androie/settings/applications/RunningState;->hasData()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    invoke-virtual {p0, v0}, Lcom/androie/settings/applications/RunningProcessesView;->refreshUi(Z)V

    .line 470
    :goto_0
    return v0

    .line 469
    :cond_0
    iput-object p2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mDataAvail:Ljava/lang/Runnable;

    .line 470
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 379
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    move-object v0, p1

    check-cast v0, Landroid/widget/ListView;

    .line 380
    .local v0, "l":Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-interface {v2, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/applications/RunningState$MergedItem;

    .line 381
    .local v1, "mi":Lcom/androie/settings/applications/RunningState$MergedItem;
    iput-object v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mCurSelected:Lcom/androie/settings/applications/RunningState$BaseItem;

    .line 382
    invoke-direct {p0, v1}, Lcom/androie/settings/applications/RunningProcessesView;->startServiceDetailsActivity(Lcom/androie/settings/applications/RunningState$MergedItem;)V

    .line 383
    return-void
.end method

.method public onMovedToScrapHeap(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 404
    iget-object v0, p0, Lcom/androie/settings/applications/RunningProcessesView;->mActiveItems:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    return-void
.end method

.method public onRefreshUi(I)V
    .locals 1
    .param p1, "what"    # I

    .prologue
    .line 488
    packed-switch p1, :pswitch_data_0

    .line 501
    :goto_0
    return-void

    .line 490
    :pswitch_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->updateTimes()V

    goto :goto_0

    .line 493
    :pswitch_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/applications/RunningProcessesView;->refreshUi(Z)V

    .line 494
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->updateTimes()V

    goto :goto_0

    .line 497
    :pswitch_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/applications/RunningProcessesView;->refreshUi(Z)V

    .line 498
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->updateTimes()V

    goto :goto_0

    .line 488
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method refreshUi(Z)V
    .locals 14
    .param p1, "dataChanged"    # Z

    .prologue
    .line 317
    if-eqz p1, :cond_0

    .line 318
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v8}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v8

    check-cast v8, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    move-object v0, v8

    check-cast v0, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;

    .line 319
    .local v0, "adapter":Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;
    invoke-virtual {v0}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->refreshItems()V

    .line 320
    invoke-virtual {v0}, Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;->notifyDataSetChanged()V

    .line 323
    .end local v0    # "adapter":Lcom/androie/settings/applications/RunningProcessesView$ServiceListAdapter;
    :cond_0
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mDataAvail:Ljava/lang/Runnable;

    if-eqz v8, :cond_1

    .line 324
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mDataAvail:Ljava/lang/Runnable;

    invoke-interface {v8}, Ljava/lang/Runnable;->run()V

    .line 325
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mDataAvail:Ljava/lang/Runnable;

    .line 330
    :cond_1
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    invoke-virtual {v8}, Lcom/android/internal/util/MemInfoReader;->readMemInfo()V

    .line 331
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    invoke-virtual {v8}, Lcom/android/internal/util/MemInfoReader;->getFreeSize()J

    move-result-wide v8

    iget-object v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    invoke-virtual {v10}, Lcom/android/internal/util/MemInfoReader;->getCachedSize()J

    move-result-wide v10

    add-long/2addr v8, v10

    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->SECONDARY_SERVER_MEM:J

    sub-long v1, v8, v10

    .line 333
    .local v1, "availMem":J
    const-wide/16 v8, 0x0

    cmp-long v8, v1, v8

    if-gez v8, :cond_2

    .line 334
    const-wide/16 v1, 0x0

    .line 337
    :cond_2
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-object v9, v8, Lcom/androie/settings/applications/RunningState;->mLock:Ljava/lang/Object;

    monitor-enter v9

    .line 338
    :try_start_0
    iget v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumBackgroundProcesses:I

    iget-object v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v10, v10, Lcom/androie/settings/applications/RunningState;->mNumBackgroundProcesses:I

    if-ne v8, v10, :cond_3

    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v12, v8, Lcom/androie/settings/applications/RunningState;->mBackgroundProcessMemory:J

    cmp-long v8, v10, v12

    if-nez v8, :cond_3

    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastAvailMemory:J

    cmp-long v8, v10, v1

    if-eqz v8, :cond_4

    .line 341
    :cond_3
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v8, v8, Lcom/androie/settings/applications/RunningState;->mNumBackgroundProcesses:I

    iput v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumBackgroundProcesses:I

    .line 342
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v10, v8, Lcom/androie/settings/applications/RunningState;->mBackgroundProcessMemory:J

    iput-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    .line 343
    iput-wide v1, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastAvailMemory:J

    .line 344
    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastAvailMemory:J

    iget-wide v12, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    add-long v3, v10, v12

    .line 345
    .local v3, "freeMem":J
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v3, v4}, Landroid/text/format/Formatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    .line 346
    .local v5, "sizeStr":Ljava/lang/String;
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mBackgroundProcessText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0807c4

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v5, v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    invoke-virtual {v10}, Lcom/android/internal/util/MemInfoReader;->getTotalSize()J

    move-result-wide v10

    sub-long/2addr v10, v3

    invoke-static {v8, v10, v11}, Landroid/text/format/Formatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    .line 350
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mForegroundProcessText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0807c5

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v5, v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .end local v3    # "freeMem":J
    .end local v5    # "sizeStr":Ljava/lang/String;
    :cond_4
    iget v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumForegroundProcesses:I

    iget-object v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v10, v10, Lcom/androie/settings/applications/RunningState;->mNumForegroundProcesses:I

    if-ne v8, v10, :cond_5

    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastForegroundProcessMemory:J

    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v12, v8, Lcom/androie/settings/applications/RunningState;->mForegroundProcessMemory:J

    cmp-long v8, v10, v12

    if-nez v8, :cond_5

    iget v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumServiceProcesses:I

    iget-object v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v10, v10, Lcom/androie/settings/applications/RunningState;->mNumServiceProcesses:I

    if-ne v8, v10, :cond_5

    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastServiceProcessMemory:J

    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v12, v8, Lcom/androie/settings/applications/RunningState;->mServiceProcessMemory:J

    cmp-long v8, v10, v12

    if-eqz v8, :cond_6

    .line 357
    :cond_5
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v8, v8, Lcom/androie/settings/applications/RunningState;->mNumForegroundProcesses:I

    iput v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumForegroundProcesses:I

    .line 358
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v10, v8, Lcom/androie/settings/applications/RunningState;->mForegroundProcessMemory:J

    iput-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastForegroundProcessMemory:J

    .line 359
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget v8, v8, Lcom/androie/settings/applications/RunningState;->mNumServiceProcesses:I

    iput v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastNumServiceProcesses:I

    .line 360
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mState:Lcom/androie/settings/applications/RunningState;

    iget-wide v10, v8, Lcom/androie/settings/applications/RunningState;->mServiceProcessMemory:J

    iput-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastServiceProcessMemory:J

    .line 369
    :cond_6
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mMemInfoReader:Lcom/android/internal/util/MemInfoReader;

    invoke-virtual {v8}, Lcom/android/internal/util/MemInfoReader;->getTotalSize()J

    move-result-wide v10

    long-to-float v6, v10

    .line 370
    .local v6, "totalMem":F
    iget-wide v10, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    add-long/2addr v10, v1

    iget-wide v12, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastServiceProcessMemory:J

    add-long/2addr v10, v12

    long-to-float v7, v10

    .line 372
    .local v7, "totalShownMem":F
    iget-object v8, p0, Lcom/androie/settings/applications/RunningProcessesView;->mColorBar:Lcom/androie/settings/applications/LinearColorBar;

    sub-float v10, v6, v7

    div-float/2addr v10, v6

    iget-wide v11, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastServiceProcessMemory:J

    long-to-float v11, v11

    div-float/2addr v11, v6

    iget-wide v12, p0, Lcom/androie/settings/applications/RunningProcessesView;->mLastBackgroundProcessMemory:J

    long-to-float v12, v12

    div-float/2addr v12, v6

    invoke-virtual {v8, v10, v11, v12}, Lcom/androie/settings/applications/LinearColorBar;->setRatios(FFF)V

    .line 375
    monitor-exit v9

    .line 376
    return-void

    .line 375
    .end local v6    # "totalMem":F
    .end local v7    # "totalShownMem":F
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8
.end method

.method updateTimes()V
    .locals 4

    .prologue
    .line 474
    iget-object v2, p0, Lcom/androie/settings/applications/RunningProcessesView;->mActiveItems:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 475
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 476
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;

    .line 477
    .local v0, "ai":Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;
    iget-object v2, v0, Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;->mRootView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    if-nez v2, :cond_0

    .line 479
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 482
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/RunningProcessesView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/applications/RunningProcessesView;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;->updateTime(Landroid/content/Context;Ljava/lang/StringBuilder;)V

    goto :goto_0

    .line 484
    .end local v0    # "ai":Lcom/androie/settings/applications/RunningProcessesView$ActiveItem;
    :cond_1
    return-void
.end method
