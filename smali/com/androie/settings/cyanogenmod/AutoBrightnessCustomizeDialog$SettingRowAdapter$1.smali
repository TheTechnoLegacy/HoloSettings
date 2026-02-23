.class Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;
.super Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$BrightnessSeekBarChangeListener;
.source "AutoBrightnessCustomizeDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

.field final synthetic val$holder:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$Holder;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$Holder;)V
    .locals 2

    .prologue
    .line 830
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->val$holder:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$Holder;

    iget-object v0, p1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$BrightnessSeekBarChangeListener;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$1;)V

    return-void
.end method


# virtual methods
.method protected getPosition(Landroid/widget/SeekBar;)I
    .locals 1
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 833
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 838
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$BrightnessSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 840
    if-eqz p3, :cond_0

    .line 841
    invoke-virtual {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->getPosition(Landroid/widget/SeekBar;)I

    move-result v0

    .line 842
    .local v0, "pos":I
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    .line 843
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v1, v0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    iget-object v2, v2, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    invoke-static {v2, p2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$1100(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;I)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;->backlight:I

    .line 844
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->this$1:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    iget-object v1, v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->this$0:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->access$2002(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Z)Z

    .line 847
    .end local v0    # "pos":I
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$1;->val$holder:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$Holder;

    invoke-virtual {v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter$Holder;->updatePercent()V

    .line 848
    return-void
.end method
