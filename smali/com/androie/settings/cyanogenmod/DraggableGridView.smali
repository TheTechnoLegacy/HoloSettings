.class public Lcom/androie/settings/cyanogenmod/DraggableGridView;
.super Landroid/view/ViewGroup;
.source "DraggableGridView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnTouchListener;


# static fields
.field public static animT:I


# instance fields
.field protected cellGap:I

.field protected childHeight:I

.field protected childWidth:I

.field protected colCount:I

.field protected dragged:I

.field protected enabled:Z

.field protected handler:Landroid/os/Handler;

.field protected isDelete:Z

.field protected lastDelta:F

.field protected lastTarget:I

.field protected lastX:I

.field protected lastY:I

.field protected newPositions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field protected onRearrangeListener:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

.field protected scroll:I

.field protected secondaryOnClickListener:Landroid/view/View$OnClickListener;

.field protected touching:Z

.field protected updateTask:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const/16 v0, 0x96

    sput v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 62
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 50
    iput v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->handler:Landroid/os/Handler;

    .line 53
    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastX:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    iput-boolean v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    iput-boolean v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    .line 102
    new-instance v0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;-><init>(Lcom/androie/settings/cyanogenmod/DraggableGridView;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->updateTask:Ljava/lang/Runnable;

    .line 63
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->init(Landroid/content/Context;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 67
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    iput v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->handler:Landroid/os/Handler;

    .line 53
    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastX:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    iput-boolean v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    iput-boolean v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    .line 102
    new-instance v0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;-><init>(Lcom/androie/settings/cyanogenmod/DraggableGridView;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->updateTask:Ljava/lang/Runnable;

    .line 68
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->init(Landroid/content/Context;)V

    .line 69
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setListeners()V

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setChildrenDrawingOrderEnabled(Z)V

    .line 80
    invoke-virtual {p0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setClipChildren(Z)V

    .line 81
    invoke-virtual {p0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setClipToPadding(Z)V

    .line 82
    const/4 v0, 0x3

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    .line 83
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 132
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 133
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I

    .prologue
    .line 126
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 127
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    return-void
.end method

.method protected animateDragged()V
    .locals 15

    .prologue
    const v1, 0x3f2ac083    # 0.667f

    const/4 v14, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 373
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 374
    .local v11, "v":Landroid/view/View;
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    div-int/lit8 v4, v4, 0x2

    add-int v12, v3, v4

    .local v12, "x":I
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    div-int/lit8 v4, v4, 0x2

    add-int v13, v3, v4

    .line 376
    .local v13, "y":I
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x4

    sub-int v9, v12, v3

    .local v9, "l":I
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x4

    sub-int v10, v13, v3

    .line 377
    .local v10, "t":I
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v9

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v10

    invoke-virtual {v11, v9, v10, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 378
    new-instance v8, Landroid/view/animation/AnimationSet;

    invoke-direct {v8, v14}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 379
    .local v8, "animSet":Landroid/view/animation/AnimationSet;
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x4

    int-to-float v5, v3

    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v3, v3, 0x4

    int-to-float v6, v3

    move v3, v1

    move v4, v2

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 381
    .local v0, "scale":Landroid/view/animation/ScaleAnimation;
    sget v1, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animT:I

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 382
    new-instance v7, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-direct {v7, v2, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 383
    .local v7, "alpha":Landroid/view/animation/AlphaAnimation;
    sget v1, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animT:I

    int-to-long v1, v1

    invoke-virtual {v7, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 385
    invoke-virtual {v8, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 386
    invoke-virtual {v8, v7}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 387
    invoke-virtual {v8, v14}, Landroid/view/animation/AnimationSet;->setFillEnabled(Z)V

    .line 388
    invoke-virtual {v8, v14}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 390
    invoke-virtual {v11}, Landroid/view/View;->clearAnimation()V

    .line 391
    invoke-virtual {v11, v8}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 392
    return-void
.end method

.method protected animateGap(I)V
    .locals 18
    .param p1, "target"    # I

    .prologue
    .line 395
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v2

    if-ge v10, v2, :cond_5

    .line 396
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v17

    .line 397
    .local v17, "v":Landroid/view/View;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    if-ne v10, v2, :cond_1

    .line 395
    :cond_0
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 399
    :cond_1
    move v12, v10

    .line 400
    .local v12, "newPos":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    move/from16 v0, p1

    if-ge v2, v0, :cond_4

    move-object/from16 v0, p0

    iget v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    add-int/lit8 v2, v2, 0x1

    if-lt v10, v2, :cond_4

    move/from16 v0, p1

    if-gt v10, v0, :cond_4

    .line 401
    add-int/lit8 v12, v12, -0x1

    .line 406
    :cond_2
    :goto_2
    move v15, v10

    .line 407
    .local v15, "oldPos":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 408
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 409
    :cond_3
    if-eq v15, v12, :cond_0

    .line 412
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v16

    .line 413
    .local v16, "oldXY":Landroid/graphics/Point;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v13

    .line 414
    .local v13, "newXY":Landroid/graphics/Point;
    new-instance v14, Landroid/graphics/Point;

    move-object/from16 v0, v16

    iget v2, v0, Landroid/graphics/Point;->x:I

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v2, v3

    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-direct {v14, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 416
    .local v14, "oldOffset":Landroid/graphics/Point;
    new-instance v11, Landroid/graphics/Point;

    iget v2, v13, Landroid/graphics/Point;->x:I

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, v13, Landroid/graphics/Point;->y:I

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-direct {v11, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 419
    .local v11, "newOffset":Landroid/graphics/Point;
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    const/4 v2, 0x0

    iget v3, v14, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    const/4 v4, 0x0

    iget v5, v11, Landroid/graphics/Point;->x:I

    int-to-float v5, v5

    const/4 v6, 0x0

    iget v7, v14, Landroid/graphics/Point;->y:I

    int-to-float v7, v7

    const/4 v8, 0x0

    iget v9, v11, Landroid/graphics/Point;->y:I

    int-to-float v9, v9

    invoke-direct/range {v1 .. v9}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 423
    .local v1, "translate":Landroid/view/animation/TranslateAnimation;
    sget v2, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animT:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 424
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/animation/TranslateAnimation;->setFillEnabled(Z)V

    .line 425
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    .line 426
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->clearAnimation()V

    .line 427
    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 429
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v10, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 402
    .end local v1    # "translate":Landroid/view/animation/TranslateAnimation;
    .end local v11    # "newOffset":Landroid/graphics/Point;
    .end local v13    # "newXY":Landroid/graphics/Point;
    .end local v14    # "oldOffset":Landroid/graphics/Point;
    .end local v15    # "oldPos":I
    .end local v16    # "oldXY":Landroid/graphics/Point;
    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    move/from16 v0, p1

    if-ge v0, v2, :cond_2

    move/from16 v0, p1

    if-lt v10, v0, :cond_2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    if-ge v10, v2, :cond_2

    .line 403
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_2

    .line 431
    .end local v12    # "newPos":I
    .end local v17    # "v":Landroid/view/View;
    :cond_5
    return-void
.end method

.method protected clampScroll()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 474
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getMaxScroll()I

    move-result v0

    .line 475
    .local v0, "max":I
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 476
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    if-gez v1, :cond_2

    .line 477
    iget-boolean v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    if-nez v1, :cond_1

    .line 478
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 491
    :cond_0
    :goto_0
    return-void

    .line 480
    :cond_1
    iput v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 481
    iput v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    goto :goto_0

    .line 483
    :cond_2
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    if-le v1, v0, :cond_0

    .line 484
    iget-boolean v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    if-nez v1, :cond_3

    .line 485
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    sub-int v2, v0, v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    goto :goto_0

    .line 487
    :cond_3
    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 488
    iput v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    goto :goto_0
.end method

.method protected getChildDrawingOrder(II)I
    .locals 2
    .param p1, "childCount"    # I
    .param p2, "i"    # I

    .prologue
    .line 179
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 185
    .end local p2    # "i":I
    :cond_0
    :goto_0
    return p2

    .line 181
    .restart local p2    # "i":I
    :cond_1
    add-int/lit8 v0, p1, -0x1

    if-ne p2, v0, :cond_2

    .line 182
    iget p2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    goto :goto_0

    .line 183
    :cond_2
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    if-lt p2, v0, :cond_0

    .line 184
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method protected getColumnFromCoor(I)I
    .locals 3
    .param p1, "coor"    # I

    .prologue
    .line 199
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    sub-int/2addr p1, v1

    .line 200
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lez p1, :cond_1

    .line 201
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    if-ge p1, v1, :cond_0

    .line 205
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 203
    .restart local v0    # "i":I
    :cond_0
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    add-int/2addr v1, v2

    sub-int/2addr p1, v1

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 205
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method protected getCoorFromIndex(I)Landroid/graphics/Point;
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 242
    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    rem-int v0, p1, v2

    .line 243
    .local v0, "col":I
    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    div-int v1, p1, v2

    .line 244
    .local v1, "row":I
    new-instance v2, Landroid/graphics/Point;

    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    div-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    iget v5, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    mul-int/2addr v4, v0

    add-int/2addr v3, v4

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    div-int/lit8 v4, v4, 0x2

    iget v5, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    iget v6, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    mul-int/2addr v5, v1

    add-int/2addr v4, v5

    iget v5, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    sub-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    return-object v2
.end method

.method public getIndexFromCoor(II)I
    .locals 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v3, -0x1

    .line 189
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getColumnFromCoor(I)I

    move-result v0

    .local v0, "col":I
    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getRowFromCoor(I)I

    move-result v2

    .line 190
    .local v2, "row":I
    if-eq v0, v3, :cond_0

    if-ne v2, v3, :cond_2

    :cond_0
    move v1, v3

    .line 195
    :cond_1
    :goto_0
    return v1

    .line 192
    :cond_2
    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    mul-int/2addr v4, v2

    add-int v1, v4, v0

    .line 193
    .local v1, "index":I
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v4

    if-lt v1, v4, :cond_1

    move v1, v3

    .line 194
    goto :goto_0
.end method

.method public getLastIndex()I
    .locals 2

    .prologue
    .line 500
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastX:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    invoke-virtual {p0, v0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getIndexFromCoor(II)I

    move-result v0

    return v0
.end method

.method protected getMaxScroll()I
    .locals 6

    .prologue
    .line 494
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v2

    int-to-double v2, v2

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    int-to-double v4, v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    .local v1, "rowCount":I
    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/2addr v2, v1

    add-int/lit8 v3, v1, 0x1

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getHeight()I

    move-result v3

    sub-int v0, v2, v3

    .line 496
    .local v0, "max":I
    return v0
.end method

.method protected getRowFromCoor(I)I
    .locals 3
    .param p1, "coor"    # I

    .prologue
    .line 209
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    sub-int/2addr p1, v1

    .line 210
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lez p1, :cond_1

    .line 211
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    if-ge p1, v1, :cond_0

    .line 215
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 213
    .restart local v0    # "i":I
    :cond_0
    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    add-int/2addr v1, v2

    sub-int/2addr p1, v1

    .line 210
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 215
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method protected getTargetFromCoor(II)I
    .locals 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v3, -0x1

    .line 219
    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getRowFromCoor(I)I

    move-result v4

    if-ne v4, v3, :cond_1

    move v2, v3

    .line 238
    :cond_0
    :goto_0
    return v2

    .line 222
    :cond_1
    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    div-int/lit8 v4, v4, 0x4

    sub-int v4, p1, v4

    invoke-virtual {p0, v4, p2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getIndexFromCoor(II)I

    move-result v0

    .line 223
    .local v0, "leftPos":I
    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    div-int/lit8 v4, v4, 0x4

    add-int/2addr v4, p1

    invoke-virtual {p0, v4, p2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getIndexFromCoor(II)I

    move-result v1

    .line 224
    .local v1, "rightPos":I
    if-ne v0, v3, :cond_2

    if-ne v1, v3, :cond_2

    move v2, v3

    .line 226
    goto :goto_0

    .line 227
    :cond_2
    if-ne v0, v1, :cond_3

    move v2, v3

    .line 228
    goto :goto_0

    .line 230
    :cond_3
    const/4 v2, -0x1

    .line 231
    .local v2, "target":I
    if-le v1, v3, :cond_5

    .line 232
    move v2, v1

    .line 235
    :cond_4
    :goto_1
    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    if-ge v3, v2, :cond_0

    .line 236
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 233
    :cond_5
    if-le v0, v3, :cond_4

    .line 234
    add-int/lit8 v2, v0, 0x1

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    if-eqz v0, :cond_1

    .line 258
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->secondaryOnClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->secondaryOnClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_1

    .line 261
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLastIndex()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLastIndex()I

    move-result v3

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLastIndex()I

    move-result v4

    iget v5, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    div-int/2addr v4, v5

    int-to-long v4, v4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 265
    :cond_1
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 9
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v0

    .line 145
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 146
    invoke-virtual {p0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 147
    .local v2, "v":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    .line 148
    invoke-virtual {p0, v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v3

    .line 149
    .local v3, "xy":Landroid/graphics/Point;
    iget v4, v3, Landroid/graphics/Point;->x:I

    iget v5, v3, Landroid/graphics/Point;->y:I

    iget v6, v3, Landroid/graphics/Point;->x:I

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v6, v7

    iget v7, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 145
    .end local v3    # "xy":Landroid/graphics/Point;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    .end local v2    # "v":Landroid/view/View;
    :cond_1
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 280
    iget-boolean v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    if-nez v3, :cond_1

    .line 289
    :cond_0
    :goto_0
    return v1

    .line 282
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLastIndex()I

    move-result v0

    .line 283
    .local v0, "index":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-eq v0, v3, :cond_0

    .line 284
    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->toggleAddDelete(Z)V

    .line 285
    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    .line 286
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animateDragged()V

    move v1, v2

    .line 287
    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 157
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 158
    .local v5, "width":I
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getPaddingLeft()I

    move-result v6

    sub-int v6, v5, v6

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    add-int/lit8 v7, v7, -0x1

    iget v8, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    mul-int/2addr v7, v8

    sub-int v1, v6, v7

    .line 160
    .local v1, "availableWidth":I
    int-to-float v6, v1

    iget v7, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    iput v6, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    .line 163
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v0

    .line 164
    .local v0, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 165
    invoke-virtual {p0, v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 166
    .local v4, "v":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 167
    .local v3, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v6, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    iput v6, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 168
    iget v6, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    iput v6, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 169
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_0

    .line 170
    iget v6, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/high16 v7, 0x40000000    # 2.0f

    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    iget v7, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v8, -0x80000000

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    invoke-virtual {p0, v4, v6, v7}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->measureChild(Landroid/view/View;II)V

    .line 164
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 174
    .end local v3    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .end local v4    # "v":Landroid/view/View;
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 175
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 293
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    .line 294
    .local v6, "action":I
    and-int/lit16 v0, v6, 0xff

    packed-switch v0, :pswitch_data_0

    .line 366
    :goto_0
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    .line 367
    const/4 v0, 0x1

    .line 368
    :goto_1
    return v0

    .line 296
    :pswitch_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    .line 297
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastX:I

    .line 298
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    .line 299
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    goto :goto_0

    .line 302
    :pswitch_1
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    sub-int v7, v0, v1

    .line 303
    .local v7, "delta":I
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 305
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v12, v0

    .local v12, "x":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v14, v0

    .line 306
    .local v14, "y":I
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    sub-int v8, v12, v0

    .local v8, "l":I
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    sub-int v9, v14, v0

    .line 307
    .local v9, "t":I
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v8

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v9

    invoke-virtual {v0, v8, v9, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 311
    invoke-virtual {p0, v12, v14}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getTargetFromCoor(II)I

    move-result v10

    .line 313
    .local v10, "target":I
    invoke-virtual {p0, v12, v14}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getIndexFromCoor(II)I

    move-result v0

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 314
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 315
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    goto :goto_0

    .line 318
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    .line 319
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "#AA222222"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 321
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    if-eq v0, v10, :cond_1

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-eq v10, v0, :cond_1

    .line 322
    const/4 v0, -0x1

    if-eq v10, v0, :cond_1

    .line 323
    invoke-virtual {p0, v10}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->animateGap(I)V

    .line 324
    iput v10, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    .line 334
    .end local v8    # "l":I
    .end local v9    # "t":I
    .end local v10    # "target":I
    .end local v12    # "x":I
    .end local v14    # "y":I
    :cond_1
    :goto_2
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastX:I

    .line 335
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    .line 336
    int-to-float v0, v7

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    goto/16 :goto_0

    .line 328
    :cond_2
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 329
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->clampScroll()V

    .line 330
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_3

    .line 331
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->enabled:Z

    .line 332
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getBottom()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onLayout(ZIIII)V

    goto :goto_2

    .line 339
    .end local v7    # "delta":I
    :pswitch_2
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_7

    .line 340
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->toggleAddDelete(Z)V

    .line 341
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 342
    .local v11, "v":Landroid/view/View;
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    iget-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    if-nez v0, :cond_6

    .line 343
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->reorderChildren(Z)V

    .line 348
    :goto_3
    invoke-virtual {v11}, Landroid/view/View;->clearAnimation()V

    .line 349
    instance-of v0, v11, Landroid/widget/ImageView;

    if-eqz v0, :cond_4

    .line 350
    check-cast v11, Landroid/widget/ImageView;

    .end local v11    # "v":Landroid/view/View;
    const/16 v0, 0xff

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 351
    :cond_4
    iget-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    if-eqz v0, :cond_5

    .line 352
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    .line 353
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->removeViewAt(I)V

    .line 354
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onRearrangeListener:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-interface {v0, v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;->onDelete(I)V

    .line 355
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->reorderChildren(Z)V

    .line 357
    :cond_5
    const/4 v0, -0x1

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    .line 358
    const/4 v0, -0x1

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    .line 362
    :goto_4
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    .line 363
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->isDelete:Z

    goto/16 :goto_0

    .line 345
    .restart local v11    # "v":Landroid/view/View;
    :cond_6
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getCoorFromIndex(I)Landroid/graphics/Point;

    move-result-object v13

    .line 346
    .local v13, "xy":Landroid/graphics/Point;
    iget v0, v13, Landroid/graphics/Point;->x:I

    iget v1, v13, Landroid/graphics/Point;->y:I

    iget v2, v13, Landroid/graphics/Point;->x:I

    iget v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childWidth:I

    add-int/2addr v2, v3

    iget v3, v13, Landroid/graphics/Point;->y:I

    iget v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    add-int/2addr v3, v4

    invoke-virtual {v11, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    goto :goto_3

    .line 360
    .end local v11    # "v":Landroid/view/View;
    .end local v13    # "xy":Landroid/graphics/Point;
    :cond_7
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->updateTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_4

    .line 368
    :cond_8
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 294
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public removeViewAt(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 138
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 139
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 140
    return-void
.end method

.method protected reorderChildren(Z)V
    .locals 8
    .param p1, "notify"    # Z

    .prologue
    .line 434
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onRearrangeListener:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 435
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onRearrangeListener:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    invoke-interface {v0, v1, v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;->onRearrange(II)V

    .line 436
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 437
    .local v6, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v0

    if-ge v7, v0, :cond_1

    .line 438
    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 439
    invoke-virtual {p0, v7}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 437
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 441
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->removeAllViews()V

    .line 442
    :cond_2
    :goto_1
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    if-eq v0, v1, :cond_5

    .line 443
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 446
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 447
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    goto :goto_1

    .line 448
    :cond_3
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    if-ge v0, v1, :cond_4

    .line 450
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v6, v0, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 451
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    goto :goto_1

    .line 452
    :cond_4
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastTarget:I

    if-le v0, v1, :cond_2

    .line 454
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    iget v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v6, v0, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 455
    iget v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    goto :goto_1

    .line 457
    :cond_5
    const/4 v7, 0x0

    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v7, v0, :cond_6

    .line 458
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->newPositions:Ljava/util/ArrayList;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v7, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 459
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->addView(Landroid/view/View;)V

    .line 457
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 461
    :cond_6
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getBottom()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onLayout(ZIIII)V

    .line 462
    return-void
.end method

.method public setCellGap(I)V
    .locals 0
    .param p1, "gap"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    .line 95
    return-void
.end method

.method public setCellHeight(I)V
    .locals 0
    .param p1, "height"    # I

    .prologue
    .line 90
    iput p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->childHeight:I

    .line 91
    return-void
.end method

.method public setColumnCount(I)V
    .locals 0
    .param p1, "count"    # I

    .prologue
    .line 86
    iput p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->colCount:I

    .line 87
    return-void
.end method

.method protected setListeners()V
    .locals 0

    .prologue
    .line 72
    invoke-virtual {p0, p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 73
    invoke-super {p0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    invoke-virtual {p0, p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 75
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->secondaryOnClickListener:Landroid/view/View$OnClickListener;

    .line 100
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 508
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 509
    return-void
.end method

.method public setOnRearrangeListener(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;)V
    .locals 0
    .param p1, "l"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onRearrangeListener:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;

    .line 505
    return-void
.end method

.method toggleAddDelete(Z)V
    .locals 6
    .param p1, "delete"    # Z

    .prologue
    const/4 v5, 0x0

    .line 268
    const v1, 0x7f020071

    .line 269
    .local v1, "resid":I
    const v2, 0x7f0800ba

    .line 270
    .local v2, "stringid":I
    if-eqz p1, :cond_0

    .line 271
    const v1, 0x7f020072

    .line 272
    const v2, 0x7f080189

    .line 274
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0c0184

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 275
    .local v0, "addDeleteTile":Landroid/widget/TextView;
    invoke-virtual {v0, v5, v1, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 276
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 277
    return-void
.end method
