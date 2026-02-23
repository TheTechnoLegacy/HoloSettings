.class Lcom/androie/settings/DisplaySettings$2;
.super Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;
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
.method constructor <init>(Lcom/androie/settings/DisplaySettings;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/androie/settings/DisplaySettings$2;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-direct {p0}, Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/androie/settings/DisplaySettings$2;->this$0:Lcom/androie/settings/DisplaySettings;

    invoke-static {v0}, Lcom/androie/settings/DisplaySettings;->access$000(Lcom/androie/settings/DisplaySettings;)V

    .line 118
    return-void
.end method
