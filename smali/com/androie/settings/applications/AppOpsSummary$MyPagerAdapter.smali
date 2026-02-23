.class Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;
.super Landroid/support/v13/app/FragmentPagerAdapter;
.source "AppOpsSummary.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/applications/AppOpsSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/AppOpsSummary;


# direct methods
.method public constructor <init>(Lcom/androie/settings/applications/AppOpsSummary;Landroid/app/FragmentManager;)V
    .locals 0
    .param p2, "fm"    # Landroid/app/FragmentManager;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    .line 67
    invoke-direct {p0, p2}, Landroid/support/v13/app/FragmentPagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 68
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 77
    sget-object v0, Lcom/androie/settings/applications/AppOpsSummary;->sPageTemplates:[Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    array-length v0, v0

    return v0
.end method

.method public getCurrentPage()I
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    iget v0, v0, Lcom/androie/settings/applications/AppOpsSummary;->mCurPos:I

    return v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 72
    new-instance v0, Lcom/androie/settings/applications/AppOpsCategory;

    sget-object v1, Lcom/androie/settings/applications/AppOpsSummary;->sPageTemplates:[Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    aget-object v1, v1, p1

    invoke-direct {v0, v1}, Lcom/androie/settings/applications/AppOpsCategory;-><init>(Lcom/androie/settings/applications/AppOpsState$OpsTemplate;)V

    return-object v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    iget-object v0, v0, Lcom/androie/settings/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 100
    if-nez p1, :cond_0

    .line 103
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 87
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 91
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;->this$0:Lcom/androie/settings/applications/AppOpsSummary;

    iput p1, v0, Lcom/androie/settings/applications/AppOpsSummary;->mCurPos:I

    .line 92
    return-void
.end method
