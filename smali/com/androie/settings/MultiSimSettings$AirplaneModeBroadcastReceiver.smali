.class Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MultiSimSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/MultiSimSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AirplaneModeBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/MultiSimSettings;


# direct methods
.method private constructor <init>(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/MultiSimSettings;Lcom/androie/settings/MultiSimSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/MultiSimSettings;
    .param p2, "x1"    # Lcom/androie/settings/MultiSimSettings$1;

    .prologue
    .line 197
    invoke-direct {p0, p1}, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;-><init>(Lcom/androie/settings/MultiSimSettings;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 200
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 202
    const-string v1, "MultiSimSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Airplane mode is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v3}, Lcom/androie/settings/MultiSimSettings;->access$100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v1}, Lcom/androie/settings/MultiSimSettings;->access$100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 204
    const-string v1, "MultiSimSettings"

    const-string v2, "Airplane mode is ON, grayout the config subscription menu!!!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v1}, Lcom/androie/settings/MultiSimSettings;->access$200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/PreferenceScreen;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v1}, Lcom/androie/settings/MultiSimSettings;->access$200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/PreferenceScreen;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    goto :goto_0
.end method
