.class Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;)V
    .locals 0

    .prologue
    .line 1906
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1909
    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-virtual {v1}, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataDisableFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/DataUsageSummary;

    .line 1910
    .local v0, "target":Lcom/jellybyn/settings/DataUsageSummary;
    if-eqz v0, :cond_0

    .line 1912
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$500(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    .line 1914
    :cond_0
    return-void
.end method
