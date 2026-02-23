.class Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;
.super Landroid/database/ContentObserver;
.source "PerformanceSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/PerformanceSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PerformanceProfileObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;


# direct methods
.method public constructor <init>(Lcom/androie/settings/cyanogenmod/PerformanceSettings;Landroid/os/Handler;)V
    .locals 0
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;->this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;

    .line 66
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 67
    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings$PerformanceProfileObserver;->this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->access$000(Lcom/androie/settings/cyanogenmod/PerformanceSettings;)V

    .line 72
    return-void
.end method
