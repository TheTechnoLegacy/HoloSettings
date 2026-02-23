.class Lcom/androie/settings/wifi/WifiSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "WifiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wifi/WifiSettings;-><init>()V
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
    .line 195
    iput-object p1, p0, Lcom/androie/settings/wifi/WifiSettings$1;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiSettings$1;->this$0:Lcom/androie/settings/wifi/WifiSettings;

    invoke-static {v0, p1, p2}, Lcom/androie/settings/wifi/WifiSettings;->access$000(Lcom/androie/settings/wifi/WifiSettings;Landroid/content/Context;Landroid/content/Intent;)V

    .line 199
    return-void
.end method
