.class Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment$2;
.super Ljava/lang/Object;
.source "DevelopmentSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;)V
    .locals 0

    .prologue
    .line 1326
    iput-object p1, p0, Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment$2;->this$0:Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1329
    iget-object v0, p0, Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment$2;->this$0:Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;

    invoke-virtual {v0}, Lcom/jellybyn/settings/DevelopmentSettings$ConfirmEnforceFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/DevelopmentSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DevelopmentSettings;->access$100(Lcom/jellybyn/settings/DevelopmentSettings;)V

    .line 1330
    return-void
.end method
