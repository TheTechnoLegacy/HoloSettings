.class Lcom/androie/settings/widget/ChartDataUsageView$2;
.super Ljava/lang/Object;
.source "ChartDataUsageView.java"

# interfaces
.implements Lcom/androie/settings/widget/ChartSweepView$OnSweepListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/widget/ChartDataUsageView;
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
    .line 298
    iput-object p1, p0, Lcom/androie/settings/widget/ChartDataUsageView$2;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSweep(Lcom/androie/settings/widget/ChartSweepView;Z)V
    .locals 1
    .param p1, "sweep"    # Lcom/androie/settings/widget/ChartSweepView;
    .param p2, "sweepDone"    # Z

    .prologue
    .line 301
    iget-object v0, p0, Lcom/androie/settings/widget/ChartDataUsageView$2;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/androie/settings/widget/ChartDataUsageView;->access$300(Lcom/androie/settings/widget/ChartDataUsageView;)V

    .line 304
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/androie/settings/widget/ChartDataUsageView$2;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/androie/settings/widget/ChartDataUsageView;->access$400(Lcom/androie/settings/widget/ChartDataUsageView;)Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/androie/settings/widget/ChartDataUsageView$2;->this$0:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/androie/settings/widget/ChartDataUsageView;->access$400(Lcom/androie/settings/widget/ChartDataUsageView;)Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;->onInspectRangeChanged()V

    .line 307
    :cond_0
    return-void
.end method

.method public requestEdit(Lcom/androie/settings/widget/ChartSweepView;)V
    .locals 0
    .param p1, "sweep"    # Lcom/androie/settings/widget/ChartSweepView;

    .prologue
    .line 312
    return-void
.end method
