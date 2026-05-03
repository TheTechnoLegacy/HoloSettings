.class public Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;
.super Ljava/lang/Object;
.source "ManageApplications.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/applications/ManageApplications;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TabInfo"
.end annotation


# instance fields
.field private mAppStorage:J

.field public mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

.field public final mApplicationsState:Lcom/jellybyn/settings/applications/ApplicationsState;

.field public final mClickListener:Lcom/jellybyn/settings/applications/AppClickListener;

.field private mColorBar:Lcom/jellybyn/settings/applications/LinearColorBar;

.field public final mComputingSizeStr:Ljava/lang/CharSequence;

.field private mContainerService:Lcom/android/internal/app/IMediaContainerService;

.field public final mFilter:I

.field private mFreeStorage:J

.field private mFreeStorageText:Landroid/widget/TextView;

.field public mInflater:Landroid/view/LayoutInflater;

.field public final mInvalidSizeStr:Ljava/lang/CharSequence;

.field public final mLabel:Ljava/lang/CharSequence;

.field private mLastFreeStorage:J

.field private mLastUsedStorage:J

.field private mListContainer:Landroid/view/View;

.field public final mListType:I

.field private mListView:Landroid/widget/ListView;

.field private mLoadingContainer:Landroid/view/View;

.field public final mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

.field public mRootView:Landroid/view/View;

.field final mRunningProcessesAvail:Ljava/lang/Runnable;

.field private mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

.field private final mSavedInstanceState:Landroid/os/Bundle;

.field private mStorageChartLabel:Landroid/widget/TextView;

.field private mTotalStorage:J

