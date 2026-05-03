.class Lcom/jellybyn/settings/wfd/WifiDisplaySettings$6;
.super Landroid/database/ContentObserver;
.source "WifiDisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/wfd/WifiDisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$6;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 365
    iget-object v0, p0, Lcom/jellybyn/settings/wfd/WifiDisplaySettings$6;->this$0:Lcom/jellybyn/settings/wfd/WifiDisplaySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/wfd/WifiDisplaySettings;->access$500(Lcom/jellybyn/settings/wfd/WifiDisplaySettings;)V

    .line 366
    return-void
.end method
