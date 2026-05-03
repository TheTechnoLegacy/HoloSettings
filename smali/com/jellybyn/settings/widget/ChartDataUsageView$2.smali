.class Lcom/jellybyn/settings/widget/ChartDataUsageView$2;
.super Ljava/lang/Object;
.source "ChartDataUsageView.java"

# interfaces
.implements Lcom/jellybyn/settings/widget/ChartSweepView$OnSweepListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/widget/ChartDataUsageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/widget/ChartDataUsageView;)V
    .locals 0

    .prologue
    .line 298
    iput-object p1, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$2;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSweep(Lcom/jellybyn/settings/widget/ChartSweepView;Z)V
    .locals 1
    .param p1, "sweep"    # Lcom/jellybyn/settings/widget/ChartSweepView;
    .param p2, "sweepDone"    # Z

    .prologue
    .line 301
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$2;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$300(Lcom/jellybyn/settings/widget/ChartDataUsageView;)V

    .line 304
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$2;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$2;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;->onInspectRangeChanged()V

    .line 307
    :cond_0
    return-void
.end method

.method public requestEdit(Lcom/jellybyn/settings/widget/ChartSweepView;)V
    .locals 0
    .param p1, "sweep"    # Lcom/jellybyn/settings/widget/ChartSweepView;

    .prologue
    .line 312
    return-void
.end method
