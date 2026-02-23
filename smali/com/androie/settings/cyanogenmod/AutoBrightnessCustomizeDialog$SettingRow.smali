.class Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;
.super Ljava/lang/Object;
.source "AutoBrightnessCustomizeDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SettingRow"
.end annotation


# instance fields
.field backlight:I

.field lux:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "lux"    # I
    .param p2, "backlight"    # I

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;->lux:I

    .line 73
    iput p2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;->backlight:I

    .line 74
    return-void
.end method
