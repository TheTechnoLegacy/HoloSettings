.class Lcom/jellybyn/settings/wfd/WifiDisplaySettings$5;
.super Landroid/content/BroadcastReceiver;
.source "WifiDisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/wfd/WifiDisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;)V
    .locals 0

    .prologue
    .line 349
    iput-object p1, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 352
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 353
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 354
    const-string v2, "android.hardware.display.extra.WIFI_DISPLAY_STATUS"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/WifiDisplayStatus;

    .line 356
    .local v1, "status":Landroid/hardware/display/WifiDisplayStatus;
    iget-object v2, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-static {v2, v1}, Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->access$002(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;

    .line 357
    iget-object v2, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-static {v2}, Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->access$400(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;)V

    .line 359
    .end local v1    # "status":Landroid/hardware/display/WifiDisplayStatus;
    :cond_0
    return-void
.end method
