.class Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler$2;
.super Ljava/lang/Object;
.source "BluetoothDiscoverableEnabler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;


# direct methods
.method constructor <init>(Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler$2;->this$0:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler$2;->this$0:Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;

    invoke-static {v0}, Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;->access$000(Lcom/androie/settings/bluetooth/BluetoothDiscoverableEnabler;)V

    .line 92
    return-void
.end method
