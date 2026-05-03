.class public Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;
.super Landroid/app/Fragment;
.source "DataUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppDetailsFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1600
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method public static show(Lcom/jellybyn/settings/DataUsageSummary;Lcom/jellybyn/settings/DataUsageSummary$AppItem;Ljava/lang/CharSequence;)V
    .locals 4
    .param p0, "parent"    # Lcom/jellybyn/settings/DataUsageSummary;
    .param p1, "app"    # Lcom/jellybyn/settings/DataUsageSummary$AppItem;
    .param p2, "label"    # Ljava/lang/CharSequence;

    .prologue
    .line 1604
    invoke-virtual {p0}, Lcom/jellybyn/settings/DataUsageSummary;->isAdded()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1617
    :goto_0
    return-void

    .line 1606
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1607
    .local v0, "args":Landroid/os/Bundle;
    const-string v3, "app"

    invoke-virtual {v0, v3, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1609
    new-instance v1, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;

    invoke-direct {v1}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;-><init>()V

    .line 1610
    .local v1, "fragment":Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;
    invoke-virtual {v1, v0}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 1611
    const/4 v3, 0x0

    invoke-virtual {v1, p0, v3}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;->setTargetFragment(Landroid/app/Fragment;I)V

    .line 1612
    invoke-virtual {p0}, Lcom/jellybyn/settings/DataUsageSummary;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 1613
    .local v2, "ft":Landroid/app/FragmentTransaction;
    const-string v3, "appDetails"

    invoke-virtual {v2, v1, v3}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 1614
    const-string v3, "appDetails"

    invoke-virtual {v2, v3}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 1615
    invoke-virtual {v2, p2}, Landroid/app/FragmentTransaction;->setBreadCrumbTitle(Ljava/lang/CharSequence;)Landroid/app/FragmentTransaction;

    .line 1616
    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    goto :goto_0
.end method


# virtual methods
.method public onStart()V
    .locals 3

    .prologue
    .line 1621
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 1622
    invoke-virtual {p0}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/DataUsageSummary;

    .line 1623
    .local v0, "target":Lcom/jellybyn/settings/DataUsageSummary;
    invoke-virtual {p0}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "app"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/DataUsageSummary$AppItem;

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$2502(Lcom/jellybyn/settings/DataUsageSummary;Lcom/jellybyn/settings/DataUsageSummary$AppItem;)Lcom/jellybyn/settings/DataUsageSummary$AppItem;

    .line 1624
    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$100(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1625
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 1629
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 1630
    invoke-virtual {p0}, Lcom/jellybyn/settings/DataUsageSummary$AppDetailsFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/DataUsageSummary;

    .line 1631
    .local v0, "target":Lcom/jellybyn/settings/DataUsageSummary;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/jellybyn/settings/DataUsageSummary;->access$2502(Lcom/jellybyn/settings/DataUsageSummary;Lcom/jellybyn/settings/DataUsageSummary$AppItem;)Lcom/jellybyn/settings/DataUsageSummary$AppItem;

    .line 1632
    invoke-static {v0}, Lcom/jellybyn/settings/DataUsageSummary;->access$100(Lcom/jellybyn/settings/DataUsageSummary;)V

    .line 1633
    return-void
.end method
