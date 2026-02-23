.class Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;)V
    .locals 0

    .prologue
    .line 2180
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;->this$0:Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2183
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;->this$0:Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;->access$2900(Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;)Z

    move-result v0

    invoke-static {v0}, Landroid/content/ContentResolver;->setMasterSyncAutomatically(Z)V

    .line 2184
    return-void
.end method
