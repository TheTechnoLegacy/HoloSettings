.class Lcom/androie/settings/RingerVolumePreference$5;
.super Ljava/lang/Object;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/RingerVolumePreference;->onBindDialogView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/RingerVolumePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/RingerVolumePreference;)V
    .locals 0

    .prologue
    .line 299
    iput-object p1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 303
    if-nez p2, :cond_1

    .line 305
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/androie/settings/RingerVolumePreference;->access$302(Lcom/androie/settings/RingerVolumePreference;Z)Z

    .line 306
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->access$400(Lcom/androie/settings/RingerVolumePreference;)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 307
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->access$500(Lcom/androie/settings/RingerVolumePreference;)V

    .line 309
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-virtual {v1}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 310
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f080271

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 311
    const v1, 0x7f080270

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 312
    const v1, 0x7f080458

    new-instance v2, Lcom/androie/settings/RingerVolumePreference$5$1;

    invoke-direct {v2, p0}, Lcom/androie/settings/RingerVolumePreference$5$1;-><init>(Lcom/androie/settings/RingerVolumePreference$5;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 325
    const v1, 0x7f080073

    new-instance v2, Lcom/androie/settings/RingerVolumePreference$5$2;

    invoke-direct {v2, p0}, Lcom/androie/settings/RingerVolumePreference$5$2;-><init>(Lcom/androie/settings/RingerVolumePreference$5;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 339
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/androie/settings/RingerVolumePreference;->access$402(Lcom/androie/settings/RingerVolumePreference;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 340
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->access$400(Lcom/androie/settings/RingerVolumePreference;)Landroid/app/Dialog;

    move-result-object v1

    new-instance v2, Lcom/androie/settings/RingerVolumePreference$5$3;

    invoke-direct {v2, p0}, Lcom/androie/settings/RingerVolumePreference$5$3;-><init>(Lcom/androie/settings/RingerVolumePreference$5;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 357
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 354
    :cond_1
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$5;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-virtual {v1}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "safe_headset_volume"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0
.end method
