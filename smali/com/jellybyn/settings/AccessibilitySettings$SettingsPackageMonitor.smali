.class Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingsPackageMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/AccessibilitySettings;


# direct methods
.method private constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings;)V
    .locals 0

    .prologue
    .line 613
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings;Lcom/jellybyn/settings/AccessibilitySettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jellybyn/settings/AccessibilitySettings;
    .param p2, "x1"    # Lcom/jellybyn/settings/AccessibilitySettings$1;

    .prologue
    .line 613
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;-><init>(Lcom/jellybyn/settings/AccessibilitySettings;)V

    return-void
.end method


# virtual methods
.method public onPackageAdded(Ljava/lang/String;I)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "uid"    # I

    .prologue
    .line 617
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 618
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 619
    return-void
.end method

.method public onPackageAppeared(Ljava/lang/String;I)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # I

    .prologue
    .line 623
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 624
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 625
    return-void
.end method

.method public onPackageDisappeared(Ljava/lang/String;I)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "reason"    # I

    .prologue
    .line 629
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 630
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 631
    return-void
.end method

.method public onPackageRemoved(Ljava/lang/String;I)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "uid"    # I

    .prologue
    .line 635
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 636
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/jellybyn/settings/AccessibilitySettings$SettingsPackageMonitor;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v1}, Lcom/jellybyn/settings/AccessibilitySettings;->access$400(Lcom/jellybyn/settings/AccessibilitySettings;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 637
    return-void
.end method
