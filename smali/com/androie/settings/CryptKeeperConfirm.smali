.class public Lcom/androie/settings/CryptKeeperConfirm;
.super Landroid/app/Fragment;
.source "CryptKeeperConfirm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/CryptKeeperConfirm$Blank;
    }
.end annotation


# instance fields
.field private mContentView:Landroid/view/View;

.field private mFinalButton:Landroid/widget/Button;

.field private mFinalClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 85
    new-instance v0, Lcom/androie/settings/CryptKeeperConfirm$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/CryptKeeperConfirm$1;-><init>(Lcom/androie/settings/CryptKeeperConfirm;)V

    iput-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mFinalClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private establishFinalConfirmationState()V
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mContentView:Landroid/view/View;

    const v1, 0x7f0c0056

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mFinalButton:Landroid/widget/Button;

    .line 101
    iget-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mFinalButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/androie/settings/CryptKeeperConfirm;->mFinalClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 107
    const v0, 0x7f040027

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mContentView:Landroid/view/View;

    .line 108
    invoke-direct {p0}, Lcom/androie/settings/CryptKeeperConfirm;->establishFinalConfirmationState()V

    .line 109
    iget-object v0, p0, Lcom/androie/settings/CryptKeeperConfirm;->mContentView:Landroid/view/View;

    return-object v0
.end method
