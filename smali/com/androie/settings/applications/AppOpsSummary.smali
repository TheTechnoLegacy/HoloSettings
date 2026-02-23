.class public Lcom/androie/settings/applications/AppOpsSummary;
.super Landroid/app/Fragment;
.source "AppOpsSummary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;
    }
.end annotation


# static fields
.field static sPageTemplates:[Lcom/androie/settings/applications/AppOpsState$OpsTemplate;


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

.field private mContentContainer:Landroid/view/ViewGroup;

.field mCurPos:I

.field private mInflater:Landroid/view/LayoutInflater;

.field mPageNames:[Ljava/lang/CharSequence;

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mRootView:Landroid/view/View;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 55
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    const/4 v1, 0x0

    sget-object v2, Lcom/androie/settings/applications/AppOpsState;->LOCATION_TEMPLATE:Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/androie/settings/applications/AppOpsState;->PERSONAL_TEMPLATE:Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/androie/settings/applications/AppOpsState;->MESSAGING_TEMPLATE:Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/androie/settings/applications/AppOpsState;->DEVICE_TEMPLATE:Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    aput-object v2, v0, v1

    sput-object v0, Lcom/androie/settings/applications/AppOpsSummary;->sPageTemplates:[Lcom/androie/settings/applications/AppOpsState$OpsTemplate;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/applications/AppOpsSummary;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/applications/AppOpsSummary;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->resetCounters()V

    return-void
.end method

.method private resetAdapter()V
    .locals 3

    .prologue
    .line 108
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;->getCurrentPage()I

    move-result v0

    .line 109
    .local v0, "curPos":I
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 110
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 111
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 112
    return-void
.end method

.method private resetCounters()V
    .locals 3

    .prologue
    .line 171
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    const-string v2, "appops"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .line 173
    .local v0, "appOps":Landroid/app/AppOpsManager;
    if-nez v0, :cond_0

    .line 179
    :goto_0
    return-void

    .line 176
    :cond_0
    invoke-virtual {v0}, Landroid/app/AppOpsManager;->resetCounters()V

    .line 178
    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->resetAdapter()V

    goto :goto_0
.end method

.method private resetCountersConfirm()V
    .locals 3

    .prologue
    .line 182
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/applications/AppOpsSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080329

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08032a

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/androie/settings/applications/AppOpsSummary$1;

    invoke-direct {v2, p0}, Lcom/androie/settings/applications/AppOpsSummary$1;-><init>(Lcom/androie/settings/applications/AppOpsSummary;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 195
    return-void
.end method

.method private shouldShowSystemApps()Z
    .locals 3

    .prologue
    .line 149
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    const-string v1, "show_system_apps"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private shouldShowUserApps()Z
    .locals 3

    .prologue
    .line 145
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    const-string v1, "show_user_apps"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 154
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 157
    iget-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    const-string v1, "appops_manager"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    .line 159
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/applications/AppOpsSummary;->setHasOptionsMenu(Z)V

    .line 160
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 164
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 165
    const v0, 0x7f100001

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 166
    const v0, 0x7f0c02a1

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->shouldShowUserApps()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 167
    const v0, 0x7f0c02a2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->shouldShowSystemApps()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 168
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/androie/settings/applications/AppOpsSummary;->mInflater:Landroid/view/LayoutInflater;

    .line 119
    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f04000b

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 121
    .local v0, "rootView":Landroid/view/View;
    iput-object p2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mContentContainer:Landroid/view/ViewGroup;

    .line 122
    iput-object v0, p0, Lcom/androie/settings/applications/AppOpsSummary;->mRootView:Landroid/view/View;

    .line 124
    invoke-virtual {p0}, Lcom/androie/settings/applications/AppOpsSummary;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0033

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPageNames:[Ljava/lang/CharSequence;

    .line 126
    const v2, 0x7f0c0018

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    iput-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 127
    new-instance v2, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {p0}, Lcom/androie/settings/applications/AppOpsSummary;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;-><init>(Lcom/androie/settings/applications/AppOpsSummary;Landroid/app/FragmentManager;)V

    iput-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    .line 128
    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 129
    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/androie/settings/applications/AppOpsSummary;->mAdapter:Lcom/androie/settings/applications/AppOpsSummary$MyPagerAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 130
    const v2, 0x7f0c0019

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/PagerTabStrip;

    .line 131
    .local v1, "tabs":Landroid/support/v4/view/PagerTabStrip;
    const v2, 0x1060012

    invoke-virtual {v1, v2}, Landroid/support/v4/view/PagerTabStrip;->setTabIndicatorColorResource(I)V

    .line 135
    instance-of v2, p2, Landroid/preference/PreferenceFrameLayout;

    if-eqz v2, :cond_0

    .line 136
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceFrameLayout$LayoutParams;

    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/preference/PreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 139
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/applications/AppOpsSummary;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mActivity:Landroid/app/Activity;

    .line 141
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 199
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 220
    invoke-super {p0, p1}, Landroid/app/Fragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    :goto_0
    return v3

    .line 201
    :pswitch_0
    const-string v1, "show_user_apps"

    .line 203
    .local v1, "prefNameUserApps":Ljava/lang/String;
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v4

    if-nez v4, :cond_0

    move v2, v3

    :cond_0
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 204
    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v4, "show_user_apps"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 206
    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->resetAdapter()V

    goto :goto_0

    .line 209
    .end local v1    # "prefNameUserApps":Ljava/lang/String;
    :pswitch_1
    const-string v0, "show_system_apps"

    .line 211
    .local v0, "prefNameSysApps":Ljava/lang/String;
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v4

    if-nez v4, :cond_1

    move v2, v3

    :cond_1
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 212
    iget-object v2, p0, Lcom/androie/settings/applications/AppOpsSummary;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v4, "show_system_apps"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 214
    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->resetAdapter()V

    goto :goto_0

    .line 217
    .end local v0    # "prefNameSysApps":Ljava/lang/String;
    :pswitch_2
    invoke-direct {p0}, Lcom/androie/settings/applications/AppOpsSummary;->resetCountersConfirm()V

    goto :goto_0

    .line 199
    :pswitch_data_0
    .packed-switch 0x7f0c02a1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
