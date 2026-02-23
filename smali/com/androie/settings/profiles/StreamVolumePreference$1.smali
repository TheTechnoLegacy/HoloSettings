.class Lcom/androie/settings/profiles/StreamVolumePreference$1;
.super Ljava/lang/Object;
.source "StreamVolumePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/StreamVolumePreference;->createVolumeDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/StreamVolumePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/StreamVolumePreference;)V
    .locals 0

    .prologue
    .line 132
    iput-object p1, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 135
    iget-object v1, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/profiles/StreamVolumePreference;->access$000(Lcom/androie/settings/profiles/StreamVolumePreference;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 136
    .local v0, "value":I
    iget-object v1, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-static {v1}, Lcom/androie/settings/profiles/StreamVolumePreference;->access$100(Lcom/androie/settings/profiles/StreamVolumePreference;)Lcom/androie/settings/profiles/ProfileConfig$StreamItem;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/profiles/ProfileConfig$StreamItem;->mSettings:Landroid/app/StreamSettings;

    invoke-virtual {v1, v0}, Landroid/app/StreamSettings;->setValue(I)V

    .line 137
    iget-object v1, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-virtual {v3}, Lcom/androie/settings/profiles/StreamVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0800d3

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/profiles/StreamVolumePreference$1;->this$0:Lcom/androie/settings/profiles/StreamVolumePreference;

    invoke-static {v3}, Lcom/androie/settings/profiles/StreamVolumePreference;->access$000(Lcom/androie/settings/profiles/StreamVolumePreference;)Landroid/widget/SeekBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getMax()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androie/settings/profiles/StreamVolumePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 138
    return-void
.end method
