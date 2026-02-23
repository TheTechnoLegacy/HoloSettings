.class Lcom/androie/settings/DreamSettings$DreamInfoAdapter;
.super Landroid/widget/ArrayAdapter;
.source "DreamSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DreamSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DreamInfoAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/androie/settings/DreamBackend$DreamInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private final mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/androie/settings/DreamSettings;


# direct methods
.method public constructor <init>(Lcom/androie/settings/DreamSettings;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->this$0:Lcom/androie/settings/DreamSettings;

    .line 287
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 288
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 289
    return-void
.end method

.method static synthetic access$500(Lcom/androie/settings/DreamSettings$DreamInfoAdapter;Lcom/androie/settings/DreamBackend$DreamInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DreamSettings$DreamInfoAdapter;
    .param p1, "x1"    # Lcom/androie/settings/DreamBackend$DreamInfo;

    .prologue
    .line 283
    invoke-direct {p0, p1}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->activate(Lcom/androie/settings/DreamBackend$DreamInfo;)V

    return-void
.end method

.method private activate(Lcom/androie/settings/DreamBackend$DreamInfo;)V
    .locals 3
    .param p1, "dreamInfo"    # Lcom/androie/settings/DreamBackend$DreamInfo;

    .prologue
    .line 354
    invoke-direct {p0}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getCurrentSelection()Lcom/androie/settings/DreamBackend$DreamInfo;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 362
    :goto_0
    return-void

    .line 356
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 357
    invoke-virtual {p0, v0}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/DreamBackend$DreamInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    .line 356
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 359
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p1, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    .line 360
    iget-object v1, p0, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->this$0:Lcom/androie/settings/DreamSettings;

    invoke-static {v1}, Lcom/androie/settings/DreamSettings;->access$200(Lcom/androie/settings/DreamSettings;)Lcom/androie/settings/DreamBackend;

    move-result-object v1

    iget-object v2, p1, Lcom/androie/settings/DreamBackend$DreamInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Lcom/androie/settings/DreamBackend;->setActiveDream(Landroid/content/ComponentName;)V

    .line 361
    invoke-virtual {p0}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method private createDreamInfoRow(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 334
    iget-object v2, p0, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f040047

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 335
    .local v1, "row":Landroid/view/View;
    const v2, 0x1020018

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 336
    .local v0, "header":Landroid/view/View;
    new-instance v2, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$3;

    invoke-direct {v2, p0, v1}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$3;-><init>(Lcom/androie/settings/DreamSettings$DreamInfoAdapter;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    return-object v1
.end method

.method private getCurrentSelection()Lcom/androie/settings/DreamBackend$DreamInfo;
    .locals 3

    .prologue
    .line 346
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 347
    invoke-virtual {p0, v1}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DreamBackend$DreamInfo;

    .line 348
    .local v0, "dreamInfo":Lcom/androie/settings/DreamBackend$DreamInfo;
    iget-boolean v2, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    if-eqz v2, :cond_0

    .line 351
    .end local v0    # "dreamInfo":Lcom/androie/settings/DreamBackend$DreamInfo;
    :goto_1
    return-object v0

    .line 346
    .restart local v0    # "dreamInfo":Lcom/androie/settings/DreamBackend$DreamInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 351
    .end local v0    # "dreamInfo":Lcom/androie/settings/DreamBackend$DreamInfo;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v8, 0x4

    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 293
    invoke-virtual {p0, p1}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DreamBackend$DreamInfo;

    .line 294
    .local v0, "dreamInfo":Lcom/androie/settings/DreamBackend$DreamInfo;
    const-string v6, "getView(%s)"

    new-array v9, v5, [Ljava/lang/Object;

    iget-object v10, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->caption:Ljava/lang/CharSequence;

    aput-object v10, v9, v7

    invoke-static {v6, v9}, Lcom/androie/settings/DreamSettings;->access$400(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 295
    if-eqz p2, :cond_0

    move-object v2, p2

    .line 296
    .local v2, "row":Landroid/view/View;
    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 299
    const v6, 0x1020006

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iget-object v9, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 302
    const v6, 0x1020016

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iget-object v9, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->caption:Ljava/lang/CharSequence;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    const v6, 0x1020019

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioButton;

    .line 306
    .local v1, "radioButton":Landroid/widget/RadioButton;
    iget-boolean v6, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    invoke-virtual {v1, v6}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 307
    new-instance v6, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$1;

    invoke-direct {v6, p0, v2}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$1;-><init>(Lcom/androie/settings/DreamSettings$DreamInfoAdapter;Landroid/view/View;)V

    invoke-virtual {v1, v6}, Landroid/widget/RadioButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 315
    iget-object v6, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->settingsComponentName:Landroid/content/ComponentName;

    if-eqz v6, :cond_1

    .line 316
    .local v5, "showSettings":Z
    :goto_1
    const v6, 0x7f0c00ba

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 317
    .local v4, "settingsDivider":Landroid/view/View;
    if-eqz v5, :cond_2

    move v6, v7

    :goto_2
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 319
    const v6, 0x102001a

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 320
    .local v3, "settingsButton":Landroid/widget/ImageView;
    if-eqz v5, :cond_3

    :goto_3
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    iget-boolean v6, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    if-eqz v6, :cond_4

    const/high16 v6, 0x3f800000    # 1.0f

    :goto_4
    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 322
    iget-boolean v6, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 323
    iget-boolean v6, v0, Lcom/androie/settings/DreamBackend$DreamInfo;->isActive:Z

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 324
    new-instance v6, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$2;

    invoke-direct {v6, p0, v2}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter$2;-><init>(Lcom/androie/settings/DreamSettings$DreamInfoAdapter;Landroid/view/View;)V

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    return-object v2

    .line 295
    .end local v1    # "radioButton":Landroid/widget/RadioButton;
    .end local v2    # "row":Landroid/view/View;
    .end local v3    # "settingsButton":Landroid/widget/ImageView;
    .end local v4    # "settingsDivider":Landroid/view/View;
    .end local v5    # "showSettings":Z
    :cond_0
    invoke-direct {p0, p3}, Lcom/androie/settings/DreamSettings$DreamInfoAdapter;->createDreamInfoRow(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    goto :goto_0

    .restart local v1    # "radioButton":Landroid/widget/RadioButton;
    .restart local v2    # "row":Landroid/view/View;
    :cond_1
    move v5, v7

    .line 315
    goto :goto_1

    .restart local v4    # "settingsDivider":Landroid/view/View;
    .restart local v5    # "showSettings":Z
    :cond_2
    move v6, v8

    .line 317
    goto :goto_2

    .restart local v3    # "settingsButton":Landroid/widget/ImageView;
    :cond_3
    move v7, v8

    .line 320
    goto :goto_3

    .line 321
    :cond_4
    const v6, 0x3ecccccd    # 0.4f

    goto :goto_4
.end method