.field private mUsedStorageText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/jellybyn/settings/applications/ManageApplications;Lcom/jellybyn/settings/applications/ApplicationsState;Ljava/lang/CharSequence;ILcom/jellybyn/settings/applications/AppClickListener;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "owner"    # Lcom/jellybyn/settings/applications/ManageApplications;
    .param p2, "apps"    # Lcom/jellybyn/settings/applications/ApplicationsState;
    .param p3, "label"    # Ljava/lang/CharSequence;
    .param p4, "listType"    # I
    .param p5, "clickListener"    # Lcom/jellybyn/settings/applications/AppClickListener;
    .param p6, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v0, 0x0

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    iput-wide v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    iput-wide v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    iput-wide v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    .line 210
    new-instance v0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo$1;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo$1;-><init>(Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;)V

    iput-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesAvail:Ljava/lang/Runnable;

    .line 219
    iput-object p1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    .line 220
    iput-object p2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplicationsState:Lcom/jellybyn/settings/applications/ApplicationsState;

    .line 221
    iput-object p3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLabel:Ljava/lang/CharSequence;

    .line 222
    iput p4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListType:I

    .line 223
    packed-switch p4, :pswitch_data_0

    .line 227
    :pswitch_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    .line 229
    :goto_0
    iput-object p5, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mClickListener:Lcom/jellybyn/settings/applications/AppClickListener;

    .line 230
    invoke-virtual {p1}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0437

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mInvalidSizeStr:Ljava/lang/CharSequence;

    .line 231
    invoke-virtual {p1}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0b0436

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mComputingSizeStr:Ljava/lang/CharSequence;

    .line 232
    iput-object p6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mSavedInstanceState:Landroid/os/Bundle;

    .line 233
    return-void

    .line 224
    :pswitch_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    goto :goto_0

    .line 225
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    goto :goto_0

    .line 226
    :pswitch_3
    const/4 v0, 0x3

    iput v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    goto :goto_0

    .line 223
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method static synthetic access$1100(Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;)Lcom/jellybyn/settings/applications/RunningProcessesView;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method applyCurrentStorage()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v9, 0x0

    const-wide/16 v7, -0x1

    .line 384
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    if-nez v3, :cond_1

    .line 416
    :cond_0
    :goto_0
    return-void

    .line 387
    :cond_1
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_3

    .line 388
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mColorBar:Lcom/jellybyn/settings/applications/LinearColorBar;

    iget-wide v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    sub-long/2addr v4, v6

    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    sub-long/2addr v4, v6

    long-to-float v4, v4

    iget-wide v5, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    long-to-float v5, v5

    div-float/2addr v4, v5

    iget-wide v5, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    long-to-float v5, v5

    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    long-to-float v6, v6

    div-float/2addr v5, v6

    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    long-to-float v6, v6

    iget-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    long-to-float v7, v7

    div-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Lcom/jellybyn/settings/applications/LinearColorBar;->setRatios(FFF)V

    .line 390
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    iget-wide v5, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    sub-long v1, v3, v5

    .line 391
    .local v1, "usedStorage":J
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastUsedStorage:J

    cmp-long v3, v3, v1

    if-eqz v3, :cond_2

    .line 392
    iput-wide v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastUsedStorage:J

    .line 393
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v3}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v1, v2}, Landroid/text/format/Formatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    .line 395
    .local v0, "sizeStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mUsedStorageText:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v4}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b045c

    new-array v6, v11, [Ljava/lang/Object;

    aput-object v0, v6, v10

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 398
    .end local v0    # "sizeStr":Ljava/lang/String;
    :cond_2
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastFreeStorage:J

    iget-wide v5, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    .line 399
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    iput-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastFreeStorage:J

    .line 400
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v3}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-wide v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    invoke-static {v3, v4, v5}, Landroid/text/format/Formatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    .line 402
    .restart local v0    # "sizeStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorageText:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v4}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b045b

    new-array v6, v11, [Ljava/lang/Object;

    aput-object v0, v6, v10

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 406
    .end local v0    # "sizeStr":Ljava/lang/String;
    .end local v1    # "usedStorage":J
    :cond_3
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mColorBar:Lcom/jellybyn/settings/applications/LinearColorBar;

    invoke-virtual {v3, v9, v9, v9}, Lcom/jellybyn/settings/applications/LinearColorBar;->setRatios(FFF)V

    .line 407
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastUsedStorage:J

    cmp-long v3, v3, v7

    if-eqz v3, :cond_4

    .line 408
    iput-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastUsedStorage:J

    .line 409
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mUsedStorageText:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    :cond_4
    iget-wide v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastFreeStorage:J

    cmp-long v3, v3, v7

    if-eqz v3, :cond_0

    .line 412
    iput-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLastFreeStorage:J

    .line 413
    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorageText:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method

.method public build(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "contentParent"    # Landroid/view/ViewGroup;
    .param p3, "contentChild"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 241
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 242
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    .line 287
    :goto_0
    return-object v2

    .line 245
    :cond_0
    iput-object p1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mInflater:Landroid/view/LayoutInflater;

    .line 246
    iget v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListType:I

    if-ne v2, v4, :cond_4

    const v2, 0x7f040041

    :goto_1
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    .line 249
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    const v3, 0x7f0800af

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    .line 250
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 251
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    const v3, 0x7f0800aa

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    .line 252
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 254
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x1020004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 255
    .local v0, "emptyView":Landroid/view/View;
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x102000a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 256
    .local v1, "lv":Landroid/widget/ListView;
    if-eqz v0, :cond_1

    .line 257
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 259
    :cond_1
    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 260
    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setSaveEnabled(Z)V

    .line 261
    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 262
    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 263
    iput-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListView:Landroid/widget/ListView;

    .line 264
    new-instance v2, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplicationsState:Lcom/jellybyn/settings/applications/ApplicationsState;

    iget v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    invoke-direct {v2, v3, p0, v4}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;-><init>(Lcom/jellybyn/settings/applications/ApplicationsState;Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;I)V

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    .line 265
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 266
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 267
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x7f0800ab

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/jellybyn/settings/applications/LinearColorBar;

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mColorBar:Lcom/jellybyn/settings/applications/LinearColorBar;

    .line 268
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x7f0800ad

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mStorageChartLabel:Landroid/widget/TextView;

    .line 269
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x7f0800ac

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mUsedStorageText:Landroid/widget/TextView;

    .line 270
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListContainer:Landroid/view/View;

    const v3, 0x7f0800ae

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorageText:Landroid/widget/TextView;

    .line 271
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mListView:Landroid/widget/ListView;

    invoke-static {p2, p3, v2, v5}, Lcom/jellybyn/settings/Utils;->prepareCustomPreferencesList(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Z)V

    .line 272
    iget v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    .line 273
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mStorageChartLabel:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v3}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0b0421

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    :goto_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->applyCurrentStorage()V

    .line 281
    .end local v0    # "emptyView":Landroid/view/View;
    .end local v1    # "lv":Landroid/widget/ListView;
    :cond_2
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    const v3, 0x7f0800b3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/jellybyn/settings/applications/RunningProcessesView;

    iput-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    .line 283
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    if-eqz v2, :cond_3

    .line 284
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mSavedInstanceState:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Lcom/jellybyn/settings/applications/RunningProcessesView;->doCreate(Landroid/os/Bundle;)V

    .line 287
    :cond_3
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    goto/16 :goto_0

    .line 246
    :cond_4
    const v2, 0x7f04003e

    goto/16 :goto_1

    .line 276
    .restart local v0    # "emptyView":Landroid/view/View;
    .restart local v1    # "lv":Landroid/widget/ListView;
    :cond_5
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mStorageChartLabel:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v3}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0b0420

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method public detachView()V
    .locals 2

    .prologue
    .line 291
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 292
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 293
    .local v0, "group":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 294
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 297
    .end local v0    # "group":Landroid/view/ViewGroup;
    :cond_0
    return-void
