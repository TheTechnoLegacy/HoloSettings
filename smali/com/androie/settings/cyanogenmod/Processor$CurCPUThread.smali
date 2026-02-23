.class Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;
.super Ljava/lang/Thread;
.source "Processor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/Processor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CurCPUThread"
.end annotation


# instance fields
.field private mInterrupt:Z

.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/Processor;


# direct methods
.method private constructor <init>(Lcom/androie/settings/cyanogenmod/Processor;)V
    .locals 1

    .prologue
    .line 63
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->mInterrupt:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/cyanogenmod/Processor;Lcom/androie/settings/cyanogenmod/Processor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/cyanogenmod/Processor;
    .param p2, "x1"    # Lcom/androie/settings/cyanogenmod/Processor$1;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;-><init>(Lcom/androie/settings/cyanogenmod/Processor;)V

    return-void
.end method


# virtual methods
.method public interrupt()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->mInterrupt:Z

    .line 68
    return-void
.end method

.method public run()V
    .locals 4

    .prologue
    .line 73
    :cond_0
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->mInterrupt:Z

    if-nez v1, :cond_1

    .line 74
    const-wide/16 v1, 0x1f4

    invoke-static {v1, v2}, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->sleep(J)V

    .line 75
    invoke-static {}, Lcom/androie/settings/cyanogenmod/Processor;->access$000()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/Utils;->fileReadOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "curFreq":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 77
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/Processor;->access$100(Lcom/androie/settings/cyanogenmod/Processor;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/Processor$CurCPUThread;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/Processor;->access$100(Lcom/androie/settings/cyanogenmod/Processor;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 79
    .end local v0    # "curFreq":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 81
    :cond_1
    return-void
.end method
