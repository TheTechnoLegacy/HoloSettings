.class Lcom/androie/settings/wfd/WifiDisplaySettings$2;
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

.field final synthetic val$nameEditText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/widget/EditText;Landroid/hardware/display/WifiDisplay;Z)V
    .locals 0

    .prologue
    .line 385
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    iput-object p2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$nameEditText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$display:Landroid/hardware/display/WifiDisplay;

    iput-boolean p4, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$isRemoteDisplay:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 388
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$nameEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 389
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplay;->getDeviceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 390
    :cond_0
    const/4 v0, 0x0

    .line 392
    :cond_1
    iget-boolean v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$isRemoteDisplay:Z

    if-nez v1, :cond_2

    .line 393
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$100(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/DisplayManager;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-virtual {v2}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/hardware/display/DisplayManager;->renameWifiDisplay(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    :goto_0
    return-void

    .line 396
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v1}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$300(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/IRemoteDisplayAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$2;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-virtual {v2}, Landroid/hardware/display/WifiDisplay;->getDeviceAddress()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Landroid/hardware/display/IRemoteDisplayAdapter;->renameRemoteDisplay(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 398
    :catch_0
    move-exception v1

    goto :goto_0
.end method
