.class Lcom/jellybyn/settings/DataUsageSummary$12;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Lcom/jellybyn/settings/widget/ChartDataUsageView$DataUsageChartListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1283
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInspectRangeChanged()V
    .locals 1

    .prologue
    .line 1287
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1500(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1288
    return-void
.end method

.method public onLimitChanged()V
    .locals 3

    .prologue
    .line 1297
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->getLimitBytes()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/jellybyn/settings/DataUsageSummary;->access$800(Lcom/jellybyn/settings/DataUsageSummary;J)V

    .line 1298
    return-void
.end method

.method public onWarningChanged()V
    .locals 3

    .prologue
    .line 1292
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->getWarningBytes()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/jellybyn/settings/DataUsageSummary;->access$2400(Lcom/jellybyn/settings/DataUsageSummary;J)V

    .line 1293
    return-void
.end method

.method public requestLimitEdit()V
    .locals 1

    .prologue
    .line 1307
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary$LimitEditorFragment;->show(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1308
    return-void
.end method

.method public requestWarningEdit()V
    .locals 1

    .prologue
    .line 1302
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$12;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary$WarningEditorFragment;->show(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1303
    return-void
.end method
