.class Lcom/androie/settings/wfd/WifiDisplaySettings$4;
.super Ljava/lang/Object;
.source "WifiDisplaySettings.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/wfd/WifiDisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/wfd/WifiDisplaySettings;)V
    .locals 0

    .prologue
    .line 438
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$4;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 441
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$4;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0, p2}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$402(Lcom/androie/settings/wfd/WifiDisplaySettings;Z)Z

    .line 442
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$4;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$500(Lcom/androie/settings/wfd/WifiDisplaySettings;)Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_display_on"

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 444
    return-void

    .line 442
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
