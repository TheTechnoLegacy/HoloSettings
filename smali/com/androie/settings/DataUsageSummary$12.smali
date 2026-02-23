.class Lcom/androie/settings/DataUsageSummary$12;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1362
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInspectRangeChanged()V
    .locals 1

    .prologue
    .line 1366
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1500(Lcom/androie/settings/DataUsageSummary;)V

    .line 1367
    return-void
.end method

.method public onLimitChanged()V
    .locals 3

    .prologue
    .line 1376
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/androie/settings/widget/ChartDataUsageView;->getLimitBytes()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/androie/settings/DataUsageSummary;->access$800(Lcom/androie/settings/DataUsageSummary;J)V

    .line 1377
    return-void
.end method

.method public onWarningChanged()V
    .locals 3

    .prologue
    .line 1371
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/androie/settings/widget/ChartDataUsageView;->getWarningBytes()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/androie/settings/DataUsageSummary;->access$2400(Lcom/androie/settings/DataUsageSummary;J)V

    .line 1372
    return-void
.end method

.method public requestLimitEdit()V
    .locals 1

    .prologue
    .line 1386
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary$LimitEditorFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    .line 1387
    return-void
.end method

.method public requestWarningEdit()V
    .locals 1

    .prologue
    .line 1381
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$12;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary$WarningEditorFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    .line 1382
    return-void
.end method
