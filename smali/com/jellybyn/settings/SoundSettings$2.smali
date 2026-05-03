.class Lcom/jellybyn/settings/SoundSettings$2;
.super Landroid/content/BroadcastReceiver;
.source "SoundSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/SoundSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/SoundSettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/SoundSettings;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/jellybyn/settings/SoundSettings$2;->this$0:Lcom/jellybyn/settings/SoundSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 121
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.DOCK_EVENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings$2;->this$0:Lcom/jellybyn/settings/SoundSettings;

    invoke-static {v0, p2}, Lcom/jellybyn/settings/SoundSettings;->access$200(Lcom/jellybyn/settings/SoundSettings;Landroid/content/Intent;)V

    .line 124
    :cond_0
    return-void
.end method
