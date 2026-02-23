.class public Lcom/androie/settings/DataUsageSummary;
.super Landroid/app/Fragment;
.source "DataUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/DataUsageSummary$UidDetailTask;,
        Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;,
        Lcom/androie/settings/DataUsageSummary$ConfirmAppRestrictFragment;,
        Lcom/androie/settings/DataUsageSummary$DeniedRestrictFragment;,
        Lcom/androie/settings/DataUsageSummary$ConfirmRestrictFragment;,
        Lcom/androie/settings/DataUsageSummary$ConfirmDataRoamingFragment;,
        Lcom/androie/settings/DataUsageSummary$ConfirmDataDisableFragment;,
        Lcom/androie/settings/DataUsageSummary$LimitEditorFragment;,
        Lcom/androie/settings/DataUsageSummary$WarningEditorFragment;,
        Lcom/androie/settings/DataUsageSummary$CycleEditorFragment;,
        Lcom/androie/settings/DataUsageSummary$ConfirmLimitFragment;,
        Lcom/androie/settings/DataUsageSummary$AppDetailsFragment;,
        Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;,
        Lcom/androie/settings/DataUsageSummary$AppItem;,
        Lcom/androie/settings/DataUsageSummary$CycleAdapter;,
        Lcom/androie/settings/DataUsageSummary$CycleChangeItem;,
        Lcom/androie/settings/DataUsageSummary$CycleItem;
    }
.end annotation


# static fields
.field private static final sBuilder:Ljava/lang/StringBuilder;

.field private static final sFormatter:Ljava/util/Formatter;


# instance fields
.field private mAdapter:Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

.field private mAppBackground:Landroid/widget/TextView;

.field private mAppDetail:Landroid/view/View;

.field private mAppForeground:Landroid/widget/TextView;

.field private mAppIcon:Landroid/widget/ImageView;

.field private mAppPieChart:Lcom/androie/settings/widget/PieChartView;

.field private mAppRestrict:Landroid/widget/CheckBox;

.field private mAppRestrictListener:Landroid/view/View$OnClickListener;

.field private mAppRestrictView:Landroid/view/View;

.field private mAppSettings:Landroid/widget/Button;

.field private mAppSettingsIntent:Landroid/content/Intent;

.field private mAppSettingsListener:Landroid/view/View$OnClickListener;

.field private mAppSwitches:Landroid/widget/LinearLayout;

.field private mAppTitles:Landroid/view/ViewGroup;

.field private mBinding:Z

.field private mChart:Lcom/androie/settings/widget/ChartDataUsageView;

.field private mChartData:Lcom/androie/settings/net/ChartData;

.field private final mChartDataCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks",
            "<",
            "Lcom/androie/settings/net/ChartData;",
            ">;"
        }
    .end annotation
.end field

.field private mChartListener:Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;

.field private mConnService:Landroid/net/ConnectivityManager;

.field private mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

.field private mCurrentTab:Ljava/lang/String;

.field private mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

.field private mCycleListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mCycleSpinner:Landroid/widget/Spinner;

.field private mCycleView:Landroid/view/View;

.field private mDataEnabled:Landroid/widget/Switch;

.field private mDataEnabledListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mDataEnabledView:Landroid/view/View;

.field private mDisableAtLimit:Landroid/widget/CheckBox;

.field private mDisableAtLimitListener:Landroid/view/View$OnClickListener;

.field private mDisableAtLimitView:Landroid/view/View;

.field private mEmpty:Landroid/widget/TextView;

.field private mEmptyTabContent:Landroid/widget/TabHost$TabContentFactory;

.field private mHeader:Landroid/view/ViewGroup;

.field private mInsetSide:I

.field private mIntentTab:Ljava/lang/String;

.field private mListListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mListView:Landroid/widget/ListView;

.field private mMenuAutoSync:Landroid/view/MenuItem;

.field private mMenuDataRoaming:Landroid/view/MenuItem;

.field private mMenuRestrictBackground:Landroid/view/MenuItem;

.field private mMobileDataEnabled:Ljava/lang/Boolean;

.field private mNetworkService:Landroid/os/INetworkManagementService;

.field private mNetworkSwitches:Landroid/widget/LinearLayout;

.field private mNetworkSwitchesContainer:Landroid/view/ViewGroup;

.field private mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

.field private mPolicyManager:Landroid/net/NetworkPolicyManager;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mShowEthernet:Z

.field private mShowWifi:Z

.field private mStatsService:Landroid/net/INetworkStatsService;

.field private mStatsSession:Landroid/net/INetworkStatsSession;

.field private final mSummaryCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks",
            "<",
            "Landroid/net/NetworkStats;",
            ">;"
        }
    .end annotation
.end field

.field private mTabHost:Landroid/widget/TabHost;

.field private mTabListener:Landroid/widget/TabHost$OnTabChangeListener;

.field private mTabWidget:Landroid/widget/TabWidget;

.field private mTabsContainer:Landroid/view/ViewGroup;

.field private mTemplate:Landroid/net/NetworkTemplate;

.field private mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

.field private mUsageSummary:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 1428
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    sput-object v0, Lcom/androie/settings/DataUsageSummary;->sBuilder:Ljava/lang/StringBuilder;

    .line 1429
    new-instance v0, Ljava/util/Formatter;

    sget-object v1, Lcom/androie/settings/DataUsageSummary;->sBuilder:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    sput-object v0, Lcom/androie/settings/DataUsageSummary;->sFormatter:Ljava/util/Formatter;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 160
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 214
    iput v0, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    .line 245
    iput-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    .line 246
    iput-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    .line 251
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    .line 257
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    .line 258
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    .line 672
    new-instance v0, Lcom/androie/settings/DataUsageSummary$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$2;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mEmptyTabContent:Landroid/widget/TabHost$TabContentFactory;

    .line 692
    new-instance v0, Lcom/androie/settings/DataUsageSummary$3;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$3;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabListener:Landroid/widget/TabHost$OnTabChangeListener;

    .line 1100
    new-instance v0, Lcom/androie/settings/DataUsageSummary$4;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$4;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 1121
    new-instance v0, Lcom/androie/settings/DataUsageSummary$5;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$5;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitListener:Landroid/view/View$OnClickListener;

    .line 1135
    new-instance v0, Lcom/androie/settings/DataUsageSummary$6;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$6;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictListener:Landroid/view/View$OnClickListener;

    .line 1151
    new-instance v0, Lcom/androie/settings/DataUsageSummary$7;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$7;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsListener:Landroid/view/View$OnClickListener;

    .line 1161
    new-instance v0, Lcom/androie/settings/DataUsageSummary$8;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$8;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mListListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 1175
    new-instance v0, Lcom/androie/settings/DataUsageSummary$9;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$9;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 1274
    new-instance v0, Lcom/androie/settings/DataUsageSummary$10;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$10;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartDataCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    .line 1305
    new-instance v0, Lcom/androie/settings/DataUsageSummary$11;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$11;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mSummaryCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    .line 1362
    new-instance v0, Lcom/androie/settings/DataUsageSummary$12;

    invoke-direct {v0, p0}, Lcom/androie/settings/DataUsageSummary$12;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartListener:Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;

    .line 2224
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/DataUsageSummary;)Landroid/net/INetworkStatsService;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mStatsService:Landroid/net/INetworkStatsService;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateBody()V

    return-void
.end method

.method static synthetic access$1000(Lcom/androie/settings/DataUsageSummary;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Z

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/androie/settings/DataUsageSummary;->setAppRestrictBackground(Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/androie/settings/DataUsageSummary;)Landroid/content/Intent;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/UidDetailProvider;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/widget/ChartDataUsageView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateDetailData()V

    return-void
.end method

.method static synthetic access$1600(Lcom/androie/settings/DataUsageSummary;)Landroid/net/INetworkStatsSession;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mStatsSession:Landroid/net/INetworkStatsSession;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/ChartData;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    return-object v0
.end method

.method static synthetic access$1702(Lcom/androie/settings/DataUsageSummary;Lcom/androie/settings/net/ChartData;)Lcom/androie/settings/net/ChartData;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Lcom/androie/settings/net/ChartData;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/androie/settings/DataUsageSummary;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateAppDetail()V

    return-void
.end method

.method static synthetic access$1900(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/TabHost;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/androie/settings/DataUsageSummary;)Landroid/net/NetworkPolicyManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAdapter:Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/androie/settings/DataUsageSummary;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mEmpty:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/androie/settings/DataUsageSummary;J)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # J

    .prologue
    .line 160
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/DataUsageSummary;->setPolicyWarningBytes(J)V

    return-void
