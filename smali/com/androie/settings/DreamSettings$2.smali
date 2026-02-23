.class Lcom/androie/settings/DreamSettings$2;
.super Ljava/lang/Object;
.source "DreamSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/DreamSettings;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/DreamSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/DreamSettings;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/androie/settings/DreamSettings$2;->this$0:Lcom/androie/settings/DreamSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/androie/settings/DreamSettings$2;->this$0:Lcom/androie/settings/DreamSettings;

    invoke-static {v0}, Lcom/androie/settings/DreamSettings;->access$200(Lcom/androie/settings/DreamSettings;)Lcom/androie/settings/DreamBackend;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androie/settings/DreamBackend;->startDreaming()V

    .line 149
    return-void
.end method
