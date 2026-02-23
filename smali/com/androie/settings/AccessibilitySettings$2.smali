.class Lcom/androie/settings/AccessibilitySettings$2;
.super Lcom/androie/settings/AccessibilitySettings$SettingsContentObserver;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/AccessibilitySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/AccessibilitySettings;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/androie/settings/AccessibilitySettings$2;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-direct {p0, p2}, Lcom/androie/settings/AccessibilitySettings$SettingsContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$2;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/androie/settings/AccessibilitySettings;->access$100(Lcom/androie/settings/AccessibilitySettings;)V

    .line 161
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$2;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/androie/settings/AccessibilitySettings;->access$200(Lcom/androie/settings/AccessibilitySettings;)V

    .line 162
    return-void
.end method
