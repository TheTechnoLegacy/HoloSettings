.class Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$3;
.super Ljava/lang/Object;
.source "BluetoothPermissionActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;->createMasDialogView()Landroid/view/View;
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
    .line 211
    iput-object p1, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$3;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 213
    if-eqz p2, :cond_0

    .line 214
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$3;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;->access$202(Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;Z)Z

    .line 218
    :goto_0
    return-void

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity$3;->this$0:Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;->access$202(Lcom/androie/settings/bluetooth/BluetoothPermissionActivity;Z)Z

    goto :goto_0
.end method
