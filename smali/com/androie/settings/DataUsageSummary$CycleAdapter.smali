.class public Lcom/androie/settings/DataUsageSummary$CycleAdapter;
.super Landroid/widget/ArrayAdapter;
.source "DataUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CycleAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/androie/settings/DataUsageSummary$CycleItem;",
        ">;"
    }
.end annotation


# instance fields
.field private final mChangeItem:Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

.field private mChangePossible:Z

.field private mChangeVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 1459
    const v0, 0x1090008

    invoke-direct {p0, p1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 1453
    iput-boolean v1, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangePossible:Z

    .line 1454
    iput-boolean v1, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeVisible:Z

    .line 1460
    const v0, 0x1090009

    invoke-virtual {p0, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->setDropDownViewResource(I)V

    .line 1461
    new-instance v0, Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    invoke-direct {v0, p1}, Lcom/androie/settings/DataUsageSummary$CycleChangeItem;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeItem:Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    .line 1462
    return-void
.end method

.method private updateChange()V
    .locals 1

    .prologue
    .line 1475
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeItem:Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    invoke-virtual {p0, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->remove(Ljava/lang/Object;)V

    .line 1476
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangePossible:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeVisible:Z

    if-eqz v0, :cond_0

    .line 1477
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeItem:Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    invoke-virtual {p0, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->add(Ljava/lang/Object;)V

    .line 1479
    :cond_0
    return-void
.end method


# virtual methods
.method public findNearestPosition(Lcom/androie/settings/DataUsageSummary$CycleItem;)I
    .locals 4
    .param p1, "target"    # Lcom/androie/settings/DataUsageSummary$CycleItem;

    .prologue
    .line 1486
    if-eqz p1, :cond_2

    .line 1487
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->getCount()I

    move-result v0

    .line 1488
    .local v0, "count":I
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_2

    .line 1489
    invoke-virtual {p0, v1}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/DataUsageSummary$CycleItem;

    .line 1490
    .local v2, "item":Lcom/androie/settings/DataUsageSummary$CycleItem;
    instance-of v3, v2, Lcom/androie/settings/DataUsageSummary$CycleChangeItem;

    if-eqz v3, :cond_1

    .line 1488
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1492
    :cond_1
    invoke-virtual {v2, p1}, Lcom/androie/settings/DataUsageSummary$CycleItem;->compareTo(Lcom/androie/settings/DataUsageSummary$CycleItem;)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1497
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "item":Lcom/androie/settings/DataUsageSummary$CycleItem;
    :goto_1
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public setChangePossible(Z)V
    .locals 0
    .param p1, "possible"    # Z

    .prologue
    .line 1465
    iput-boolean p1, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangePossible:Z

    .line 1466
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->updateChange()V

    .line 1467
    return-void
.end method

.method public setChangeVisible(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 1470
    iput-boolean p1, p0, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->mChangeVisible:Z

    .line 1471
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->updateChange()V

    .line 1472
    return-void
.end method
