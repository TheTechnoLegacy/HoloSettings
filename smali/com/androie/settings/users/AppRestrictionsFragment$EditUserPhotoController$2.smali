.class Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;
.super Landroid/os/AsyncTask;
.source "AppRestrictionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->onActivityResult(IILandroid/content/Intent;)Z
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
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;


# direct methods
.method constructor <init>(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)V
    .locals 0

    .prologue
    .line 1139
    iput-object p1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 1142
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v0}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2200(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1139
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1146
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v0, p1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2302(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 1147
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2500(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v2}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2300(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/androie/settings/users/CircleFramedDrawable;->getInstance(Landroid/content/Context;Landroid/graphics/Bitmap;)Lcom/androie/settings/users/CircleFramedDrawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2402(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 1149
    iget-object v0, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v0}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2500(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2400(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1151
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2200(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1152
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->this$0:Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;

    invoke-static {v1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;->access$2600(Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1153
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1139
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/users/AppRestrictionsFragment$EditUserPhotoController$2;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
