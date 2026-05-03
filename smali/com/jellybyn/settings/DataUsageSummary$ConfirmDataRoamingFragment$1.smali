.class Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;)V
    .locals 0

    .prologue
    .line 1947
    iput-object p1, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1950
    iget-object v1, p0, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment$1;->this$0:Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;

    invoke-virtual {v1}, Lcom/jellybyn/settings/DataUsageSummary$ConfirmDataRoamingFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/DataUsageSummary;

    .line 1951
    .local v0, "target":Lcom/jellybyn/settings/DataUsageSummary;
    if-eqz v0, :cond_0

    .line 1952
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$2800(Lcom/jellybyn/settings/DataUsageSummary;Z)V

    .line 1954
    :cond_0
    return-void
.end method
