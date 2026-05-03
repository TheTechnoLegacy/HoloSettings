.class Lcom/jellybyn/settings/AccessibilitySettings$1;
.super Landroid/os/Handler;
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
.method constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 148
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    .line 149
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/AccessibilitySettings;->access$100(Lcom/jellybyn/settings/AccessibilitySettings;)V

    .line 150
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$1;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/AccessibilitySettings;->access$200(Lcom/jellybyn/settings/AccessibilitySettings;)V

    .line 151
    return-void
.end method
