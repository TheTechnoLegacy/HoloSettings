.class Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;
.super Ljava/lang/Object;
.source "LockscreenTargets.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/LockscreenTargets;->createShortcutDialogView(I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)V
    .locals 0

    .prologue
    .line 452
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 455
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$600(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$800()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 457
    :try_start_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$900(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 458
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$900(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/io/File;->setWritable(ZZ)Z

    .line 459
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$1000(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Lcom/androie/settings/cyanogenmod/IconPicker;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getId()I

    move-result v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$3;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v3}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$900(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/androie/settings/cyanogenmod/IconPicker;->pickIcon(ILjava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    :cond_0
    :goto_0
    return-void

    .line 460
    :catch_0
    move-exception v0

    .line 461
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "LockscreenTargets"

    const-string v2, "Could not create temporary icon"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
