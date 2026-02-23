.class Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;
.super Landroid/os/Handler;
.source "ApnSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/ApnSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RestoreApnUiHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ApnSettings;


# direct methods
.method private constructor <init>(Lcom/androie/settings/ApnSettings;)V
    .locals 0

    .prologue
    .line 327
    iput-object p1, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/ApnSettings;Lcom/androie/settings/ApnSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/ApnSettings;
    .param p2, "x1"    # Lcom/androie/settings/ApnSettings$1;

    .prologue
    .line 327
    invoke-direct {p0, p1}, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;-><init>(Lcom/androie/settings/ApnSettings;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    .line 330
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 343
    :goto_0
    return-void

    .line 332
    :pswitch_0
    iget-object v0, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    invoke-static {v0}, Lcom/androie/settings/ApnSettings;->access$200(Lcom/androie/settings/ApnSettings;)V

    .line 333
    iget-object v0, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    invoke-virtual {v0}, Lcom/androie/settings/ApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 334
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/androie/settings/ApnSettings;->access$102(Z)Z

    .line 335
    iget-object v0, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    const/16 v1, 0x3e9

    invoke-virtual {v0, v1}, Lcom/androie/settings/ApnSettings;->removeDialog(I)V

    .line 336
    iget-object v0, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    invoke-virtual {v0}, Lcom/androie/settings/ApnSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/ApnSettings$RestoreApnUiHandler;->this$0:Lcom/androie/settings/ApnSettings;

    invoke-virtual {v1}, Lcom/androie/settings/ApnSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0806d0

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 330
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
