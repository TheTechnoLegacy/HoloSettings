.class Lcom/androie/settings/bluetooth/BluetoothDevicePreference$1;
.super Ljava/lang/Object;
.source "BluetoothDevicePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->askDisconnect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/BluetoothDevicePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)V
    .locals 0

    .prologue
    .line 198
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference$1;->this$0:Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 200
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDevicePreference$1;->this$0:Lcom/androie/settings/bluetooth/BluetoothDevicePreference;

    invoke-static {v0}, Lcom/androie/settings/bluetooth/BluetoothDevicePreference;->access$000(Lcom/androie/settings/bluetooth/BluetoothDevicePreference;)Lcom/androie/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/bluetooth/CachedBluetoothDevice;->disconnect()V

    .line 201
    return-void
.end method
