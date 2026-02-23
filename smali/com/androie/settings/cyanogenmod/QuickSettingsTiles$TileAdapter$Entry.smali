.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Entry"
.end annotation


# instance fields
.field public final tile:Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

.field public final tileTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;Ljava/lang/String;)V
    .locals 0
    .param p1, "tile"    # Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    .param p2, "tileTitle"    # Ljava/lang/String;

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tile:Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    .line 281
    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tileTitle:Ljava/lang/String;

    .line 282
    return-void
.end method
