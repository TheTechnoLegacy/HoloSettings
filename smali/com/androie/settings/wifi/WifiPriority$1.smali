.class Lcom/androie/settings/wifi/WifiPriority$1;
.super Ljava/lang/Object;
.source "WifiPriority.java"

# interfaces
.implements Lcom/androie/settings/cyanogenmod/TouchInterceptor$DropListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/wifi/WifiPriority;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wifi/WifiPriority;


# direct methods
.method constructor <init>(Lcom/androie/settings/wifi/WifiPriority;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public drop(II)V
    .locals 6
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 43
    if-ne p1, p2, :cond_0

    .line 66
    :goto_0
    return-void

    .line 46
    :cond_0
    iget-object v5, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority;->access$000(Lcom/androie/settings/wifi/WifiPriority;)Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->getNetworks()Ljava/util/List;

    move-result-object v2

    .line 47
    .local v2, "mNetworks":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-interface {v2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiConfiguration;

    .line 48
    .local v4, "o":Landroid/net/wifi/WifiConfiguration;
    invoke-interface {v2, p2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 51
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    .line 52
    .local v0, "cc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiConfiguration;

    .line 54
    .local v3, "network":Landroid/net/wifi/WifiConfiguration;
    sub-int v5, v0, v1

    iput v5, v3, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 57
    iget-object v5, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority;->access$100(Lcom/androie/settings/wifi/WifiPriority;)Landroid/net/wifi/WifiManager;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 52
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 61
    .end local v3    # "network":Landroid/net/wifi/WifiConfiguration;
    :cond_1
    iget-object v5, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority;->access$100(Lcom/androie/settings/wifi/WifiPriority;)Landroid/net/wifi/WifiManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 64
    iget-object v5, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority;->access$000(Lcom/androie/settings/wifi/WifiPriority;)Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;

    move-result-object v5

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;->access$200(Lcom/androie/settings/wifi/WifiPriority$WifiPriorityAdapter;)V

    .line 65
    iget-object v5, p0, Lcom/androie/settings/wifi/WifiPriority$1;->this$0:Lcom/androie/settings/wifi/WifiPriority;

    invoke-static {v5}, Lcom/androie/settings/wifi/WifiPriority;->access$300(Lcom/androie/settings/wifi/WifiPriority;)Lcom/androie/settings/cyanogenmod/TouchInterceptor;

    move-result-object v5

    invoke-virtual {v5}, Lcom/androie/settings/cyanogenmod/TouchInterceptor;->invalidateViews()V

    goto :goto_0
.end method
