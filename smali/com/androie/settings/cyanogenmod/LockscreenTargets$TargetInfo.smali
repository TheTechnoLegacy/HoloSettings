.class Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;
.super Ljava/lang/Object;
.source "LockscreenTargets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/LockscreenTargets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TargetInfo"
.end annotation


# instance fields
.field defaultIcon:Landroid/graphics/drawable/Drawable;

.field icon:Landroid/graphics/drawable/StateListDrawable;

.field iconSource:Ljava/lang/String;

.field iconType:Ljava/lang/String;

.field packageName:Ljava/lang/String;

.field uri:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenTargets$1;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenTargets$TargetInfo;-><init>()V

    return-void
.end method
