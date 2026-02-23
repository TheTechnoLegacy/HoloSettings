.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;)V
    .locals 0

    .prologue
    .line 209
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "position"    # I

    .prologue
    .line 211
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;

    invoke-direct {v2, p0, p2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;-><init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;I)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 221
    sget-object v1, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->TILES:Ljava/util/Map;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v2, v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$200(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->getTileId(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;

    .line 222
    .local v0, "info":Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getTitleResId()I

    move-result v2

    invoke-virtual {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil$TileInfo;->getIcon()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->addTile(ILjava/lang/String;IZ)V

    .line 223
    return-void
.end method
