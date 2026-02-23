.class Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;
.super Ljava/lang/Object;
.source "ApplicationLightPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/notificationlight/ApplicationLightPreference;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

.field final synthetic val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;


# direct methods
.method constructor <init>(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Lcom/androie/settings/notificationlight/LightSettingsDialog;)V
    .locals 0

    .prologue
    .line 154
    iput-object p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iput-object p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 157
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v2}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getPulseSpeedOn()I

    move-result v1

    .line 158
    .local v1, "onTime":I
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v2}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getPulseSpeedOff()I

    move-result v0

    .line 160
    .local v0, "offTime":I
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iget-object v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v3}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getColor()I

    move-result v3

    const/high16 v4, -0x1000000

    sub-int/2addr v3, v4

    invoke-static {v2, v3, v1, v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$000(Lcom/androie/settings/notificationlight/ApplicationLightPreference;III)V

    .line 161
    return-void
.end method
