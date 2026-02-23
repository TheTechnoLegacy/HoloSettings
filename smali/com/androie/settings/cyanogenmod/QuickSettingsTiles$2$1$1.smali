.class Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;
.super Ljava/lang/Object;
.source "QuickSettingsTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;I)V
    .locals 0

    .prologue
    .line 211
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iput p2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 214
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iget-object v2, v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v2, v2, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v2

    invoke-static {v1, v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getCurrentTiles(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileListFromString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 216
    .local v0, "curr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$200(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;

    move-result-object v1

    iget v2, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->val$position:I

    invoke-virtual {v1, v2}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$TileAdapter;->getTileId(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->getTileStringFromList(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1$1;->this$2:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;

    iget-object v3, v3, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2$1;->this$1:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;

    iget-object v3, v3, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles$2;->this$0:Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;

    invoke-static {v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;->access$000(Lcom/androie/settings/cyanogenmod/QuickSettingsTiles;)Z

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/androie/settings/cyanogenmod/QuickSettingsUtil;->saveCurrentTiles(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 219
    return-void
.end method
