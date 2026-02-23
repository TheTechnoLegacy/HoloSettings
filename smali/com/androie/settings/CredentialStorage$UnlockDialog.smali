.class Lcom/androie/settings/CredentialStorage$UnlockDialog;
.super Ljava/lang/Object;
.source "CredentialStorage.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/CredentialStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnlockDialog"
.end annotation


# instance fields
.field private final mButton:Landroid/widget/Button;

.field private final mError:Landroid/widget/TextView;

.field private final mOldPassword:Landroid/widget/TextView;

.field private mUnlockConfirmed:Z

.field final synthetic this$0:Lcom/androie/settings/CredentialStorage;


# direct methods
.method private constructor <init>(Lcom/androie/settings/CredentialStorage;)V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 385
    iput-object p1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 386
    const v3, 0x7f040025

    const/4 v4, 0x0

    invoke-static {p1, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 389
    .local v2, "view":Landroid/view/View;
    invoke-static {p1}, Lcom/androie/settings/CredentialStorage;->access$500(Lcom/androie/settings/CredentialStorage;)I

    move-result v3

    if-ne v3, v7, :cond_0

    .line 390
    invoke-virtual {p1}, Lcom/androie/settings/CredentialStorage;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080907

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 399
    .local v1, "text":Ljava/lang/CharSequence;
    :goto_0
    const v3, 0x7f0c0052

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    const v3, 0x7f0c0055

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    .line 401
    iget-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 402
    iget-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 403
    const v3, 0x7f0c0053

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mError:Landroid/widget/TextView;

    .line 405
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080906

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x104000a

    invoke-virtual {v3, v4, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/high16 v4, 0x1040000

    invoke-virtual {v3, v4, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 411
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 412
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 413
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mButton:Landroid/widget/Button;

    .line 414
    iget-object v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mButton:Landroid/widget/Button;

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 415
    return-void

    .line 391
    .end local v0    # "dialog":Landroid/app/AlertDialog;
    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_0
    invoke-static {p1}, Lcom/androie/settings/CredentialStorage;->access$500(Lcom/androie/settings/CredentialStorage;)I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_1

    .line 392
    invoke-virtual {p1}, Lcom/androie/settings/CredentialStorage;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08090b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/CharSequence;
    goto :goto_0

    .line 393
    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_1
    invoke-static {p1}, Lcom/androie/settings/CredentialStorage;->access$500(Lcom/androie/settings/CredentialStorage;)I

    move-result v3

    if-ne v3, v5, :cond_2

    .line 394
    invoke-virtual {p1}, Lcom/androie/settings/CredentialStorage;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08090c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/CharSequence;
    goto/16 :goto_0

    .line 396
    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_2
    const v3, 0x7f08090d

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {p1}, Lcom/androie/settings/CredentialStorage;->access$500(Lcom/androie/settings/CredentialStorage;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p1, v3, v4}, Lcom/androie/settings/CredentialStorage;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/CharSequence;
    goto/16 :goto_0
.end method

.method synthetic constructor <init>(Lcom/androie/settings/CredentialStorage;Lcom/androie/settings/CredentialStorage$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/CredentialStorage;
    .param p2, "x1"    # Lcom/androie/settings/CredentialStorage$1;

    .prologue
    .line 376
    invoke-direct {p0, p1}, Lcom/androie/settings/CredentialStorage$UnlockDialog;-><init>(Lcom/androie/settings/CredentialStorage;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 418
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 419
    return-void

    .line 418
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 422
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "button"    # I

    .prologue
    .line 428
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mUnlockConfirmed:Z

    .line 429
    return-void

    .line 428
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 432
    iget-boolean v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mUnlockConfirmed:Z

    if-eqz v1, :cond_3

    .line 433
    iput-boolean v3, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mUnlockConfirmed:Z

    .line 434
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mError:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 435
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1}, Lcom/androie/settings/CredentialStorage;->access$400(Lcom/androie/settings/CredentialStorage;)Landroid/security/KeyStore;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->mOldPassword:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/security/KeyStore;->unlock(Ljava/lang/String;)Z

    .line 436
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1}, Lcom/androie/settings/CredentialStorage;->access$400(Lcom/androie/settings/CredentialStorage;)Landroid/security/KeyStore;

    move-result-object v1

    invoke-virtual {v1}, Landroid/security/KeyStore;->getLastError()I

    move-result v0

    .line 437
    .local v0, "error":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 438
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1, v4}, Lcom/androie/settings/CredentialStorage;->access$502(Lcom/androie/settings/CredentialStorage;I)I

    .line 439
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    const v2, 0x7f080910

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 444
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1}, Lcom/androie/settings/CredentialStorage;->access$600(Lcom/androie/settings/CredentialStorage;)V

    .line 460
    .end local v0    # "error":I
    :cond_0
    :goto_0
    return-void

    .line 445
    .restart local v0    # "error":I
    :cond_1
    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 446
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1, v4}, Lcom/androie/settings/CredentialStorage;->access$502(Lcom/androie/settings/CredentialStorage;I)I

    .line 447
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    const v2, 0x7f08090e

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 451
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1}, Lcom/androie/settings/CredentialStorage;->access$700(Lcom/androie/settings/CredentialStorage;)V

    goto :goto_0

    .line 452
    :cond_2
    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    .line 454
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    add-int/lit8 v2, v0, -0xa

    add-int/lit8 v2, v2, 0x1

    invoke-static {v1, v2}, Lcom/androie/settings/CredentialStorage;->access$502(Lcom/androie/settings/CredentialStorage;I)I

    .line 455
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-static {v1}, Lcom/androie/settings/CredentialStorage;->access$700(Lcom/androie/settings/CredentialStorage;)V

    goto :goto_0

    .line 459
    .end local v0    # "error":I
    :cond_3
    iget-object v1, p0, Lcom/androie/settings/CredentialStorage$UnlockDialog;->this$0:Lcom/androie/settings/CredentialStorage;

    invoke-virtual {v1}, Lcom/androie/settings/CredentialStorage;->finish()V

    goto :goto_0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 425
    return-void
.end method
