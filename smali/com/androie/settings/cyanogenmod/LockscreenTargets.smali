.class public Lcom/androie/settings/cyanogenmod/LockscreenTargets;
.super Landroid/app/Fragment;
.source "LockscreenTargets.java"

# interfaces
.implements Lcom/android/internal/widget/multiwaveview/GlowPadView$OnTriggerListener;
.implements Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;
.implements Lcom/androie/settings/cyanogenmod/ShortcutPickHelper$OnPickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    }
.end annotation


# static fields
.field private static mEmptyLabel:Ljava/lang/String;


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mContainer:Landroid/view/ViewGroup;

.field private mDialogIcon:Landroid/widget/ImageButton;

.field private mDialogLabel:Landroid/widget/Button;

.field private mIconPicker:Lcom/androie/settings/cyanogenmod/IconPicker;

.field private mMaxTargets:I

.field private mPicker:Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

.field private mResources:Landroid/content/res/Resources;

.field private mTargetIndex:I

.field private mTargetOffset:I

.field private mTargetStore:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mTemporaryImage:Ljava/io/File;

.field private mWaveView:Lcom/android/internal/widget/multiwaveview/GlowPadView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    .line 75
    const/4 v0, 0x0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetIndex:I

    .line 81
    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/LockscreenTargets;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->initializeView(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Lcom/androie/settings/cyanogenmod/IconPicker;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mIconPicker:Lcom/androie/settings/cyanogenmod/IconPicker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mPicker:Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$400(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getPickedIconFromDialog()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetIndex:I

    return v0
.end method

.method static synthetic access$600(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$700(Lcom/androie/settings/cyanogenmod/LockscreenTargets;ILjava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Landroid/graphics/drawable/Drawable;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct/range {p0 .. p6}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->setTarget(ILjava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mEmptyLabel:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    return-object v0
.end method

.method private createShortcutDialogView(I)Landroid/view/View;
    .locals 8
    .param p1, "target"    # I

    .prologue
    const/4 v7, 0x0

    const v6, 0x7f0c00e8

    const v5, 0x7f0c0037

    .line 451
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    const v4, 0x7f04005a

    invoke-static {v3, v4, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 452
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;

    invoke-direct {v4, p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 466
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;

    invoke-direct {v4, p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 477
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    .line 478
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    .line 480
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    .line 481
    .local v1, "item":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    iget-object v3, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->defaultIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v3}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->setIconForDialog(Landroid/graphics/drawable/Drawable;)V

    .line 483
    new-instance v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    invoke-direct {v0, v7}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    .line 484
    .local v0, "icon":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    iget-object v3, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 485
    iget-object v3, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 486
    iget-object v3, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    .line 487
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 489
    iget-object v3, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    const-string v4, "empty"

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 490
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    sget-object v4, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mEmptyLabel:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 494
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    iget-object v4, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 496
    return-object v2

    .line 492
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mPicker:Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    iget-object v5, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;->getFriendlyNameForUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private getPickedIconFromDialog()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method private initializeView(Ljava/lang/String;)V
    .locals 24
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 153
    if-nez p1, :cond_0

    .line 154
    const-string p1, "empty"

    .line 157
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->clear()V

    .line 159
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    move-object/from16 v20, v0

    const v21, 0x1080334

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 161
    .local v5, "activeBack":Landroid/graphics/drawable/Drawable;
    const-string v20, "\\|"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 163
    .local v16, "targetStore":[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v10, v0, :cond_1

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    new-instance v21, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    const/16 v22, 0x0

    invoke-direct/range {v21 .. v22}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 168
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    move-object/from16 v20, v0

    const v21, 0x1080339

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    .line 170
    .local v18, "unlockFront":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    move-object/from16 v20, v0

    const v21, 0x1080338

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    .line 172
    .local v17, "unlockBack":Landroid/graphics/drawable/Drawable;
    new-instance v19, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    const/16 v20, 0x0

    invoke-direct/range {v19 .. v20}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    .line 173
    .local v19, "unlockTarget":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move/from16 v3, v21

    move/from16 v4, v22

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getLayeredDrawable(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;IZ)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->icon:Landroid/graphics/drawable/StateListDrawable;

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    const/4 v10, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    move/from16 v20, v0

    rsub-int/lit8 v20, v20, 0x8

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v20

    if-ge v10, v0, :cond_9

    .line 178
    move-object/from16 v0, p0

    iget v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mMaxTargets:I

    move/from16 v20, v0

    move/from16 v0, v20

    if-lt v10, v0, :cond_2

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    new-instance v21, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    const/16 v22, 0x0

    invoke-direct/range {v21 .. v22}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 183
    :cond_2
    const/4 v8, 0x0

    .line 184
    .local v8, "front":Landroid/graphics/drawable/Drawable;
    move-object v6, v5

    .line 185
    .local v6, "back":Landroid/graphics/drawable/Drawable;
    const/4 v9, 0x0

    .line 186
    .local v9, "frontBlank":Z
    new-instance v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-direct {v12, v0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    .line 187
    .local v12, "info":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v10, v0, :cond_7

    aget-object v20, v16, v10

    :goto_3
    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    .line 189
    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "empty"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_4

    .line 191
    :try_start_0
    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v14

    .line 192
    .local v14, "intent":Landroid/content/Intent;
    const-string v20, "icon_file"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 193
    const-string v20, "icon_file"

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 194
    const-string v20, "icon_file"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v21}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 210
    :cond_3
    :goto_4
    if-nez v8, :cond_4

    .line 211
    const/16 v20, 0x0

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-static {v0, v14}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromIntent(Landroid/content/Context;Landroid/content/Intent;)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 219
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_4
    :goto_5
    if-eqz v6, :cond_5

    if-nez v8, :cond_6

    .line 220
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    move-object/from16 v20, v0

    const v21, 0x7f020066

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 223
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v20 .. v21}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getInsetForIconType(Landroid/content/Context;Ljava/lang/String;)I

    move-result v13

    .line 224
    .local v13, "inset":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-static {v0, v6, v8, v13, v9}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getLayeredDrawable(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;IZ)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->icon:Landroid/graphics/drawable/StateListDrawable;

    .line 226
    iput-object v8, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->defaultIcon:Landroid/graphics/drawable/Drawable;

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 187
    .end local v13    # "inset":I
    :cond_7
    const-string v20, "empty"

    goto/16 :goto_3

    .line 197
    .restart local v14    # "intent":Landroid/content/Intent;
    :cond_8
    :try_start_1
    const-string v20, "icon_resource"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 198
    const-string v20, "icon_resource"

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 199
    const-string v20, "icon_resource"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 200
    const-string v20, "icon_package"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    .line 202
    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    move-object/from16 v20, v0

    if-eqz v20, :cond_3

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    move-object/from16 v21, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static/range {v20 .. v23}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromResources(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    move-object/from16 v20, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    move-object/from16 v21, v0

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-static/range {v20 .. v23}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromResources(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 207
    const/4 v9, 0x1

    goto/16 :goto_4

    .line 214
    .end local v14    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v7

    .line 215
    .local v7, "e":Ljava/net/URISyntaxException;
    const-string v20, "LockscreenTargets"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Invalid lockscreen target "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v12, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 231
    .end local v6    # "back":Landroid/graphics/drawable/Drawable;
    .end local v7    # "e":Ljava/net/URISyntaxException;
    .end local v8    # "front":Landroid/graphics/drawable/Drawable;
    .end local v9    # "frontBlank":Z
    .end local v12    # "info":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    :cond_9
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .local v15, "targetDrawables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/widget/multiwaveview/TargetDrawable;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .end local v10    # "i":I
    .local v11, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    .line 233
    .local v10, "i":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    new-instance v21, Lcom/android/internal/widget/multiwaveview/TargetDrawable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    move-object/from16 v22, v0

    if-eqz v10, :cond_a

    iget-object v0, v10, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->icon:Landroid/graphics/drawable/StateListDrawable;

    move-object/from16 v20, v0

    :goto_7
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/android/internal/widget/multiwaveview/TargetDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;)V

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_a
    const/16 v20, 0x0

    goto :goto_7

    .line 235
    .end local v10    # "i":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mWaveView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setTargetResources(Ljava/util/ArrayList;)V

    .line 236
    return-void
.end method

.method private resetAll()V
    .locals 3

    .prologue
    .line 242
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0800ae

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0800af

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080073

    new-instance v2, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;

    invoke-direct {v2, p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080458

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 258
    return-void
.end method

.method private saveAll()V
    .locals 17

    .prologue
    .line 264
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .local v11, "targetLayout":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .local v3, "existingImages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 268
    .local v4, "hasValidTargets":Z
    move-object/from16 v0, p0

    iget v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    add-int/lit8 v5, v14, 0x1

    .local v5, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mMaxTargets:I

    add-int/2addr v14, v15

    if-gt v5, v14, :cond_5

    .line 269
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    .line 270
    .local v8, "info":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    iget-object v13, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    .line 272
    .local v13, "uri":Ljava/lang/String;
    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    if-eqz v14, :cond_0

    .line 273
    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    :cond_0
    const-string v14, "empty"

    invoke-static {v13, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 278
    :try_start_0
    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static {v14, v15}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v9

    .line 280
    .local v9, "intent":Landroid/content/Intent;
    const-string v14, "icon_resource"

    invoke-virtual {v9, v14}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 281
    const-string v14, "icon_file"

    invoke-virtual {v9, v14}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 282
    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    if-eqz v14, :cond_1

    .line 283
    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    iget-object v15, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-virtual {v9, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 285
    :cond_1
    const-string v14, "icon_resource"

    iget-object v15, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    iget-object v14, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    if-eqz v14, :cond_4

    .line 287
    const-string v14, "icon_package"

    iget-object v15, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 292
    :goto_1
    const/4 v14, 0x0

    invoke-virtual {v9, v14}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v13

    .line 293
    const/4 v4, 0x1

    .line 300
    .end local v9    # "intent":Landroid/content/Intent;
    :cond_2
    :goto_2
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    move-result v14

    if-lez v14, :cond_3

    .line 301
    const-string v14, "|"

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    :cond_3
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 289
    .restart local v9    # "intent":Landroid/content/Intent;
    :cond_4
    :try_start_1
    const-string v14, "icon_package"

    invoke-virtual {v9, v14}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 294
    .end local v9    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v2

    .line 295
    .local v2, "e":Ljava/net/URISyntaxException;
    const-string v14, "LockscreenTargets"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Invalid uri "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget-object v0, v8, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " on save, ignoring"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    const-string v13, "empty"

    goto :goto_2

    .line 306
    .end local v2    # "e":Ljava/net/URISyntaxException;
    .end local v8    # "info":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    .end local v13    # "uri":Ljava/lang/String;
    :cond_5
    if-eqz v4, :cond_7

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 307
    .local v12, "targets":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-virtual {v14}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string v15, "lockscreen_targets"

    invoke-static {v14, v15, v12}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 310
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-virtual {v14}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v14}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .local v1, "arr$":[Ljava/io/File;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_4
    if-ge v6, v10, :cond_8

    aget-object v7, v1, v6

    .line 311
    .local v7, "image":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "lockscreen_"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_6

    .line 313
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 310
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 306
    .end local v1    # "arr$":[Ljava/io/File;
    .end local v6    # "i$":I
    .end local v7    # "image":Ljava/io/File;
    .end local v10    # "len$":I
    .end local v12    # "targets":Ljava/lang/String;
    :cond_7
    const/4 v12, 0x0

    goto :goto_3

    .line 316
    .restart local v1    # "arr$":[Ljava/io/File;
    .restart local v6    # "i$":I
    .restart local v10    # "len$":I
    .restart local v12    # "targets":Ljava/lang/String;
    :cond_8
    return-void
.end method

.method private setIconForDialog(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 366
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 367
    return-void
.end method

.method private setTarget(ILjava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "position"    # I
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p4, "iconType"    # Ljava/lang/String;
    .param p5, "iconSource"    # Ljava/lang/String;
    .param p6, "packageName"    # Ljava/lang/String;

    .prologue
    .line 323
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetStore:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    .line 324
    .local v13, "item":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    iget-object v14, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->icon:Landroid/graphics/drawable/StateListDrawable;

    .line 325
    .local v14, "state":Landroid/graphics/drawable/StateListDrawable;
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Landroid/graphics/drawable/StateListDrawable;->getStateDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    check-cast v12, Landroid/graphics/drawable/LayerDrawable;

    .line 326
    .local v12, "inactiveLayer":Landroid/graphics/drawable/LayerDrawable;
    const/4 v3, 0x1

    invoke-virtual {v14, v3}, Landroid/graphics/drawable/StateListDrawable;->getStateDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    check-cast v9, Landroid/graphics/drawable/LayerDrawable;

    .line 327
    .local v9, "activeLayer":Landroid/graphics/drawable/LayerDrawable;
    const/4 v11, 0x0

    .line 329
    .local v11, "hasBackground":Z
    const/4 v3, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v12, v3, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 331
    const-string v3, "icon_resource"

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz p5, :cond_2

    .line 332
    new-instance v2, Landroid/graphics/drawable/InsetDrawable;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    const v5, 0x106000d

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    .line 334
    .local v2, "empty":Landroid/graphics/drawable/InsetDrawable;
    const/4 v3, 0x1

    invoke-virtual {v9, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 335
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    const/4 v5, 0x1

    move-object/from16 v0, p6

    move-object/from16 v1, p5

    invoke-static {v3, v0, v1, v5}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromResources(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 337
    .local v10, "back":Landroid/graphics/drawable/Drawable;
    if-eqz v10, :cond_0

    .line 338
    const/4 v3, 0x0

    invoke-virtual {v9, v3, v10}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 339
    const/4 v11, 0x1

    .line 345
    .end local v2    # "empty":Landroid/graphics/drawable/InsetDrawable;
    .end local v10    # "back":Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    if-nez v11, :cond_1

    .line 346
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    const v5, 0x1080334

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 348
    .local v4, "activeBack":Landroid/graphics/drawable/Drawable;
    const/4 v15, 0x0

    new-instance v3, Landroid/graphics/drawable/InsetDrawable;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {v9, v15, v3}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 351
    .end local v4    # "activeBack":Landroid/graphics/drawable/Drawable;
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getPickedIconFromDialog()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->defaultIcon:Landroid/graphics/drawable/Drawable;

    .line 352
    move-object/from16 v0, p2

    iput-object v0, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->uri:Ljava/lang/String;

    .line 353
    move-object/from16 v0, p4

    iput-object v0, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 354
    move-object/from16 v0, p5

    iput-object v0, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 355
    move-object/from16 v0, p6

    iput-object v0, v13, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    .line 357
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->saveAll()V

    .line 358
    return-void

    .line 342
    :cond_2
    const/4 v3, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v9, v3, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_0
.end method


# virtual methods
.method public iconPicked(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, -0x1

    .line 505
    new-instance v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;

    invoke-direct {v0, v5}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V

    .line 506
    .local v0, "icon":Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
    const/4 v1, 0x0

    .line 508
    .local v1, "iconDrawable":Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x1

    if-ne p1, v3, :cond_3

    .line 509
    if-ne p2, v4, :cond_2

    .line 510
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/lockscreen_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 512
    .local v2, "imageFile":Ljava/io/File;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 513
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    invoke-virtual {v3, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 515
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->setReadOnly()Z

    .line 517
    const-string v3, "icon_file"

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 518
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 519
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    iget-object v4, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 543
    .end local v2    # "imageFile":Ljava/io/File;
    :goto_0
    if-eqz v1, :cond_5

    .line 544
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 545
    invoke-direct {p0, v1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->setIconForDialog(Landroid/graphics/drawable/Drawable;)V

    .line 550
    :cond_1
    :goto_1
    return-void

    .line 522
    :cond_2
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 523
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 527
    :cond_3
    if-nez p1, :cond_4

    .line 528
    const-string v3, "icon_resource"

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 529
    const-string v3, "resource_name"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 530
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    iget-object v4, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-static {v3, v5, v4, v6}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromResources(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_0

    .line 532
    :cond_4
    const/4 v3, 0x2

    if-ne p1, v3, :cond_1

    if-ne p2, v4, :cond_1

    .line 534
    const-string v3, "package_name"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    .line 535
    const-string v3, "icon_resource"

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    .line 536
    const-string v3, "resource_name"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    .line 537
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    iget-object v4, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    iget-object v5, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-static {v3, v4, v5, v6}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromResources(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_0

    .line 547
    :cond_5
    const-string v3, "LockscreenTargets"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not fetch icon, keeping old one (type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", source="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->iconSource:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", package= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 114
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 116
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    const v1, 0x7f0c00f5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mWaveView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    .line 117
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mWaveView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v0, p0}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setOnTriggerListener(Lcom/android/internal/widget/multiwaveview/GlowPadView$OnTriggerListener;)V

    .line 119
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "lockscreen_targets"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->initializeView(Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 391
    const/4 v0, 0x0

    .line 392
    .local v0, "shortcutName":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 393
    const-string v1, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 396
    :cond_0
    sget-object v1, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mEmptyLabel:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 397
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    sget-object v2, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mEmptyLabel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 398
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    const-string v2, "empty"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 399
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    const v2, 0x7f020066

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 400
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 409
    :cond_1
    :goto_0
    return-void

    .line 401
    :cond_2
    if-eqz p1, :cond_3

    const/4 v1, 0x1

    if-eq p1, v1, :cond_3

    const/4 v1, 0x2

    if-ne p1, v1, :cond_4

    .line 404
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mIconPicker:Lcom/androie/settings/cyanogenmod/IconPicker;

    invoke-virtual {v1, p1, p2, p3}, Lcom/androie/settings/cyanogenmod/IconPicker;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 405
    :cond_4
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 407
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mPicker:Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    invoke-virtual {v1, p1, p2, p3}, Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 134
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

    .line 139
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 93
    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mContainer:Landroid/view/ViewGroup;

    .line 95
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->setHasOptionsMenu(Z)V

    .line 97
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    .line 98
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    .line 100
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getTargetOffset(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    .line 101
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getMaxTargets(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mMaxTargets:I

    .line 103
    new-instance v0, Lcom/androie/settings/cyanogenmod/IconPicker;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/androie/settings/cyanogenmod/IconPicker;-><init>(Landroid/app/Activity;Lcom/androie/settings/cyanogenmod/IconPicker$OnIconPickListener;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mIconPicker:Lcom/androie/settings/cyanogenmod/IconPicker;

    .line 104
    new-instance v0, Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;-><init>(Landroid/app/Activity;Lcom/androie/settings/cyanogenmod/ShortcutPickHelper$OnPickListener;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mPicker:Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    .line 106
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/target.tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTemporaryImage:Ljava/io/File;

    .line 107
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mResources:Landroid/content/res/Resources;

    const v1, 0x7f0800b0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mEmptyLabel:Ljava/lang/String;

    .line 109
    const v0, 0x7f04005b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onFinishFinalAnimation()V
    .locals 0

    .prologue
    .line 554
    return-void
.end method

.method public onGrabbed(Landroid/view/View;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "handle"    # I

    .prologue
    .line 413
    return-void
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "handle"    # I

    .prologue
    .line 501
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 143
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 148
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 145
    :pswitch_0
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->resetAll()V

    .line 146
    const/4 v0, 0x1

    goto :goto_0

    .line 143
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onReleased(Landroid/view/View;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "handle"    # I

    .prologue
    .line 417
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 125
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 127
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->isScreenLarge(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 130
    :cond_0
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "target"    # I

    .prologue
    .line 421
    iput p2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetIndex:I

    .line 423
    iget v0, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mTargetOffset:I

    if-ne p2, v0, :cond_0

    .line 448
    :goto_0
    return-void

    .line 427
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0800b1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-direct {p0, p2}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->createShortcutDialogView(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080073

    new-instance v2, Lcom/androie/settings/cyanogenmod/LockscreenTargets$2;

    invoke-direct {v2, p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$2;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080458

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public shortcutPicked(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "friendlyName"    # Ljava/lang/String;
    .param p3, "isApplication"    # Z

    .prologue
    .line 371
    if-nez p1, :cond_0

    .line 387
    :goto_0
    return-void

    .line 376
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    invoke-static {p1, v3}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    .line 377
    .local v2, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mActivity:Landroid/app/Activity;

    invoke-static {v3, v2}, Lcom/android/internal/util/cm/LockscreenTargetUtils;->getDrawableFromIntent(Landroid/content/Context;Landroid/content/Intent;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 379
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    invoke-virtual {v3, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 380
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogLabel:Landroid/widget/Button;

    invoke-virtual {v3, p1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 382
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 383
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->mDialogIcon:Landroid/widget/ImageButton;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 384
    .end local v1    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 385
    .local v0, "e":Ljava/net/URISyntaxException;
    const-string v3, "LockscreenTargets"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " on pick"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
