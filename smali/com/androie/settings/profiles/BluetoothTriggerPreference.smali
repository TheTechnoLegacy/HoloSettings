.class public Lcom/androie/settings/profiles/BluetoothTriggerPreference;
.super Lcom/androie/settings/profiles/AbstractTriggerPreference;
.source "BluetoothTriggerPreference.java"


# instance fields
.field private mAddress:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/androie/settings/profiles/AbstractTriggerPreference;-><init>(Landroid/content/Context;)V

    .line 28
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->mAddress:Ljava/lang/String;

    .line 29
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getAlias()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getAlias()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 34
    :goto_0
    return-void

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "address"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/androie/settings/profiles/AbstractTriggerPreference;-><init>(Landroid/content/Context;)V

    .line 38
    iput-object p3, p0, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->mAddress:Ljava/lang/String;

    .line 39
    invoke-virtual {p0, p2}, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/androie/settings/profiles/BluetoothTriggerPreference;->mAddress:Ljava/lang/String;

    return-object v0
.end method
