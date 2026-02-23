.class public Lcom/androie/settings/RingerVolumePreference;
.super Landroid/preference/VolumePreference;
.source "RingerVolumePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/RingerVolumePreference$SavedState;
    }
.end annotation


# static fields
.field private static final CHECKBOX_VIEW_ID:[I

.field private static final SEEKBAR_ID:[I

.field private static final SEEKBAR_MUTED_RES_ID:[I

.field private static final SEEKBAR_TYPE:[I

.field private static final SEEKBAR_UNMUTED_RES_ID:[I


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mCheckBoxes:[Landroid/widget/ImageView;

.field private mDialogClicked:Z

.field private mHandler:Landroid/os/Handler;

.field private mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

.field private mSafeHeadsetVolume:Landroid/widget/CheckBox;

.field private mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

.field private mSeekBars:[Landroid/widget/SeekBar;

.field private mWaiverDialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 71
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    .line 78
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    .line 85
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/androie/settings/RingerVolumePreference;->CHECKBOX_VIEW_ID:[I

    .line 92
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_MUTED_RES_ID:[I

    .line 99
    new-array v0, v1, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_UNMUTED_RES_ID:[I

    return-void

    .line 71
    nop

    :array_0
    .array-data 4
        0x7f0c0145
        0x7f0c014b
        0x7f0c014f
        0x7f0c0155
    .end array-data

    .line 78
    :array_1
    .array-data 4
        0x3
        0x2
        0x5
        0x4
    .end array-data

    .line 85
    :array_2
    .array-data 4
        0x7f0c0144
        0x7f0c014a
        0x7f0c014e
        0x7f0c0154
    .end array-data

    .line 92
    :array_3
    .array-data 4
        0x10802a6
        0x10802a3
        0x10802a0
        0x108029c
    .end array-data

    .line 99
    :array_4
    .array-data 4
        0x10802a5
        0x10802a2
        0x108029f
        0x108029b
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 156
    invoke-direct {p0, p1, p2}, Landroid/preference/VolumePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 106
    sget-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_MUTED_RES_ID:[I

    array-length v0, v0

    new-array v0, v0, [Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    .line 107
    sget-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v0, v0

    new-array v0, v0, [Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    .line 109
    new-instance v0, Lcom/androie/settings/RingerVolumePreference$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/RingerVolumePreference$1;-><init>(Lcom/androie/settings/RingerVolumePreference;)V

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mHandler:Landroid/os/Handler;

    .line 159
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androie/settings/RingerVolumePreference;->setStreamType(I)V

    .line 161
    const v0, 0x7f040086

    invoke-virtual {p0, v0}, Lcom/androie/settings/RingerVolumePreference;->setDialogLayoutResource(I)V

    .line 162
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/RingerVolumePreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    .line 164
    sget-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v0, v0

    new-array v0, v0, [Landroid/preference/VolumePreference$SeekBarVolumizer;

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .line 166
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    .line 167
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/RingerVolumePreference;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/androie/settings/RingerVolumePreference;->updateSlidersAndMutedStates()V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;)I
    .locals 1
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 59
    invoke-static {p0}, Lcom/androie/settings/RingerVolumePreference;->getCurrentMutableStreams(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/androie/settings/RingerVolumePreference;)Landroid/media/AudioManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/RingerVolumePreference;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/androie/settings/RingerVolumePreference;->mDialogClicked:Z

    return v0
.end method

.method static synthetic access$302(Lcom/androie/settings/RingerVolumePreference;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;
    .param p1, "x1"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/androie/settings/RingerVolumePreference;->mDialogClicked:Z

    return p1
.end method

.method static synthetic access$400(Lcom/androie/settings/RingerVolumePreference;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mWaiverDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$402(Lcom/androie/settings/RingerVolumePreference;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;
    .param p1, "x1"    # Landroid/app/Dialog;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/androie/settings/RingerVolumePreference;->mWaiverDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$500(Lcom/androie/settings/RingerVolumePreference;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/androie/settings/RingerVolumePreference;->dismissDialog()V

    return-void
.end method

.method static synthetic access$600(Lcom/androie/settings/RingerVolumePreference;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSafeHeadsetVolume:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$700(Lcom/androie/settings/RingerVolumePreference;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/RingerVolumePreference;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$800()[I
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    return-object v0
.end method

.method private cleanup()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 436
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 437
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    .line 438
    invoke-virtual {p0}, Lcom/androie/settings/RingerVolumePreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 439
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 441
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 443
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/preference/VolumePreference$SeekBarVolumizer;->stop()V

    .line 444
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aput-object v4, v2, v1

    .line 436
    .end local v0    # "dialog":Landroid/app/Dialog;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 447
    :cond_2
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v2, :cond_3

    .line 448
    invoke-virtual {p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 449
    iput-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    .line 451
    :cond_3
    return-void
.end method

.method private dismissDialog()V
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mWaiverDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 382
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mWaiverDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 383
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mWaiverDialog:Landroid/app/Dialog;

    .line 385
    :cond_0
    return-void
.end method

.method private static getCurrentMutableStreams(Landroid/content/Context;)I
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 170
    const/16 v0, 0xa6

    .line 172
    .local v0, "defaultMuteStreams":I
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "mode_ringer_streams_affected"

    const/16 v3, 0xa6

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method private getMediaVolumeUri(Landroid/content/Context;)Landroid/net/Uri;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/high16 v1, 0x7f060000

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private updateSlidersAndMutedStates()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 122
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v4, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    array-length v4, v4

    if-ge v0, v4, :cond_6

    .line 123
    sget-object v4, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v2, v4, v0

    .line 124
    .local v2, "streamType":I
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4, v2}, Landroid/media/AudioManager;->isStreamMute(I)Z

    move-result v1

    .line 126
    .local v1, "muted":Z
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    aget-object v4, v4, v0

    if-eqz v4, :cond_1

    .line 127
    const/4 v4, 0x2

    if-eq v2, v4, :cond_0

    const/4 v4, 0x5

    if-ne v2, v4, :cond_3

    :cond_0
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v4

    if-ne v4, v6, :cond_3

    .line 130
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    aget-object v4, v4, v0

    const v5, 0x10802a4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 137
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    aget-object v4, v4, v0

    if-eqz v4, :cond_2

    .line 138
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v3

    .line 139
    .local v3, "volume":I
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    aget-object v4, v4, v0

    invoke-virtual {v4, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 140
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4}, Landroid/media/AudioManager;->getMasterStreamType()I

    move-result v4

    if-eq v2, v4, :cond_5

    if-eqz v1, :cond_5

    .line 141
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    aget-object v4, v4, v0

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 122
    .end local v3    # "volume":I
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    :cond_3
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    aget-object v5, v4, v0

    if-eqz v1, :cond_4

    sget-object v4, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_MUTED_RES_ID:[I

    aget v4, v4, v0

    :goto_3
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    :cond_4
    sget-object v4, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_UNMUTED_RES_ID:[I

    aget v4, v4, v0

    goto :goto_3

    .line 143
    .restart local v3    # "volume":I
    :cond_5
    iget-object v4, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    aget-object v4, v4, v0

    invoke-virtual {v4, v6}, Landroid/widget/SeekBar;->setEnabled(Z)V

    goto :goto_2

    .line 147
    .end local v1    # "muted":Z
    .end local v2    # "streamType":I
    .end local v3    # "volume":I
    :cond_6
    return-void
.end method


# virtual methods
.method public createActionButtons()V
    .locals 1

    .prologue
    .line 117
    const v0, 0x104000a

    invoke-virtual {p0, v0}, Lcom/androie/settings/RingerVolumePreference;->setPositiveButtonText(I)V

    .line 118
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/androie/settings/RingerVolumePreference;->setNegativeButtonText(Ljava/lang/CharSequence;)V

    .line 119
    return-void
.end method

.method public onActivityStop()V
    .locals 4

    .prologue
    .line 407
    invoke-super {p0}, Landroid/preference/VolumePreference;->onActivityStop()V

    .line 409
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .local v0, "arr$":[Landroid/preference/VolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 410
    .local v3, "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/preference/VolumePreference$SeekBarVolumizer;->stopSample()V

    .line 409
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 412
    .end local v3    # "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_1
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .locals 19
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 178
    invoke-super/range {p0 .. p1}, Landroid/preference/VolumePreference;->onBindDialogView(Landroid/view/View;)V

    .line 180
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    sget-object v1, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v1, v1

    if-ge v9, v1, :cond_1

    .line 181
    sget-object v1, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    aget v1, v1, v9

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    .line 182
    .local v4, "seekBar":Landroid/widget/SeekBar;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mSeekBars:[Landroid/widget/SeekBar;

    aput-object v4, v1, v9

    .line 183
    sget-object v1, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v1, v1, v9

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    move-object/from16 v18, v0

    new-instance v1, Landroid/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v2, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v5, v2, v9

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/androie/settings/RingerVolumePreference;->getMediaVolumeUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v6

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Landroid/preference/VolumePreference$SeekBarVolumizer;-><init>(Landroid/preference/VolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;ILandroid/net/Uri;)V

    aput-object v1, v18, v9

    .line 180
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 187
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    new-instance v2, Landroid/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v5, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v5, v5, v9

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v4, v5}, Landroid/preference/VolumePreference$SeekBarVolumizer;-><init>(Landroid/preference/VolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;I)V

    aput-object v2, v1, v9

    goto :goto_1

    .line 193
    .end local v4    # "seekBar":Landroid/widget/SeekBar;
    :cond_1
    const/4 v9, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    array-length v1, v1

    if-ge v9, v1, :cond_2

    .line 194
    sget-object v1, Lcom/androie/settings/RingerVolumePreference;->CHECKBOX_VIEW_ID:[I

    aget v1, v1, v9

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 195
    .local v7, "checkbox":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mCheckBoxes:[Landroid/widget/ImageView;

    aput-object v7, v1, v9

    .line 193
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 198
    .end local v7    # "checkbox":Landroid/widget/ImageView;
    :cond_2
    const v1, 0x7f0c0151

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/CheckBox;

    .line 199
    .local v10, "linkCheckBox":Landroid/widget/CheckBox;
    const v1, 0x7f0c0152

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/CheckBox;

    .line 200
    .local v11, "linkMuteStates":Landroid/widget/CheckBox;
    const v1, 0x7f0c0153

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/CheckBox;

    .line 201
    .local v17, "volumeKeysControlRingStream":Landroid/widget/CheckBox;
    const v1, 0x7f0c0147

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mSafeHeadsetVolume:Landroid/widget/CheckBox;

    .line 203
    const v1, 0x7f0c0148

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    .line 204
    .local v15, "ringerSection":Landroid/view/View;
    const v1, 0x7f0c014c

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .line 205
    .local v13, "notificationSection":Landroid/view/View;
    const v1, 0x7f0c0150

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    .line 206
    .local v12, "linkVolumesSection":Landroid/view/View;
    const v1, 0x7f0c0149

    invoke-virtual {v15, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 209
    .local v14, "ringerDesc":Landroid/widget/TextView;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/Utils;->isVoiceCapable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 210
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/androie/settings/RingerVolumePreference;->getCurrentMutableStreams(Landroid/content/Context;)I

    move-result v1

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_4

    .line 211
    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 216
    :goto_3
    new-instance v1, Lcom/androie/settings/RingerVolumePreference$2;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/androie/settings/RingerVolumePreference$2;-><init>(Lcom/androie/settings/RingerVolumePreference;)V

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 235
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "volume_link_notification"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 237
    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 238
    const/16 v1, 0x8

    invoke-virtual {v13, v1}, Landroid/view/View;->setVisibility(I)V

    .line 239
    const v1, 0x7f080614

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(I)V

    .line 240
    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 248
    :goto_4
    new-instance v1, Lcom/androie/settings/RingerVolumePreference$3;

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v13, v14, v11}, Lcom/androie/settings/RingerVolumePreference$3;-><init>(Lcom/androie/settings/RingerVolumePreference;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/CheckBox;)V

    invoke-virtual {v10, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 272
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "volume_keys_control_ring_stream"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_6

    .line 274
    const/4 v1, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 279
    :goto_5
    new-instance v1, Lcom/androie/settings/RingerVolumePreference$4;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/androie/settings/RingerVolumePreference$4;-><init>(Lcom/androie/settings/RingerVolumePreference;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 295
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x111004b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v16

    .line 297
    .local v16, "safeMediaVolumeEnabled":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/androie/settings/RingerVolumePreference;->mSafeHeadsetVolume:Landroid/widget/CheckBox;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v5, "safe_headset_volume"

    if-eqz v16, :cond_8

    const/4 v1, 0x1

    :goto_7
    invoke-static {v3, v5, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x1

    :goto_8
    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 299
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mSafeHeadsetVolume:Landroid/widget/CheckBox;

    new-instance v2, Lcom/androie/settings/RingerVolumePreference$5;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/androie/settings/RingerVolumePreference$5;-><init>(Lcom/androie/settings/RingerVolumePreference;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 361
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->updateSlidersAndMutedStates()V

    .line 364
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    if-nez v1, :cond_3

    .line 365
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    .line 366
    .local v8, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.media.RINGER_MODE_CHANGED"

    invoke-virtual {v8, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 367
    new-instance v1, Lcom/androie/settings/RingerVolumePreference$6;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/androie/settings/RingerVolumePreference$6;-><init>(Lcom/androie/settings/RingerVolumePreference;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    .line 376
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/androie/settings/RingerVolumePreference;->mRingModeChangedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v8}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 378
    .end local v8    # "filter":Landroid/content/IntentFilter;
    :cond_3
    return-void

    .line 213
    .end local v16    # "safeMediaVolumeEnabled":Z
    :cond_4
    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto/16 :goto_3

    .line 242
    :cond_5
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 243
    const/4 v1, 0x0

    invoke-virtual {v13, v1}, Landroid/view/View;->setVisibility(I)V

    .line 244
    const v1, 0x7f08019f

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(I)V

    .line 245
    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    goto/16 :goto_4

    .line 276
    :cond_6
    const/4 v1, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto/16 :goto_5

    .line 290
    :cond_7
    const/16 v1, 0x8

    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V

    .line 291
    const/16 v1, 0x8

    invoke-virtual {v12, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_6

    .line 297
    .restart local v16    # "safeMediaVolumeEnabled":Z
    :cond_8
    const/4 v1, 0x0

    goto :goto_7

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method protected onDialogClosed(Z)V
    .locals 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 395
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onDialogClosed(Z)V

    .line 397
    if-nez p1, :cond_1

    .line 398
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .local v0, "arr$":[Landroid/preference/VolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 399
    .local v3, "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 398
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    .end local v0    # "arr$":[Landroid/preference/VolumePreference$SeekBarVolumizer;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_1
    invoke-direct {p0}, Lcom/androie/settings/RingerVolumePreference;->cleanup()V

    .line 403
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 416
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_0

    move v0, v1

    .line 417
    .local v0, "isdown":Z
    :goto_0
    sparse-switch p2, :sswitch_data_0

    move v1, v2

    .line 423
    :sswitch_0
    return v1

    .end local v0    # "isdown":Z
    :cond_0
    move v0, v2

    .line 416
    goto :goto_0

    .line 417
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0xa4 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4

    .prologue
    .line 474
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/androie/settings/RingerVolumePreference$SavedState;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 476
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 489
    :cond_1
    return-void

    .line 480
    :cond_2
    check-cast p1, Lcom/androie/settings/RingerVolumePreference$SavedState;

    .line 481
    invoke-virtual {p1}, Lcom/androie/settings/RingerVolumePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 482
    sget-object v0, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v0, v0

    invoke-virtual {p1, v0}, Lcom/androie/settings/RingerVolumePreference$SavedState;->getVolumeStore(I)[Landroid/preference/VolumePreference$VolumeStore;

    move-result-object v1

    .line 483
    const/4 v0, 0x0

    :goto_0
    sget-object v2, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 484
    iget-object v2, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v0

    .line 485
    if-eqz v2, :cond_3

    .line 486
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Landroid/preference/VolumePreference$SeekBarVolumizer;->onRestoreInstanceState(Landroid/preference/VolumePreference$VolumeStore;)V

    .line 483
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onSampleStarting(Landroid/preference/VolumePreference$SeekBarVolumizer;)V
    .locals 4
    .param p1, "volumizer"    # Landroid/preference/VolumePreference$SeekBarVolumizer;

    .prologue
    .line 429
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onSampleStarting(Landroid/preference/VolumePreference$SeekBarVolumizer;)V

    .line 430
    iget-object v0, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .local v0, "arr$":[Landroid/preference/VolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 431
    .local v3, "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_0

    if-eq v3, p1, :cond_0

    invoke-virtual {v3}, Landroid/preference/VolumePreference$SeekBarVolumizer;->stopSample()V

    .line 430
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 433
    .end local v3    # "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_1
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 6

    .prologue
    .line 455
    invoke-super {p0}, Landroid/preference/VolumePreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 456
    .local v2, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/androie/settings/RingerVolumePreference;->isPersistent()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 469
    .end local v2    # "superState":Landroid/os/Parcelable;
    :goto_0
    return-object v2

    .line 461
    .restart local v2    # "superState":Landroid/os/Parcelable;
    :cond_0
    new-instance v1, Lcom/androie/settings/RingerVolumePreference$SavedState;

    invoke-direct {v1, v2}, Lcom/androie/settings/RingerVolumePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 462
    .local v1, "myState":Lcom/androie/settings/RingerVolumePreference$SavedState;
    sget-object v5, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    invoke-virtual {v1, v5}, Lcom/androie/settings/RingerVolumePreference$SavedState;->getVolumeStore(I)[Landroid/preference/VolumePreference$VolumeStore;

    move-result-object v4

    .line 463
    .local v4, "volumeStore":[Landroid/preference/VolumePreference$VolumeStore;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v5, Lcom/androie/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 464
    iget-object v5, p0, Lcom/androie/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v3, v5, v0

    .line 465
    .local v3, "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_1

    .line 466
    aget-object v5, v4, v0

    invoke-virtual {v3, v5}, Landroid/preference/VolumePreference$SeekBarVolumizer;->onSaveInstanceState(Landroid/preference/VolumePreference$VolumeStore;)V

    .line 463
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v3    # "vol":Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_2
    move-object v2, v1

    .line 469
    goto :goto_0
.end method
