.class Lcom/jellybyn/settings/DisplaySettings$1;
.super Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;
.source "DisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/DisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/DisplaySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/DisplaySettings;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/jellybyn/settings/DisplaySettings$1;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-direct {p0}, Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/jellybyn/settings/DisplaySettings$1;->this$0:Lcom/jellybyn/settings/DisplaySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/DisplaySettings;->access$000(Lcom/jellybyn/settings/DisplaySettings;)V

    .line 86
    return-void
.end method
