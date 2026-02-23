.class Lcom/androie/settings/AccessibilitySettings$3;
.super Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/AccessibilitySettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/AccessibilitySettings;)V
    .locals 0

    .prologue
    .line 166
    iput-object p1, p0, Lcom/androie/settings/AccessibilitySettings$3;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-direct {p0}, Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/androie/settings/AccessibilitySettings$3;->this$0:Lcom/androie/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/androie/settings/AccessibilitySettings;->access$300(Lcom/androie/settings/AccessibilitySettings;)V

    .line 170
    return-void
.end method
