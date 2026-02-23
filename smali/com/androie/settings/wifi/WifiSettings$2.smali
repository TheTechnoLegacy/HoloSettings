.class Lcom/androie/settings/wifi/WifiSettings$2;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wifi/WifiSettings;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wifi/WifiSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/wifi/WifiSettings;)V
    .locals 0

    .prologue
    .line 219
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiSettings$2;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings$2;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-static {v0}, Lcom/androie/settings/wifi/WifiSettings;->access$200(Lcom/androie/settings/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings$2;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-virtual {v0}, Lcom/androie/settings/wifi/WifiSettings;->onAddNetworkPressed()V

    .line 225
    :cond_0
    return-void
.end method
