.class Lcom/androie/settings/profiles/ProfileConfig$AirplaneModeItem;
.super Ljava/lang/Object;
.source "ProfileConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/profiles/ProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AirplaneModeItem"
.end annotation


# instance fields
.field mCheckbox:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

.field mSettings:Landroid/app/AirplaneModeSettings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 477
    return-void
.end method
