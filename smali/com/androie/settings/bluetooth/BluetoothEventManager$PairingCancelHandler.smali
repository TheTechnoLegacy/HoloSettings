.class Lcom/androie/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;
.super Ljava/lang/Object;
.source "BluetoothEventManager.java"

# interfaces
.implements Lcom/androie/settings/bluetooth/BluetoothEventManager$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/bluetooth/BluetoothEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PairingCancelHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/BluetoothEventManager;


# direct methods
.method private constructor <init>(Lcom/androie/settings/bluetooth/BluetoothEventManager;)V
    .locals 0

    .prologue
    .line 353
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;->this$0:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/bluetooth/BluetoothEventManager;Lcom/androie/settings/bluetooth/BluetoothEventManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/bluetooth/BluetoothEventManager;
    .param p2, "x1"    # Lcom/androie/settings/bluetooth/BluetoothEventManager$1;

    .prologue
    .line 353
    invoke-direct {p0, p1}, Lcom/androie/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;-><init>(Lcom/androie/settings/bluetooth/BluetoothEventManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 355
    if-nez p3, :cond_1

    .line 356
    const-string v2, "BluetoothEventManager"

    const-string v3, "ACTION_PAIRING_CANCEL with no EXTRA_DEVICE"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 359
    :cond_1
    const v1, 0x7f0804ed

    .line 360
    .local v1, "errorMsg":I
    iget-object v2, p0, Lcom/androie/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;->this$0:Lcom/androie/settings/bluetooth/BluetoothEventManager;

    invoke-static {v2}, Lcom/androie/settings/bluetooth/BluetoothEventManager;->access$1200(Lcom/androie/settings/bluetooth/BluetoothEventManager;)Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/androie/settings/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 361
    .local v0, "cachedDevice":Lcom/androie/settings/bluetooth/CachedBluetoothDevice;
    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    .line 362
    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v1}, Lcom/androie/settings/bluetooth/Utils;->showError(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method
