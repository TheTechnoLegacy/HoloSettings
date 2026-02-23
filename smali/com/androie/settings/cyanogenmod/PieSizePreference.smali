.class public Lcom/androie/settings/cyanogenmod/PieSizePreference;
.super Landroid/preference/SeekBarDialogPreference;
.source "PieSizePreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;
    }
.end annotation


# instance fields
.field private mOldSize:F

.field private mRestoredOldState:Z

.field private mSeekBar:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Landroid/preference/SeekBarDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mRestoredOldState:Z

    .line 27
    return-void
.end method

.method private restoreOldState()V
    .locals 3

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mRestoredOldState:Z

    if-eqz v0, :cond_0

    .line 75
    :goto_0
    return-void

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pie_size"

    iget v2, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mOldSize:F

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mRestoredOldState:Z

    goto :goto_0
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 39
    invoke-static {p1}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getSeekBar(Landroid/view/View;)Landroid/widget/SeekBar;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    .line 40
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    const/16 v1, 0x5dc

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 41
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pie_size"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mOldSize:F

    .line 44
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mOldSize:F

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float/2addr v1, v2

    const/high16 v2, 0x43fa0000    # 500.0f

    sub-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 45
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 46
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 47
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 3
    .param p1, "positiveResult"    # Z

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onDialogClosed(Z)V

    .line 59
    if-eqz p1, :cond_0

    .line 60
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 64
    :goto_0
    return-void

    .line 62
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->restoreOldState()V

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromTouch"    # Z

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pie_size"

    add-int/lit16 v2, p2, 0x1f4

    int-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 53
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .prologue
    .line 95
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 97
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 104
    :goto_0
    return-void

    .line 101
    :cond_1
    check-cast p1, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    .line 102
    invoke-virtual {p1}, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 103
    iget v0, p1, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;->oldSize:F

    iput v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mOldSize:F

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 79
    invoke-super {p0}, Landroid/preference/SeekBarDialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 80
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move-object v0, v1

    .line 90
    :goto_0
    return-object v0

    .line 85
    :cond_1
    new-instance v0, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;

    invoke-direct {v0, v1}, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 86
    .local v0, "myState":Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;
    iget v2, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mOldSize:F

    iput v2, v0, Lcom/androie/settings/cyanogenmod/PieSizePreference$SavedState;->oldSize:F

    .line 89
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/PieSizePreference;->restoreOldState()V

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 141
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 146
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->showDialog(Landroid/os/Bundle;)V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/cyanogenmod/PieSizePreference;->mRestoredOldState:Z

    .line 33
    return-void
.end method
