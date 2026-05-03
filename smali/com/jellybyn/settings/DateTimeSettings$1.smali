.class Lcom/jellybyn/settings/DateTimeSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "DateTimeSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DateTimeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DateTimeSettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DateTimeSettings;)V
    .locals 0

    .prologue
    .line 417
    iput-object p1, p0, Lcom/jellybyn/settings/DateTimeSettings$1;->this$0:Lcom/jellybyn/settings/DateTimeSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 420
    iget-object v1, p0, Lcom/jellybyn/settings/DateTimeSettings$1;->this$0:Lcom/jellybyn/settings/DateTimeSettings;

    invoke-virtual {v1}, Lcom/jellybyn/settings/DateTimeSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 421
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 422
    iget-object v1, p0, Lcom/jellybyn/settings/DateTimeSettings$1;->this$0:Lcom/jellybyn/settings/DateTimeSettings;

    invoke-virtual {v1, v0}, Lcom/jellybyn/settings/DateTimeSettings;->updateTimeAndDateDisplay(Landroid/content/Context;)V

    .line 424
    :cond_0
    return-void
.end method
