.class Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$ClassChangedHandler;
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
    name = "ClassChangedHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;


# direct methods
.method private constructor <init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)V
    .locals 0

    .prologue
    .line 331
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$ClassChangedHandler;->this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;
    .param p2, "x1"    # Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$1;

    .prologue
    .line 331
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$ClassChangedHandler;-><init>(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;Landroid/bluetooth/BluetoothDevice;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 334
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager$ClassChangedHandler;->this$0:Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;

    invoke-static {v0}, Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;->access$1200(Lcom/jellybyn/settings/bluetooth/BluetoothEventManager;)Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/jellybyn/settings/bluetooth/CachedBluetoothDeviceManager;->onBtClassChanged(Landroid/bluetooth/BluetoothDevice;)V

    .line 335
    return-void
.end method
