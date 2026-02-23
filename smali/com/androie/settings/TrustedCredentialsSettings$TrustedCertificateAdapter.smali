.class Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;
.super Landroid/widget/BaseAdapter;
.source "TrustedCredentialsSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/TrustedCredentialsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TrustedCertificateAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader;
    }
.end annotation


# instance fields
.field private final mCertHolders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mTab:Lcom/androie/settings/TrustedCredentialsSettings$Tab;

.field final synthetic this$0:Lcom/androie/settings/TrustedCredentialsSettings;


# direct methods
.method private constructor <init>(Lcom/androie/settings/TrustedCredentialsSettings;Lcom/androie/settings/TrustedCredentialsSettings$Tab;)V
    .locals 1
    .param p2, "tab"    # Lcom/androie/settings/TrustedCredentialsSettings$Tab;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->this$0:Lcom/androie/settings/TrustedCredentialsSettings;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mCertHolders:Ljava/util/List;

    .line 174
    iput-object p2, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mTab:Lcom/androie/settings/TrustedCredentialsSettings$Tab;

    .line 175
    invoke-direct {p0}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->load()V

    .line 176
    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/TrustedCredentialsSettings;Lcom/androie/settings/TrustedCredentialsSettings$Tab;Lcom/androie/settings/TrustedCredentialsSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/TrustedCredentialsSettings;
    .param p2, "x1"    # Lcom/androie/settings/TrustedCredentialsSettings$Tab;
    .param p3, "x2"    # Lcom/androie/settings/TrustedCredentialsSettings$1;

    .prologue
    .line 170
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;-><init>(Lcom/androie/settings/TrustedCredentialsSettings;Lcom/androie/settings/TrustedCredentialsSettings$Tab;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)Lcom/androie/settings/TrustedCredentialsSettings$Tab;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mTab:Lcom/androie/settings/TrustedCredentialsSettings$Tab;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    .prologue
    .line 170
    iget-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mCertHolders:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->load()V

    return-void
.end method

.method private load()V
    .locals 2

    .prologue
    .line 178
    new-instance v0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader;-><init>(Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;Lcom/androie/settings/TrustedCredentialsSettings$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter$AliasLoader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 179
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mCertHolders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 184
    iget-object v0, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mCertHolders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 170
    invoke-virtual {p0, p1}, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->getItem(I)Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 187
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 191
    if-nez p2, :cond_1

    .line 192
    iget-object v3, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->this$0:Lcom/androie/settings/TrustedCredentialsSettings;

    invoke-virtual {v3}, Lcom/androie/settings/TrustedCredentialsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 193
    .local v2, "inflater":Landroid/view/LayoutInflater;
    const v3, 0x7f0400bc

    invoke-virtual {v2, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 194
    new-instance v1, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;-><init>(Lcom/androie/settings/TrustedCredentialsSettings$1;)V

    .line 195
    .local v1, "holder":Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;
    const v3, 0x7f0c01d5

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-static {v1, v3}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1302(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 197
    const v3, 0x7f0c01d6

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-static {v1, v3}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1402(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 199
    const v3, 0x7f0c01d7

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    invoke-static {v1, v3}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1502(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;Landroid/widget/CheckBox;)Landroid/widget/CheckBox;

    .line 200
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 204
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mCertHolders:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;

    .line 205
    .local v0, "certHolder":Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;
    invoke-static {v1}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1300(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-static {v0}, Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;->access$1600(Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    invoke-static {v1}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1400(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-static {v0}, Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;->access$1700(Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    iget-object v3, p0, Lcom/androie/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->mTab:Lcom/androie/settings/TrustedCredentialsSettings$Tab;

    invoke-static {v3}, Lcom/androie/settings/TrustedCredentialsSettings$Tab;->access$1800(Lcom/androie/settings/TrustedCredentialsSettings$Tab;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    invoke-static {v1}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1500(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;)Landroid/widget/CheckBox;

    move-result-object v5

    invoke-static {v0}, Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;->access$000(Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x1

    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 209
    invoke-static {v1}, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;->access$1500(Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;)Landroid/widget/CheckBox;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 211
    :cond_0
    return-object p2

    .line 202
    .end local v0    # "certHolder":Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;
    .end local v1    # "holder":Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;

    .restart local v1    # "holder":Lcom/androie/settings/TrustedCredentialsSettings$ViewHolder;
    goto :goto_0

    .restart local v0    # "certHolder":Lcom/androie/settings/TrustedCredentialsSettings$CertHolder;
    :cond_2
    move v3, v4

    .line 208
    goto :goto_1
.end method
