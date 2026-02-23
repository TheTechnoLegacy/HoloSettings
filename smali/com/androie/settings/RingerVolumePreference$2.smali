.class Lcom/androie/settings/RingerVolumePreference$2;
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
    .line 216
    iput-object p1, p0, Lcom/androie/settings/RingerVolumePreference$2;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 221
    iget-object v1, p0, Lcom/androie/settings/RingerVolumePreference$2;->this$0:Lcom/androie/settings/RingerVolumePreference;

    invoke-virtual {v1}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->access$100(Landroid/content/Context;)I

    move-result v0

    .line 223
    .local v0, "mutedStreams":I
    if-eqz p2, :cond_0

    .line 224
    or-int/lit8 v0, v0, 0x20

    .line 228
    :goto_0
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "mode_ringer_streams_affected"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 232
    return-void

    .line 226
    :cond_0
    and-int/lit8 v0, v0, -0x21

    goto :goto_0
.end method
