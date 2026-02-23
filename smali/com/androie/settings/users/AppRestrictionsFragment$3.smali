.class Lcom/androie/settings/users/AppRestrictionsFragment$3;
.super Ljava/lang/Object;
.source "AppRestrictionsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/users/AppRestrictionsFragment;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/users/AppRestrictionsFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/users/AppRestrictionsFragment;)V
    .locals 0

    .prologue
    .line 1066
    iput-object p1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$3;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1069
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$3;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-static {v0}, Lcom/androie/settings/users/AppRestrictionsFragment;->access$1500(Lcom/androie/settings/users/AppRestrictionsFragment;)V

    .line 1070
    return-void
.end method
