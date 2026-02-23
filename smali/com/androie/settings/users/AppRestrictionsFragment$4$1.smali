.class Lcom/androie/settings/users/AppRestrictionsFragment$4$1;
.super Landroid/os/AsyncTask;
.source "AppRestrictionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/users/AppRestrictionsFragment$4;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/users/AppRestrictionsFragment$4;


# direct methods
.method constructor <init>(Lcom/androie/settings/users/AppRestrictionsFragment$4;)V
    .locals 0

    .prologue
    .line 1052
    iput-object p1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$4$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$4;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1052
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/users/AppRestrictionsFragment$4$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 1055
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$4$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$4;

    iget-object v0, v0, Lcom/androie/settings/users/AppRestrictionsFragment$4;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-static {v0}, Lcom/androie/settings/users/AppRestrictionsFragment;->access$1200(Lcom/androie/settings/users/AppRestrictionsFragment;)Landroid/os/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$4$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$4;

    iget-object v1, v1, Lcom/androie/settings/users/AppRestrictionsFragment$4;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-static {v1}, Lcom/androie/settings/users/AppRestrictionsFragment;->access$1100(Lcom/androie/settings/users/AppRestrictionsFragment;)Landroid/os/UserHandle;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    iget-object v2, p0, Lcom/androie/settings/users/AppRestrictionsFragment$4$1;->this$1:Lcom/androie/settings/users/AppRestrictionsFragment$4;

    iget-object v2, v2, Lcom/androie/settings/users/AppRestrictionsFragment$4;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-static {v2}, Lcom/androie/settings/users/AppRestrictionsFragment;->access$1800(Lcom/androie/settings/users/AppRestrictionsFragment;)Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->getNewUserPhotoBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/UserManager;->setUserIcon(ILandroid/graphics/Bitmap;)V

    .line 1057
    const/4 v0, 0x0

    return-object v0
.end method
