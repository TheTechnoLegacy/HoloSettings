.class Lcom/androie/settings/profiles/ProfileConfig$RingModeItem;
.super Ljava/lang/Object;
.source "ProfileConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/profiles/ProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RingModeItem"
.end annotation


# instance fields
.field mCheckbox:Lcom/androie/settings/profiles/ProfileRingModePreference;

.field mSettings:Landroid/app/RingModeSettings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 468
    return-void
.end method
