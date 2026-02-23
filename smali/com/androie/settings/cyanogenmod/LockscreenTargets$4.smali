.class Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;
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
    .line 466
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 469
    new-array v1, v3, [Ljava/lang/String;

    invoke-static {}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$800()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 470
    .local v1, "names":[Ljava/lang/String;
    new-array v0, v3, [Landroid/content/Intent$ShortcutIconResource;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$200(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Landroid/app/Activity;

    move-result-object v2

    const v3, 0x108001d

    invoke-static {v2, v3}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v2

    aput-object v2, v0, v4

    .line 473
    .local v0, "icons":[Landroid/content/Intent$ShortcutIconResource;
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->access$1100(Lcom/androie/settings/cyanogenmod/LockscreenTargets;)Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenTargets$4;->this$0:Lcom/androie/settings/cyanogenmod/LockscreenTargets;

    invoke-virtual {v3}, Lcom/androie/settings/cyanogenmod/LockscreenTargets;->getId()I

    move-result v3

    invoke-virtual {v2, v1, v0, v3}, Lcom/androie/settings/cyanogenmod/ShortcutPickHelper;->pickShortcut([Ljava/lang/String;[Landroid/content/Intent$ShortcutIconResource;I)V

    .line 474
    return-void
.end method
