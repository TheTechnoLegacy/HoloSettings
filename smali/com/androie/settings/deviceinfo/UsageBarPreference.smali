.class public Lcom/androie/settings/deviceinfo/UsageBarPreference;
.super Landroid/preference/Preference;
.source "UsageBarPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;
    }
.end annotation


# instance fields
.field private mAllowMediaScan:Z

.field private mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

.field private final mEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/androie/settings/deviceinfo/PercentageBarChart$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mOnRequestMediaRescanListener:Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;

.field private mRescanMedia:Landroid/widget/ImageView;

.field private mRescanMediaWaiting:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 43
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    .line 44
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    .line 45
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    .line 51
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    .line 62
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->init()V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    .line 44
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    .line 45
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    .line 51
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    .line 67
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->init()V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    .line 44
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    .line 45
    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    .line 51
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    .line 57
    invoke-direct {p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->init()V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/deviceinfo/UsageBarPreference;)Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/UsageBarPreference;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mOnRequestMediaRescanListener:Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/deviceinfo/UsageBarPreference;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/UsageBarPreference;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/deviceinfo/UsageBarPreference;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/UsageBarPreference;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/deviceinfo/UsageBarPreference;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/deviceinfo/UsageBarPreference;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 71
    const v0, 0x7f04008d

    invoke-virtual {p0, v0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->setLayoutResource(I)V

    .line 72
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mHandler:Landroid/os/Handler;

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mAllowMediaScan:Z

    .line 74
    return-void
.end method


# virtual methods
.method public addEntry(IFI)V
    .locals 2
    .param p1, "order"    # I
    .param p2, "percentage"    # F
    .param p3, "color"    # I

    .prologue
    .line 77
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    invoke-static {p1, p2, p3}, Lcom/androie/settings/deviceinfo/PercentageBarChart;->createEntry(IFI)Lcom/androie/settings/deviceinfo/PercentageBarChart$Entry;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 79
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 134
    return-void
.end method

.method public commit()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    invoke-virtual {v0}, Lcom/androie/settings/deviceinfo/PercentageBarChart;->invalidate()V

    .line 130
    :cond_0
    return-void
.end method

.method protected notifyScanCompleted()V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 92
    iget-object v1, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    iget-boolean v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mAllowMediaScan:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 93
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 95
    :cond_0
    return-void

    .line 92
    :cond_1
    const/4 v0, 0x4

    goto :goto_0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 99
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 101
    const v0, 0x7f0c015b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/deviceinfo/PercentageBarChart;

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    .line 102
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mChart:Lcom/androie/settings/deviceinfo/PercentageBarChart;

    iget-object v1, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mEntries:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/androie/settings/deviceinfo/PercentageBarChart;->setEntries(Ljava/util/Collection;)V

    .line 104
    const v0, 0x7f0c015a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMediaWaiting:Landroid/widget/ProgressBar;

    .line 106
    const v0, 0x7f0c0159

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    .line 107
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mRescanMedia:Landroid/widget/ImageView;

    new-instance v1, Lcom/androie/settings/deviceinfo/UsageBarPreference$1;

    invoke-direct {v1, p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference$1;-><init>(Lcom/androie/settings/deviceinfo/UsageBarPreference;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->notifyScanCompleted()V

    .line 124
    return-void
.end method

.method protected setAllowMediaScan(Z)V
    .locals 0
    .param p1, "allow"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mAllowMediaScan:Z

    .line 87
    invoke-virtual {p0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->notifyScanCompleted()V

    .line 88
    return-void
.end method

.method protected setOnRequestMediaRescanListener(Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference;->mOnRequestMediaRescanListener:Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;

    .line 83
    return-void
.end method
