.class Lcom/androie/settings/DisplaySettings$3;
.super Ljava/lang/Object;
.source "DisplaySettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DisplaySettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DisplaySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DisplaySettings;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/androie/settings/DisplaySettings$3;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/androie/settings/DisplaySettings$3;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/DisplaySettings;->access$100(Lcom/androie/settings/DisplaySettings;)Lcom/androie/settings/FontDialogPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/FontDialogPreference;->click()V

    .line 376
    return-void
.end method
