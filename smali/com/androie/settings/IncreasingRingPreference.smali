.class public Lcom/androie/settings/IncreasingRingPreference;
.super Landroid/preference/VolumePreference;
.source "IncreasingRingPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/IncreasingRingPreference$SavedState;
    }
.end annotation


# instance fields
.field private mEnabledCheckbox:Landroid/widget/CheckBox;

.field private mInterval:Landroid/widget/Spinner;

.field private mIntervalTitle:Landroid/widget/TextView;

.field private mIntervalValues:[I

.field private mMinVolumeSeekBar:Landroid/widget/SeekBar;

.field private mMinVolumeTitle:Landroid/widget/TextView;

.field private mRingVolumeNotice:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Landroid/preference/VolumePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 53
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androie/settings/IncreasingRingPreference;->setStreamType(I)V

    .line 55
    const v0, 0x7f040085

    invoke-virtual {p0, v0}, Lcom/androie/settings/IncreasingRingPreference;->setDialogLayoutResource(I)V

    .line 56
    const v0, 0x7f0200a6

    invoke-virtual {p0, v0}, Lcom/androie/settings/IncreasingRingPreference;->setDialogIcon(I)V

    .line 57
    return-void
.end method

.method private updateEnabledStates()V
    .locals 2

    .prologue
    .line 135
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 136
    .local v0, "enable":Z
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 137
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 138
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mRingVolumeNotice:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 139
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 140
    iget-object v1, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 141
    return-void
.end method

.method private updateVolumeNoticeVisibility(I)V
    .locals 3
    .param p1, "value"    # I

    .prologue
    const/4 v1, 0x0

    .line 127
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getSecondaryProgress()I

    move-result v2

    if-le p1, v2, :cond_1

    const/4 v0, 0x1

    .line 128
    .local v0, "visible":Z
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    .line 129
    const/4 v0, 0x0

    .line 131
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mRingVolumeNotice:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 132
    return-void

    .end local v0    # "visible":Z
    :cond_1
    move v0, v1

    .line 127
    goto :goto_0

    .line 131
    .restart local v0    # "visible":Z
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 61
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onBindDialogView(Landroid/view/View;)V

    .line 63
    invoke-virtual {p0}, Lcom/androie/settings/IncreasingRingPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 65
    .local v1, "cr":Landroid/content/ContentResolver;
    const v5, 0x7f0c013f

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    .line 66
    const v5, 0x7f0c0140

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeTitle:Landroid/widget/TextView;

    .line 67
    const v5, 0x102033c

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/SeekBar;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    .line 68
    const v5, 0x7f0c0141

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mRingVolumeNotice:Landroid/widget/TextView;

    .line 69
    const v5, 0x7f0c0142

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalTitle:Landroid/widget/TextView;

    .line 70
    const v5, 0x7f0c0143

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    .line 71
    invoke-virtual {p0}, Lcom/androie/settings/IncreasingRingPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0b0071

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v5

    iput-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalValues:[I

    .line 73
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v5, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 74
    iget-object v8, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    const-string v5, "increasing_ring"

    invoke-static {v1, v5, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v6, :cond_1

    move v5, v6

    :goto_0
    invoke-virtual {v8, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 75
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    const-string v8, "increasing_ring_min_vol"

    invoke-static {v1, v8, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 77
    const-string v5, "increasing_ring_interval"

    invoke-static {v1, v5, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 78
    .local v4, "interval":I
    const/4 v3, 0x0

    .line 80
    .local v3, "index":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalValues:[I

    array-length v5, v5

    if-ge v2, v5, :cond_0

    .line 81
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalValues:[I

    aget v5, v5, v2

    if-ne v5, v4, :cond_2

    .line 82
    move v3, v2

    .line 86
    :cond_0
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    invoke-virtual {v5, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 88
    invoke-virtual {p0}, Lcom/androie/settings/IncreasingRingPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "audio"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 89
    .local v0, "am":Landroid/media/AudioManager;
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 91
    iget-object v5, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getProgress()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/androie/settings/IncreasingRingPreference;->updateVolumeNoticeVisibility(I)V

    .line 92
    invoke-direct {p0}, Lcom/androie/settings/IncreasingRingPreference;->updateEnabledStates()V

    .line 93
    return-void

    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v2    # "i":I
    .end local v3    # "index":I
    .end local v4    # "interval":I
    :cond_1
    move v5, v7

    .line 74
    goto :goto_0

    .line 80
    .restart local v2    # "i":I
    .restart local v3    # "index":I
    .restart local v4    # "interval":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 113
    iget-object v0, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/androie/settings/IncreasingRingPreference;->updateVolumeNoticeVisibility(I)V

    .line 114
    invoke-direct {p0}, Lcom/androie/settings/IncreasingRingPreference;->updateEnabledStates()V

    .line 115
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 5
    .param p1, "positiveResult"    # Z

    .prologue
    const/4 v2, 0x0

    .line 97
    invoke-super {p0, v2}, Landroid/preference/VolumePreference;->onDialogClosed(Z)V

    .line 99
    if-eqz p1, :cond_1

    .line 100
    iget-object v3, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 101
    .local v0, "checked":Z
    invoke-virtual {p0}, Lcom/androie/settings/IncreasingRingPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 103
    .local v1, "cr":Landroid/content/ContentResolver;
    const-string v3, "increasing_ring"

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v1, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 104
    const-string v2, "increasing_ring_interval"

    iget-object v3, p0, Lcom/androie/settings/IncreasingRingPreference;->mIntervalValues:[I

    iget-object v4, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    invoke-virtual {v4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    aget v3, v3, v4

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 106
    const-string v2, "increasing_ring_min_vol"

    iget-object v3, p0, Lcom/androie/settings/IncreasingRingPreference;->mMinVolumeSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 110
    .end local v0    # "checked":Z
    .end local v1    # "cr":Landroid/content/ContentResolver;
    :cond_1
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .prologue
    .line 163
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/androie/settings/IncreasingRingPreference$SavedState;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 165
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 177
    :cond_1
    :goto_0
    return-void

    .line 169
    :cond_2
    check-cast p1, Lcom/androie/settings/IncreasingRingPreference$SavedState;

    .line 170
    invoke-virtual {p1}, Lcom/androie/settings/IncreasingRingPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 171
    iget-object v0, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    if-eqz v0, :cond_3

    .line 172
    iget-object v0, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    iget-boolean v1, p1, Lcom/androie/settings/IncreasingRingPreference$SavedState;->mEnabled:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 174
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    if-eqz v0, :cond_1

    .line 175
    iget-object v0, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    iget v1, p1, Lcom/androie/settings/IncreasingRingPreference$SavedState;->mIntervalSelection:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 145
    invoke-super {p0}, Landroid/preference/VolumePreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 146
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/androie/settings/IncreasingRingPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 158
    .end local v1    # "superState":Landroid/os/Parcelable;
    :goto_0
    return-object v1

    .line 151
    .restart local v1    # "superState":Landroid/os/Parcelable;
    :cond_0
    new-instance v0, Lcom/androie/settings/IncreasingRingPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/androie/settings/IncreasingRingPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 152
    .local v0, "myState":Lcom/androie/settings/IncreasingRingPreference$SavedState;
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    if-eqz v2, :cond_1

    .line 153
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mEnabledCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/androie/settings/IncreasingRingPreference$SavedState;->mEnabled:Z

    .line 155
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    if-eqz v2, :cond_2

    .line 156
    iget-object v2, p0, Lcom/androie/settings/IncreasingRingPreference;->mInterval:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    iput v2, v0, Lcom/androie/settings/IncreasingRingPreference$SavedState;->mIntervalSelection:I

    :cond_2
    move-object v1, v0

    .line 158
    goto :goto_0
.end method

.method public onVolumeChange(Landroid/preference/VolumePreference$SeekBarVolumizer;I)Z
    .locals 1
    .param p1, "volumizer"    # Landroid/preference/VolumePreference$SeekBarVolumizer;
    .param p2, "value"    # I

    .prologue
    .line 119
    invoke-super {p0, p1, p2}, Landroid/preference/VolumePreference;->onVolumeChange(Landroid/preference/VolumePreference$SeekBarVolumizer;I)Z

    move-result v0

    .line 120
    .local v0, "result":Z
    if-eqz v0, :cond_0

    .line 121
    invoke-direct {p0, p2}, Lcom/androie/settings/IncreasingRingPreference;->updateVolumeNoticeVisibility(I)V

    .line 123
    :cond_0
    return v0
.end method
