.class public Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMLogNativeFragment;
.super Lcom/koushikdutta/superuser/LogNativeFragment;
.source "PolicyNativeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CMLogNativeFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/koushikdutta/superuser/LogNativeFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    invoke-super {p0, p1, p2, p3}, Lcom/koushikdutta/superuser/LogNativeFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 21
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMLogNativeFragment;->getInternal()Lcom/koushikdutta/widgets/FragmentInterface;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/superuser/LogFragmentInternal;

    invoke-virtual {v1}, Lcom/koushikdutta/superuser/LogFragmentInternal;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;->access$000(Landroid/widget/ListView;)V

    .line 22
    return-object v0
.end method
