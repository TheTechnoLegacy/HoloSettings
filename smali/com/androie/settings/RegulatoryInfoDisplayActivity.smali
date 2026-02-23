.class public Lcom/androie/settings/RegulatoryInfoDisplayActivity;
.super Landroid/app/Activity;
.source "RegulatoryInfoDisplayActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x2

    .line 44
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    invoke-virtual {p0}, Lcom/androie/settings/RegulatoryInfoDisplayActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 47
    .local v7, "resources":Landroid/content/res/Resources;
    const v8, 0x7f0d0005

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    if-nez v8, :cond_0

    .line 48
    invoke-virtual {p0}, Lcom/androie/settings/RegulatoryInfoDisplayActivity;->finish()V

    .line 51
    :cond_0
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-direct {v8, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v9, 0x7f080717

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8, p0}, Landroid/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 57
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v8, 0x7f0200f2

    :try_start_0
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 60
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    if-le v8, v10, :cond_1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-le v8, v10, :cond_1

    const/4 v5, 0x1

    .line 66
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .local v5, "regulatoryInfoDrawableExists":Z
    :goto_0
    const v8, 0x7f080a85

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 68
    .local v6, "regulatoryText":Ljava/lang/CharSequence;
    if-eqz v5, :cond_2

    .line 69
    invoke-virtual {p0}, Lcom/androie/settings/RegulatoryInfoDisplayActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v8

    const v9, 0x7f0400a6

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 70
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 81
    :goto_1
    return-void

    .line 60
    .end local v5    # "regulatoryInfoDrawableExists":Z
    .end local v6    # "regulatoryText":Ljava/lang/CharSequence;
    .restart local v1    # "d":Landroid/graphics/drawable/Drawable;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 62
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    :catch_0
    move-exception v3

    .line 63
    .local v3, "ignored":Landroid/content/res/Resources$NotFoundException;
    const/4 v5, 0x0

    .restart local v5    # "regulatoryInfoDrawableExists":Z
    goto :goto_0

    .line 71
    .end local v3    # "ignored":Landroid/content/res/Resources$NotFoundException;
    .restart local v6    # "regulatoryText":Ljava/lang/CharSequence;
    :cond_2
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-lez v8, :cond_3

    .line 72
    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 73
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .line 75
    .local v2, "dialog":Landroid/app/AlertDialog;
    const v8, 0x102000b

    invoke-virtual {v2, v8}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 76
    .local v4, "messageText":Landroid/widget/TextView;
    const/16 v8, 0x11

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setGravity(I)V

    goto :goto_1

    .line 79
    .end local v2    # "dialog":Landroid/app/AlertDialog;
    .end local v4    # "messageText":Landroid/widget/TextView;
    :cond_3
    invoke-virtual {p0}, Lcom/androie/settings/RegulatoryInfoDisplayActivity;->finish()V

    goto :goto_1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/androie/settings/RegulatoryInfoDisplayActivity;->finish()V

    .line 86
    return-void
.end method
