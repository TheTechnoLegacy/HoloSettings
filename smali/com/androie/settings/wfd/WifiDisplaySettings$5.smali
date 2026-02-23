.class Lcom/androie/settings/wfd/WifiDisplaySettings$5;
.super Landroid/content/BroadcastReceiver;
.source "WifiDisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/wfd/WifiDisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/wfd/WifiDisplaySettings;)V
    .locals 0

    .prologue
    .line 447
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 450
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 451
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 452
    const-string v2, "android.hardware.display.extra.WIFI_DISPLAY_STATUS"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/WifiDisplayStatus;

    .line 454
    .local v1, "status":Landroid/hardware/display/WifiDisplayStatus;
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v2, v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$002(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;

    .line 455
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$600(Lcom/androie/settings/wfd/WifiDisplaySettings;)V

    .line 462
    .end local v1    # "status":Landroid/hardware/display/WifiDisplayStatus;
    :cond_0
    :goto_0
    return-void

    .line 456
    :cond_1
    const-string v2, "android.hardware.display.action.REMOTE_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 457
    const-string v2, "android.hardware.display.extra.REMOTE_DISPLAY_STATUS"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/WifiDisplayStatus;

    .line 459
    .restart local v1    # "status":Landroid/hardware/display/WifiDisplayStatus;
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v2, v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$202(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;

    .line 460
    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$5;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v2}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$600(Lcom/androie/settings/wfd/WifiDisplaySettings;)V

    goto :goto_0
.end method
