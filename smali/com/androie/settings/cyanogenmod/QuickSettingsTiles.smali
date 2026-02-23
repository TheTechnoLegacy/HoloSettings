.class public Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;
.super Landroid/app/Fragment;
.source "QuickSettingsTiles.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;,
        Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;
    }
.end annotation


# instance fields
.field private mConfigRibbon:Z

.field private mContainer:Landroid/view/ViewGroup;

.field private mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mSystemUiResources:Landroid/content/res/Resources;

.field private mTileAdapter:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 344
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mConfigRibbon:Z

    return v0
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Lcom/androie/settings/cyanogenmod/DraggableGridView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mTileAdapter:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    return-object v0
.end method

.method private getItemFromSystemUi(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 108
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    if-eqz v1, :cond_1

    .line 109
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    const-string v2, "com.android.systemui"

    invoke-virtual {v1, p1, p2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 110
    .local v0, "resId":I
    if-lez v0, :cond_1

    .line 112
    :try_start_0
    const-string v1, "dimen"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    .line 121
    .end local v0    # "resId":I
    :goto_0
    return v1

    .line 115
    .restart local v0    # "resId":I
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 117
    :catch_0
    move-exception v1

    .line 121
    .end local v0    # "resId":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private resetTiles()V
    .locals 3

    .prologue
    .line 262
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 263
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f08024d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 264
    const v1, 0x7f08024e

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 265
    const v1, 0x7f080073

    new-instance v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;

    invoke-direct {v2, p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$3;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 271
    const v1, 0x7f080458

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 272
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 273
    return-void
.end method


# virtual methods
.method addTile(ILjava/lang/String;IZ)V
    .locals 12
    .param p1, "titleId"    # I
    .param p2, "iconSysId"    # Ljava/lang/String;
    .param p3, "iconRegId"    # I
    .param p4, "newTile"    # Z

    .prologue
    .line 145
    const/4 v6, 0x0

    .line 146
    .local v6, "tileView":Landroid/view/View;
    if-eqz p3, :cond_1

    .line 147
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f0400a3

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    .line 148
    const v8, 0x7f0c0184

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 149
    .local v4, "name":Landroid/widget/TextView;
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(I)V

    .line 150
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v4, v8, p3, v9, v10}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 177
    .end local v4    # "name":Landroid/widget/TextView;
    :cond_0
    :goto_0
    iget-object v9, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    if-eqz p4, :cond_4

    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    :goto_1
    invoke-virtual {v9, v6, v8}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->addView(Landroid/view/View;I)V

    .line 178
    return-void

    .line 152
    :cond_1
    sget-object v8, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->TILES:Ljava/util/Map;

    const-string v9, "toggleUser"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    invoke-virtual {v8}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getTitleResId()I

    move-result v8

    if-ne p1, v8, :cond_2

    const/4 v2, 0x1

    .line 153
    .local v2, "isUserTile":Z
    :goto_2
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    if-eqz v8, :cond_0

    if-eqz p2, :cond_0

    .line 154
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v8, p2, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 155
    .local v5, "resId":I
    if-lez v5, :cond_0

    .line 157
    :try_start_0
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    invoke-virtual {v8, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 158
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    const/4 v6, 0x0

    .line 159
    if-eqz v2, :cond_3

    .line 160
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f0400a4

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    .line 161
    const v8, 0x7f0c0185

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 162
    .local v3, "iv":Landroid/widget/ImageView;
    const v8, 0x7f0c0184

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 163
    .local v7, "tv":Landroid/widget/TextView;
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(I)V

    .line 164
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 171
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    .end local v3    # "iv":Landroid/widget/ImageView;
    .end local v7    # "tv":Landroid/widget/TextView;
    :catch_0
    move-exception v1

    .line 172
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 152
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "isUserTile":Z
    .end local v5    # "resId":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    .line 166
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v2    # "isUserTile":Z
    .restart local v5    # "resId":I
    :cond_3
    :try_start_1
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f0400a3

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    .line 167
    const v8, 0x7f0c0184

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 168
    .restart local v4    # "name":Landroid/widget/TextView;
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(I)V

    .line 169
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v4, v8, v0, v9, v10}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 177
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    .end local v2    # "isUserTile":Z
    .end local v4    # "name":Landroid/widget/TextView;
    .end local v5    # "resId":I
    :cond_4
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v8

    goto :goto_1
.end method

.method genTiles()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 125
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v4}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->removeAllViews()V

    .line 126
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-boolean v5, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mConfigRibbon:Z

    invoke-static {v4, v5}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getCurrentTiles(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileListFromString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 128
    .local v3, "tiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 129
    .local v2, "tileindex":Ljava/lang/String;
    sget-object v4, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->TILES:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    .line 130
    .local v1, "tile":Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    if-eqz v1, :cond_0

    .line 131
    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getTitleResId()I

    move-result v4

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getIcon()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5, v7, v7}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->addTile(ILjava/lang/String;IZ)V

    goto :goto_0

    .line 134
    .end local v1    # "tile":Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    .end local v2    # "tileindex":Ljava/lang/String;
    :cond_1
    const v4, 0x7f0800ba

    const/4 v5, 0x0

    const v6, 0x7f020071

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->addTile(ILjava/lang/String;IZ)V

    .line 135
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 182
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 183
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->genTiles()V

    .line 184
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    new-instance v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)V

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setOnRearrangeListener(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;)V

    .line 203
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    new-instance v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    invoke-direct {v1, p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)V

    invoke-virtual {v0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 229
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->setHasOptionsMenu(Z)V

    .line 230
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 243
    const/4 v0, 0x1

    const v1, 0x7f0800c7

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020090

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    const/16 v1, 0x72

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 248
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x0

    .line 65
    new-instance v8, Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/androie/settings/cyanogenmod/DraggableGridView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    .line 66
    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mContainer:Landroid/view/ViewGroup;

    .line 67
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 68
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v8, v10}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 69
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mInflater:Landroid/view/LayoutInflater;

    .line 72
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 73
    .local v0, "args":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 74
    const-string v8, "config_ribbon"

    invoke-virtual {v0, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mConfigRibbon:Z

    .line 77
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 78
    .local v7, "pm":Landroid/content/pm/PackageManager;
    if-eqz v7, :cond_1

    .line 80
    :try_start_0
    const-string v8, "com.android.systemui"

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v8

    iput-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_1
    :goto_0
    const-string v8, "notification_panel_width"

    const-string v9, "dimen"

    invoke-direct {p0, v8, v9}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getItemFromSystemUi(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 86
    .local v5, "panelWidth":I
    if-eqz v5, :cond_2

    .line 87
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, 0x1

    invoke-direct {v6, v5, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 89
    .local v6, "params":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8, v6}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .end local v6    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :cond_2
    const-string v8, "quick_settings_cell_height"

    const-string v9, "dimen"

    invoke-direct {p0, v8, v9}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getItemFromSystemUi(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 92
    .local v2, "cellHeight":I
    if-eqz v2, :cond_3

    .line 93
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8, v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setCellHeight(I)V

    .line 95
    :cond_3
    const-string v8, "quick_settings_cell_gap"

    const-string v9, "dimen"

    invoke-direct {p0, v8, v9}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getItemFromSystemUi(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 96
    .local v1, "cellGap":I
    if-eqz v1, :cond_4

    .line 97
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setCellGap(I)V

    .line 99
    :cond_4
    const-string v8, "quick_settings_num_columns"

    const-string v9, "integer"

    invoke-direct {p0, v8, v9}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getItemFromSystemUi(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 100
    .local v3, "columnCount":I
    if-eqz v3, :cond_5

    .line 101
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v8, v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setColumnCount(I)V

    .line 103
    :cond_5
    new-instance v8, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v9

    iget-boolean v10, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mConfigRibbon:Z

    invoke-direct {v8, v9, v10}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;-><init>(Landroid/content/Context;Z)V

    iput-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mTileAdapter:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    .line 104
    iget-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mDragView:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    return-object v8

    .line 81
    .end local v1    # "cellGap":I
    .end local v2    # "cellHeight":I
    .end local v3    # "columnCount":I
    .end local v5    # "panelWidth":I
    :catch_0
    move-exception v4

    .line 82
    .local v4, "e":Ljava/lang/Exception;
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mSystemUiResources:Landroid/content/res/Resources;

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 252
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 257
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 254
    :pswitch_0
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->resetTiles()V

    .line 255
    const/4 v0, 0x1

    goto :goto_0

    .line 252
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 3

    .prologue
    const/16 v2, 0x14

    const/4 v1, 0x0

    .line 234
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 235
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/Utils;->isPhone(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2, v1, v2, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 238
    :cond_0
    return-void
.end method
