.class public Lcom/jellybyn/settings/SoundSettings;
.super Lcom/jellybyn/settings/SettingsPreferenceFragment;
.source "SoundSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final NEED_VOICE_CAPABILITY:[Ljava/lang/String;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

.field private mDockAudioSettings:Landroid/preference/Preference;

.field private mDockIntent:Landroid/content/Intent;

.field private mDockSounds:Landroid/preference/CheckBoxPreference;

.field private mDtmfTone:Landroid/preference/CheckBoxPreference;

.field private mHandler:Landroid/os/Handler;

.field private mHapticFeedback:Landroid/preference/CheckBoxPreference;

.field private mLockSounds:Landroid/preference/CheckBoxPreference;

.field private mMusicFx:Landroid/preference/Preference;

.field private mNotificationPreference:Landroid/preference/Preference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRingtoneLookupRunnable:Ljava/lang/Runnable;

.field private mRingtonePreference:Landroid/preference/Preference;

.field private mSoundEffects:Landroid/preference/CheckBoxPreference;

.field private mSoundSettings:Landroid/preference/PreferenceGroup;

.field private mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 79
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "ringtone"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "dtmf_tone"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "category_calls_and_notification"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "emergency_tone"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "vibrate_when_ringing"

    aput-object v2, v0, v1

    sput-object v0, Lcom/jellybyn/settings/SoundSettings;->NEED_VOICE_CAPABILITY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;-><init>()V

    .line 105
    new-instance v0, Lcom/jellybyn/settings/SoundSettings$1;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/SoundSettings$1;-><init>(Lcom/jellybyn/settings/SoundSettings;)V

    iput-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mHandler:Landroid/os/Handler;

    .line 118
    new-instance v0, Lcom/jellybyn/settings/SoundSettings$2;

    invoke-direct {v0, p0}, Lcom/jellybyn/settings/SoundSettings$2;-><init>(Lcom/jellybyn/settings/SoundSettings;)V

    iput-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/jellybyn/settings/SoundSettings;)Landroid/preference/Preference;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/SoundSettings;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mRingtonePreference:Landroid/preference/Preference;

    return-object v0
.end method

.method static synthetic access$100(Lcom/jellybyn/settings/SoundSettings;)Landroid/preference/Preference;
    .locals 1
    .param p0, "x0"    # Lcom/jellybyn/settings/SoundSettings;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mNotificationPreference:Landroid/preference/Preference;

    return-object v0
.end method

