.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;
.super Landroid/widget/ArrayAdapter;
.source "QuickSettingsTiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TileAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private mIsRibbon:Z

.field private mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isRibbon"    # Z

    .prologue
    .line 289
    const v0, 0x1090003

    invoke-direct {p0, p1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 290
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->getCount()I

    move-result v0

    new-array v0, v0, [Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    .line 291
    iput-boolean p2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mIsRibbon:Z

    .line 292
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->loadItems(Landroid/content/res/Resources;)V

    .line 293
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->sortItems()V

    .line 294
    return-void
.end method

.method private loadItems(Landroid/content/res/Resources;)V
    .locals 7
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 297
    const/4 v1, 0x0

    .line 298
    .local v1, "index":I
    sget-object v4, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->TILES:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    .line 299
    .local v3, "t":Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    new-instance v5, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    invoke-virtual {v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getTitleResId()I

    move-result v6

    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v3, v6}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;Ljava/lang/String;)V

    aput-object v5, v4, v1

    move v1, v2

    .line 300
    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_0

    .line 301
    .end local v3    # "t":Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    :cond_0
    return-void
.end method

.method private sortItems()V
    .locals 3

    .prologue
    .line 304
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    .line 305
    .local v0, "collator":Ljava/text/Collator;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/text/Collator;->setDecomposition(I)V

    .line 306
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/Collator;->setStrength(I)V

    .line 307
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    new-instance v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;Ljava/text/Collator;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 313
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 324
    sget-object v0, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->TILES:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 329
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tileTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTileId(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 333
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tile:Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 317
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 318
    .local v0, "v":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->isEnabled(I)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 319
    return-object v0
.end method

.method public isEnabled(I)Z
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 338
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mIsRibbon:Z

    invoke-static {v1, v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getCurrentTiles(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 340
    .local v0, "usedTiles":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->mTiles:[Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    aget-object v1, v1, p1

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tile:Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
