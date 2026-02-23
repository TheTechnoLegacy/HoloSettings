.class Lcom/androie/settings/cyanogenmod/Processor$1;
.super Landroid/os/Handler;
.source "Processor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/Processor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/Processor;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/Processor;)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/Processor$1;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/Processor$1;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/Processor;->access$400(Lcom/androie/settings/cyanogenmod/Processor;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/Processor$1;->this$0:Lcom/androie/settings/cyanogenmod/Processor;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/androie/settings/cyanogenmod/Processor;->access$300(Lcom/androie/settings/cyanogenmod/Processor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 89
    return-void
.end method