.end method

.method static synthetic access$2502(Lcom/androie/settings/DataUsageSummary;Lcom/androie/settings/DataUsageSummary$AppItem;)Lcom/androie/settings/DataUsageSummary$AppItem;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Lcom/androie/settings/DataUsageSummary$AppItem;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    return-object p1
.end method

.method static synthetic access$2600(Lcom/androie/settings/DataUsageSummary;)Landroid/net/NetworkTemplate;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/androie/settings/DataUsageSummary;)Lcom/androie/settings/net/NetworkPolicyEditor;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/androie/settings/DataUsageSummary;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Z

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/androie/settings/DataUsageSummary;->setDataRoaming(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/androie/settings/DataUsageSummary;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mBinding:Z

    return v0
.end method

.method static synthetic access$400(Lcom/androie/settings/DataUsageSummary;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/DataUsageSummary;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Z

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/androie/settings/DataUsageSummary;->setMobileDataEnabled(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/androie/settings/DataUsageSummary;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # Z

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/androie/settings/DataUsageSummary;->updatePolicy(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$800(Lcom/androie/settings/DataUsageSummary;J)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;
    .param p1, "x1"    # J

    .prologue
    .line 160
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/DataUsageSummary;->setPolicyLimitBytes(J)V

    return-void
.end method

.method static synthetic access$900(Lcom/androie/settings/DataUsageSummary;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/DataUsageSummary;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    return-object v0
.end method

.method private static buildLayoutTransition()Landroid/animation/LayoutTransition;
    .locals 2

    .prologue
    .line 611
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 615
    .local v0, "transition":Landroid/animation/LayoutTransition;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 616
    return-object v0
.end method

.method private buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "titleRes"    # I

    .prologue
    .line 683
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, p1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {p0, p2}, Lcom/androie/settings/DataUsageSummary;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mEmptyTabContent:Landroid/widget/TabHost$TabContentFactory;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    return-object v0
.end method

.method private buildTabSpec(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, p1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mEmptyTabContent:Landroid/widget/TabHost$TabContentFactory;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    return-object v0
.end method

.method private static computeTabFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2203
    const-string v0, "android.net.NETWORK_TEMPLATE"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkTemplate;

    .line 2204
    if-nez v0, :cond_0

    move-object v0, v1

    .line 2216
    :goto_0
    return-object v0

    .line 2206
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkTemplate;->getMatchRule()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    move-object v0, v1

    .line 2216
    goto :goto_0

    .line 2208
    :pswitch_0
    const-string v0, "3g"

    goto :goto_0

    .line 2210
    :pswitch_1
    const-string v0, "4g"

    goto :goto_0

    .line 2212
    :pswitch_2
    const-string v0, "mobile"

    goto :goto_0

    .line 2214
    :pswitch_3
    const-string v0, "wifi"

    goto :goto_0

    .line 2206
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method private ensureLayoutTransitions()V
    .locals 3

    .prologue
    .line 598
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v1}, Lcom/androie/settings/widget/ChartDataUsageView;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 608
    :goto_0
    return-void

    .line 600
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mTabsContainer:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/androie/settings/DataUsageSummary;->buildLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 601
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/androie/settings/DataUsageSummary;->buildLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 602
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitchesContainer:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/androie/settings/DataUsageSummary;->buildLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 604
    invoke-static {}, Lcom/androie/settings/DataUsageSummary;->buildLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v0

    .line 605
    .local v0, "chartTransition":Landroid/animation/LayoutTransition;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    .line 606
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    .line 607
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v1, v0}, Lcom/androie/settings/widget/ChartDataUsageView;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    goto :goto_0
.end method

.method public static formatDateRange(Landroid/content/Context;JJ)Ljava/lang/String;
    .locals 9

    .prologue
    .line 1433
    .line 1435
    sget-object v8, Lcom/androie/settings/DataUsageSummary;->sBuilder:Ljava/lang/StringBuilder;

    monitor-enter v8

    .line 1436
    :try_start_0
    sget-object v0, Lcom/androie/settings/DataUsageSummary;->sBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1437
    sget-object v1, Lcom/androie/settings/DataUsageSummary;->sFormatter:Ljava/util/Formatter;

    const v6, 0x10010

    const/4 v7, 0x0

    move-object v0, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v7}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;Ljava/util/Formatter;JJILjava/lang/String;)Ljava/util/Formatter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v0

    monitor-exit v8

    return-object v0

    .line 1439
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static getActiveSubscriberId(I)Ljava/lang/String;
    .locals 1
    .param p0, "sub"    # I

    .prologue
    .line 1359
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/telephony/MSimTelephonyManager;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 1353
    invoke-static {p0}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 1354
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 1355
    const-string v1, "test.subscriberid"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getAppRestrictBackground()Z
    .locals 3

    .prologue
    .line 976
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    iget v0, v2, Lcom/androie/settings/DataUsageSummary$AppItem;->key:I

    .line 977
    .local v0, "uid":I
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    invoke-virtual {v2, v0}, Landroid/net/NetworkPolicyManager;->getUidPolicy(I)I

    move-result v1

    .line 978
    .local v1, "uidPolicy":I
    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getDataRoaming()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 937
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 939
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v4, "SIM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 941
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "data_roaming"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->multiSimGetCurrentSub()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    .line 945
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 941
    goto :goto_0

    .line 945
    :cond_2
    const-string v3, "data_roaming"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method private getSubTag(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 2479
    if-gtz p1, :cond_0

    .line 2480
    const-string v0, ""

    .line 2482
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SIM"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getSubTitle(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 2488
    if-gtz p1, :cond_0

    .line 2489
    const-string v0, ""

    .line 2491
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f08033e

    invoke-virtual {p0, v1}, Lcom/androie/settings/DataUsageSummary;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static hasReadyMobile4gRadio(Landroid/content/Context;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 2299
    const/4 v0, 0x0

    return v0
.end method

.method public static hasReadyMobileRadio(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 2288
    invoke-static {p0}, Landroid/net/ConnectivityManager;->from(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v0

    .line 2291
    .local v0, "conn":Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {p0}, Lcom/androie/settings/DataUsageSummary;->hasSubscription(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private static hasSubscription(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 2358
    invoke-static {p0}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2359
    .local v0, "tele":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static hasWifiRadio(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 2322
    invoke-static {p0}, Landroid/net/ConnectivityManager;->from(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v0

    .line 2323
    .local v0, "conn":Landroid/net/ConnectivityManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v1

    return v1
.end method

.method private static inflateAppTitle(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Ljava/lang/CharSequence;)Landroid/view/View;
    .locals 2

    .prologue
    .line 2376
    const v0, 0x7f04002e

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 2378
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2379
    return-object v0
.end method

.method private static inflatePreference(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 2367
    const v0, 0x7f04007e

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 2368
    const v0, 0x1020018

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 2370
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2371
    return-object v1
.end method

.method private static insetListViewDrawables(Landroid/widget/ListView;I)V
    .locals 4
    .param p0, "view"    # Landroid/widget/ListView;
    .param p1, "insetSide"    # I

    .prologue
    .line 2444
    invoke-virtual {p0}, Landroid/widget/ListView;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 2445
    .local v1, "selector":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/widget/ListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2449
    .local v0, "divider":Landroid/graphics/drawable/Drawable;
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 2450
    .local v2, "stub":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 2451
    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 2453
    new-instance v3, Lcom/androie/settings/drawable/InsetBoundsDrawable;

    invoke-direct {v3, v1, p1}, Lcom/androie/settings/drawable/InsetBoundsDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0, v3}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 2454
    new-instance v3, Lcom/androie/settings/drawable/InsetBoundsDrawable;

    invoke-direct {v3, v0, p1}, Lcom/androie/settings/drawable/InsetBoundsDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 2455
    return-void
.end method

.method private isAppDetailMode()Z
    .locals 1

    .prologue
    .line 788
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isBandwidthControlEnabled()Z
    .locals 4

    .prologue
    .line 929
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkService:Landroid/os/INetworkManagementService;

    invoke-interface {v0}, Landroid/os/INetworkManagementService;->isBandwidthControlEnabled()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 932
    :goto_0
    return v0

    .line 930
    :catch_0
    move-exception v0

    .line 931
    const-string v1, "DataUsage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "problem talking with INetworkManagementService: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 932
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMobileDataEnabled()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 888
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v2, "SIM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 890
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mobile_data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->multiSimGetCurrentSub()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 898
    :cond_0
    :goto_0
    return v0

    .line 894
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mMobileDataEnabled:Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 896
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mMobileDataEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    .line 898
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v0

    goto :goto_0
.end method

.method private isMobilePolicySplit()Z
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1334
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1335
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1336
    invoke-static {v0}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 1337
    .local v1, "tele":Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/androie/settings/net/NetworkPolicyEditor;->isMobilePolicySplit(Ljava/lang/String;)Z

    move-result v2

    .line 1339
    .end local v1    # "tele":Landroid/telephony/TelephonyManager;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isNetworkPolicyModifiable(Landroid/net/NetworkPolicy;)Z
    .locals 1
    .param p1, "policy"    # Landroid/net/NetworkPolicy;

    .prologue
    .line 923
    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isBandwidthControlEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabled:Landroid/widget/Switch;

    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private multiSimGetCurrentSub()I
    .locals 3

    .prologue
    .line 2498
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2500
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    invoke-direct {p0, v2}, Lcom/androie/settings/DataUsageSummary;->getSubTag(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2506
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 2499
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2506
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private setAppRestrictBackground(Z)V
    .locals 3
    .param p1, "restrictBackground"    # Z

    .prologue
    .line 983
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    iget v0, v1, Lcom/androie/settings/DataUsageSummary$AppItem;->key:I

    .line 984
    .local v0, "uid":I
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v0, v1}, Landroid/net/NetworkPolicyManager;->setUidPolicy(II)V

    .line 986
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 987
    return-void

    .line 984
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setDataRoaming(Z)V
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 951
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 953
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v4, "SIM"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 954
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->multiSimGetCurrentSub()I

    move-result v4

    .line 957
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "data_roaming"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    if-eqz p1, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v3, v5, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 960
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->getPreferredDataSubscription()I

    move-result v0

    if-ne v4, v0, :cond_0

    .line 961
    const-string v0, "data_roaming"

    if-eqz p1, :cond_2

    :goto_1
    invoke-static {v3, v0, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 967
    :cond_0
    :goto_2
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mMenuDataRoaming:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 968
    return-void

    :cond_1
    move v0, v2

    .line 957
    goto :goto_0

    :cond_2
    move v1, v2

    .line 961
    goto :goto_1

    .line 964
    :cond_3
    const-string v0, "data_roaming"

    if-eqz p1, :cond_4

    :goto_3
    invoke-static {v3, v0, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_2

    :cond_4
    move v1, v2

    goto :goto_3
.end method

.method private setMobileDataEnabled(Z)V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 904
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 905
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->multiSimGetCurrentSub()I

    move-result v2

    .line 908
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mobile_data"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v3, v4, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 912
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->getPreferredDataSubscription()I

    move-result v0

    if-ne v2, v0, :cond_0

    .line 913
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 919
    :cond_0
    :goto_1
    invoke-direct {p0, v1}, Lcom/androie/settings/DataUsageSummary;->updatePolicy(Z)V

    .line 920
    return-void

    :cond_1
    move v0, v1

    .line 908
    goto :goto_0

    .line 916
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 917
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mMobileDataEnabled:Ljava/lang/Boolean;

    goto :goto_1
.end method

.method private setMobilePolicySplit(Z)V
    .locals 4
    .param p1, "split"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1345
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1346
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1347
    invoke-static {v0}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 1348
    .local v1, "tele":Landroid/telephony/TelephonyManager;
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Lcom/androie/settings/net/NetworkPolicyEditor;->setMobilePolicySplit(Ljava/lang/String;Z)V

    .line 1350
    .end local v1    # "tele":Landroid/telephony/TelephonyManager;
    :cond_0
    return-void
.end method

.method private setPolicyLimitBytes(J)V
    .locals 2
    .param p1, "limitBytes"    # J

    .prologue
    .line 877
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    invoke-virtual {v0, v1, p1, p2}, Lcom/androie/settings/net/NetworkPolicyEditor;->setPolicyLimitBytes(Landroid/net/NetworkTemplate;J)V

    .line 878
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/androie/settings/DataUsageSummary;->updatePolicy(Z)V

    .line 879
    return-void
.end method

.method private setPolicyWarningBytes(J)V
    .locals 2
    .param p1, "warningBytes"    # J

    .prologue
    .line 871
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    invoke-virtual {v0, v1, p1, p2}, Lcom/androie/settings/net/NetworkPolicyEditor;->setPolicyWarningBytes(Landroid/net/NetworkTemplate;J)V

    .line 872
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/androie/settings/DataUsageSummary;->updatePolicy(Z)V

    .line 873
    return-void
.end method

.method private static setPreferenceSummary(Landroid/view/View;Ljava/lang/CharSequence;)V
    .locals 2

    .prologue
    .line 2471
    const v0, 0x1020010

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 2472
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2473
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2474
    return-void
.end method

.method private static setPreferenceTitle(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 2462
    const v0, 0x1020016

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 2463
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 2464
    return-void
.end method

.method private updateAppDetail()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0x8

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 796
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 797
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 798
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    .line 800
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 801
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 802
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v2, v1}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->setChangeVisible(Z)V

    .line 813
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v2, v13}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkPolicy(Landroid/net/NetworkPolicy;)V

    .line 816
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    iget v6, v2, Lcom/androie/settings/DataUsageSummary$AppItem;->key:I

    .line 817
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    invoke-virtual {v2, v6, v0}, Lcom/androie/settings/net/UidDetailProvider;->getUidDetail(IZ)Lcom/androie/settings/net/UidDetail;

    move-result-object v2

    .line 818
    iget-object v7, p0, Lcom/androie/settings/DataUsageSummary;->mAppIcon:Landroid/widget/ImageView;

    iget-object v8, v2, Lcom/androie/settings/net/UidDetail;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 820
    iget-object v7, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 821
    iget-object v7, v2, Lcom/androie/settings/net/UidDetail;->detailLabels:[Ljava/lang/CharSequence;

    if-eqz v7, :cond_1

    .line 822
    iget-object v7, v2, Lcom/androie/settings/net/UidDetail;->detailLabels:[Ljava/lang/CharSequence;

    array-length v8, v7

    move v2, v1

    :goto_0
    if-ge v2, v8, :cond_2

    aget-object v9, v7, v2

    .line 823
    iget-object v10, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    invoke-static {v5, v11, v9}, Lcom/androie/settings/DataUsageSummary;->inflateAppTitle(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 822
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 804
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    invoke-virtual {v1, v12}, Landroid/view/View;->setVisibility(I)V

    .line 805
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v1, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->setChangeVisible(Z)V

    .line 808
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v0, v13}, Lcom/androie/settings/widget/ChartDataUsageView;->bindDetailNetworkStats(Landroid/net/NetworkStatsHistory;)V

    .line 867
    :goto_1
    return-void

    .line 826
    :cond_1
    iget-object v7, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    iget-object v8, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    iget-object v2, v2, Lcom/androie/settings/net/UidDetail;->label:Ljava/lang/CharSequence;

    invoke-static {v5, v8, v2}, Lcom/androie/settings/DataUsageSummary;->inflateAppTitle(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 830
    :cond_2
    invoke-virtual {v4, v6}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v5

    .line 831
    if-eqz v5, :cond_4

    array-length v2, v5

    if-lez v2, :cond_4

    .line 832
    new-instance v2, Landroid/content/Intent;

    const-string v7, "android.intent.action.MANAGE_NETWORK_USAGE"

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    .line 833
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    const-string v7, "android.intent.category.DEFAULT"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 837
    array-length v7, v5

    move v2, v1

    :goto_2
    if-ge v2, v7, :cond_6

    aget-object v8, v5, v2

    .line 838
    iget-object v9, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    invoke-virtual {v9, v8}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 839
    iget-object v8, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    invoke-virtual {v4, v8, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 845
    :goto_3
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettings:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 846
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettings:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 853
    :goto_4
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateDetailData()V

    .line 855
    invoke-static {v6}, Landroid/os/UserHandle;->isApp(I)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    invoke-virtual {v0}, Landroid/net/NetworkPolicyManager;->getRestrictBackground()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isBandwidthControlEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 857
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    const v2, 0x7f0809d9

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 858
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    const v2, 0x7f0809da

    invoke-virtual {p0, v2}, Lcom/androie/settings/DataUsageSummary;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceSummary(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 861
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 862
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->getAppRestrictBackground()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto/16 :goto_1

    .line 837
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 849
    :cond_4
    iput-object v13, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsIntent:Landroid/content/Intent;

    .line 850
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettings:Landroid/widget/Button;

    invoke-virtual {v0, v12}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_4

    .line 865
    :cond_5
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1

    :cond_6
    move v0, v1

    goto :goto_3
.end method

.method private updateBody()V
    .locals 8

    .prologue
    const v7, 0x7f0809d5

    const v6, 0x7f0809ca

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v2, 0x8

    .line 706
    iput-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mBinding:Z

    .line 707
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->isAdded()Z

    move-result v3

    if-nez v3, :cond_0

    .line 785
    :goto_0
    return-void

    .line 709
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 710
    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v4}, Landroid/widget/TabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v4

    .line 711
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v5

    if-nez v5, :cond_1

    .line 713
    :goto_1
    if-nez v4, :cond_2

    .line 714
    const-string v0, "DataUsage"

    const-string v1, "no tab selected; hiding body"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    move v0, v1

    .line 711
    goto :goto_1

    .line 718
    :cond_2
    iget-object v5, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 721
    iget-object v5, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 722
    :cond_3
    iput-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    .line 726
    iget-object v5, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    if-eqz v0, :cond_5

    move v0, v1

    :goto_2
    invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V

    .line 729
    invoke-static {v3}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    .line 731
    const-string v0, "mobile"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 732
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    invoke-static {v0, v7}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 733
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-static {v0, v6}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 734
    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/NetworkTemplate;->buildTemplateMobileAll(Ljava/lang/String;)Landroid/net/NetworkTemplate;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    .line 778
    :cond_4
    :goto_3
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    invoke-static {v3, v4}, Lcom/androie/settings/net/ChartDataLoader;->buildArgs(Landroid/net/NetworkTemplate;Lcom/androie/settings/DataUsageSummary$AppItem;)Landroid/os/Bundle;

    move-result-object v3

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mChartDataCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 782
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 784
    iput-boolean v1, p0, Lcom/androie/settings/DataUsageSummary;->mBinding:Z

    goto :goto_0

    :cond_5
    move v0, v2

    .line 726
    goto :goto_2

    .line 736
    :cond_6
    const-string v0, "SIM"

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v1

    .line 737
    :goto_4
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 739
    add-int/lit8 v2, v0, 0x1

    invoke-direct {p0, v2}, Lcom/androie/settings/DataUsageSummary;->getSubTag(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 740
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    invoke-static {v2, v7}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 742
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-static {v2, v6}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 744
    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/NetworkTemplate;->buildTemplateMobileAll(Ljava/lang/String;)Landroid/net/NetworkTemplate;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    .line 738
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 747
    :cond_8
    const-string v0, "3g"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 748
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    const v2, 0x7f0809d6

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 749
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    const v2, 0x7f0809cc

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 751
    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/NetworkTemplate;->buildTemplateMobile3gLower(Ljava/lang/String;)Landroid/net/NetworkTemplate;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    goto :goto_3

    .line 753
    :cond_9
    const-string v0, "4g"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 754
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    const v2, 0x7f0809d7

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 755
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    const v2, 0x7f0809cb

    invoke-static {v0, v2}, Lcom/androie/settings/DataUsageSummary;->setPreferenceTitle(Landroid/view/View;I)V

    .line 757
    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->getActiveSubscriberId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/NetworkTemplate;->buildTemplateMobile4g(Ljava/lang/String;)Landroid/net/NetworkTemplate;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    goto/16 :goto_3

    .line 759
    :cond_a
    const-string v0, "wifi"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 761
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 762
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 763
    invoke-static {}, Landroid/net/NetworkTemplate;->buildTemplateWifiWildcard()Landroid/net/NetworkTemplate;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    goto/16 :goto_3

    .line 765
    :cond_b
    const-string v0, "ethernet"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 767
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 768
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 769
    invoke-static {}, Landroid/net/NetworkTemplate;->buildTemplateEthernet()Landroid/net/NetworkTemplate;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    goto/16 :goto_3

    .line 772
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown tab: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private updateCycleList(Landroid/net/NetworkPolicy;)V
    .locals 14

    .prologue
    const-wide v9, 0x7fffffffffffffffL

    const-wide/high16 v4, -0x8000000000000000L

    const/4 v11, 0x0

    .line 1034
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/androie/settings/DataUsageSummary$CycleItem;

    .line 1035
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->clear()V

    .line 1037
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1041
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    if-eqz v0, :cond_8

    .line 1042
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->network:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0}, Landroid/net/NetworkStatsHistory;->getStart()J

    move-result-wide v7

    .line 1043
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->network:Landroid/net/NetworkStatsHistory;

    invoke-virtual {v0}, Landroid/net/NetworkStatsHistory;->getEnd()J

    move-result-wide v2

    .line 1046
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 1047
    cmp-long v0, v7, v9

    if-nez v0, :cond_7

    move-wide v9, v12

    .line 1048
    :goto_1
    cmp-long v0, v2, v4

    if-nez v0, :cond_6

    const-wide/16 v2, 0x1

    add-long v7, v12, v2

    .line 1051
    :goto_2
    if-eqz p1, :cond_5

    .line 1053
    invoke-static {v7, v8, p1}, Landroid/net/NetworkPolicyManager;->computeNextCycleBoundary(JLandroid/net/NetworkPolicy;)J

    move-result-wide v4

    move v0, v11

    .line 1056
    :goto_3
    cmp-long v2, v4, v9

    if-lez v2, :cond_0

    .line 1057
    invoke-static {v4, v5, p1}, Landroid/net/NetworkPolicyManager;->computeLastCycleBoundary(JLandroid/net/NetworkPolicy;)J

    move-result-wide v2

    .line 1058
    const-string v0, "DataUsage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "generating cs="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " to ce="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " waiting for hs="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1060
    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    new-instance v0, Lcom/androie/settings/DataUsageSummary$CycleItem;

    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/DataUsageSummary$CycleItem;-><init>(Landroid/content/Context;JJ)V

    invoke-virtual {v12, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->add(Ljava/lang/Object;)V

    .line 1062
    const/4 v0, 0x1

    move-wide v4, v2

    .line 1063
    goto :goto_3

    .line 1066
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-direct {p0, p1}, Lcom/androie/settings/DataUsageSummary;->isNetworkPolicyModifiable(Landroid/net/NetworkPolicy;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->setChangePossible(Z)V

    .line 1069
    :goto_4
    if-nez v0, :cond_2

    move-wide v4, v7

    .line 1072
    :goto_5
    cmp-long v0, v4, v9

    if-lez v0, :cond_1

    .line 1073
    const-wide v2, 0x90321000L

    sub-long v2, v4, v2

    .line 1074
    iget-object v7, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    new-instance v0, Lcom/androie/settings/DataUsageSummary$CycleItem;

    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/DataUsageSummary$CycleItem;-><init>(Landroid/content/Context;JJ)V

    invoke-virtual {v7, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->add(Ljava/lang/Object;)V

    move-wide v4, v2

    .line 1076
    goto :goto_5

    .line 1078
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v0, v11}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->setChangePossible(Z)V

    .line 1082
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_4

    .line 1083
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v0, v6}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->findNearestPosition(Lcom/androie/settings/DataUsageSummary$CycleItem;)I

    move-result v3

    .line 1084
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1088
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v0, v3}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/DataUsageSummary$CycleItem;

    .line 1089
    invoke-static {v0, v6}, Llibcore/util/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1090
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCycleListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    const/4 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 1098
    :goto_6
    return-void

    .line 1093
    :cond_3
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateDetailData()V

    goto :goto_6

    .line 1096
    :cond_4
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateDetailData()V

    goto :goto_6

    :cond_5
    move v0, v11

    goto :goto_4

    :cond_6
    move-wide v7, v2

    goto/16 :goto_2

    :cond_7
    move-wide v9, v7

    goto/16 :goto_1

    :cond_8
    move-wide v2, v4

    move-wide v7, v9

    goto/16 :goto_0
.end method

.method private updateDetailData()V
    .locals 15

    .prologue
    .line 1216
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v0}, Lcom/androie/settings/widget/ChartDataUsageView;->getInspectStart()J

    move-result-wide v1

    .line 1217
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v0}, Lcom/androie/settings/widget/ChartDataUsageView;->getInspectEnd()J

    move-result-wide v3

    .line 1218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 1220
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v8

    .line 1222
    const/4 v7, 0x0

    .line 1223
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    if-eqz v0, :cond_1

    .line 1225
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->detailDefault:Landroid/net/NetworkStatsHistory;

    invoke-virtual/range {v0 .. v7}, Landroid/net/NetworkStatsHistory;->getValues(JJJLandroid/net/NetworkStatsHistory$Entry;)Landroid/net/NetworkStatsHistory$Entry;

    move-result-object v7

    .line 1226
    iget-wide v9, v7, Landroid/net/NetworkStatsHistory$Entry;->rxBytes:J

    iget-wide v11, v7, Landroid/net/NetworkStatsHistory$Entry;->txBytes:J

    add-long/2addr v9, v11

    .line 1227
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->detailForeground:Landroid/net/NetworkStatsHistory;

    invoke-virtual/range {v0 .. v7}, Landroid/net/NetworkStatsHistory;->getValues(JJJLandroid/net/NetworkStatsHistory$Entry;)Landroid/net/NetworkStatsHistory$Entry;

    move-result-object v0

    .line 1228
    iget-wide v11, v0, Landroid/net/NetworkStatsHistory$Entry;->rxBytes:J

    iget-wide v13, v0, Landroid/net/NetworkStatsHistory$Entry;->txBytes:J

    add-long/2addr v11, v13

    .line 1230
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    const/16 v7, 0xaf

    invoke-virtual {v0, v7}, Lcom/androie/settings/widget/PieChartView;->setOriginAngle(I)V

    .line 1232
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    invoke-virtual {v0}, Lcom/androie/settings/widget/PieChartView;->removeAllSlices()V

    .line 1233
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    const-string v7, "#d88d3a"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v11, v12, v7}, Lcom/androie/settings/widget/PieChartView;->addSlice(JI)V

    .line 1234
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    const-string v7, "#666666"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v9, v10, v7}, Lcom/androie/settings/widget/PieChartView;->addSlice(JI)V

    .line 1236
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    invoke-virtual {v0}, Lcom/androie/settings/widget/PieChartView;->generatePath()V

    .line 1238
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppBackground:Landroid/widget/TextView;

    invoke-static {v8, v9, v10}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1239
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mAppForeground:Landroid/widget/TextView;

    invoke-static {v8, v11, v12}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1242
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->detail:Landroid/net/NetworkStatsHistory;

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/net/NetworkStatsHistory;->getValues(JJJLandroid/net/NetworkStatsHistory$Entry;)Landroid/net/NetworkStatsHistory$Entry;

    move-result-object v7

    .line 1244
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v5, 0x3

    invoke-virtual {v0, v5}, Landroid/app/LoaderManager;->destroyLoader(I)V

    .line 1256
    :goto_0
    if-eqz v7, :cond_3

    iget-wide v5, v7, Landroid/net/NetworkStatsHistory$Entry;->rxBytes:J

    iget-wide v9, v7, Landroid/net/NetworkStatsHistory$Entry;->txBytes:J

    add-long/2addr v5, v9

    .line 1257
    :goto_1
    invoke-static {v8, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    .line 1258
    invoke-static {v8, v1, v2, v3, v4}, Lcom/androie/settings/DataUsageSummary;->formatDateRange(Landroid/content/Context;JJ)Ljava/lang/String;

    move-result-object v1

    .line 1261
    const-string v0, "mobile"

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "3g"

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "4g"

    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentApp:Lcom/androie/settings/DataUsageSummary$AppItem;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1263
    :cond_0
    const v0, 0x7f0809f3

    .line 1268
    :goto_2
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mUsageSummary:Landroid/widget/TextView;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {p0, v0, v3}, Lcom/androie/settings/DataUsageSummary;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1271
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->ensureLayoutTransitions()V

    .line 1272
    return-void

    .line 1247
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    if-eqz v0, :cond_2

    .line 1248
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mChartData:Lcom/androie/settings/net/ChartData;

    iget-object v0, v0, Lcom/androie/settings/net/ChartData;->network:Landroid/net/NetworkStatsHistory;

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/net/NetworkStatsHistory;->getValues(JJJLandroid/net/NetworkStatsHistory$Entry;)Landroid/net/NetworkStatsHistory$Entry;

    move-result-object v7

    .line 1252
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v5, 0x3

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    invoke-static {v6, v1, v2, v3, v4}, Lcom/androie/settings/net/SummaryForAllUidLoader;->buildArgs(Landroid/net/NetworkTemplate;JJ)Landroid/os/Bundle;

    move-result-object v6

    iget-object v9, p0, Lcom/androie/settings/DataUsageSummary;->mSummaryCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v5, v6, v9}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    .line 1256
    :cond_3
    const-wide/16 v5, 0x0

    goto :goto_1

    .line 1265
    :cond_4
    const v0, 0x7f0809f2

    goto :goto_2
.end method

.method private updatePolicy(Z)V
    .locals 8
    .param p1, "refreshCycle"    # Z

    .prologue
    const/16 v5, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 994
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 995
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1001
    :goto_0
    const-string v3, "mobile"

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v4, "SIM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1002
    :cond_0
    iput-boolean v1, p0, Lcom/androie/settings/DataUsageSummary;->mBinding:Z

    .line 1003
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabled:Landroid/widget/Switch;

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isMobileDataEnabled()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Switch;->setChecked(Z)V

    .line 1004
    iput-boolean v2, p0, Lcom/androie/settings/DataUsageSummary;->mBinding:Z

    .line 1007
    :cond_1
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mTemplate:Landroid/net/NetworkTemplate;

    invoke-virtual {v3, v4}, Lcom/androie/settings/net/NetworkPolicyEditor;->getPolicy(Landroid/net/NetworkTemplate;)Landroid/net/NetworkPolicy;

    move-result-object v0

    .line 1008
    .local v0, "policy":Landroid/net/NetworkPolicy;
    invoke-direct {p0, v0}, Lcom/androie/settings/DataUsageSummary;->isNetworkPolicyModifiable(Landroid/net/NetworkPolicy;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1009
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1010
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    if-eqz v0, :cond_5

    iget-wide v4, v0, Landroid/net/NetworkPolicy;->limitBytes:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_5

    :goto_1
    invoke-virtual {v3, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1011
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1012
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v1, v0}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkPolicy(Landroid/net/NetworkPolicy;)V

    .line 1021
    :cond_2
    :goto_2
    if-eqz p1, :cond_3

    .line 1023
    invoke-direct {p0, v0}, Lcom/androie/settings/DataUsageSummary;->updateCycleList(Landroid/net/NetworkPolicy;)V

    .line 1025
    :cond_3
    return-void

    .line 997
    .end local v0    # "policy":Landroid/net/NetworkPolicy;
    :cond_4
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .restart local v0    # "policy":Landroid/net/NetworkPolicy;
    :cond_5
    move v1, v2

    .line 1010
    goto :goto_1

    .line 1017
    :cond_6
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1018
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkPolicy(Landroid/net/NetworkPolicy;)V

    goto :goto_2
.end method

.method private updateTabs()V
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 625
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 626
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->clearAllTabs()V

    .line 628
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isMobilePolicySplit()Z

    move-result v0

    .line 629
    if-eqz v0, :cond_4

    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobile4gRadio(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 630
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    const-string v4, "3g"

    const v5, 0x7f0809d2

    invoke-direct {p0, v4, v5}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 631
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    const-string v4, "4g"

    const v5, 0x7f0809d1

    invoke-direct {p0, v4, v5}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 643
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    if-eqz v0, :cond_1

    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->hasWifiRadio(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 644
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    const-string v4, "wifi"

    const v5, 0x7f0809ce

    invoke-direct {p0, v4, v5}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 646
    :cond_1
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0, v3}, Lcom/androie/settings/DataUsageSummary;->hasEthernet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 647
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    const-string v3, "ethernet"

    const v4, 0x7f0809cf

    invoke-direct {p0, v3, v4}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 650
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabWidget:Landroid/widget/TabWidget;

    invoke-virtual {v0}, Landroid/widget/TabWidget;->getTabCount()I

    move-result v0

    if-nez v0, :cond_6

    move v0, v1

    .line 651
    :goto_1
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabWidget:Landroid/widget/TabWidget;

    invoke-virtual {v3}, Landroid/widget/TabWidget;->getTabCount()I

    move-result v3

    if-le v3, v1, :cond_7

    .line 652
    :goto_2
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabWidget:Landroid/widget/TabWidget;

    if-eqz v1, :cond_8

    :goto_3
    invoke-virtual {v3, v2}, Landroid/widget/TabWidget;->setVisibility(I)V

    .line 653
    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 654
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1}, Landroid/widget/TabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Llibcore/util/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 656
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateBody()V

    .line 660
    :goto_4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    .line 667
    :cond_3
    :goto_5
    return-void

    .line 632
    :cond_4
    invoke-static {v3}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 633
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v4

    .line 634
    if-le v4, v1, :cond_5

    move v0, v2

    .line 635
    :goto_6
    if-ge v0, v4, :cond_0

    .line 636
    iget-object v5, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    add-int/lit8 v6, v0, 0x1

    invoke-direct {p0, v6}, Lcom/androie/settings/DataUsageSummary;->getSubTag(I)Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v7, v0, 0x1

    invoke-direct {p0, v7}, Lcom/androie/settings/DataUsageSummary;->getSubTitle(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 635
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 639
    :cond_5
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    const-string v4, "mobile"

    const v5, 0x7f0809d0

    invoke-direct {p0, v4, v5}, Lcom/androie/settings/DataUsageSummary;->buildTabSpec(Ljava/lang/String;I)Landroid/widget/TabHost$TabSpec;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    goto/16 :goto_0

    :cond_6
    move v0, v2

    .line 650
    goto :goto_1

    :cond_7
    move v1, v2

    .line 651
    goto :goto_2

    .line 652
    :cond_8
    const/16 v2, 0x8

    goto :goto_3

    .line 658
    :cond_9
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    iget-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    goto :goto_4

    .line 661
    :cond_a
    if-eqz v0, :cond_3

    .line 663
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateBody()V

    goto :goto_5
.end method


# virtual methods
.method public hasEthernet(Landroid/content/Context;)Z
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 2334
    invoke-static {p1}, Landroid/net/ConnectivityManager;->from(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v6

    .line 2335
    .local v6, "conn":Landroid/net/ConnectivityManager;
    const/16 v0, 0x9

    invoke-virtual {v6, v0}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v10

    .line 2338
    .local v10, "hasEthernet":Z
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mStatsSession:Landroid/net/INetworkStatsSession;

    if-eqz v0, :cond_0

    .line 2340
    :try_start_0
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mStatsSession:Landroid/net/INetworkStatsSession;

    invoke-static {}, Landroid/net/NetworkTemplate;->buildTemplateEthernet()Landroid/net/NetworkTemplate;

    move-result-object v1

    const-wide/high16 v2, -0x8000000000000000L

    const-wide v4, 0x7fffffffffffffffL

    invoke-interface/range {v0 .. v5}, Landroid/net/INetworkStatsSession;->getSummaryForNetwork(Landroid/net/NetworkTemplate;JJ)Landroid/net/NetworkStats;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkStats;->getTotalBytes()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    .line 2351
    .local v8, "ethernetBytes":J
    :goto_0
    if-eqz v10, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    .line 2343
    .end local v8    # "ethernetBytes":J
    :catch_0
    move-exception v7

    .line 2344
    .local v7, "e":Landroid/os/RemoteException;
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 2347
    .end local v7    # "e":Landroid/os/RemoteException;
    :cond_0
    const-wide/16 v8, 0x0

    .restart local v8    # "ethernetBytes":J
    goto :goto_0

    .line 2351
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 271
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 272
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 274
    .local v0, "context":Landroid/content/Context;
    const-string v2, "network_management"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkService:Landroid/os/INetworkManagementService;

    .line 276
    const-string v2, "netstats"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/net/INetworkStatsService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/net/INetworkStatsService;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mStatsService:Landroid/net/INetworkStatsService;

    .line 278
    invoke-static {v0}, Landroid/net/NetworkPolicyManager;->from(Landroid/content/Context;)Landroid/net/NetworkPolicyManager;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    .line 279
    invoke-static {v0}, Landroid/net/ConnectivityManager;->from(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mConnService:Landroid/net/ConnectivityManager;

    .line 281
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "data_usage"

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPrefs:Landroid/content/SharedPreferences;

    .line 283
    new-instance v2, Lcom/androie/settings/net/NetworkPolicyEditor;

    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    invoke-direct {v2, v3}, Lcom/androie/settings/net/NetworkPolicyEditor;-><init>(Landroid/net/NetworkPolicyManager;)V

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    .line 284
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyEditor:Lcom/androie/settings/net/NetworkPolicyEditor;

    invoke-virtual {v2}, Lcom/androie/settings/net/NetworkPolicyEditor;->read()V

    .line 287
    :try_start_0
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mStatsService:Landroid/net/INetworkStatsService;

    invoke-interface {v2}, Landroid/net/INetworkStatsService;->openSession()Landroid/net/INetworkStatsSession;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mStatsSession:Landroid/net/INetworkStatsSession;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "show_wifi"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    .line 293
    iget-object v2, p0, Lcom/androie/settings/DataUsageSummary;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "show_ethernet"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    .line 296
    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 297
    iput-boolean v5, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    .line 298
    iput-boolean v5, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    .line 301
    :cond_0
    invoke-virtual {p0, v5}, Lcom/androie/settings/DataUsageSummary;->setHasOptionsMenu(Z)V

    .line 302
    return-void

    .line 288
    :catch_0
    move-exception v1

    .line 289
    .local v1, "e":Landroid/os/RemoteException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 450
    const v0, 0x7f100004

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 451
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 308
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 309
    .local v0, "context":Landroid/content/Context;
    const v3, 0x7f040036

    invoke-virtual {p1, v3, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 311
    .local v2, "view":Landroid/view/View;
    new-instance v3, Lcom/androie/settings/net/UidDetailProvider;

    invoke-direct {v3, v0}, Lcom/androie/settings/net/UidDetailProvider;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    .line 313
    const v3, 0x1020012

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TabHost;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    .line 314
    const v3, 0x7f0c0079

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabsContainer:Landroid/view/ViewGroup;

    .line 315
    const v3, 0x1020013

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TabWidget;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabWidget:Landroid/widget/TabWidget;

    .line 316
    const v3, 0x102000a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    .line 320
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getScrollBarStyle()I

    move-result v3

    const/high16 v6, 0x2000000

    if-ne v3, v6, :cond_1

    move v1, v4

    .line 322
    .local v1, "shouldInset":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 323
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v6, 0x1050029

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    iput v3, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    .line 330
    :goto_1
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-static {p2, v2, v3, v4}, Lcom/androie/settings/Utils;->prepareCustomPreferencesList(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Z)V

    .line 332
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v3}, Landroid/widget/TabHost;->setup()V

    .line 333
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mTabHost:Landroid/widget/TabHost;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mTabListener:Landroid/widget/TabHost$OnTabChangeListener;

    invoke-virtual {v3, v6}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 335
    const v3, 0x7f040034

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-virtual {p1, v3, v6, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    .line 336
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 338
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    new-instance v6, Landroid/view/View;

    invoke-direct {v6, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v6, v8, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 339
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    invoke-virtual {v3, v6, v8, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 340
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 342
    iget v3, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    if-lez v3, :cond_0

    .line 344
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    iget v6, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    invoke-static {v3, v6}, Lcom/androie/settings/DataUsageSummary;->insetListViewDrawables(Landroid/widget/ListView;I)V

    .line 345
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    iget v6, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    iget v7, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    invoke-virtual {v3, v6, v5, v7, v5}, Landroid/view/ViewGroup;->setPaddingRelative(IIII)V

    .line 350
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v6, 0x7f0c0076

    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitchesContainer:Landroid/view/ViewGroup;

    .line 352
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v6, 0x7f0c0077

    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    .line 354
    new-instance v3, Landroid/widget/Switch;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabled:Landroid/widget/Switch;

    .line 355
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabled:Landroid/widget/Switch;

    invoke-static {p1, v3, v6}, Lcom/androie/settings/DataUsageSummary;->inflatePreference(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    .line 356
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabled:Landroid/widget/Switch;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v3, v6}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 357
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 359
    new-instance v3, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    .line 360
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 361
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 362
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimit:Landroid/widget/CheckBox;

    invoke-static {p1, v3, v6}, Lcom/androie/settings/DataUsageSummary;->inflatePreference(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    .line 363
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setClickable(Z)V

    .line 364
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 365
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 366
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mNetworkSwitches:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 370
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v6, 0x7f0c006d

    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleView:Landroid/view/View;

    .line 371
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleView:Landroid/view/View;

    const v6, 0x7f0c006e

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    .line 372
    new-instance v3, Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-direct {v3, v0}, Lcom/androie/settings/DataUsageSummary$CycleAdapter;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    .line 373
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mCycleAdapter:Lcom/androie/settings/DataUsageSummary$CycleAdapter;

    invoke-virtual {v3, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 374
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mCycleSpinner:Landroid/widget/Spinner;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mCycleListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v3, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 376
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v6, 0x7f0c0064

    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/widget/ChartDataUsageView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    .line 377
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mChartListener:Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;

    invoke-virtual {v3, v6}, Lcom/androie/settings/widget/ChartDataUsageView;->setListener(Lcom/androie/settings/widget/ChartDataUsageView$DataUsageChartListener;)V

    .line 378
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mChart:Lcom/androie/settings/widget/ChartDataUsageView;

    invoke-virtual {v3, v8}, Lcom/androie/settings/widget/ChartDataUsageView;->bindNetworkPolicy(Landroid/net/NetworkPolicy;)V

    .line 382
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v6, 0x7f0c006f

    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    .line 383
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0016

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppIcon:Landroid/widget/ImageView;

    .line 384
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0070

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppTitles:Landroid/view/ViewGroup;

    .line 385
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0073

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/widget/PieChartView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppPieChart:Lcom/androie/settings/widget/PieChartView;

    .line 386
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0071

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppForeground:Landroid/widget/TextView;

    .line 387
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0072

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppBackground:Landroid/widget/TextView;

    .line 388
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0075

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppSwitches:Landroid/widget/LinearLayout;

    .line 390
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppDetail:Landroid/view/View;

    const v6, 0x7f0c0074

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettings:Landroid/widget/Button;

    .line 391
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettings:Landroid/widget/Button;

    iget-object v6, p0, Lcom/androie/settings/DataUsageSummary;->mAppSettingsListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    new-instance v3, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    .line 394
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 395
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 396
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppSwitches:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrict:Landroid/widget/CheckBox;

    invoke-static {p1, v3, v5}, Lcom/androie/settings/DataUsageSummary;->inflatePreference(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    .line 397
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setClickable(Z)V

    .line 398
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setFocusable(Z)V

    .line 399
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 400
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAppSwitches:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mAppRestrictView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 403
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v4, 0x7f0c0078

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mUsageSummary:Landroid/widget/TextView;

    .line 404
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mHeader:Landroid/view/ViewGroup;

    const v4, 0x1020004

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mEmpty:Landroid/widget/TextView;

    .line 406
    new-instance v3, Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    iget v5, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    invoke-direct {v3, v4, v5}, Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;-><init>(Lcom/androie/settings/net/UidDetailProvider;I)V

    iput-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mAdapter:Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    .line 407
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mListListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 408
    iget-object v3, p0, Lcom/androie/settings/DataUsageSummary;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/androie/settings/DataUsageSummary;->mAdapter:Lcom/androie/settings/DataUsageSummary$DataUsageAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 410
    return-object v2

    .end local v1    # "shouldInset":Z
    :cond_1
    move v1, v5

    .line 320
    goto/16 :goto_0

    .line 326
    .restart local v1    # "shouldInset":Z
    :cond_2
    iput v5, p0, Lcom/androie/settings/DataUsageSummary;->mInsetSide:I

    goto/16 :goto_1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 576
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mDataEnabledView:Landroid/view/View;

    .line 577
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mDisableAtLimitView:Landroid/view/View;

    .line 579
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    invoke-virtual {v0}, Lcom/androie/settings/net/UidDetailProvider;->clearCache()V

    .line 580
    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mUidDetailProvider:Lcom/androie/settings/net/UidDetailProvider;

    .line 582
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mStatsSession:Landroid/net/INetworkStatsSession;

    invoke-static {v0}, Landroid/net/TrafficStats;->closeQuietly(Landroid/net/INetworkStatsSession;)V

    .line 584
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 585
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "appDetails"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentManager;->popBackStack(Ljava/lang/String;I)V

    .line 589
    :cond_0
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 590
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 514
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    move v7, v6

    .line 571
    :goto_0
    return v7

    .line 516
    :pswitch_0
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v7

    .line 517
    :goto_1
    if-eqz v0, :cond_1

    .line 518
    invoke-static {p0}, Lcom/androie/settings/DataUsageSummary$ConfirmDataRoamingFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    goto :goto_0

    :cond_0
    move v0, v6

    .line 516
    goto :goto_1

    .line 521
    :cond_1
    invoke-direct {p0, v6}, Lcom/androie/settings/DataUsageSummary;->setDataRoaming(Z)V

    goto :goto_0

    .line 526
    :pswitch_1
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v7

    .line 527
    :goto_2
    if-eqz v0, :cond_3

    .line 528
    invoke-static {p0}, Lcom/androie/settings/DataUsageSummary$ConfirmRestrictFragment;->show(Lcom/androie/settings/DataUsageSummary;)V

    goto :goto_0

    :cond_2
    move v0, v6

    .line 526
    goto :goto_2

    .line 531
    :cond_3
    invoke-virtual {p0, v6}, Lcom/androie/settings/DataUsageSummary;->setRestrictBackground(Z)V

    goto :goto_0

    .line 536
    :pswitch_2
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_4

    move v6, v7

    .line 537
    :cond_4
    invoke-direct {p0, v6}, Lcom/androie/settings/DataUsageSummary;->setMobilePolicySplit(Z)V

    .line 538
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isMobilePolicySplit()Z

    move-result v0

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 539
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateTabs()V

    goto :goto_0

    .line 543
    :pswitch_3
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_5

    move v6, v7

    :cond_5
    iput-boolean v6, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    .line 544
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "show_wifi"

    iget-boolean v2, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 545
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 546
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateTabs()V

    goto :goto_0

    .line 550
    :pswitch_4
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_6

    move v6, v7

    :cond_6
    iput-boolean v6, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    .line 551
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "show_ethernet"

    iget-boolean v2, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 552
    iget-boolean v0, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 553
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateTabs()V

    goto/16 :goto_0

    .line 557
    :pswitch_5
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 558
    const-class v1, Lcom/androie/settings/net/DataUsageMeteredSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f0809f4

    move-object v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    goto/16 :goto_0

    .line 563
    :pswitch_6
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 564
    const-string v0, "SyncState"

    const-string v1, "ignoring monkey\'s attempt to flip global sync state"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 566
    :cond_7
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    if-nez v0, :cond_8

    move v6, v7

    :cond_8
    invoke-static {p0, v6}, Lcom/androie/settings/DataUsageSummary$ConfirmAutoSyncChangeFragment;->show(Lcom/androie/settings/DataUsageSummary;Z)V

    goto/16 :goto_0

    .line 514
    nop

    :pswitch_data_0
    .packed-switch 0x7f0c02a8
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 13
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 455
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 456
    .local v1, "context":Landroid/content/Context;
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isAppDetailMode()Z

    move-result v0

    .line 457
    .local v0, "appDetailMode":Z
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v11

    if-nez v11, :cond_2

    move v4, v9

    .line 459
    .local v4, "isOwner":Z
    :goto_0
    const v11, 0x7f0c02a8

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    iput-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuDataRoaming:Landroid/view/MenuItem;

    .line 460
    const-string v11, "mobile"

    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mCurrentTab:Ljava/lang/String;

    const-string v12, "SIM"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 461
    :cond_0
    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mMenuDataRoaming:Landroid/view/MenuItem;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_3

    if-nez v0, :cond_3

    move v11, v9

    :goto_1
    invoke-interface {v12, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 462
    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuDataRoaming:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->getDataRoaming()Z

    move-result v12

    invoke-interface {v11, v12}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 467
    :goto_2
    const v11, 0x7f0c02a9

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    iput-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuRestrictBackground:Landroid/view/MenuItem;

    .line 468
    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mMenuRestrictBackground:Landroid/view/MenuItem;

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_5

    if-eqz v4, :cond_5

    if-nez v0, :cond_5

    move v11, v9

    :goto_3
    invoke-interface {v12, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 470
    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuRestrictBackground:Landroid/view/MenuItem;

    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    invoke-virtual {v12}, Landroid/net/NetworkPolicyManager;->getRestrictBackground()Z

    move-result v12

    invoke-interface {v11, v12}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 472
    const v11, 0x7f0c02ab

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    iput-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuAutoSync:Landroid/view/MenuItem;

    .line 473
    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuAutoSync:Landroid/view/MenuItem;

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v12

    invoke-interface {v11, v12}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 474
    iget-object v12, p0, Lcom/androie/settings/DataUsageSummary;->mMenuAutoSync:Landroid/view/MenuItem;

    if-nez v0, :cond_6

    move v11, v9

    :goto_4
    invoke-interface {v12, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 476
    const v11, 0x7f0c02aa

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    .line 477
    .local v8, "split4g":Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobile4gRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_7

    if-eqz v4, :cond_7

    if-nez v0, :cond_7

    move v11, v9

    :goto_5
    invoke-interface {v8, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 478
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->isMobilePolicySplit()Z

    move-result v11

    invoke-interface {v8, v11}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 480
    const v11, 0x7f0c02ac

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 481
    .local v7, "showWifi":Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasWifiRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_9

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 482
    if-nez v0, :cond_8

    move v11, v9

    :goto_6
    invoke-interface {v7, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 483
    iget-boolean v11, p0, Lcom/androie/settings/DataUsageSummary;->mShowWifi:Z

    invoke-interface {v7, v11}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 488
    :goto_7
    const v11, 0x7f0c02ad

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 489
    .local v6, "showEthernet":Landroid/view/MenuItem;
    invoke-virtual {p0, v1}, Lcom/androie/settings/DataUsageSummary;->hasEthernet(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_b

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 490
    if-nez v0, :cond_a

    move v11, v9

    :goto_8
    invoke-interface {v6, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 491
    iget-boolean v11, p0, Lcom/androie/settings/DataUsageSummary;->mShowEthernet:Z

    invoke-interface {v6, v11}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 496
    :goto_9
    const v11, 0x7f0c02ae

    invoke-interface {p1, v11}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 497
    .local v5, "metered":Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasReadyMobileRadio(Landroid/content/Context;)Z

    move-result v11

    if-nez v11, :cond_1

    invoke-static {v1}, Lcom/androie/settings/DataUsageSummary;->hasWifiRadio(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_d

    .line 498
    :cond_1
    if-nez v0, :cond_c

    :goto_a
    invoke-interface {v5, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 503
    :goto_b
    const v9, 0x7f0c02af

    invoke-interface {p1, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 505
    .local v2, "help":Landroid/view/MenuItem;
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x7f080a61

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .local v3, "helpUrl":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_e

    .line 506
    invoke-static {v1, v2, v3}, Lcom/androie/settings/HelpUtils;->prepareHelpMenuItem(Landroid/content/Context;Landroid/view/MenuItem;Ljava/lang/String;)Z

    .line 510
    :goto_c
    return-void

    .end local v2    # "help":Landroid/view/MenuItem;
    .end local v3    # "helpUrl":Ljava/lang/String;
    .end local v4    # "isOwner":Z
    .end local v5    # "metered":Landroid/view/MenuItem;
    .end local v6    # "showEthernet":Landroid/view/MenuItem;
    .end local v7    # "showWifi":Landroid/view/MenuItem;
    .end local v8    # "split4g":Landroid/view/MenuItem;
    :cond_2
    move v4, v10

    .line 457
    goto/16 :goto_0

    .restart local v4    # "isOwner":Z
    :cond_3
    move v11, v10

    .line 461
    goto/16 :goto_1

    .line 464
    :cond_4
    iget-object v11, p0, Lcom/androie/settings/DataUsageSummary;->mMenuDataRoaming:Landroid/view/MenuItem;

    invoke-interface {v11, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_2

    :cond_5
    move v11, v10

    .line 468
    goto/16 :goto_3

    :cond_6
    move v11, v10

    .line 474
    goto/16 :goto_4

    .restart local v8    # "split4g":Landroid/view/MenuItem;
    :cond_7
    move v11, v10

    .line 477
    goto/16 :goto_5

    .restart local v7    # "showWifi":Landroid/view/MenuItem;
    :cond_8
    move v11, v10

    .line 482
    goto :goto_6

    .line 485
    :cond_9
    invoke-interface {v7, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_7

    .restart local v6    # "showEthernet":Landroid/view/MenuItem;
    :cond_a
    move v11, v10

    .line 490
    goto :goto_8

    .line 493
    :cond_b
    invoke-interface {v6, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_9

    .restart local v5    # "metered":Landroid/view/MenuItem;
    :cond_c
    move v9, v10

    .line 498
    goto :goto_a

    .line 500
    :cond_d
    invoke-interface {v5, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_b

    .line 508
    .restart local v2    # "help":Landroid/view/MenuItem;
    .restart local v3    # "helpUrl":Ljava/lang/String;
    :cond_e
    invoke-interface {v2, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_c
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 415
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 418
    invoke-virtual {p0}, Lcom/androie/settings/DataUsageSummary;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 419
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {v0}, Lcom/androie/settings/DataUsageSummary;->computeTabFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/DataUsageSummary;->mIntentTab:Ljava/lang/String;

    .line 423
    invoke-direct {p0}, Lcom/androie/settings/DataUsageSummary;->updateTabs()V

    .line 426
    new-instance v1, Lcom/androie/settings/DataUsageSummary$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/DataUsageSummary$1;-><init>(Lcom/androie/settings/DataUsageSummary;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v3}, Lcom/androie/settings/DataUsageSummary$1;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 446
    return-void
.end method

.method public setRestrictBackground(Z)V
    .locals 1
    .param p1, "restrictBackground"    # Z

    .prologue
    .line 971
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mPolicyManager:Landroid/net/NetworkPolicyManager;

    invoke-virtual {v0, p1}, Landroid/net/NetworkPolicyManager;->setRestrictBackground(Z)V

    .line 972
    iget-object v0, p0, Lcom/androie/settings/DataUsageSummary;->mMenuRestrictBackground:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 973
    return-void
.end method
