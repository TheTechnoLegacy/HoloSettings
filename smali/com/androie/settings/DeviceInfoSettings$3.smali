.class Lcom/androie/settings/DeviceInfoSettings$3;
.super Ljava/lang/Object;
.source "DeviceInfoSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DeviceInfoSettings;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DeviceInfoSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DeviceInfoSettings;)V
    .locals 0

    .prologue
    .line 271
    iput-object p1, p0, Lcom/androie/settings/DeviceInfoSettings$3;->this$0:Lcom/androie/settings/DeviceInfoSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 273
    return-void
.end method
