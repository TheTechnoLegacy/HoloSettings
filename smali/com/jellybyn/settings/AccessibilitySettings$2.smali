.class Lcom/jellybyn/settings/AccessibilitySettings$2;
.super Lcom/jellybyn/settings/AccessibilitySettings$SettingsContentObserver;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/AccessibilitySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-direct {p0, p2}, Lcom/jellybyn/settings/AccessibilitySettings$SettingsContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/AccessibilitySettings;->access$100(Lcom/jellybyn/settings/AccessibilitySettings;)V

    .line 159
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$2;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/AccessibilitySettings;->access$200(Lcom/jellybyn/settings/AccessibilitySettings;)V

    .line 160
    return-void
.end method
