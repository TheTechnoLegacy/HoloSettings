.class Lcom/androie/settings/cyanogenmod/PerformanceSettings$2;
.super Ljava/lang/Object;
.source "PerformanceSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/PerformanceSettings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/PerformanceSettings;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings$2;->this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PerformanceSettings$2;->this$0:Lcom/androie/settings/cyanogenmod/PerformanceSettings;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/PerformanceSettings;->finish()V

    .line 124
    return-void
.end method
