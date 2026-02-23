.class Lcom/androie/settings/applications/AppOpsDetails$1;
.super Ljava/lang/Object;
.source "AppOpsDetails.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/applications/AppOpsDetails;->setAppLabelAndIcon(Landroid/content/pm/PackageInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/applications/AppOpsDetails;

.field final synthetic val$pkgInfo:Landroid/content/pm/PackageInfo;


# direct methods
.method constructor <init>(Lcom/androie/settings/applications/AppOpsDetails;Landroid/content/pm/PackageInfo;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/androie/settings/applications/AppOpsDetails$1;->this$0:Lcom/androie/settings/applications/AppOpsDetails;

    iput-object p2, p0, Lcom/androie/settings/applications/AppOpsDetails$1;->val$pkgInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/androie/settings/applications/AppOpsDetails$1;->this$0:Lcom/androie/settings/applications/AppOpsDetails;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    const-string v4, "package"

    iget-object v5, p0, Lcom/androie/settings/applications/AppOpsDetails$1;->val$pkgInfo:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Lcom/androie/settings/applications/AppOpsDetails;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v1, "AppOpsDetails"

    const-string v2, "Couldn\'t open app details activity"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
