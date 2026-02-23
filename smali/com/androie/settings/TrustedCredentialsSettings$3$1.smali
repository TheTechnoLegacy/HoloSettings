.class Lcom/androie/settings/TrustedCredentialsSettings$3$1;
.super Ljava/lang/Object;
.source "TrustedCredentialsSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/TrustedCredentialsSettings$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/TrustedCredentialsSettings$3;


# direct methods
.method constructor <init>(Lcom/androie/settings/TrustedCredentialsSettings$3;)V
    .locals 0

    .prologue
    .line 360
    iput-object p1, p0, Lcom/androie/settings/TrustedCredentialsSettings$3$1;->this$1:Lcom/androie/settings/TrustedCredentialsSettings$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 362
    new-instance v0, Lcom/androie/settings/TrustedCredentialsSettings$AliasOperation;

    iget-object v1, p0, Lcom/androie/settings/TrustedCredentialsSettings$3$1;->this$1:Lcom/androie/settings/TrustedCredentialsSettings$3;

    iget-object v1, v1, Lcom/androie/settings/TrustedCredentialsSettings$3;->this$0:Lcom/androie/settings/TrustedCredentialsSettings;

    iget-object v2, p0, Lcom/androie/settings/TrustedCredentialsSettings$3$1;->this$1:Lcom/androie/settings/TrustedCredentialsSettings$3;

    iget-object v2, v2, Lcom/androie/settings/TrustedCredentialsSettings$3;->val$certHolder:Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/androie/settings/TrustedCredentialsSettings$AliasOperation;-><init>(Lcom/androie/settings/TrustedCredentialsSettings;Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;Lcom/androie/settings/TrustedCredentialsSettings$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/androie/settings/TrustedCredentialsSettings$AliasOperation;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 363
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 364
    iget-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$3$1;->this$1:Lcom/androie/settings/TrustedCredentialsSettings$3;

    iget-object v0, v0, Lcom/androie/settings/TrustedCredentialsSettings$3;->val$certDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 365
    return-void
.end method
