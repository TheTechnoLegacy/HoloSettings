.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"

# interfaces
.implements Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$OnRearrangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)V
    .locals 0

    .prologue
    .line 184
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDelete(I)V
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 196
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getCurrentTiles(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileListFromString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 198
    .local v0, "tiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 199
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileStringFromList(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->saveCurrentTiles(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 201
    return-void
.end method

.method public onRearrange(II)V
    .locals 5
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    .line 186
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v3

    invoke-static {v2, v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getCurrentTiles(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileListFromString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 188
    .local v1, "tiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 189
    .local v0, "oldTile":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 190
    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 191
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileStringFromList(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$1;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v4}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->saveCurrentTiles(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 193
    return-void
.end method
