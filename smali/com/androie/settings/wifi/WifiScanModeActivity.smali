.class public Lcom/androie/settings/wifi/WifiScanModeActivity;
.super Landroid/app/Activity;
.source "WifiScanModeActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/wifi/WifiScanModeActivity$AlertDialogFragment;
    }
.end annotation


# instance fields
.field private mApp:Ljava/lang/String;

.field private mDialog:Landroid/app/DialogFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/wifi/WifiScanModeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiScanModeActivity;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->doNegativeClick()V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/wifi/WifiScanModeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/wifi/WifiScanModeActivity;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->doPositiveClick()V

    return-void
.end method

.method private createDialog()V
    .locals 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    if-nez v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mApp:Ljava/lang/String;

    invoke-static {v0}, Lcom/androie/settings/wifi/WifiScanModeActivity$AlertDialogFragment;->newInstance(Ljava/lang/String;)Lcom/androie/settings/wifi/WifiScanModeActivity$AlertDialogFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    .line 60
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "dialog"

    invoke-virtual {v0, v1, v2}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 62
    :cond_0
    return-void
.end method

.method private dismissDialog()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    invoke-virtual {v0}, Landroid/app/DialogFragment;->dismiss()V

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mDialog:Landroid/app/DialogFragment;

    .line 69
    :cond_0
    return-void
.end method

.method private doNegativeClick()V
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->setResult(I)V

    .line 80
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->finish()V

    .line 81
    return-void
.end method

.method private doPositiveClick()V
    .locals 3

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wifi_scan_always_enabled"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 74
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->setResult(I)V

    .line 75
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->finish()V

    .line 76
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 43
    .local v0, "intent":Landroid/content/Intent;
    if-nez p1, :cond_1

    .line 44
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.net.wifi.action.REQUEST_SCAN_ALWAYS_AVAILABLE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->getCallingPackage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mApp:Ljava/lang/String;

    .line 54
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->createDialog()V

    .line 55
    :goto_1
    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->finish()V

    goto :goto_1

    .line 52
    :cond_1
    const-string v1, "app"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mApp:Ljava/lang/String;

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 92
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->dismissDialog()V

    .line 93
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 96
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 97
    invoke-direct {p0}, Lcom/androie/settings/wifi/WifiScanModeActivity;->createDialog()V

    .line 98
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 85
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 86
    const-string v0, "app"

    iget-object v1, p0, Lcom/androie/settings/wifi/WifiScanModeActivity;->mApp:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method
