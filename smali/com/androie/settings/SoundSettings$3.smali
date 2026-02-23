.class Lcom/androie/settings/SoundSettings$3;
.super Ljava/lang/Object;
.source "SoundSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/SoundSettings;->onCreate(Landroid/os/Bundle;)V
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
    .line 259
    iput-object p1, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 261
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-static {v0}, Lcom/androie/settings/SoundSettings;->access$000(Lcom/androie/settings/SoundSettings;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    iget-object v1, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-static {v1}, Lcom/androie/settings/SoundSettings;->access$000(Lcom/androie/settings/SoundSettings;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v2, v1, v2}, Lcom/androie/settings/SoundSettings;->access$400(Lcom/androie/settings/SoundSettings;ILandroid/preference/Preference;I)V

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-static {v0}, Lcom/androie/settings/SoundSettings;->access$100(Lcom/androie/settings/SoundSettings;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 266
    iget-object v0, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    iget-object v1, p0, Lcom/androie/settings/SoundSettings$3;->this$0:Lcom/androie/settings/SoundSettings;

    invoke-static {v1}, Lcom/androie/settings/SoundSettings;->access$100(Lcom/androie/settings/SoundSettings;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v3, v1, v3}, Lcom/androie/settings/SoundSettings;->access$400(Lcom/androie/settings/SoundSettings;ILandroid/preference/Preference;I)V

    .line 269
    :cond_1
    return-void
.end method