.method static synthetic access$200(Lcom/jellybyn/settings/SoundSettings;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/SoundSettings;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/jellybyn/settings/SoundSettings;->handleDockChange(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$300(Lcom/jellybyn/settings/SoundSettings;ILandroid/preference/Preference;I)V
    .locals 0
    .param p0, "x0"    # Lcom/jellybyn/settings/SoundSettings;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/preference/Preference;
    .param p3, "x3"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3}, Lcom/jellybyn/settings/SoundSettings;->updateRingtoneName(ILandroid/preference/Preference;I)V

    return-void
.end method

.method private createUndockedMessage()Landroid/app/Dialog;
    .locals 3

    .prologue
    .line 438
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 439
    .local v0, "ab":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f0b02b7

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 440
    const v1, 0x7f0b02b8

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 441
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 442
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method private handleDockChange(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 386
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    if-eqz v3, :cond_0

    .line 387
    const-string v3, "android.intent.extra.DOCK_STATE"

    invoke-virtual {p1, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 389
    .local v0, "dockState":I
    const-string v3, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    if-eqz v3, :cond_1

    move v1, v4

    .line 392
    .local v1, "isBluetooth":Z
    :goto_0
    iput-object p1, p0, Lcom/jellybyn/settings/SoundSettings;->mDockIntent:Landroid/content/Intent;

    .line 394
    if-eqz v0, :cond_6

    .line 397
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p0, v3}, Lcom/jellybyn/settings/SoundSettings;->removeDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 402
    :goto_1
    if-eqz v1, :cond_2

    .line 403
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 427
    .end local v0    # "dockState":I
    .end local v1    # "isBluetooth":Z
    :cond_0
    :goto_2
    return-void

    .restart local v0    # "dockState":I
    :cond_1
    move v1, v5

    .line 389
    goto :goto_0

    .line 405
    .restart local v1    # "isBluetooth":Z
    :cond_2
    const/4 v3, 0x3

    if-ne v0, v3, :cond_5

    .line 406
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 407
    .local v2, "resolver":Landroid/content/ContentResolver;
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 408
    const-string v3, "dock_audio_media_enabled"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v6, :cond_3

    .line 410
    const-string v3, "dock_audio_media_enabled"

    invoke-static {v2, v3, v5}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 413
    :cond_3
    const-string v3, "dock_audio_media_enabled"

    invoke-virtual {p0, v3}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

    .line 415
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v5}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 416
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

    const-string v6, "dock_audio_media_enabled"

    invoke-static {v2, v6, v5}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-eqz v6, :cond_4

    :goto_3
    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_2

    :cond_4
    move v4, v5

    goto :goto_3

    .line 420
    .end local v2    # "resolver":Landroid/content/ContentResolver;
    :cond_5
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_2

    .line 424
    :cond_6
    iget-object v3, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_2

    .line 398
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private initDockSettings()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 368
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 370
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-direct {p0}, Lcom/jellybyn/settings/SoundSettings;->needsDockSettings()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 371
    const-string v1, "dock_sounds"

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    iput-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mDockSounds:Landroid/preference/CheckBoxPreference;

    .line 372
    iget-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mDockSounds:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 373
    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mDockSounds:Landroid/preference/CheckBoxPreference;

    const-string v1, "dock_sounds_enabled"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 375
    const-string v1, "dock_audio"

    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    .line 376
    iget-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 383
    :goto_1
    return-void

    :cond_0
    move v1, v3

    .line 373
    goto :goto_0

    .line 378
    :cond_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v3, "dock_category"

    invoke-virtual {p0, v3}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 379
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v3, "dock_audio"

    invoke-virtual {p0, v3}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 380
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v3, "dock_sounds"

    invoke-virtual {p0, v3}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 381
    const-string v1, "dock_audio_media_enabled"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1
.end method

.method private lookupRingtoneNames()V
    .locals 2

    .prologue
    .line 277
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mRingtoneLookupRunnable:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 278
    return-void
.end method

.method private needsDockSettings()Z
    .locals 2

    .prologue
    .line 364
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f090000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method private updateRingtoneName(ILandroid/preference/Preference;I)V
    .locals 9
    .param p1, "type"    # I
    .param p2, "preference"    # Landroid/preference/Preference;
    .param p3, "msg"    # I

    .prologue
    .line 250
    if-nez p2, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 251
    :cond_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    .line 252
    .local v6, "context":Landroid/content/Context;
    if-eqz v6, :cond_0

    .line 253
    invoke-static {v6, p1}, Landroid/media/RingtoneManager;->getActualDefaultRingtoneUri(Landroid/content/Context;I)Landroid/net/Uri;

    move-result-object v1

    .line 254
    .local v1, "ringtoneUri":Landroid/net/Uri;
    const v0, 0x104042e

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 256
    .local v8, "summary":Ljava/lang/CharSequence;
    if-nez v1, :cond_3

    .line 257
    const v0, 0x104042c

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 273
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/jellybyn/settings/SoundSettings;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, p3, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 261
    :cond_3
    :try_start_0
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 263
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_2

    .line 264
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 265
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 267
    :cond_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 269
    .end local v7    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method protected getHelpResource()I
    .locals 1

    .prologue
    .line 360
    const v0, 0x7f0b06ff

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 15
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 131
    invoke-super/range {p0 .. p1}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 132
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 133
    .local v9, "resolver":Landroid/content/ContentResolver;
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v12

    invoke-virtual {v12}, Landroid/telephony/TelephonyManager;->getCurrentPhoneType()I

    move-result v0

    .line 135
    .local v0, "activePhoneType":I
    const-string v12, "audio"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/media/AudioManager;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mAudioManager:Landroid/media/AudioManager;

    .line 137
    const v12, 0x7f050026

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->addPreferencesFromResource(I)V

    .line 139
    const/4 v12, 0x2

    if-eq v12, v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    const-string v13, "emergency_tone"

    invoke-virtual {p0, v13}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f090001

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v12

    if-nez v12, :cond_1

    .line 145
    const-string v12, "ring_volume"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    .line 148
    :cond_1
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x111004f

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 150
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    const-string v13, "ring_volume"

    invoke-virtual {p0, v13}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 153
    :cond_2
    const-string v12, "vibrate_when_ringing"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;

    .line 154
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 155
    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;

    const-string v12, "vibrate_when_ringing"

    const/4 v14, 0x0

    invoke-static {v9, v12, v14}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_8

    const/4 v12, 0x1

    :goto_0
    invoke-virtual {v13, v12}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 158
    const-string v12, "dtmf_tone"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mDtmfTone:Landroid/preference/CheckBoxPreference;

    .line 159
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mDtmfTone:Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 160
    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mDtmfTone:Landroid/preference/CheckBoxPreference;

    const-string v12, "dtmf_tone"

    const/4 v14, 0x1

    invoke-static {v9, v12, v14}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_9

    const/4 v12, 0x1

    :goto_1
    invoke-virtual {v13, v12}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 162
    const-string v12, "sound_effects"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    .line 163
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 164
    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    const-string v12, "sound_effects_enabled"

    const/4 v14, 0x1

    invoke-static {v9, v12, v14}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_a

    const/4 v12, 0x1

    :goto_2
    invoke-virtual {v13, v12}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 166
    const-string v12, "haptic_feedback"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mHapticFeedback:Landroid/preference/CheckBoxPreference;

    .line 167
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mHapticFeedback:Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 168
    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mHapticFeedback:Landroid/preference/CheckBoxPreference;

    const-string v12, "haptic_feedback_enabled"

    const/4 v14, 0x1

    invoke-static {v9, v12, v14}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_b

    const/4 v12, 0x1

    :goto_3
    invoke-virtual {v13, v12}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 170
    const-string v12, "lock_sounds"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/CheckBoxPreference;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mLockSounds:Landroid/preference/CheckBoxPreference;

    .line 171
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mLockSounds:Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 172
    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mLockSounds:Landroid/preference/CheckBoxPreference;

    const-string v12, "lockscreen_sounds_enabled"

    const/4 v14, 0x1

    invoke-static {v9, v12, v14}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    if-eqz v12, :cond_c

    const/4 v12, 0x1

    :goto_4
    invoke-virtual {v13, v12}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 175
    const-string v12, "ringtone"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mRingtonePreference:Landroid/preference/Preference;

    .line 176
    const-string v12, "notification_sound"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mNotificationPreference:Landroid/preference/Preference;

    .line 178
    const-string v12, "vibrator"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/os/Vibrator;

    .line 179
    .local v11, "vibrator":Landroid/os/Vibrator;
    if-eqz v11, :cond_3

    invoke-virtual {v11}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v12

    if-nez v12, :cond_4

    .line 180
    :cond_3
    const-string v12, "vibrate_when_ringing"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->removePreference(Ljava/lang/String;)V

    .line 181
    const-string v12, "haptic_feedback"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->removePreference(Ljava/lang/String;)V

    .line 184
    :cond_4
    const/4 v12, 0x2

    if-ne v12, v0, :cond_5

    .line 185
    const-string v12, "emergency_tone"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    .line 187
    .local v2, "emergencyTonePreference":Landroid/preference/ListPreference;
    const-string v12, "emergency_tone"

    const/4 v13, 0x0

    invoke-static {v9, v12, v13}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 189
    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 192
    .end local v2    # "emergencyTonePreference":Landroid/preference/ListPreference;
    :cond_5
    const-string v12, "sound_settings"

    invoke-virtual {p0, v12}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/PreferenceGroup;

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundSettings:Landroid/preference/PreferenceGroup;

    .line 194
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundSettings:Landroid/preference/PreferenceGroup;

    const-string v13, "musicfx"

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mMusicFx:Landroid/preference/Preference;

    .line 195
    new-instance v3, Landroid/content/Intent;

    const-string v12, "android.media.action.DISPLAY_AUDIO_EFFECT_CONTROL_PANEL"

    invoke-direct {v3, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 196
    .local v3, "i":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 197
    .local v6, "p":Landroid/content/pm/PackageManager;
    const/16 v12, 0x200

    invoke-virtual {v6, v3, v12}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v10

    .line 198
    .local v10, "ris":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    const/4 v13, 0x2

    if-gt v12, v13, :cond_6

    .line 204
    iget-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundSettings:Landroid/preference/PreferenceGroup;

    iget-object v13, p0, Lcom/jellybyn/settings/SoundSettings;->mMusicFx:Landroid/preference/Preference;

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 207
    :cond_6
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v12

    invoke-static {v12}, Lcom/jellybyn/settings/Utils;->isVoiceCapable(Landroid/content/Context;)Z

    move-result v12

    if-nez v12, :cond_d

    .line 208
    sget-object v1, Lcom/jellybyn/settings/SoundSettings;->NEED_VOICE_CAPABILITY:[Ljava/lang/String;

    .local v1, "arr$":[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_5
    if-ge v4, v5, :cond_d

    aget-object v8, v1, v4

    .line 209
    .local v8, "prefKey":Ljava/lang/String;
    invoke-virtual {p0, v8}, Lcom/jellybyn/settings/SoundSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    .line 210
    .local v7, "pref":Landroid/preference/Preference;
    if-eqz v7, :cond_7

    .line 211
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    invoke-virtual {v12, v7}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 208
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 155
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v3    # "i":Landroid/content/Intent;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "p":Landroid/content/pm/PackageManager;
    .end local v7    # "pref":Landroid/preference/Preference;
    .end local v8    # "prefKey":Ljava/lang/String;
    .end local v10    # "ris":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v11    # "vibrator":Landroid/os/Vibrator;
    :cond_8
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 160
    :cond_9
    const/4 v12, 0x0

    goto/16 :goto_1

    .line 164
    :cond_a
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 168
    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 172
    :cond_c
    const/4 v12, 0x0

    goto/16 :goto_4

    .line 216
    .restart local v3    # "i":Landroid/content/Intent;
    .restart local v6    # "p":Landroid/content/pm/PackageManager;
    .restart local v10    # "ris":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v11    # "vibrator":Landroid/os/Vibrator;
    :cond_d
    new-instance v12, Lcom/jellybyn/settings/SoundSettings$3;

    invoke-direct {v12, p0}, Lcom/jellybyn/settings/SoundSettings$3;-><init>(Lcom/jellybyn/settings/SoundSettings;)V

    iput-object v12, p0, Lcom/jellybyn/settings/SoundSettings;->mRingtoneLookupRunnable:Ljava/lang/Runnable;

    .line 229
    invoke-direct {p0}, Lcom/jellybyn/settings/SoundSettings;->initDockSettings()V

    .line 230
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 431
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 432
    invoke-direct {p0}, Lcom/jellybyn/settings/SoundSettings;->createUndockedMessage()Landroid/app/Dialog;

    move-result-object v0

    .line 434
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 244
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPause()V

    .line 246
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/jellybyn/settings/SoundSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 247
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "objValue"    # Ljava/lang/Object;

    .prologue
    .line 344
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 345
    .local v1, "key":Ljava/lang/String;
    const-string v3, "emergency_tone"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 347
    :try_start_0
    check-cast p2, Ljava/lang/String;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 348
    .local v2, "value":I
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "emergency_tone"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 355
    .end local v2    # "value":I
    :cond_0
    :goto_0
    const/4 v3, 0x1

    return v3

    .line 350
    :catch_0
    move-exception v0

    .line 351
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v3, "SoundSettings"

    const-string v4, "could not persist emergency tone setting"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 282
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_3

    .line 283
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "vibrate_when_ringing"

    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mVibrateWhenRinging:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v3, v4, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_0
    :goto_1
    move v2, v1

    .line 340
    :cond_1
    return v2

    :cond_2
    move v0, v2

    .line 283
    goto :goto_0

    .line 285
    :cond_3
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDtmfTone:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_5

    .line 286
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "dtmf_tone"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mDtmfTone:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_4

    move v2, v1

    :cond_4
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    .line 289
    :cond_5
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_8

    .line 290
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 291
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->loadSoundEffects()V

    .line 295
    :goto_2
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "sound_effects_enabled"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mSoundEffects:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_6

    move v2, v1

    :cond_6
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    .line 293
    :cond_7
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->unloadSoundEffects()V

    goto :goto_2

    .line 298
    :cond_8
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mHapticFeedback:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_a

    .line 299
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "haptic_feedback_enabled"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mHapticFeedback:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_9

    move v2, v1

    :cond_9
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    .line 302
    :cond_a
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mLockSounds:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_c

    .line 303
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "lockscreen_sounds_enabled"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mLockSounds:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_b

    move v2, v1

    :cond_b
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    .line 306
    :cond_c
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mMusicFx:Landroid/preference/Preference;

    if-eq p2, v0, :cond_1

    .line 309
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    if-ne p2, v0, :cond_12

    .line 310
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockIntent:Landroid/content/Intent;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockIntent:Landroid/content/Intent;

    const-string v3, "android.intent.extra.DOCK_STATE"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 314
    :goto_3
    if-nez v0, :cond_e

    .line 315
    invoke-virtual {p0, v1}, Lcom/jellybyn/settings/SoundSettings;->showDialog(I)V

    goto/16 :goto_1

    :cond_d
    move v0, v2

    .line 310
    goto :goto_3

    .line 317
    :cond_e
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockIntent:Landroid/content/Intent;

    const-string v3, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_f

    move v0, v1

    .line 319
    :goto_4
    if-eqz v0, :cond_10

    .line 320
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/jellybyn/settings/SoundSettings;->mDockIntent:Landroid/content/Intent;

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 321
    const-string v2, "com.jellybyn.settings.bluetooth.action.DOCK_SHOW_UI"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 322
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/jellybyn/settings/bluetooth/DockEventReceiver;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 323
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    :cond_f
    move v0, v2

    .line 317
    goto :goto_4

    .line 325
    :cond_10
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioSettings:Landroid/preference/Preference;

    check-cast v0, Landroid/preference/PreferenceScreen;

    .line 326
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 327
    const-string v4, "checked"

    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "dock_audio_media_enabled"

    invoke-static {v5, v6, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v1, :cond_11

    move v2, v1

    :cond_11
    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 330
    invoke-super {p0, v0, v0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    goto/16 :goto_1

    .line 333
    :cond_12
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockSounds:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_14

    .line 334
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "dock_sounds_enabled"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mDockSounds:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_13

    move v2, v1

    :cond_13
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_1

    .line 336
    :cond_14
    iget-object v0, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_0

    .line 337
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "dock_audio_media_enabled"

    iget-object v4, p0, Lcom/jellybyn/settings/SoundSettings;->mDockAudioMediaEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_15

    move v2, v1

    :cond_15
    invoke-static {v0, v3, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_1
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 234
    invoke-super {p0}, Lcom/jellybyn/settings/SettingsPreferenceFragment;->onResume()V

    .line 236
    invoke-direct {p0}, Lcom/jellybyn/settings/SoundSettings;->lookupRingtoneNames()V

    .line 238
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.DOCK_EVENT"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 239
    .local v0, "filter":Landroid/content/IntentFilter;
    invoke-virtual {p0}, Lcom/jellybyn/settings/SoundSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/jellybyn/settings/SoundSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 240
    return-void
.end method
