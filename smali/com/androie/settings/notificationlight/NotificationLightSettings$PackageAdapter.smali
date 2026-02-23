.class Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;
.super Landroid/widget/BaseAdapter;
.source "NotificationLightSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/notificationlight/NotificationLightSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PackageAdapter"
.end annotation


# instance fields
.field private mInstalledPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/androie/settings/notificationlight/NotificationLightSettings;


# direct methods
.method public constructor <init>(Lcom/androie/settings/notificationlight/NotificationLightSettings;)V
    .locals 1

    .prologue
    .line 542
    iput-object p1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->this$0:Lcom/androie/settings/notificationlight/NotificationLightSettings;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 497
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    .line 543
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->reloadList()V

    .line 544
    return-void
.end method

.method static synthetic access$200(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;

    .prologue
    .line 496
    iget-object v0, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    return-object v0
.end method

.method private reloadList()V
    .locals 3

    .prologue
    .line 500
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 501
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;-><init>(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;Landroid/os/Handler;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 540
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .prologue
    .line 548
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    monitor-enter v1

    .line 549
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 550
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getItem(I)Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 555
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    monitor-enter v1

    .line 556
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    monitor-exit v1

    return-object v0

    .line 557
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 496
    invoke-virtual {p0, p1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->getItem(I)Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 562
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    monitor-enter v1

    .line 564
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->mInstalledPackages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    iget-object v0, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v2, v0

    monitor-exit v1

    return-wide v2

    .line 565
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 571
    if-eqz p2, :cond_1

    .line 572
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;

    .line 582
    .local v1, "holder":Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->getItem(I)Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    move-result-object v0

    .line 584
    .local v0, "applicationInfo":Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;
    iget-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v7, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 585
    iget-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v7, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 587
    iget-object v4, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    invoke-virtual {v4}, Ljava/util/TreeSet;->size()I

    move-result v4

    if-lez v4, :cond_2

    move v3, v5

    .line 588
    .local v3, "needSummary":Z
    :goto_1
    iget-object v4, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    invoke-virtual {v4}, Ljava/util/TreeSet;->size()I

    move-result v4

    if-ne v4, v5, :cond_0

    .line 589
    iget-object v5, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->title:Ljava/lang/CharSequence;

    iget-object v4, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    invoke-virtual {v4}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v5, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 590
    const/4 v3, 0x0

    .line 594
    :cond_0
    if-eqz v3, :cond_3

    .line 595
    iget-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->summary:Landroid/widget/TextView;

    const-string v5, ", "

    iget-object v7, v0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    invoke-static {v5, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 596
    iget-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->summary:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 601
    :goto_2
    return-object p2

    .line 574
    .end local v0    # "applicationInfo":Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;
    .end local v1    # "holder":Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;
    .end local v3    # "needSummary":Z
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->this$0:Lcom/androie/settings/notificationlight/NotificationLightSettings;

    const-string v7, "layout_inflater"

    invoke-static {v4, v7}, Lcom/androie/settings/notificationlight/NotificationLightSettings;->access$500(Lcom/androie/settings/notificationlight/NotificationLightSettings;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 575
    .local v2, "layoutInflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04008a

    const/4 v7, 0x0

    invoke-virtual {v2, v4, v7, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 576
    new-instance v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;

    invoke-direct {v1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;-><init>()V

    .line 577
    .restart local v1    # "holder":Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 578
    const v4, 0x1020016

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->title:Landroid/widget/TextView;

    .line 579
    const v4, 0x1020010

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->summary:Landroid/widget/TextView;

    .line 580
    const v4, 0x7f0c0037

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->icon:Landroid/widget/ImageView;

    goto/16 :goto_0

    .end local v2    # "layoutInflater":Landroid/view/LayoutInflater;
    .restart local v0    # "applicationInfo":Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;
    :cond_2
    move v3, v6

    .line 587
    goto :goto_1

    .line 598
    .restart local v3    # "needSummary":Z
    :cond_3
    iget-object v4, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$ViewHolder;->summary:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method
