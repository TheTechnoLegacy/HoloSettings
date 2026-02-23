.class Lcom/androie/settings/DateTimeSettingsSetupWizard$1;
.super Landroid/content/BroadcastReceiver;
.source "DateTimeSettingsSetupWizard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DateTimeSettingsSetupWizard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DateTimeSettingsSetupWizard;


# direct methods
.method constructor <init>(Lcom/androie/settings/DateTimeSettingsSetupWizard;)V
    .locals 0

    .prologue
    .line 327
    iput-object p1, p0, Lcom/androie/settings/DateTimeSettingsSetupWizard$1;->this$0:Lcom/androie/settings/DateTimeSettingsSetupWizard;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 330
    iget-object v0, p0, Lcom/androie/settings/DateTimeSettingsSetupWizard$1;->this$0:Lcom/androie/settings/DateTimeSettingsSetupWizard;

    invoke-static {v0}, Lcom/androie/settings/DateTimeSettingsSetupWizard;->access$000(Lcom/androie/settings/DateTimeSettingsSetupWizard;)V

    .line 331
    return-void
.end method
