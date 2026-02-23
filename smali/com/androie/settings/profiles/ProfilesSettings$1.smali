.class Lcom/androie/settings/profiles/ProfilesSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "ProfilesSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfilesSettings;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfilesSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfilesSettings;)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfilesSettings$1;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 89
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.app.profiles.PROFILES_STATE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 91
    iget-object v1, p0, Lcom/androie/settings/profiles/ProfilesSettings$1;->this$0:Lcom/androie/settings/profiles/ProfilesSettings;

    invoke-static {v1}, Lcom/androie/settings/profiles/ProfilesSettings;->access$000(Lcom/androie/settings/profiles/ProfilesSettings;)V

    .line 93
    :cond_0
    return-void
.end method
