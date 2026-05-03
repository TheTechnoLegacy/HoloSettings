.class Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;
.super Ljava/lang/Object;
.source "WifiDisplaySettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->showDisconnectDialog(Landroid/hardware/display/WifiDisplay;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

.field final synthetic val$display:Landroid/hardware/display/WifiDisplay;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplay;)V
    .locals 0

    .prologue
    .line 278
    iput-object p1, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    iput-object p2, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;->val$display:Landroid/hardware/display/WifiDisplay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 281
    iget-object v0, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;->val$display:Landroid/hardware/display/WifiDisplay;

    iget-object v1, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->access$000(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/WifiDisplayStatus;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/display/WifiDisplayStatus;->getActiveDisplay()Landroid/hardware/display/WifiDisplay;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/display/WifiDisplay;->equals(Landroid/hardware/display/WifiDisplay;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$1;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->access$100(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;)Landroid/hardware/display/DisplayManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->disconnectWifiDisplay()V

    .line 284
    :cond_0
    return-void
.end method
