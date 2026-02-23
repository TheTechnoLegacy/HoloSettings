.class Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$1;
.super Ljava/lang/Object;
.source "PrivacyGuardManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager;->loadInstalledApps()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager;)V
    .locals 0

    .prologue
    .line 320
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$1;->this$0:Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;)I
    .locals 2
    .param p1, "lhs"    # Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;
    .param p2, "rhs"    # Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;

    .prologue
    .line 323
    iget-boolean v0, p1, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;->enabled:Z

    iget-boolean v1, p2, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;->enabled:Z

    if-eq v0, v1, :cond_1

    .line 324
    iget-boolean v0, p1, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;->enabled:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 326
    :goto_0
    return v0

    .line 324
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 326
    :cond_1
    iget-object v0, p1, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;->title:Ljava/lang/String;

    iget-object v1, p2, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 320
    check-cast p1, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$1;->compare(Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;Lcom/androie/settings/cyanogenmod/privacyguard/PrivacyGuardManager$AppInfo;)I

    move-result v0

    return v0
.end method
