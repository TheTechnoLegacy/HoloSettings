.class Lcom/jellybyn/settings/LocationSettings$1;
.super Ljava/lang/Object;
.source "LocationSettings.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jellybyn/settings/LocationSettings;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/LocationSettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/LocationSettings;)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/jellybyn/settings/LocationSettings$1;->this$0:Lcom/jellybyn/settings/LocationSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/util/Observable;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/jellybyn/settings/LocationSettings$1;->this$0:Lcom/jellybyn/settings/LocationSettings;

    invoke-static {v0}, Lcom/jellybyn/settings/LocationSettings;->access$000(Lcom/jellybyn/settings/LocationSettings;)V

    .line 123
    return-void
.end method
