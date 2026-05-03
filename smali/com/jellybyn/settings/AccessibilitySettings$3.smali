.class Lcom/jellybyn/settings/AccessibilitySettings$3;
.super Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;
.source "AccessibilitySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/AccessibilitySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jellybyn/settings/AccessibilitySettings;


# direct methods
.method constructor <init>(Lcom/jellybyn/settings/AccessibilitySettings;)V
    .locals 0

    .prologue
    .line 164
    iput-object p1, p0, Lcom/jellybyn/settings/AccessibilitySettings$3;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-direct {p0}, Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/jellybyn/settings/AccessibilitySettings$3;->this$0:Lcom/jellybyn/settings/AccessibilitySettings;

    invoke-static {v0}, Lcom/jellybyn/settings/AccessibilitySettings;->access$300(Lcom/jellybyn/settings/AccessibilitySettings;)V

    .line 168
    return-void
.end method