.end method

.method handleRunningProcessesAvail()V
    .locals 3

    .prologue
    .line 424
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v1}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x10a0001

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 426
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v1}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/high16 v2, 0x10a0000

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/RunningProcessesView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 428
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/RunningProcessesView;->setVisibility(I)V

    .line 429
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 430
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .param p2, "view"    # Landroid/view/View;
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
    .line 420
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mClickListener:Lcom/jellybyn/settings/applications/AppClickListener;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-wide v5, p4

    invoke-interface/range {v0 .. v6}, Lcom/jellybyn/settings/applications/AppClickListener;->onItemClick(Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 421
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v0}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->pause()V

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    if-eqz v0, :cond_1

    .line 319
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    invoke-virtual {v0}, Lcom/jellybyn/settings/applications/RunningProcessesView;->doPause()V

    .line 321
    :cond_1
    return-void
.end method

.method public resume(I)V
    .locals 5
    .param p1, "sortOrder"    # I

    .prologue
    const/4 v4, 0x0

    .line 300
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v1, :cond_0

    .line 301
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v1, p1}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->resume(I)V

    .line 303
    :cond_0
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    if-eqz v1, :cond_1

    .line 304
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesAvail:Ljava/lang/Runnable;

    invoke-virtual {v1, v2, v3}, Lcom/jellybyn/settings/applications/RunningProcessesView;->doResume(Landroid/app/Fragment;Ljava/lang/Runnable;)Z

    move-result v0

    .line 305
    .local v0, "haveData":Z
    if-eqz v0, :cond_2

    .line 306
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mRunningProcessesView:Lcom/jellybyn/settings/applications/RunningProcessesView;

    invoke-virtual {v1, v4}, Lcom/jellybyn/settings/applications/RunningProcessesView;->setVisibility(I)V

    .line 307
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 312
    .end local v0    # "haveData":Z
    :cond_1
    :goto_0
    return-void

    .line 309
    .restart local v0    # "haveData":Z
    :cond_2
    iget-object v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLoadingContainer:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public setContainerService(Lcom/android/internal/app/IMediaContainerService;)V
    .locals 0
    .param p1, "containerService"    # Lcom/android/internal/app/IMediaContainerService;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    .line 237
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->updateStorageUsage()V

    .line 238
    return-void
.end method

