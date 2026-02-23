.class Lcom/androie/settings/DataUsageSummary$10;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Lcom/androie/settings/net/ChartData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1275
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader",
            "<",
            "Lcom/androie/settings/net/ChartData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1278
    new-instance v0, Lcom/androie/settings/net/ChartDataLoader;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-virtual {v1}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$1600(Lcom/androie/settings/DataUsageSummary;)Landroid/net/INetworkStatsSession;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lcom/androie/settings/net/ChartDataLoader;-><init>(Landroid/content/Context;Landroid/net/INetworkStatsSession;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/androie/settings/net/ChartData;)V
    .locals 2
    .param p2, "data"    # Lcom/androie/settings/net/ChartData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/androie/settings/net/ChartData;",
            ">;",
            "Lcom/androie/settings/net/ChartData;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1283
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Lcom/androie/settings/net/ChartData;>;"
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0, p2}, Lcom/androie/settings/DataUsageSummary;->access$1702(Lcom/androie/settings/DataUsageSummary;Lcom/androie/settings/net/ChartData;)Lcom/androie/settings/net/ChartData;

    .line 1284
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1700(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/ChartData;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/net/ChartData;->network:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0, v1}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1285
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$1700(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/ChartData;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0, v1}, Lcom/androie/settings/widget/ChartDataUsageView;->bindDetailNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1288
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/androie/settings/DataUsageSummary;->access$600(Lcom/androie/settings/DataUsageSummary;Z)V

    .line 1289
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1800(Lcom/androie/settings/DataUsageSummary;)V

    .line 1292
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1700(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/ChartData;

    move-result-object v0

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    if-eqz v0, :cond_0

    .line 1293
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1900(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 1295
    :cond_0
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1275
    check-cast p2, Lcom/androie/settings/net/ChartData;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/DataUsageSummary$10;->onLoadFinished(Landroid/content/Loader;Lcom/androie/settings/net/ChartData;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/androie/settings/net/ChartData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Lcom/androie/settings/net/ChartData;>;"
    const/4 v1, 0x0

    .line 1299
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0, v1}, Lcom/androie/settings/DataUsageSummary;->access$1702(Lcom/androie/settings/DataUsageSummary;Lcom/androie/settings/net/ChartData;)Lcom/androie/settings/net/ChartData;

    .line 1300
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1301
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$10;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/androie/settings/widget/ChartDataUsageView;->bindDetailNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1302
    return-void
.end method
