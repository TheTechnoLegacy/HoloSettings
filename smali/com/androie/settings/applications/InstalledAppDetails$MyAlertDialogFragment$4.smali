.class Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$4;
.super Ljava/lang/Object;
.source "InstalledAppDetails.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;)V
    .locals 0

    .prologue
    .line 1130
    iput-object p1, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$4;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x0

    .line 1132
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$4;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-virtual {v0}, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->getOwner()Lcom/androie/settings/applications/InstalledAppDetails;

    move-result-object v0

    invoke-static {v0}, Lcom/androie/settings/applications/InstalledAppDetails;->access$800(Lcom/androie/settings/applications/InstalledAppDetails;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1134
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$4;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-virtual {v0}, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->getOwner()Lcom/androie/settings/applications/InstalledAppDetails;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/androie/settings/applications/InstalledAppDetails;->access$700(Lcom/androie/settings/applications/InstalledAppDetails;ZZ)V

    .line 1135
    return-void
.end method
