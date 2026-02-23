.class Lcom/androie/settings/DataUsageSummary$11;
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
        "Landroid/net/NetworkStats;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0

    .prologue
    .line 1306
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private updateEmptyVisible()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1327
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$2100(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$2200(Lcom/androie/settings/DataUsageSummary;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x1

    .line 1328
    .local v0, "isEmpty":Z
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$2300(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1329
    return-void

    .end local v0    # "isEmpty":Z
    :cond_0
    move v0, v1

    .line 1327
    goto :goto_0

    .line 1328
    .restart local v0    # "isEmpty":Z
    :cond_1
    const/16 v1, 0x8

    goto :goto_1
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
            "Landroid/net/NetworkStats;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1309
    new-instance v0, Lcom/androie/settings/net/SummaryForAllUidLoader;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-virtual {v1}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v2}, Lcom/androie/settings/DataUsageSummary;->access$1600(Lcom/androie/settings/DataUsageSummary;)Landroid/net/INetworkStatsSession;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lcom/androie/settings/net/SummaryForAllUidLoader;-><init>(Landroid/content/Context;Landroid/net/INetworkStatsSession;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/net/NetworkStats;)V
    .locals 3
    .param p2, "data"    # Landroid/net/NetworkStats;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/net/NetworkStats;",
            ">;",
            "Landroid/net/NetworkStats;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1314
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Landroid/net/NetworkStats;>;"
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$2000(Lcom/androie/settings/DataUsageSummary;)Landroid/net/NetworkPolicyManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/net/NetworkPolicyManager;->getUidsWithPolicy(I)[I

    move-result-object v0

    .line 1316
    .local v0, "restrictedUids":[I
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->access$2100(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;->bindStats(Landroid/net/NetworkStats;[I)V

    .line 1317
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary$11;->updateEmptyVisible()V

    .line 1318
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1306
    check-cast p2, Landroid/net/NetworkStats;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/DataUsageSummary$11;->onLoadFinished(Landroid/content/Loader;Landroid/net/NetworkStats;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/net/NetworkStats;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1322
    .local p1, "loader":Landroid/content/Loader;, "Landroid/content/Loader<Landroid/net/NetworkStats;>;"
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$11;->this$0:Lcom/androie/settings/DataUsageSummary;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->access$2100(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-array v2, v2, [I

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;->bindStats(Landroid/net/NetworkStats;[I)V

    .line 1323
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary$11;->updateEmptyVisible()V

    .line 1324
    return-void
.end method
