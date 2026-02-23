.class Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$1;
.super Lcom/koushikdutta/superuser/PolicyNativeFragment$FragmentInternal;
.source "PolicyNativeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;->createFragmentInterface()Lcom/koushikdutta/superuser/PolicyFragmentInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;)V
    .locals 0
    .param p2, "x0"    # Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$1;->this$0:Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment;

    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/superuser/PolicyNativeFragment$FragmentInternal;-><init>(Lcom/koushikdutta/superuser/PolicyNativeFragment;Lcom/koushikdutta/widgets/FragmentInterfaceWrapper;)V

    return-void
.end method


# virtual methods
.method protected createLogNativeFragment()Lcom/koushikdutta/superuser/LogNativeFragment;
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMLogNativeFragment;

    invoke-direct {v0}, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMLogNativeFragment;-><init>()V

    return-object v0
.end method

.method protected createSettingsNativeFragment()Lcom/koushikdutta/superuser/SettingsNativeFragment;
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMSettingsNativeFragment;

    invoke-direct {v0}, Lcom/androie/settings/cyanogenmod/superuser/PolicyNativeFragment$CMSettingsNativeFragment;-><init>()V

    return-object v0
.end method
