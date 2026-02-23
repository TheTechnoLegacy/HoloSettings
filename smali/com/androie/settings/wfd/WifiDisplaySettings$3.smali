.class Lcom/androie/settings/wfd/WifiDisplaySettings$3;
.super Ljava/lang/Object;
.source "WifiDisplaySettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/wfd/WifiDisplaySettings;->showOptionsDialog(Landroid/hardware/display/WifiDisplay;Z)V
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
    .line 403
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    iput-boolean p2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->val$isRemoteDisplay:Z

    iput-object p3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 406
    iget-boolean v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->val$isRemoteDisplay:Z

    if-nez v0, :cond_0

    .line 407
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$100(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/DisplayManager;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->forgetWifiDisplay(Ljava/lang/String;)V

    .line 415
    :goto_0
    return-void

    .line 410
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$300(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/IRemoteDisplayAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$3;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/hardware/display/IRemoteDisplayAdapter;->forgetRemoteDisplay(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 412
    :catch_0
    move-exception v0

    goto :goto_0
.end method
