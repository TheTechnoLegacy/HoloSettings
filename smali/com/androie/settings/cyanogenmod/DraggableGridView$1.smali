.class Lcom/androie/settings/cyanogenmod/DraggableGridView$1;
.super Ljava/lang/Object;
.source "DraggableGridView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/DraggableGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/DraggableGridView;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 104
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->dragged:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 105
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v1, v1, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    mul-int/lit8 v1, v1, 0x3

    if-ge v0, v1, :cond_2

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    if-lez v0, :cond_2

    .line 106
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    add-int/lit8 v1, v1, -0x14

    iput v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 116
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->clampScroll()V

    .line 117
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getLeft()I

    move-result v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v3}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getTop()I

    move-result v3

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v4}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getRight()I

    move-result v4

    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v5}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getBottom()I

    move-result v5

    invoke-virtual/range {v0 .. v5}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->onLayout(ZIIII)V

    .line 118
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    cmpl-float v0, v0, v6

    if-eqz v0, :cond_1

    .line 119
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget-object v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x19

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 121
    :cond_1
    return-void

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastY:I

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getBottom()I

    move-result v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v2, v2, Lcom/androie/settings/cyanogenmod/DraggableGridView;->cellGap:I

    mul-int/lit8 v2, v2, 0x3

    sub-int/2addr v1, v2

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/DraggableGridView;->getMaxScroll()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 109
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    add-int/lit8 v1, v1, 0x14

    iput v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    goto :goto_0

    .line 110
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    cmpl-float v0, v0, v6

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget-boolean v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->touching:Z

    if-nez v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v2, v2, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->scroll:I

    .line 112
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    float-to-double v1, v1

    const-wide v3, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v1, v3

    double-to-float v1, v1

    iput v1, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    .line 113
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iget v0, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x3fd0000000000000L    # 0.25

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/DraggableGridView$1;->this$0:Lcom/androie/settings/cyanogenmod/DraggableGridView;

    iput v6, v0, Lcom/androie/settings/cyanogenmod/DraggableGridView;->lastDelta:F

    goto/16 :goto_0
.end method
