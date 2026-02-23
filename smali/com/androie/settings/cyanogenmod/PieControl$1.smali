.class Lcom/androie/settings/cyanogenmod/PieControl$1;
.super Landroid/database/ContentObserver;
.source "PieControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/PieControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/PieControl;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/PieControl;Landroid/os/Handler;)V
    .locals 0
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/PieControl$1;->this$0:Lcom/androie/settings/cyanogenmod/PieControl;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .prologue
    .line 40
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieControl$1;->this$0:Lcom/androie/settings/cyanogenmod/PieControl;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/PieControl;->access$000(Lcom/androie/settings/cyanogenmod/PieControl;)V

    .line 41
    return-void
.end method
