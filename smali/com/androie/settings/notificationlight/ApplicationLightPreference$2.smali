.class Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;
.super Ljava/lang/Object;
.source "ApplicationLightPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/notificationlight/ApplicationLightPreference;->createDialog()Landroid/app/Dialog;
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
    .line 172
    iput-object p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iput-object p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 175
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iget-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getColor()I

    move-result v1

    const/high16 v2, -0x1000000

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$102(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I

    .line 176
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iget-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getPulseSpeedOn()I

    move-result v1

    invoke-static {v0, v1}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$202(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I

    .line 177
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    iget-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->val$d:Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getPulseSpeedOff()I

    move-result v1

    invoke-static {v0, v1}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$302(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I

    .line 178
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    invoke-static {v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$400(Lcom/androie/settings/notificationlight/ApplicationLightPreference;)V

    .line 179
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;->this$0:Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    invoke-static {v0, p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->access$500(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Ljava/lang/Object;)Z

    .line 180
    return-void
.end method
