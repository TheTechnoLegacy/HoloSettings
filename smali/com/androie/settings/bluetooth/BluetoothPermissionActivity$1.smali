.class Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothPermissionActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;


# direct methods
.method constructor <init>(Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$1;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 66
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 68
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 69
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$1;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    invoke-static {v2}, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;->access$000(Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$1;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    invoke-static {v2}, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;->access$100(Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;)V

    .line 71
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_0
    return-void
.end method
