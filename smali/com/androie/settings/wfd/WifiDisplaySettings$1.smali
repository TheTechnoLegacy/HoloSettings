.class Lcom/androie/settings/wfd/WifiDisplaySettings$1;
.super Ljava/lang/Object;
.source "WifiDisplaySettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wfd/WifiDisplaySettings;->showDisconnectDialog(Landroid/hardware/display/WifiDisplay;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

.field final synthetic val$display:Landroid/hardware/display/WifiDisplay;

.field final synthetic val$isRemoteDisplay:Z


# direct methods
.method constructor <init>(Lcom/androie/settings/wfd/WifiDisplaySettings;ZLandroid/hardware/display/WifiDisplay;)V
    .locals 0

    .prologue
    .line 354
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    iput-boolean p2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$isRemoteDisplay:Z

    iput-object p3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 357
    iget-boolean v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$isRemoteDisplay:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$display:Landroid/hardware/display/WifiDisplay;

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$000(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 358
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$100(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/DisplayManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->disconnectWifiDisplay()V

    .line 366
    :cond_0
    :goto_0
    return-void

    .line 359
    :cond_1
    iget-boolean v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$isRemoteDisplay:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->val$display:Landroid/hardware/display/WifiDisplay;

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$200(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$300(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/IRemoteDisplayAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/hardware/display/IRemoteDisplayAdapter;->disconnectRemoteDisplay()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 363
    :catch_0
    move-exception v0

    goto :goto_0
.end method
