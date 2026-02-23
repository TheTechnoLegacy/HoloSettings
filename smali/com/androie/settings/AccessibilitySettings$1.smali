.class Lcom/androie/settings/AccessibilitySettings$1;
.super Landroid/os/Handler;
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
.method constructor <init>(Lcom/androie/settings/AccessibilitySettings;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/androie/settings/AccessibilitySettings$1;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 150
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    .line 151
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$1;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/androie/settings/AccessibilitySettings;->access$100(Lcom/androie/settings/AccessibilitySettings;)V

    .line 152
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$1;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/androie/settings/AccessibilitySettings;->access$200(Lcom/androie/settings/AccessibilitySettings;)V

    .line 153
    return-void
.end method
