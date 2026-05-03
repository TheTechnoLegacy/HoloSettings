.class Lcom/jellybyn/settings/widget/ChartDataUsageView$3;
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
    .line 326
    iput-object p1, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSweep(Lcom/jellybyn/settings/widget/ChartSweepView;Z)V
    .locals 2
    .param p1, "sweep"    # Lcom/jellybyn/settings/widget/ChartSweepView;
    .param p2, "sweepDone"    # Z

    .prologue
    .line 329
    if-eqz p2, :cond_2

    .line 330
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0, p1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$500(Lcom/jellybyn/settings/widget/ChartDataUsageView;Lcom/jellybyn/settings/widget/ChartSweepView;)V

    .line 331
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$100(Lcom/jellybyn/settings/widget/ChartDataUsageView;)V

    .line 333
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$600(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartSweepView;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 334
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;->onWarningChanged()V

    .line 342
    :cond_0
    :goto_0
    return-void

    .line 335
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$700(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartSweepView;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;->onLimitChanged()V

    goto :goto_0

    .line 340
    :cond_2
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$200(Lcom/jellybyn/settings/widget/ChartDataUsageView;Lcom/jellybyn/settings/widget/ChartSweepView;Z)V

    goto :goto_0
.end method

.method public requestEdit(Lcom/jellybyn/settings/widget/ChartSweepView;)V
    .locals 1
    .param p1, "sweep"    # Lcom/jellybyn/settings/widget/ChartSweepView;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$600(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartSweepView;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 347
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;->requestWarningEdit()V

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 348
    :cond_1
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$700(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartSweepView;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/jellybyn/settings/widget/ChartDataUsageView$3;->this$0:Lcom/jellybyn/settings/widget/ChartDataUsageView;

    invoke-static {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->access$400(Lcom/jellybyn/settings/widget/ChartDataUsageView;)Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;->requestLimitEdit()V

    goto :goto_0
.end method
