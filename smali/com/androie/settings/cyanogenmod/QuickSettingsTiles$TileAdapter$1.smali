.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->sortItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

.field final synthetic val$collator:Ljava/text/Collator;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;Ljava/text/Collator;)V
    .locals 0

    .prologue
    .line 307
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;->val$collator:Ljava/text/Collator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;)I
    .locals 3
    .param p1, "e1"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;
    .param p2, "e2"    # Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;->val$collator:Ljava/text/Collator;

    iget-object v1, p1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tileTitle:Ljava/lang/String;

    iget-object v2, p2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;->tileTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 307
    check-cast p1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$1;->compare(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter$Entry;)I

    move-result v0

    return v0
.end method
