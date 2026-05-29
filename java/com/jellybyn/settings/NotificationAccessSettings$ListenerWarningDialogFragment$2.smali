.class Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;
.super Ljava/lang/Object;
.source "NotificationAccessSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;

.field final synthetic val$cn:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;Landroid/content/ComponentName;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;->this$1:Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;

    iput-object p2, p0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;->val$cn:Landroid/content/ComponentName;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 113
    iget-object v0, p0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;->this$1:Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;

    iget-object v0, v0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;->this$0:Lcom/jellybyn/settings/NotificationAccessSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/NotificationAccessSettings;->access$000(Lcom/jellybyn/settings/NotificationAccessSettings;)Ljava/util/HashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;->val$cn:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 114
    iget-object v0, p0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment$2;->this$1:Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;

    iget-object v0, v0, Lcom/jellybyn/settings/NotificationAccessSettings$ListenerWarningDialogFragment;->this$0:Lcom/jellybyn/settings/NotificationAccessSettings;

    invoke-virtual {v0}, Lcom/jellybyn/settings/NotificationAccessSettings;->saveEnabledListeners()V

    .line 115
    return-void
.end method
