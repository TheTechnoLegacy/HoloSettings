.class Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;)V
    .locals 0

    .prologue
    .line 1989
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1992
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-virtual {v1}, Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DataUsageSummary;

    .line 1993
    .local v0, "target":Lcom/androie/settings/DataUsageSummary;
    if-eqz v0, :cond_0

    .line 1995
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androie/settings/DataUsageSummary;->access$500(Lcom/androie/settings/DataUsageSummary;Z)V

    .line 1997
    :cond_0
    return-void
.end method
