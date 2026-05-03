.class Lcom/jellybyn/settings/TrustedCredentialsSettings$1;
.super Ljava/lang/Object;
.source "TrustedCredentialsSettings.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/TrustedCredentialsSettings;->addTab(Lcom/jellybyn/settings/TrustedCredentialsSettings$Tab;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/TrustedCredentialsSettings;

.field final synthetic val$adapter:Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;->this$0:Lcom/jellybyn/settings/TrustedCredentialsSettings;

    iput-object p2, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;->val$adapter:Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;->this$0:Lcom/jellybyn/settings/TrustedCredentialsSettings;

    iget-object v1, p0, Lcom/jellybyn/settings/TrustedCredentialsSettings$1;->val$adapter:Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;

    invoke-virtual {v1, p3}, Lcom/jellybyn/settings/TrustedCredentialsSettings$TrustedCertificateAdapter;->getItem(I)Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/jellybyn/settings/TrustedCredentialsSettings;->access$1000(Lcom/jellybyn/settings/TrustedCredentialsSettings;Lcom/jellybyn/settings/TrustedCredentialsSettings$CertHolder;)V

    .line 166
    return-void
.end method
