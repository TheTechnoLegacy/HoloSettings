.class Lcom/jellybyn/settings/RingerVolumePreference$1;
.super Landroid/os/Handler;
.source "RingerVolumePreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/RingerVolumePreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/RingerVolumePreference;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/RingerVolumePreference;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lcom/jellybyn/settings/RingerVolumePreference$1;->this$0:Lcom/jellybyn/settings/RingerVolumePreference;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/jellybyn/settings/RingerVolumePreference$1;->this$0:Lcom/jellybyn/settings/RingerVolumePreference;

    invoke-static {v0}, Lcom/jellybyn/settings/RingerVolumePreference;->access$000(Lcom/jellybyn/settings/RingerVolumePreference;)V

    .line 103
    return-void
.end method
