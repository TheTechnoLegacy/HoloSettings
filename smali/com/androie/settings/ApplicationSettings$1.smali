.class Lcom/androie/settings/ApplicationSettings$1;
.super Ljava/lang/Object;
.source "ApplicationSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/ApplicationSettings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/ApplicationSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/ApplicationSettings;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/androie/settings/ApplicationSettings$1;->this$0:Lcom/androie/settings/ApplicationSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 71
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    .line 72
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/ApplicationSettings$1;->this$0:Lcom/androie/settings/ApplicationSettings;

    invoke-virtual {v1, v0}, Lcom/androie/settings/ApplicationSettings;->handleUpdateAppInstallLocation(Ljava/lang/String;)V

    .line 73
    const/4 v1, 0x0

    return v1
.end method
