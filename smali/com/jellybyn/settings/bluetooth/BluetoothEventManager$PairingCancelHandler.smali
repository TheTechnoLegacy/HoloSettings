.class Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;
.super Ljava/lang/Object;
.source "BluetoothEventManager.java"

# interfaces
.implements Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PairingCancelHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;


# direct methods
.method private constructor <init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)V
    .locals 0

    .prologue
    .line 345
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;->this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;
    .param p2, "x1"    # Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$1;

    .prologue
    .line 345
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;-><init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 347
    if-nez p3, :cond_0

    .line 348
    const-string v2, "BluetoothEventManager"

    const-string v3, "ACTION_PAIRING_CANCEL with no EXTRA_DEVICE"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    :goto_0
    return-void

    .line 351
    :cond_0
    const v1, 0x7f0b0180

    .line 352
    .local v1, "errorMsg":I
    iget-object v2, p0, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$PairingCancelHandler;->this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-static {v2}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->access$1200(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 353
    .local v0, "cachedDevice":Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v1}, Lcom/jellybyn/settings/bluetooth/Utils;->showError(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method
