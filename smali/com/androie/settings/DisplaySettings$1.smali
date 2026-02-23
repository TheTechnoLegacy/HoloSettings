.class Lcom/androie/settings/DisplaySettings$1;
.super Landroid/database/ContentObserver;
.source "DisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/DisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DisplaySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DisplaySettings;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/androie/settings/DisplaySettings$1;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .prologue
    .line 109
    iget-object v0, p0, Lcom/androie/settings/DisplaySettings$1;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/DisplaySettings;->access$000(Lcom/androie/settings/DisplaySettings;)V

    .line 110
    return-void
.end method
