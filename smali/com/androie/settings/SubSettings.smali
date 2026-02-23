.class public Lcom/androie/settings/SubSettings;
.super Lcom/androie/settings/Settings;
.source "SubSettings.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/androie/settings/Settings;-><init>()V

    return-void
.end method

.method private popFragment()Z
    .locals 2

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/androie/settings/SubSettings;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 48
    .local v0, "fm":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 49
    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    .line 50
    const/4 v1, 0x1

    .line 52
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onNavigateUp()Z
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/androie/settings/SubSettings;->finish()V

    .line 31
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 35
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 43
    :cond_0
    invoke-super {p0, p1}, Lcom/androie/settings/Settings;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 37
    :pswitch_0
    invoke-direct {p0}, Lcom/androie/settings/SubSettings;->popFragment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    const/4 v0, 0x1

    goto :goto_0

    .line 35
    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method
