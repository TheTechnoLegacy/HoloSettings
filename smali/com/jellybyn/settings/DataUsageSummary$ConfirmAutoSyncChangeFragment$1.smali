.class Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;)V
    .locals 0

    .prologue
    .line 2097
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2100
    iget-object v0, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;

    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;->access$2900(Lcom/jellybyn/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;)Z

    move-result v0

    invoke-static {v0}, Landroid/content/ContentResolver;->setMasterSyncAutomatically(Z)V

    .line 2101
    return-void
.end method