.method updateStorageUsage()V
    .locals 12

    .prologue
    const-wide/16 v7, 0x0

    .line 325
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mOwner:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-virtual {v6}, Lcom/jellybyn/settings/applications/ManageApplications;->getActivity()Landroid/app/Activity;

    move-result-object v6

    if-nez v6, :cond_1

    .line 380
    :cond_0
    :goto_0
    return-void

    .line 327
    :cond_1
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v6, :cond_0

    .line 329
    iput-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    .line 330
    iput-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    .line 331
    iput-wide v7, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    .line 333
    iget v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFilter:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_3

    .line 334
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    if-eqz v6, :cond_2

    .line 336
    :try_start_0
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/android/internal/app/IMediaContainerService;->getFileSystemStats(Ljava/lang/String;)[J

    move-result-object v5

    .line 338
    .local v5, "stats":[J
    const/4 v6, 0x0

    aget-wide v6, v5, v6

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    .line 339
    const/4 v6, 0x1

    aget-wide v6, v5, v6

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 345
    .end local v5    # "stats":[J
    :cond_2
    :goto_1
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v6, :cond_7

    .line 346
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v6}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->getCount()I

    move-result v0

    .line 347
    .local v0, "N":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    if-ge v4, v0, :cond_7

    .line 348
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v6, v4}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->getAppEntry(I)Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    move-result-object v1

    .line 349
    .local v1, "ae":Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    iget-wide v8, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    iget-wide v10, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v8, v10

    iget-wide v10, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCacheSize:J

    add-long/2addr v8, v10

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    .line 347
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 340
    .end local v0    # "N":I
    .end local v1    # "ae":Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;
    .end local v4    # "i":I
    :catch_0
    move-exception v2

    .line 341
    .local v2, "e":Landroid/os/RemoteException;
    const-string v6, "ManageApplications"

    const-string v7, "Problem in container service"

    invoke-static {v6, v7, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 354
    .end local v2    # "e":Landroid/os/RemoteException;
    :cond_3
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    if-eqz v6, :cond_4

    .line 356
    :try_start_1
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mContainerService:Lcom/android/internal/app/IMediaContainerService;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/android/internal/app/IMediaContainerService;->getFileSystemStats(Ljava/lang/String;)[J

    move-result-object v5

    .line 358
    .restart local v5    # "stats":[J
    const/4 v6, 0x0

    aget-wide v6, v5, v6

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mTotalStorage:J

    .line 359
    const/4 v6, 0x1

    aget-wide v6, v5, v6

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 365
    .end local v5    # "stats":[J
    :cond_4
    :goto_3
    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v3

    .line 366
    .local v3, "emulatedStorage":Z
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    if-eqz v6, :cond_6

    .line 367
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v6}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->getCount()I

    move-result v0

    .line 368
    .restart local v0    # "N":I
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_4
    if-ge v4, v0, :cond_6

    .line 369
    iget-object v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplications:Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;

    invoke-virtual {v6, v4}, Lcom/jellybyn/settings/applications/ManageApplications$ApplicationsAdapter;->getAppEntry(I)Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;

    move-result-object v1

    .line 370
    .restart local v1    # "ae":Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    iget-wide v8, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->codeSize:J

    iget-wide v10, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->dataSize:J

    add-long/2addr v8, v10

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    .line 371
    if-eqz v3, :cond_5

    .line 372
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    iget-wide v8, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalCodeSize:J

    iget-wide v10, v1, Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;->externalDataSize:J

    add-long/2addr v8, v10

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mAppStorage:J

    .line 368
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 360
    .end local v0    # "N":I
    .end local v1    # "ae":Lcom/jellybyn/settings/applications/ApplicationsState$AppEntry;
    .end local v3    # "emulatedStorage":Z
    .end local v4    # "i":I
    :catch_1
    move-exception v2

    .line 361
    .restart local v2    # "e":Landroid/os/RemoteException;
    const-string v6, "ManageApplications"

    const-string v7, "Problem in container service"

    invoke-static {v6, v7, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 376
    .end local v2    # "e":Landroid/os/RemoteException;
    .restart local v3    # "emulatedStorage":Z
    :cond_6
    iget-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    iget-object v8, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mApplicationsState:Lcom/jellybyn/settings/applications/ApplicationsState;

    invoke-virtual {v8}, Lcom/jellybyn/settings/applications/ApplicationsState;->sumCacheSizes()J

    move-result-wide v8

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mFreeStorage:J

    .line 379
    .end local v3    # "emulatedStorage":Z
    :cond_7
    invoke-virtual {p0}, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->applyCurrentStorage()V

    goto/16 :goto_0
.end method
