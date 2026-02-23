.class Lcom/androie/settings/RingerVolumePreference$6;
.super Landroid/content/BroadcastReceiver;
.source "RingerVolumePreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/RingerVolumePreference;->onBindDialogView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/RingerVolumePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/RingerVolumePreference;)V
    .locals 0

    .prologue
    .line 367
    iput-object p1, p0, Lcom/androie/settings/RingerVolumePreference$6;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 369
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 371
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$6;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->access$700(Lcom/androie/settings/RingerVolumePreference;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference$6;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v2}, Lcom/androie/settings/RingerVolumePreference;->access$700(Lcom/androie/settings/RingerVolumePreference;)Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0x65

    const-string v4, "android.media.EXTRA_RINGER_MODE"

    const/4 v5, -0x1

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 374
    :cond_0
    return-void
.end method
