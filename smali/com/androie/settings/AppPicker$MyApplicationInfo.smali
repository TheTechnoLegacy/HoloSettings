.class Lcom/androie/settings/AppPicker$MyApplicationInfo;
.super Ljava/lang/Object;
.source "AppPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/AppPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyApplicationInfo"
.end annotation


# instance fields
.field info:Landroid/content/pm/ApplicationInfo;

.field label:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/androie/settings/AppPicker;


# direct methods
.method constructor <init>(Lcom/androie/settings/AppPicker;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/androie/settings/AppPicker$MyApplicationInfo;->this$0:Lcom/androie/settings/AppPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
