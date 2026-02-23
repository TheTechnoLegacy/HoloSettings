.class Lcom/androie/settings/MultiSimSettings$1;
.super Landroid/os/Handler;
.source "MultiSimSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/MultiSimSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/MultiSimSettings;


# direct methods
.method constructor <init>(Lcom/androie/settings/MultiSimSettings;)V
    .locals 0

    .prologue
    .line 480
    iput-object p1, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v9, 0x1

    .line 485
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_0

    .line 581
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown Event "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    :goto_0
    return-void

    .line 487
    :pswitch_0
    const-string v6, "MultiSimSettings"

    const-string v7, "EVENT_SET_DATA_SUBSCRIPTION_DONE"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    iget-boolean v6, v6, Lcom/androie/settings/MultiSimSettings;->mIsForeground:Z

    if-eqz v6, :cond_0

    .line 489
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    const/16 v7, 0x64

    invoke-virtual {v6, v7}, Lcom/androie/settings/MultiSimSettings;->dismissDialog(I)V

    .line 491
    :cond_0
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 492
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$300(Lcom/androie/settings/MultiSimSettings;)V

    .line 494
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 496
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_1

    .line 497
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v7}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f08034e

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 499
    .local v2, "status":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6, v2}, Lcom/androie/settings/MultiSimSettings;->displayAlertDialog(Ljava/lang/String;)V

    goto :goto_0

    .line 503
    .end local v2    # "status":Ljava/lang/String;
    :cond_1
    iget-object v6, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 505
    .local v1, "result":Z
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SET_DATA_SUBSCRIPTION_DONE: result = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    if-ne v1, v9, :cond_2

    .line 507
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08034c

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 508
    .restart local v2    # "status":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v2, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 510
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 512
    .end local v2    # "status":Ljava/lang/String;
    .end local v4    # "toast":Landroid/widget/Toast;
    :cond_2
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08034d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 513
    .restart local v2    # "status":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6, v2}, Lcom/androie/settings/MultiSimSettings;->displayAlertDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 519
    .end local v0    # "ar":Landroid/os/AsyncResult;
    .end local v1    # "result":Z
    .end local v2    # "status":Ljava/lang/String;
    :pswitch_1
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->updateMultiSimEntriesForVoice()V

    .line 520
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-virtual {v6}, Lcom/androie/settings/MultiSimSettings;->updateMultiSimEntriesForSms()V

    goto/16 :goto_0

    .line 524
    :pswitch_2
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v6, v7}, Lcom/androie/settings/MultiSimSettings;->access$400(Lcom/androie/settings/MultiSimSettings;I)V

    goto/16 :goto_0

    .line 527
    :pswitch_3
    const-string v6, "MultiSimSettings"

    const-string v7, "EVENT_SET_VOICE_SUBSCRIPTION_DONE"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 530
    .restart local v0    # "ar":Landroid/os/AsyncResult;
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_3

    .line 531
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SET_VOICE_SUBSCRIPTION_DONE: returned Exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getVoiceSubscription()I

    move-result v5

    .line 534
    .local v5, "voiceSub":I
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 535
    .local v3, "sub":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$500(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 536
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$500(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v7}, Lcom/androie/settings/MultiSimSettings;->access$600(Lcom/androie/settings/MultiSimSettings;)[Ljava/lang/CharSequence;

    move-result-object v7

    aget-object v7, v7, v5

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 537
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6, v5}, Lcom/androie/settings/MultiSimSettings;->access$702(Lcom/androie/settings/MultiSimSettings;I)I

    goto/16 :goto_0

    .line 540
    .end local v3    # "sub":Ljava/lang/String;
    .end local v5    # "voiceSub":I
    :cond_3
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$700(Lcom/androie/settings/MultiSimSettings;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 541
    .restart local v3    # "sub":Ljava/lang/String;
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$500(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 542
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$500(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v7}, Lcom/androie/settings/MultiSimSettings;->access$600(Lcom/androie/settings/MultiSimSettings;)[Ljava/lang/CharSequence;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v8}, Lcom/androie/settings/MultiSimSettings;->access$700(Lcom/androie/settings/MultiSimSettings;)I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 543
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$700(Lcom/androie/settings/MultiSimSettings;)I

    move-result v6

    invoke-static {v6}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setVoiceSubscription(I)V

    goto/16 :goto_0

    .line 546
    .end local v0    # "ar":Landroid/os/AsyncResult;
    .end local v3    # "sub":Ljava/lang/String;
    :pswitch_4
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$800(Lcom/androie/settings/MultiSimSettings;)V

    goto/16 :goto_0

    .line 549
    :pswitch_5
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$900(Lcom/androie/settings/MultiSimSettings;)V

    goto/16 :goto_0

    .line 552
    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 553
    .restart local v0    # "ar":Landroid/os/AsyncResult;
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_4

    .line 554
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SET_TUNE_AWAY_DONE: returned Exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1000(Lcom/androie/settings/MultiSimSettings;)V

    goto/16 :goto_0

    .line 558
    :cond_4
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SET_TUNE_AWAY_DONE: mTuneAwayValue = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v8}, Lcom/androie/settings/MultiSimSettings;->access$1100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/CheckBoxPreference;

    move-result-object v6

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v7}, Lcom/androie/settings/MultiSimSettings;->access$1100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v7

    invoke-virtual {v6, v7}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 560
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1200(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/CheckBoxPreference;

    move-result-object v7

    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v6

    if-eqz v6, :cond_5

    const-string v6, "Enable"

    :goto_1
    invoke-virtual {v7, v6}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 561
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1100(Lcom/androie/settings/MultiSimSettings;)Z

    move-result v6

    invoke-static {v6}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setTuneAway(Z)V

    goto/16 :goto_0

    .line 560
    :cond_5
    const-string v6, "Disable"

    goto :goto_1

    .line 564
    .end local v0    # "ar":Landroid/os/AsyncResult;
    :pswitch_7
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v6, v7}, Lcom/androie/settings/MultiSimSettings;->access$1300(Lcom/androie/settings/MultiSimSettings;I)V

    goto/16 :goto_0

    .line 567
    :pswitch_8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 568
    .restart local v0    # "ar":Landroid/os/AsyncResult;
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_6

    .line 569
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "EVENT_SET_PRIORITY_SUBSCRIPTION_DONE: returned Exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1400(Lcom/androie/settings/MultiSimSettings;)V

    goto/16 :goto_0

    .line 574
    :cond_6
    const-string v6, "MultiSimSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "EVENT_SET_PRIORITY_SUBSCRIPTION_DONE : mPrioritySubValue "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v8}, Lcom/androie/settings/MultiSimSettings;->access$1500(Lcom/androie/settings/MultiSimSettings;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1600(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v7}, Lcom/androie/settings/MultiSimSettings;->access$1500(Lcom/androie/settings/MultiSimSettings;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 577
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1600(Lcom/androie/settings/MultiSimSettings;)Landroid/preference/ListPreference;

    move-result-object v6

    iget-object v7, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v7}, Lcom/androie/settings/MultiSimSettings;->access$600(Lcom/androie/settings/MultiSimSettings;)[Ljava/lang/CharSequence;

    move-result-object v7

    iget-object v8, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v8}, Lcom/androie/settings/MultiSimSettings;->access$1500(Lcom/androie/settings/MultiSimSettings;)I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 578
    iget-object v6, p0, Lcom/androie/settings/MultiSimSettings$1;->this$0:Lcom/androie/settings/MultiSimSettings;

    invoke-static {v6}, Lcom/androie/settings/MultiSimSettings;->access$1500(Lcom/androie/settings/MultiSimSettings;)I

    move-result v6

    invoke-static {v6}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->setPrioritySubscription(I)V

    goto/16 :goto_0

    .line 485
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_3
    .end packed-switch
.end method
