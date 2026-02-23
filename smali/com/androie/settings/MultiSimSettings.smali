.class public Lcom/androie/settings/MultiSimSettings;
.super Landroid/preference/PreferenceActivity;
.source "MultiSimSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;
    }
.end annotation


# instance fields
.field private entries:[Ljava/lang/CharSequence;

.field private entriesPrompt:[Ljava/lang/CharSequence;

.field private entryValues:[Ljava/lang/CharSequence;

.field private entryValuesPrompt:[Ljava/lang/CharSequence;

.field private mConfigSub:Landroid/preference/PreferenceScreen;

.field private mData:Landroid/preference/ListPreference;

.field private mHandler:Landroid/os/Handler;

.field protected mIsForeground:Z

.field private mNumPhones:I

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPrioritySub:Landroid/preference/ListPreference;

.field private mPrioritySubValue:I

.field private mSms:Landroid/preference/ListPreference;

.field private mTuneAway:Landroid/preference/CheckBoxPreference;

.field private mTuneAwayValue:Z

.field private mVoice:Landroid/preference/ListPreference;

.field private mVoiceSub:I

.field subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

.field private summaries:[Ljava/lang/CharSequence;

.field private summariesPrompt:[Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 92
    iput-boolean v1, p0, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    .line 100
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v0

    iput v0, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    .line 109
    iput-boolean v1, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAwayValue:Z

    .line 111
    iput v1, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySubValue:I

    .line 113
    iput v1, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 119
    invoke-static {}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getInstance()Lcom/codeaurora/telephony/msim/SubscriptionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    .line 480
    new-instance v0, Lcom/androie/settings/MultiSimSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/MultiSimSettings$1;-><init>(Lcom/androie/settings/MultiSimSettings;)V

    iput-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/MultiSimSettings;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->isAirplaneModeOn()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateTuneAwayState()V

    return-void
.end method

.method static synthetic access$1100(Lcom/androie/settings/MultiSimSettings;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-boolean v0, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAwayValue:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/CheckBoxPreference;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/androie/settings/MultiSimSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;
    .param p1, "x1"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/androie/settings/MultiSimSettings;->updatePrioritySub(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updatePrioritySubState()V

    return-void
.end method

.method static synthetic access$1500(Lcom/androie/settings/MultiSimSettings;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget v0, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySubValue:I

    return v0
.end method

.method static synthetic access$1600(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/PreferenceScreen;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mConfigSub:Landroid/preference/PreferenceScreen;

    return-object v0
.end method

.method static synthetic access$300(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateDataSummary()V

    return-void
.end method

.method static synthetic access$400(Lcom/androie/settings/MultiSimSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;
    .param p1, "x1"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/androie/settings/MultiSimSettings;->updateVoiceSub(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    return-object v0
.end method

.method static synthetic access$600(Lcom/androie/settings/MultiSimSettings;)[Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$700(Lcom/androie/settings/MultiSimSettings;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    iget v0, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    return v0
.end method

.method static synthetic access$702(Lcom/androie/settings/MultiSimSettings;I)I
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;
    .param p1, "x1"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    return p1
.end method

.method static synthetic access$800(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateSmsSummary()V

    return-void
.end method

.method static synthetic access$900(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/MultiSimSettings;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateTuneAwayStatus()V

    return-void
.end method

.method private isAirplaneModeOn()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 272
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private updateDataSummary()V
    .locals 4

    .prologue
    .line 306
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v0

    .line 308
    .local v0, "dataSub":I
    const-string v1, "MultiSimSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDataSummary: Data Subscription : = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 310
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 311
    return-void
.end method

.method private updatePrioritySub(I)V
    .locals 4
    .param p1, "priorityIndex"    # I

    .prologue
    .line 467
    const-string v1, "MultiSimSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updatePrioritySub change priority sub to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x9

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 470
    .local v0, "setPrioritySubMsg":Landroid/os/Message;
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, v0}, Lcom/android/internal/telephony/Phone;->setPrioritySub(ILandroid/os/Message;)V

    .line 471
    return-void
.end method

.method private updatePrioritySubState()V
    .locals 4

    .prologue
    .line 250
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 251
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 254
    :try_start_0
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "multi_sim_priority"

    invoke-static {v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v0

    .line 256
    .local v0, "priorityValue":I
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 257
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 258
    iput v0, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySubValue:I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    .end local v0    # "priorityValue":I
    :goto_0
    return-void

    .line 260
    :catch_0
    move-exception v1

    .line 261
    .local v1, "snfe":Landroid/provider/Settings$SettingNotFoundException;
    const-string v2, "MultiSimSettings"

    const-string v3, "Settings Exception Reading Dual Sim Priority Subscription Values"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateSmsSummary()V
    .locals 7

    .prologue
    .line 314
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getSMSSubscription()I

    move-result v2

    .line 315
    .local v2, "smsSub":I
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->isSMSPromptEnabled()Z

    move-result v1

    .line 316
    .local v1, "promptEnabled":Z
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v4}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getActiveSubscriptionsCount()I

    move-result v0

    .line 318
    .local v0, "count":I
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateSmsSummary: SmsSub =  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " promptEnabled = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " number of active SUBs = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    if-eqz v1, :cond_0

    const/4 v4, 0x2

    if-lt v0, v4, :cond_0

    .line 323
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "prompt is enabled: setting value to : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget v5, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 325
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    iget v6, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 332
    :goto_0
    return-void

    .line 327
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 328
    .local v3, "sub":Ljava/lang/String;
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setting value to : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    invoke-virtual {v4, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 330
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v5, v5, v2

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updateState()V
    .locals 0

    .prologue
    .line 277
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateVoiceSummary()V

    .line 278
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateDataSummary()V

    .line 279
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateSmsSummary()V

    .line 280
    return-void
.end method

.method private updateTuneAwayState()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 241
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "tune_away"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 243
    .local v1, "tuneAwayStatus":Z
    :goto_0
    if-eqz v1, :cond_1

    const v0, 0x7f080355

    .line 245
    .local v0, "resId":I
    :goto_1
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 246
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 247
    return-void

    .end local v0    # "resId":I
    .end local v1    # "tuneAwayStatus":Z
    :cond_0
    move v1, v2

    .line 241
    goto :goto_0

    .line 243
    .restart local v1    # "tuneAwayStatus":Z
    :cond_1
    const v0, 0x7f080356

    goto :goto_1
.end method

.method private updateTuneAwayStatus()V
    .locals 5

    .prologue
    .line 459
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    .line 460
    .local v1, "tuneAwayValue":Z
    iput-boolean v1, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAwayValue:Z

    .line 461
    const-string v2, "MultiSimSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " updateTuneAwayStatus change tuneAwayValue to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x7

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 463
    .local v0, "setTuneAwayMsg":Landroid/os/Message;
    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2, v1, v0}, Lcom/android/internal/telephony/Phone;->setTuneAway(ZLandroid/os/Message;)V

    .line 464
    return-void
.end method

.method private updateVoiceSub(I)V
    .locals 4
    .param p1, "subIndex"    # I

    .prologue
    .line 474
    const-string v1, "MultiSimSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateVoiceSub change voice sub to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 477
    .local v0, "setVoiceSubMsg":Landroid/os/Message;
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, v0}, Lcom/android/internal/telephony/Phone;->setDefaultVoiceSub(ILandroid/os/Message;)V

    .line 478
    return-void
.end method

.method private updateVoiceSummary()V
    .locals 7

    .prologue
    .line 284
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getVoiceSubscription()I

    move-result v3

    .line 285
    .local v3, "voiceSub":I
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->isPromptEnabled()Z

    move-result v1

    .line 286
    .local v1, "promptEnabled":Z
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v4}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getActiveSubscriptionsCount()I

    move-result v0

    .line 288
    .local v0, "count":I
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateVoiceSummary: voiceSub =  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " promptEnabled = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " number of active SUBs = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    if-eqz v1, :cond_0

    const/4 v4, 0x2

    if-lt v0, v4, :cond_0

    .line 294
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "prompt is enabled: setting value to : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget v5, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 296
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    iget v6, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 303
    :goto_0
    return-void

    .line 298
    :cond_0
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 299
    .local v2, "sub":Ljava/lang/String;
    const-string v4, "MultiSimSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setting value to : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    invoke-virtual {v4, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 301
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method displayAlertDialog(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 445
    iget-boolean v0, p0, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    if-nez v0, :cond_0

    .line 446
    const-string v0, "MultiSimSettings"

    const-string v1, "The activitiy is not in foreground. Do not display dialog!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    :goto_0
    return-void

    .line 449
    :cond_0
    const-string v0, "MultiSimSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "displayErrorDialog!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040014

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1040013

    invoke-virtual {v0, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 441
    const-string v0, "MultiSimSettings"

    const-string v1, "onClick!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    .line 122
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 124
    const v4, 0x7f050025

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->addPreferencesFromResource(I)V

    .line 126
    const-string v4, "voice"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    .line 127
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 128
    const-string v4, "data"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    .line 129
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 130
    const-string v4, "sms"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    .line 131
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 132
    const-string v4, "config_sub"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceScreen;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mConfigSub:Landroid/preference/PreferenceScreen;

    .line 133
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mConfigSub:Landroid/preference/PreferenceScreen;

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "CONFIG_SUB"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 134
    const-string v4, "tune_away"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    .line 135
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mTuneAway:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 136
    const-string v4, "priority_subscription"

    invoke-virtual {p0, v4}, Lcom/androie/settings/MultiSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    .line 137
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySub:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 138
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 140
    const/4 v2, 0x0

    .local v2, "subId":I
    :goto_0
    sget v4, Lcom/codeaurora/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v2, v4, :cond_0

    .line 141
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x2

    invoke-virtual {v4, v2, v5, v6, v7}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 143
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    iget-object v5, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x3

    invoke-virtual {v4, v2, v5, v6, v7}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 140
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 152
    :cond_0
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    .line 153
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    .line 154
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    .line 155
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entriesPrompt:[Ljava/lang/CharSequence;

    .line 156
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entryValuesPrompt:[Ljava/lang/CharSequence;

    .line 157
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Ljava/lang/CharSequence;

    iput-object v4, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    .line 158
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0051

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v3

    .line 159
    .local v3, "subString":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 160
    .local v0, "i":I
    const/4 v0, 0x0

    :goto_1
    iget v4, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    if-ge v0, v4, :cond_1

    .line 161
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    aget-object v5, v3, v0

    aput-object v5, v4, v0

    .line 162
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v5, v3, v0

    aput-object v5, v4, v0

    .line 163
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    aget-object v5, v3, v0

    aput-object v5, v4, v0

    .line 164
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entriesPrompt:[Ljava/lang/CharSequence;

    aget-object v5, v3, v0

    aput-object v5, v4, v0

    .line 165
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    .line 166
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entryValuesPrompt:[Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    .line 160
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 168
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entryValuesPrompt:[Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    .line 169
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->entriesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f080030

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    .line 170
    iget-object v4, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f080352

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    .line 171
    new-instance v1, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 173
    .local v1, "intentFilter":Landroid/content/IntentFilter;
    new-instance v4, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;

    invoke-direct {v4, p0, v7}, Lcom/androie/settings/MultiSimSettings$AirplaneModeBroadcastReceiver;-><init>(Lcom/androie/settings/MultiSimSettings;Lcom/androie/settings/MultiSimSettings$1;)V

    invoke-virtual {p0, v4, v1}, Lcom/androie/settings/MultiSimSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 174
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 413
    const/16 v1, 0x64

    if-ne p1, v1, :cond_0

    .line 414
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 416
    .local v0, "dialog":Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08034b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 417
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 418
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 422
    .end local v0    # "dialog":Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 436
    const-string v0, "MultiSimSettings"

    const-string v1, "onDismiss!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 267
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 268
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    .line 269
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 13
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "objValue"    # Ljava/lang/Object;

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 335
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 337
    .local v1, "key":Ljava/lang/String;
    const-string v7, "MultiSimSettings"

    const-string v8, "onPreferenceChange:::: "

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    const-string v7, "voice"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-object v7, p2

    .line 341
    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    .line 342
    iget v7, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    iget v8, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    if-ne v7, v8, :cond_6

    .line 344
    invoke-static {v11}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setPromptEnabled(Z)V

    .line 345
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    iget v9, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    aget-object v8, v8, v9

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 346
    const-string v7, "MultiSimSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "prompt is enabled "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    :cond_0
    :goto_0
    const-string v7, "data"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v7, p2

    .line 360
    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 361
    .local v0, "dataSub":I
    const-string v7, "MultiSimSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setDataSubscription "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    iget-boolean v7, p0, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    if-eqz v7, :cond_1

    .line 363
    const/16 v7, 0x64

    invoke-virtual {p0, v7}, Lcom/androie/settings/MultiSimSettings;->showDialog(I)V

    .line 365
    :cond_1
    invoke-static {}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getInstance()Lcom/codeaurora/telephony/msim/SubscriptionManager;

    move-result-object v2

    .line 366
    .local v2, "mSubscriptionManager":Lcom/codeaurora/telephony/msim/SubscriptionManager;
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v8, 0x0

    invoke-static {v7, v11, v8}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 367
    .local v4, "setDdsMsg":Landroid/os/Message;
    invoke-virtual {v2, v0, v4}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->setDataSubscription(ILandroid/os/Message;)V

    .line 370
    .end local v0    # "dataSub":I
    .end local v2    # "mSubscriptionManager":Lcom/codeaurora/telephony/msim/SubscriptionManager;
    .end local v4    # "setDdsMsg":Landroid/os/Message;
    :cond_2
    const-string v7, "sms"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    move-object v7, p2

    .line 371
    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 372
    .local v5, "smsSub":I
    iget v7, p0, Lcom/androie/settings/MultiSimSettings;->mNumPhones:I

    if-ne v5, v7, :cond_8

    .line 374
    invoke-static {v11}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setSMSPromptEnabled(Z)V

    .line 375
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->summariesPrompt:[Ljava/lang/CharSequence;

    aget-object v8, v8, v5

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 376
    const-string v7, "MultiSimSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "prompt is enabled "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    :goto_1
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v9, 0x5

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 390
    .end local v5    # "smsSub":I
    :cond_3
    const-string v7, "tune_away"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 391
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v9, 0x6

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 394
    :cond_4
    const-string v7, "priority_subscription"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 395
    check-cast p2, Ljava/lang/String;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 396
    .local v3, "prioritySubIndex":I
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v7, v3}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/codeaurora/telephony/msim/Subscription;

    move-result-object v7

    iget-object v7, v7, Lcom/codeaurora/telephony/msim/Subscription;->subStatus:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_a

    .line 398
    iput v3, p0, Lcom/androie/settings/MultiSimSettings;->mPrioritySubValue:I

    .line 399
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/16 v9, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 407
    .end local v3    # "prioritySubIndex":I
    :cond_5
    :goto_2
    return v11

    .line 347
    .restart local p2    # "objValue":Ljava/lang/Object;
    :cond_6
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    iget v8, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    invoke-virtual {v7, v8}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/codeaurora/telephony/msim/Subscription;

    move-result-object v7

    iget-object v7, v7, Lcom/codeaurora/telephony/msim/Subscription;->subStatus:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_7

    .line 349
    const-string v7, "MultiSimSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setVoiceSubscription "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    invoke-static {v12}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setPromptEnabled(Z)V

    .line 351
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->mHandler:Landroid/os/Handler;

    const/4 v9, 0x4

    iget v10, p0, Lcom/androie/settings/MultiSimSettings;->mVoiceSub:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 354
    :cond_7
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f080350

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 355
    .local v6, "status":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/androie/settings/MultiSimSettings;->displayAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 377
    .end local v6    # "status":Ljava/lang/String;
    .restart local v5    # "smsSub":I
    :cond_8
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v7, v5}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/codeaurora/telephony/msim/Subscription;

    move-result-object v7

    iget-object v7, v7, Lcom/codeaurora/telephony/msim/Subscription;->subStatus:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/codeaurora/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_9

    .line 379
    const-string v7, "MultiSimSettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setSMSSubscription "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    invoke-static {v12}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setSMSPromptEnabled(Z)V

    .line 381
    invoke-static {v5}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setSMSSubscription(I)V

    .line 382
    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings;->summaries:[Ljava/lang/CharSequence;

    aget-object v8, v8, v5

    invoke-virtual {v7, v8}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 384
    :cond_9
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f08034f

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 385
    .restart local v6    # "status":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/androie/settings/MultiSimSettings;->displayAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 402
    .end local v5    # "smsSub":I
    .end local v6    # "status":Ljava/lang/String;
    .end local p2    # "objValue":Ljava/lang/Object;
    .restart local v3    # "prioritySubIndex":I
    :cond_a
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f080351

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 403
    .restart local v6    # "status":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/androie/settings/MultiSimSettings;->displayAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 427
    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    .line 430
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 432
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 178
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 179
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->isAirplaneModeOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    const-string v0, "MultiSimSettings"

    const-string v1, "Airplane mode is ON, grayout the config subscription menu!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mConfigSub:Landroid/preference/PreferenceScreen;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 185
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->updateMultiSimEntriesForVoice()V

    .line 186
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->updateMultiSimEntriesForData()V

    .line 187
    invoke-virtual {p0}, Lcom/androie/settings/MultiSimSettings;->updateMultiSimEntriesForSms()V

    .line 188
    iput-boolean v2, p0, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    .line 189
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateState()V

    .line 190
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updateTuneAwayState()V

    .line 191
    invoke-direct {p0}, Lcom/androie/settings/MultiSimSettings;->updatePrioritySubState()V

    .line 192
    return-void

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mConfigSub:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    goto :goto_0
.end method

.method protected updateMultiSimEntriesForData()V
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 215
    iget-object v0, p0, Lcom/androie/settings/MultiSimSettings;->mData:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 216
    return-void
.end method

.method protected updateMultiSimEntriesForSms()V
    .locals 3

    .prologue
    .line 219
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v1}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getActiveSubscriptionsCount()I

    move-result v0

    .line 220
    .local v0, "count":I
    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 221
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entriesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 222
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entryValuesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 227
    :goto_0
    return-void

    .line 224
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 225
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mSms:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected updateMultiSimEntriesForVoice()V
    .locals 3

    .prologue
    .line 230
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->subManager:Lcom/codeaurora/telephony/msim/SubscriptionManager;

    invoke-virtual {v1}, Lcom/codeaurora/telephony/msim/SubscriptionManager;->getActiveSubscriptionsCount()I

    move-result v0

    .line 231
    .local v0, "count":I
    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entriesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 233
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entryValuesPrompt:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 238
    :goto_0
    return-void

    .line 235
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entries:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 236
    iget-object v1, p0, Lcom/androie/settings/MultiSimSettings;->mVoice:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/androie/settings/MultiSimSettings;->entryValues:[Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
