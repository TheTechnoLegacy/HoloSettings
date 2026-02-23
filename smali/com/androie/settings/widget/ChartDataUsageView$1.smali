.class Lcom/androie/settings/widget/ChartDataUsageView$1;
.super Landroid/os/Handler;
.source "ChartDataUsageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/widget/ChartDataUsageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/widget/ChartDataUsageView;


# direct methods
.method constructor <init>(Lcom/androie/settings/widget/ChartDataUsageView;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/androie/settings/widget/ChartDataUsageView$1;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 96
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/androie/settings/widget/ChartSweepView;

    .line 97
    .local v0, "sweep":Lcom/androie/settings/widget/ChartSweepView;
    iget-object v1, p0, Lcom/androie/settings/widget/ChartDataUsageView$1;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-static {v1, v0}, Lcom/androie/settings/widget/ChartDataUsageView;->access$000(Lcom/androie/settings/widget/ChartDataUsageView;Lcom/androie/settings/widget/ChartSweepView;)V

    .line 98
    iget-object v1, p0, Lcom/androie/settings/widget/ChartDataUsageView$1;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-static {v1}, Lcom/androie/settings/widget/ChartDataUsageView;->access$100(Lcom/androie/settings/widget/ChartDataUsageView;)V

    .line 101
    iget-object v1, p0, Lcom/androie/settings/widget/ChartDataUsageView$1;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lcom/androie/settings/widget/ChartDataUsageView;->access$200(Lcom/androie/settings/widget/ChartDataUsageView;Lcom/androie/settings/widget/ChartSweepView;Z)V

    .line 102
    return-void
.end method
