.class Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;
.super Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;
.source "LocalBluetoothProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PanStateChangedHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 0
    .param p2, "profile"    # Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;->this$0:Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;

    .line 241
    invoke-direct {p0, p1, p2}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;-><init>(Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager;Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;)V

    .line 242
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 246
    iget-object v0, p0, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$PanStateChangedHandler;->mProfile:Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfile;

    check-cast v0, Lcom/jellybyn/settings/bluetooth/PanProfile;

    .line 247
    .local v0, "panProfile":Lcom/jellybyn/settings/bluetooth/PanProfile;
    const-string v2, "android.bluetooth.pan.extra.LOCAL_ROLE"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 248
    .local v1, "role":I
    invoke-virtual {v0, p3, v1}, Lcom/jellybyn/settings/bluetooth/PanProfile;->setLocalRole(Landroid/bluetooth/BluetoothDevice;I)V

    .line 249
    invoke-super {p0, p1, p2, p3}, Lcom/jellybyn/settings/bluetooth/LocalBluetoothProfileManager$StateChangedHandler;->onReceive(Landroid/content/Context;Landroid/content/Intent;Landroid/bluetooth/BluetoothDevice;)V

    .line 250
    return-void
.end method
