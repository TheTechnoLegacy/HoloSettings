.class Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$2;
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
    .line 1102
    iput-object p1, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$2;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v2, 0x0

    .line 1105
    iget-object v0, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$2;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-virtual {v0}, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->getOwner()Lcom/androie/settings/applications/InstalledAppDetails;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment$2;->this$0:Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;

    invoke-virtual {v1}, Lcom/androie/settings/applications/InstalledAppDetails$MyAlertDialogFragment;->getOwner()Lcom/androie/settings/applications/InstalledAppDetails;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/applications/InstalledAppDetails;->access$100(Lcom/androie/settings/applications/InstalledAppDetails;)Lcom/androie/settings/applications/ApplicationsState$AppEntry;

    move-result-object v1

    iget-object v1, v1, Lcom/androie/settings/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, v1, v2, v2}, Lcom/androie/settings/applications/InstalledAppDetails;->access$600(Lcom/androie/settings/applications/InstalledAppDetails;Ljava/lang/String;ZZ)V

    .line 1107
    return-void
.end method
