.class Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "ManageApplications.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/applications/ManageApplications;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPagerAdapter"
.end annotation


# instance fields
.field mCurPos:I

.field final synthetic this$0:Lcom/jellybyn/settings/applications/ManageApplications;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/applications/ManageApplications;)V
    .locals 1

    .prologue
    .line 466
    iput-object p1, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    .line 468
    const/4 v0, 0x0

    iput v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->mCurPos:I

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 486
    check-cast p3, Landroid/view/View;

    .end local p3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 487
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v0}, Lcom/jellybyn/settings/applications/ManageApplications;->access$000(Lcom/jellybyn/settings/applications/ManageApplications;)I

    move-result v0

    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 496
    invoke-super {p0, p1}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 502
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v0}, Lcom/jellybyn/settings/applications/ManageApplications;->access$100(Lcom/jellybyn/settings/applications/ManageApplications;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;

    iget-object v0, v0, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->mLabel:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 477
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v2}, Lcom/jellybyn/settings/applications/ManageApplications;->access$100(Lcom/jellybyn/settings/applications/ManageApplications;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;

    .line 478
    .local v1, "tab":Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;
    iget-object v2, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v2}, Lcom/jellybyn/settings/applications/ManageApplications;->access$200(Lcom/jellybyn/settings/applications/ManageApplications;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v3}, Lcom/jellybyn/settings/applications/ManageApplications;->access$300(Lcom/jellybyn/settings/applications/ManageApplications;)Landroid/view/ViewGroup;

    move-result-object v3

    iget-object v4, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    invoke-static {v4}, Lcom/jellybyn/settings/applications/ManageApplications;->access$400(Lcom/jellybyn/settings/applications/ManageApplications;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/jellybyn/settings/applications/ManageApplications$TabInfo;->build(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 479
    .local v0, "root":Landroid/view/View;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 480
    const v2, 0x7f080072

    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 481
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 491
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 516
    if-nez p1, :cond_0

    .line 517
    iget-object v0, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->this$0:Lcom/jellybyn/settings/applications/ManageApplications;

    iget v1, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->mCurPos:I

    invoke-virtual {v0, v1}, Lcom/jellybyn/settings/applications/ManageApplications;->updateCurrentTab(I)V

    .line 519
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 507
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 511
    iput p1, p0, Lcom/jellybyn/settings/applications/ManageApplications$MyPagerAdapter;->mCurPos:I

    .line 512
    return-void
.end method
