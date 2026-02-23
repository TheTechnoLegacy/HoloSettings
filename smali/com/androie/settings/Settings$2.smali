.class Lcom/androie/settings/Settings$2;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/Settings;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/Settings;


# direct methods
.method constructor <init>(Lcom/androie/settings/Settings;)V
    .locals 0

    .prologue
    .line 224
    iput-object p1, p0, Lcom/androie/settings/Settings$2;->this$0:Lcom/androie/settings/Settings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v0, p0, Lcom/androie/settings/Settings$2;->this$0:Lcom/androie/settings/Settings;

    invoke-virtual {v0}, Lcom/androie/settings/Settings;->invalidateHeaders()V

    .line 228
    return-void
.end method
