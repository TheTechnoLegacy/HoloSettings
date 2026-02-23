.class Lcom/androie/settings/DateTimeSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "DateTimeSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DateTimeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DateTimeSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DateTimeSettings;)V
    .locals 0

    .prologue
    .line 423
    iput-object p1, p0, Lcom/androie/settings/DateTimeSettings$1;->this$0:Lcom/androie/settings/DateTimeSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 426
    iget-object v1, p0, Lcom/androie/settings/DateTimeSettings$1;->this$0:Lcom/androie/settings/DateTimeSettings;

    invoke-virtual {v1}, Lcom/androie/settings/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 427
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 428
    iget-object v1, p0, Lcom/androie/settings/DateTimeSettings$1;->this$0:Lcom/androie/settings/DateTimeSettings;

    invoke-virtual {v1, v0}, Lcom/androie/settings/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 430
    :cond_0
    return-void
.end method
