.class Lcom/jellybyn/settings/DataUsageSummary$10;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DataUsageSummary;
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
        "Lcom/jellybyn/settings/net/ChartData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1200
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

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
            "Lcom/jellybyn/settings/net/ChartData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1203
    new-instance v0, Lcom/jellybyn/settings/net/ChartDataLoader;

    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-virtual {v1}, Lcom/jellybyn/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/jellybyn/settings/DataUsageSummary;->access$1600(Lcom/jellybyn/settings/DataUsageSummary;)Landroid/net/INetworkStatsSession;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lcom/jellybyn/settings/net/ChartDataLoader;-><init>(Landroid/content/Context;Landroid/net/INetworkStatsSession;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/jellybyn/settings/net/ChartData;)V
    .locals 2
    .param p2, "data"    # Lcom/jellybyn/settings/net/ChartData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/jellybyn/settings/net/ChartData;",
            ">;",
            "Lcom/jellybyn/settings/net/ChartData;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1208
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Lcom/jellybyn/settings/net/ChartData;>;"
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0, p2}, Lcom/jellybyn/settings/DataUsageSummary;->access$1702(Lcom/jellybyn/settings/DataUsageSummary;Lcom/jellybyn/settings/net/ChartData;)Lcom/jellybyn/settings/net/ChartData;

    .line 1209
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$1700(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/net/ChartData;

    move-result-object v1

    iget-object v1, v1, Lcom/jellybyn/settings/net/ChartData;->network:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->bindNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1210
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$1700(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/net/ChartData;

    move-result-object v1

    iget-object v1, v1, Lcom/jellybyn/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->bindDetailNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1213
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$600(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    .line 1214
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1800(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1217
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1700(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/net/ChartData;

    move-result-object v0

    iget-object v0, v0, Lcom/jellybyn/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    if-eqz v0, :cond_0

    .line 1218
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1900(Lcom/jellybyn/settings/DataUsageSummary;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 1220
    :cond_0
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1200
    check-cast p2, Lcom/jellybyn/settings/net/ChartData;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/jellybyn/settings/DataUsageSummary$10;->onLoadFinished(Landroid/content/Loader;Lcom/jellybyn/settings/net/ChartData;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Lcom/jellybyn/settings/net/ChartData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Lcom/jellybyn/settings/net/ChartData;>;"
    const/4 v1, 0x0

    .line 1224
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$1702(Lcom/jellybyn/settings/DataUsageSummary;Lcom/jellybyn/settings/net/ChartData;)Lcom/jellybyn/settings/net/ChartData;

    .line 1225
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->bindNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1226
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$10;->this$0:Lcom/jellybyn/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$1400(Lcom/jellybyn/settings/DataUsageSummary;)Lcom/jellybyn/settings/widget/ChartDataUsageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/widget/ChartDataUsageView;->bindDetailNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 1227
    return-void
.end method
