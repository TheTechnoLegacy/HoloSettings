.class Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment$1;
.super Ljava/lang/Object;
.source "NotificationAccessSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment$1;->this$1:Lcom/androie/settings/NotificationAccessSettings$ListenerWarningDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 121
    return-void
.end method
