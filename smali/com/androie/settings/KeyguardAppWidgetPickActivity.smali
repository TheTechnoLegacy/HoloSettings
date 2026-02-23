.class public Lcom/androie/settings/KeyguardAppWidgetPickActivity;
.super Landroid/app/Activity;
.source "KeyguardAppWidgetPickActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/androie/settings/AppWidgetLoader$ItemConstructor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;,
        Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Lcom/androie/settings/AppWidgetLoader$ItemConstructor",
        "<",
        "Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;",
        ">;"
    }
.end annotation


# instance fields
.field private mAddingToKeyguard:Z

.field private mAppWidgetAdapter:Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

.field private mAppWidgetId:I

.field private mAppWidgetLoader:Lcom/androie/settings/AppWidgetLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/androie/settings/AppWidgetLoader",
            "<",
            "Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;",
            ">;"
        }
    .end annotation
.end field

.field private mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

.field private mExtraConfigureOptions:Landroid/os/Bundle;

.field private mGridView:Landroid/widget/GridView;

.field private mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;",
            ">;"
        }
    .end annotation
.end field

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mResultData:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAddingToKeyguard:Z

    .line 443
    return-void
.end method

.method private finishDelayedAndShowLockScreen(I)V
    .locals 10
    .param p1, "appWidgetId"    # I

    .prologue
    .line 594
    const-string v6, "window"

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 595
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v3

    .line 596
    .local v3, "iWm":Landroid/view/IWindowManager;
    const/4 v4, 0x0

    .line 597
    .local v4, "opts":Landroid/os/Bundle;
    if-eqz p1, :cond_0

    .line 598
    new-instance v4, Landroid/os/Bundle;

    .end local v4    # "opts":Landroid/os/Bundle;
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 599
    .restart local v4    # "opts":Landroid/os/Bundle;
    const-string v6, "showappwidget"

    invoke-virtual {v4, v6, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 602
    :cond_0
    :try_start_0
    invoke-interface {v3, v4}, Landroid/view/IWindowManager;->lockNow(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 607
    :goto_0
    const v6, 0x7f0c007a

    invoke-virtual {p0, v6}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 608
    .local v5, "root":Landroid/view/ViewGroup;
    const/high16 v6, -0x1000000

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 610
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 611
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_1

    .line 612
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 611
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 614
    :cond_1
    iget-object v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mGridView:Landroid/widget/GridView;

    new-instance v7, Lcom/androie/settings/KeyguardAppWidgetPickActivity$1;

    invoke-direct {v7, p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity$1;-><init>(Lcom/androie/settings/KeyguardAppWidgetPickActivity;)V

    const-wide/16 v8, 0x1f4

    invoke-virtual {v6, v7, v8, v9}, Landroid/widget/GridView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 619
    return-void

    .line 603
    .end local v1    # "childCount":I
    .end local v2    # "i":I
    .end local v5    # "root":Landroid/view/ViewGroup;
    :catch_0
    move-exception v6

    goto :goto_0
.end method


# virtual methods
.method public createItem(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "info"    # Landroid/appwidget/AppWidgetProviderInfo;
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 432
    iget-object v1, p2, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 434
    .local v1, "label":Ljava/lang/CharSequence;
    new-instance v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;

    invoke-direct {v0, p1, v1}, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 435
    .local v0, "item":Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;
    iget v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    iput v2, v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->appWidgetPreviewId:I

    .line 436
    iget v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    iput v2, v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->iconId:I

    .line 437
    iget-object v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->packageName:Ljava/lang/String;

    .line 438
    iget-object v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->className:Ljava/lang/String;

    .line 439
    iput-object p3, v0, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->extras:Landroid/os/Bundle;

    .line 440
    return-object v0
.end method

.method public bridge synthetic createItem(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Landroid/appwidget/AppWidgetProviderInfo;
    .param p3, "x2"    # Landroid/os/Bundle;

    .prologue
    .line 71
    invoke-virtual {p0, p1, p2, p3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->createItem(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 10
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/16 v9, 0x7e

    const/4 v8, 0x0

    const/4 v7, -0x1

    const/16 v6, 0x7f

    .line 552
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 553
    if-eq p1, v9, :cond_0

    if-ne p1, v6, :cond_1

    .line 555
    :cond_0
    if-nez p3, :cond_2

    .line 556
    const/4 v1, 0x0

    .line 561
    .local v1, "appWidgetId":I
    :goto_0
    if-ne p1, v9, :cond_4

    if-ne p2, v7, :cond_4

    .line 562
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v2

    .line 564
    .local v2, "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    const/4 v0, 0x0

    .line 565
    .local v0, "appWidget":Landroid/appwidget/AppWidgetProviderInfo;
    invoke-virtual {v2, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v0

    .line 567
    iget-object v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v5, :cond_3

    .line 569
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.appwidget.action.APPWIDGET_CONFIGURE"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 570
    .local v3, "intent":Landroid/content/Intent;
    iget-object v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 571
    const/high16 v5, 0x800000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 572
    const-string v5, "appWidgetId"

    invoke-virtual {v3, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 574
    invoke-virtual {p0, v3, v6}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->startActivityForResultSafely(Landroid/content/Intent;I)V

    .line 591
    .end local v0    # "appWidget":Landroid/appwidget/AppWidgetProviderInfo;
    .end local v1    # "appWidgetId":I
    .end local v2    # "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    .end local v3    # "intent":Landroid/content/Intent;
    :cond_1
    :goto_1
    return-void

    .line 558
    :cond_2
    const-string v5, "appWidgetId"

    invoke-virtual {p3, v5, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .restart local v1    # "appWidgetId":I
    goto :goto_0

    .line 577
    .restart local v0    # "appWidget":Landroid/appwidget/AppWidgetProviderInfo;
    .restart local v2    # "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    :cond_3
    invoke-virtual {p0, v6, v7, p3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1

    .line 579
    .end local v0    # "appWidget":Landroid/appwidget/AppWidgetProviderInfo;
    .end local v2    # "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    :cond_4
    if-ne p1, v6, :cond_5

    if-ne p2, v7, :cond_5

    .line 580
    iget-object v5, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v5, v1, v8}, Lcom/android/internal/widget/LockPatternUtils;->addAppWidget(II)Z

    .line 581
    invoke-direct {p0, v1}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finishDelayedAndShowLockScreen(I)V

    goto :goto_1

    .line 583
    :cond_5
    iget-boolean v5, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAddingToKeyguard:Z

    if-eqz v5, :cond_6

    iget v5, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    if-eqz v5, :cond_6

    .line 585
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v4

    .line 586
    .local v4, "userId":I
    iget v5, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    invoke-static {v5, v4}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetIdForSystem(II)V

    .line 588
    .end local v4    # "userId":I
    :cond_6
    invoke-direct {p0, v8}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finishDelayedAndShowLockScreen(I)V

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 92
    const v3, 0x7f04004f

    invoke-virtual {p0, v3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->setContentView(I)V

    .line 93
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 96
    const/4 v3, 0x0

    invoke-virtual {p0, v4, v3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->setResultData(ILandroid/content/Intent;)V

    .line 99
    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 100
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "appWidgetId"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 101
    const-string v3, "appWidgetId"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    .line 106
    :goto_0
    const-string v3, "appWidgetOptions"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mExtraConfigureOptions:Landroid/os/Bundle;

    .line 108
    const v3, 0x7f0c00e9

    invoke-virtual {p0, v3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/GridView;

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mGridView:Landroid/widget/GridView;

    .line 109
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 110
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 111
    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070032

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 114
    .local v2, "maxGridWidth":I
    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v2, v3, :cond_0

    .line 115
    iget-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v3}, Landroid/widget/GridView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 117
    :cond_0
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    .line 118
    new-instance v3, Lcom/androie/settings/AppWidgetLoader;

    iget-object v4, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    invoke-direct {v3, p0, v4, p0}, Lcom/androie/settings/AppWidgetLoader;-><init>(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;Lcom/androie/settings/AppWidgetLoader$ItemConstructor;)V

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetLoader:Lcom/androie/settings/AppWidgetLoader;

    .line 119
    iget-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetLoader:Lcom/androie/settings/AppWidgetLoader;

    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/androie/settings/AppWidgetLoader;->getItems(Landroid/content/Intent;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mItems:Ljava/util/List;

    .line 120
    new-instance v3, Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

    iget-object v4, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mItems:Ljava/util/List;

    invoke-direct {v3, p0, v4}, Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetAdapter:Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

    .line 121
    iget-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mGridView:Landroid/widget/GridView;

    iget-object v4, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetAdapter:Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 122
    iget-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v3, p0}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 124
    new-instance v3, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v3, p0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 125
    return-void

    .line 104
    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    .end local v2    # "maxGridWidth":I
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finish()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 544
    iget-object v0, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetAdapter:Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetAdapter:Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity$AppWidgetAdapter;->cancelAllWidgetPreviewLoaders()V

    .line 547
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 548
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 10
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
    .line 505
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mItems:Ljava/util/List;

    invoke-interface {v6, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;

    .line 506
    .local v3, "item":Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;
    invoke-virtual {v3}, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 509
    .local v2, "intent":Landroid/content/Intent;
    iget-object v6, v3, Lcom/androie/settings/KeyguardAppWidgetPickActivity$Item;->extras:Landroid/os/Bundle;

    if-eqz v6, :cond_0

    .line 512
    const/4 v4, -0x1

    .line 513
    .local v4, "result":I
    invoke-virtual {p0, v4, v2}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->setResultData(ILandroid/content/Intent;)V

    .line 536
    :goto_0
    iget-boolean v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAddingToKeyguard:Z

    if-eqz v6, :cond_2

    .line 537
    const/16 v6, 0x7e

    iget-object v7, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mResultData:Landroid/content/Intent;

    invoke-virtual {p0, v6, v4, v7}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 541
    :goto_1
    return-void

    .line 516
    .end local v4    # "result":I
    :cond_0
    :try_start_0
    iget-boolean v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAddingToKeyguard:Z

    if-eqz v6, :cond_1

    iget v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    if-nez v6, :cond_1

    .line 518
    const v0, 0x4b455947    # 1.2933447E7f

    .line 519
    .local v0, "KEYGUARD_HOST_ID":I
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v5

    .line 520
    .local v5, "userId":I
    const v6, 0x4b455947    # 1.2933447E7f

    invoke-static {v6, v5}, Landroid/appwidget/AppWidgetHost;->allocateAppWidgetIdForSystem(II)I

    move-result v6

    iput v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    .line 523
    .end local v0    # "KEYGUARD_HOST_ID":I
    .end local v5    # "userId":I
    :cond_1
    iget-object v6, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget v7, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    iget-object v9, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mExtraConfigureOptions:Landroid/os/Bundle;

    invoke-virtual {v6, v7, v8, v9}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetId(ILandroid/content/ComponentName;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 525
    const/4 v4, -0x1

    .line 534
    .restart local v4    # "result":I
    :goto_2
    const/4 v6, 0x0

    invoke-virtual {p0, v4, v6}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->setResultData(ILandroid/content/Intent;)V

    goto :goto_0

    .line 526
    .end local v4    # "result":I
    :catch_0
    move-exception v1

    .line 532
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const/4 v4, 0x0

    .restart local v4    # "result":I
    goto :goto_2

    .line 539
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->finish()V

    goto :goto_1
.end method

.method setResultData(ILandroid/content/Intent;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 133
    if-eqz p2, :cond_0

    move-object v0, p2

    .line 134
    .local v0, "result":Landroid/content/Intent;
    :goto_0
    const-string v1, "appWidgetId"

    iget v2, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mAppWidgetId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 135
    iput-object v0, p0, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->mResultData:Landroid/content/Intent;

    .line 136
    invoke-virtual {p0, p1, v0}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->setResult(ILandroid/content/Intent;)V

    .line 137
    return-void

    .line 133
    .end local v0    # "result":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    goto :goto_0
.end method

.method startActivityForResultSafely(Landroid/content/Intent;I)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    const v2, 0x7f08074b

    const/4 v1, 0x0

    .line 623
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/KeyguardAppWidgetPickActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 630
    :goto_0
    return-void

    .line 624
    :catch_0
    move-exception v0

    .line 625
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 626
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :catch_1
    move-exception v0

    .line 627
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 628
    const-string v1, "KeyguardAppWidgetPickActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Settings does not have the permission to launch "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
