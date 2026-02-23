.class Lcom/androie/settings/SettingsLicenseActivity$2;
.super Ljava/lang/Object;
.source "SettingsLicenseActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/SettingsLicenseActivity;->showPageOfText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/SettingsLicenseActivity;


# direct methods
.method constructor <init>(Lcom/androie/settings/SettingsLicenseActivity;)V
    .locals 0

    .prologue
    .line 193
    iput-object p1, p0, Lcom/androie/settings/SettingsLicenseActivity$2;->this$0:Lcom/androie/settings/SettingsLicenseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dlgi"    # Landroid/content/DialogInterface;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/androie/settings/SettingsLicenseActivity$2;->this$0:Lcom/androie/settings/SettingsLicenseActivity;

    invoke-virtual {v0}, Lcom/androie/settings/SettingsLicenseActivity;->finish()V

    .line 197
    return-void
.end method
