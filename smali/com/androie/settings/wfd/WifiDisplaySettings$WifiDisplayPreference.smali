.class final Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;
.super Landroid/preference/Preference;
.source "WifiDisplaySettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/wfd/WifiDisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WifiDisplayPreference"
.end annotation


# instance fields
.field private final mDisplay:Landroid/hardware/display/WifiDisplay;

.field private final mIsRemoteDisplay:Z

.field final synthetic this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;


# direct methods
.method public constructor <init>(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/content/Context;Landroid/hardware/display/WifiDisplay;Z)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "display"    # Landroid/hardware/display/WifiDisplay;
    .param p4, "isRemoteDisplay"    # Z

    .prologue
    .line 478
    iput-object p1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    .line 479
    invoke-direct {p0, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 481
    iput-object p3, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mDisplay:Landroid/hardware/display/WifiDisplay;

    .line 482
    iput-boolean p4, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mIsRemoteDisplay:Z

    .line 483
    invoke-virtual {p3}, Landroid/hardware/display/WifiDisplay;->getFriendlyDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 484
    return-void
.end method


# virtual methods
.method public getDisplay()Landroid/hardware/display/WifiDisplay;
    .locals 1

    .prologue
    .line 487
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mDisplay:Landroid/hardware/display/WifiDisplay;

    return-object v0
.end method

.method public isRemoteDisplay()Z
    .locals 1

    .prologue
    .line 491
    iget-boolean v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mIsRemoteDisplay:Z

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 496
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 498
    const v2, 0x7f0c013a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 499
    .local v0, "deviceDetails":Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 500
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 503
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 504
    .local v1, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x1010033

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 506
    invoke-virtual {v1}, Landroid/util/TypedValue;->getFloat()F

    move-result v2

    const/high16 v3, 0x437f0000    # 255.0f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 509
    .end local v1    # "value":Landroid/util/TypedValue;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->this$0:Lcom/androie/settings/wfd/WifiDisplaySettings;

    iget-object v1, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mDisplay:Landroid/hardware/display/WifiDisplay;

    iget-boolean v2, p0, Lcom/androie/settings/wfd/WifiDisplaySettings$WifiDisplayPreference;->mIsRemoteDisplay:Z

    invoke-static {v0, v1, v2}, Lcom/androie/settings/wfd/WifiDisplaySettings;->access$800(Lcom/androie/settings/wfd/WifiDisplaySettings;Landroid/hardware/display/WifiDisplay;Z)V

    .line 514
    return-void
.end method
