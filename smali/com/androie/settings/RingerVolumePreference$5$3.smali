.class Lcom/androie/settings/RingerVolumePreference$5$3;
.super Ljava/lang/Object;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/RingerVolumePreference$5;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/RingerVolumePreference$5;


# direct methods
.method constructor <init>(Lcom/androie/settings/RingerVolumePreference$5;)V
    .locals 0

    .prologue
    .line 340
    iput-object p1, p0, Lcom/androie/settings/RingerVolumePreference$5$3;->this$1:Lcom/androie/settings/RingerVolumePreference$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 345
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference$5$3;->this$1:Lcom/androie/settings/RingerVolumePreference$5;

    iget-object v0, v0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v0}, Lcom/androie/settings/RingerVolumePreference;->access$400(Lcom/androie/settings/RingerVolumePreference;)Landroid/app/Dialog;

    move-result-object v0

    if-ne p1, v0, :cond_1

    .line 346
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference$5$3;->this$1:Lcom/androie/settings/RingerVolumePreference$5;

    iget-object v0, v0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v0}, Lcom/androie/settings/RingerVolumePreference;->access$300(Lcom/androie/settings/RingerVolumePreference;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 347
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference$5$3;->this$1:Lcom/androie/settings/RingerVolumePreference$5;

    iget-object v0, v0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v0}, Lcom/androie/settings/RingerVolumePreference;->access$600(Lcom/androie/settings/RingerVolumePreference;)Landroid/widget/CheckBox;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 349
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference$5$3;->this$1:Lcom/androie/settings/RingerVolumePreference$5;

    iget-object v0, v0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/RingerVolumePreference;->access$402(Lcom/androie/settings/RingerVolumePreference;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 351
    :cond_1
    return-void
.end method
