.class Lcom/androie/settings/SoundSettings$2;
.super Landroid/content/BroadcastReceiver;
.source "SoundSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/SoundSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/SoundSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/SoundSettings;)V
    .locals 0

    .prologue
    .line 153
    iput-object p1, p0, Lcom/androie/settings/SoundSettings$2;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 156
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.DOCK_EVENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$2;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-static {v0, p2}, Lcom/androie/settings/SoundSettings;->access$200(Lcom/androie/settings/SoundSettings;Landroid/content/Intent;)V

    .line 161
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$2;->this$0:Lcom/androie/settings/SoundSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/SoundSettings;->access$300(Lcom/androie/settings/SoundSettings;Z)V

    goto :goto_0
.end method
