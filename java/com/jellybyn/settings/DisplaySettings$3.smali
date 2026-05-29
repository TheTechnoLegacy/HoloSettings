.class Lcom/jellybyn/settings/DisplaySettings$3;
.super Landroid/content/BroadcastReceiver;
.source "DisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DisplaySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DisplaySettings;)V
    .locals 0

    .prologue
    .line 361
    iput-object p1, p0, Lcom/jellybyn/settings/DisplaySettings$3;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 364
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    iget-object v1, p0, Lcom/jellybyn/settings/DisplaySettings$3;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    const-string v0, "android.hardware.display.extra.WIFI_DISPLAY_STATUS"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/WifiDisplayStatus;

    invoke-static {v1, v0}, Lcom/jellybyn/settings/DisplaySettings;->access$202(Lcom/jellybyn/settings/DisplaySettings;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;

    .line 367
    iget-object v0, p0, Lcom/jellybyn/settings/DisplaySettings$3;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DisplaySettings;->access$300(Lcom/jellybyn/settings/DisplaySettings;)V

    .line 369
    :cond_0
    return-void
.end method
