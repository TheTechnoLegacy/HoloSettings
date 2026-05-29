.class public Lcom/jellybyn/settings/TrustedCredentialsSettings;
.super Landroid/app/Fragment;
.source "TrustedCredentialsSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/TrustedCredentialsSettings$4;,
        Lcom/jellybyn/settings/TrustedCredentialsSettings$AliasOperation;,
        Lcom/jellybyn/settings/TrustedCredentialsSettings$ViewHolder;,
        Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;,
        Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;,
        Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;
    }
.end annotation


# instance fields
.field private final mStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

.field private mTabHost:Landroid/widget/TabHost;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 140
    new-instance v0, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    invoke-direct {v0}, Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;-><init>()V

    iput-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    .line 381
    return-void
.end method

.method static synthetic access$1000(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings;
    .param p1, "x1"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->showCertDialog(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/jellybyn/settings/TrustedCredentialsSettings;)Landroid/widget/TabHost;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/jellybyn/settings/TrustedCredentialsSettings;)Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/TrustedCredentialsSettings;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mStore:Lorg/apache/harmony/xnet/provider/jsse/TrustedCertificateStore;

    return-object v0
.end method

.method private addTab(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)V
    .locals 6
    .param p1, "tab"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 155
    iget-object v3, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->access$700(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->access$600(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->access$500(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost$TabSpec;->setContent(I)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    .line 158
    .local v2, "systemSpec":Landroid/widget/TabHost$TabSpec;
    iget-object v3, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v3, v2}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 160
    iget-object v3, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->access$800(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 161
    .local v1, "lv":Landroid/widget/ListView;
    new-instance v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    const/4 v3, 0x0

    invoke-direct {v0, p0, p1, v3}, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;-><init>(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lcom/jellybyn/settings/TrustedCredentialsSettings$1;)V

    .line 162
    .local v0, "adapter":Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 163
    new-instance v3, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;

    invoke-direct {v3, p0, v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;-><init>(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 168
    return-void
.end method

.method private showCertDialog(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V
    .locals 8
    .param p1, "certHolder"    # Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    .prologue
    .line 337
    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$2600(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Landroid/net/http/SslCertificate;

    move-result-object v6

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/http/SslCertificate;->inflateCertificateView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v5

    .line 338
    .local v5, "view":Landroid/view/View;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v1, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 339
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v6, 0x1040522

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 340
    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 341
    const v6, 0x104000a

    new-instance v7, Lcom/jellybyn/settings/TrustedCredentialsSettings$2;

    invoke-direct {v7, p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings$2;-><init>(Lcom/jellybyn/settings/TrustedCredentialsSettings;)V

    invoke-virtual {v1, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 346
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 348
    .local v2, "certDialog":Landroid/app/Dialog;
    const v6, 0x102032d

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 349
    .local v0, "body":Landroid/view/ViewGroup;
    invoke-virtual {p0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    .line 350
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f04007b

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v0, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 353
    .local v4, "removeButton":Landroid/widget/Button;
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 354
    invoke-static {p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;->access$100(Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    move-result-object v6

    invoke-static {v6, p1}, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->access$2700(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setText(I)V

    .line 355
    new-instance v6, Lcom/jellybyn/settings/TrustedCredentialsSettings$3;

    invoke-direct {v6, p0, p1, v2}, Lcom/jellybyn/settings/TrustedCredentialsSettings$3;-><init>(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;Landroid/app/Dialog;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 378
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 379
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 146
    const v0, 0x7f04007c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    .line 147
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    .line 148
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->SYSTEM:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->addTab(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)V

    .line 150
    sget-object v0, Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;->USER:Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;

    invoke-direct {p0, v0}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->addTab(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)V

    .line 151
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings;->mTabHost:Landroid/widget/TabHost;

    return-object v0
.end method
