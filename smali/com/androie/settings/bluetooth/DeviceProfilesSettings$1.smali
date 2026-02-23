.class Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;
.super Ljava/lang/Object;
.source "DeviceProfilesSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/bluetooth/DeviceProfilesSettings;->askDisconnect(Landroid/content/Context;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/DeviceProfilesSettings;

.field final synthetic val$device:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

.field final synthetic val$profile:Lcom/androie/settings/bluetooth/LocalBluetoothProfile;


# direct methods
.method constructor <init>(Lcom/androie/settings/bluetooth/DeviceProfilesSettings;Lcom/androie/settings/bluetooth/CachedBluetoothDevice;Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V
    .locals 0

    .prologue
    .line 290
    iput-object p1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->this$0:Lcom/androie/settings/bluetooth/DeviceProfilesSettings;

    iput-object p2, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$device:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    iput-object p3, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$profile:Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 292
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$device:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$profile:Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    invoke-virtual {v0, v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/androie/settings/bluetooth/LocalBluetoothProfile;)V

    .line 293
    iget-object v0, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$profile:Lcom/androie/settings/bluetooth/LocalBluetoothProfile;

    iget-object v1, p0, Lcom/androie/settings/bluetooth/DeviceProfilesSettings$1;->val$device:Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    invoke-virtual {v1}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/androie/settings/bluetooth/LocalBluetoothProfile;->setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 294
    return-void
.end method
