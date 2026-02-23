.class Lcom/androie/settings/deviceinfo/UsageBarPreference$1$1;
.super Ljava/lang/Object;
.source "UsageBarPreference.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/deviceinfo/UsageBarPreference$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/deviceinfo/UsageBarPreference$1;


# direct methods
.method constructor <init>(Lcom/androie/settings/deviceinfo/UsageBarPreference$1;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference$1$1;->this$1:Lcom/androie/settings/deviceinfo/UsageBarPreference$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/androie/settings/deviceinfo/UsageBarPreference$1$1;->this$1:Lcom/androie/settings/deviceinfo/UsageBarPreference$1;

    iget-object v0, v0, Lcom/androie/settings/deviceinfo/UsageBarPreference$1;->this$0:Lcom/androie/settings/deviceinfo/UsageBarPreference;

    invoke-static {v0}, Lcom/androie/settings/deviceinfo/UsageBarPreference;->access$000(Lcom/androie/settings/deviceinfo/UsageBarPreference;)Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/androie/settings/deviceinfo/UsageBarPreference$OnRequestMediaRescanListener;->onRequestMediaRescan()V

    .line 117
    return-void
.end method
