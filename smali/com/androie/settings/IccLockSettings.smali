.class public Lcom/androie/settings/IccLockSettings;
.super Landroid/preference/PreferenceActivity;
.source "IccLockSettings.java"

# interfaces
.implements Lcom/androie/settings/EditPinPreference$OnPinEnteredListener;


# instance fields
.field private mDialogState:I

.field private mError:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mNewPin:Ljava/lang/String;

.field private mOldPin:Ljava/lang/String;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPin:Ljava/lang/String;

.field private mPinDialog:Lcom/androie/settings/EditPinPreference;

.field private mPinToggle:Landroid/preference/CheckBoxPreference;

.field private mRes:Landroid/content/res/Resources;

.field private final mSimStateReceiver:Landroid/content/BroadcastReceiver;

.field private mToState:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 102
    new-instance v0, Lcom/androie/settings/IccLockSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/IccLockSettings$1;-><init>(Lcom/androie/settings/IccLockSettings;)V

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mHandler:Landroid/os/Handler;

    .line 121
    new-instance v0, Lcom/androie/settings/IccLockSettings$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/IccLockSettings$2;-><init>(Lcom/androie/settings/IccLockSettings;)V

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mSimStateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/IccLockSettings;Landroid/os/AsyncResult;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/IccLockSettings;
    .param p1, "x1"    # Landroid/os/AsyncResult;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/androie/settings/IccLockSettings;->iccLockChanged(Landroid/os/AsyncResult;)V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/IccLockSettings;Landroid/os/AsyncResult;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/IccLockSettings;
    .param p1, "x1"    # Landroid/os/AsyncResult;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/androie/settings/IccLockSettings;->iccPinChanged(Landroid/os/AsyncResult;)V

    return-void
.end method

.method static synthetic access$200(Lcom/androie/settings/IccLockSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/IccLockSettings;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->updatePreferences()V

    return-void
.end method

.method static synthetic access$300(Lcom/androie/settings/IccLockSettings;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/IccLockSettings;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private displayRetryCounter(Ljava/lang/String;)V
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 437
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/IccCard;->getIccPin1RetryCount()I

    move-result v0

    .line 438
    .local v0, "attempts":I
    if-ltz v0, :cond_0

    .line 439
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v4, 0x7f080339

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 440
    .local v1, "displayMsg":Ljava/lang/String;
    invoke-static {p0, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 445
    .end local v1    # "displayMsg":Ljava/lang/String;
    :goto_0
    return-void

    .line 442
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v3, 0x7f080655

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private handleException(Ljava/lang/Throwable;I)V
    .locals 4
    .param p1, "exception"    # Ljava/lang/Throwable;
    .param p2, "requestType"    # I

    .prologue
    const/4 v3, 0x0

    .line 367
    instance-of v2, p1, Lcom/android/internal/telephony/CommandException;

    if-eqz v2, :cond_3

    .line 368
    check-cast p1, Lcom/android/internal/telephony/CommandException;

    .end local p1    # "exception":Ljava/lang/Throwable;
    check-cast p1, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {p1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v0

    .line 369
    .local v0, "err":Lcom/android/internal/telephony/CommandException$Error;
    sget-object v2, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v0, v2, :cond_2

    .line 371
    const/16 v2, 0x64

    if-ne p2, v2, :cond_1

    .line 372
    const v1, 0x7f080338

    .line 376
    .local v1, "id":I
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 383
    .end local v0    # "err":Lcom/android/internal/telephony/CommandException$Error;
    .end local v1    # "id":I
    :cond_0
    :goto_1
    return-void

    .line 374
    .restart local v0    # "err":Lcom/android/internal/telephony/CommandException$Error;
    :cond_1
    const v1, 0x7f080337

    .restart local v1    # "id":I
    goto :goto_0

    .line 378
    .end local v1    # "id":I
    :cond_2
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v3, 0x7f080653

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/androie/settings/IccLockSettings;->displayRetryCounter(Ljava/lang/String;)V

    goto :goto_1

    .line 380
    .end local v0    # "err":Lcom/android/internal/telephony/CommandException$Error;
    .restart local p1    # "exception":Ljava/lang/Throwable;
    :cond_3
    instance-of v2, p1, Ljava/lang/RuntimeException;

    if-eqz v2, :cond_0

    .line 381
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method private iccLockChanged(Landroid/os/AsyncResult;)V
    .locals 3
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    const/4 v2, 0x0

    .line 386
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_1

    .line 387
    iget-boolean v0, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    if-eqz v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v1, 0x7f08033a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 394
    :goto_0
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    iget-boolean v1, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 398
    :goto_1
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 399
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->resetDialogState()V

    .line 400
    return-void

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v1, 0x7f08033b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 396
    :cond_1
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/IccLockSettings;->handleException(Ljava/lang/Throwable;I)V

    goto :goto_1
.end method

.method private iccPinChanged(Landroid/os/AsyncResult;)V
    .locals 2
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    .line 403
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    const/16 v1, 0x65

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/IccLockSettings;->handleException(Ljava/lang/Throwable;I)V

    .line 411
    :goto_0
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->resetDialogState()V

    .line 412
    return-void

    .line 406
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v1, 0x7f080654

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private reasonablePin(Ljava/lang/String;)Z
    .locals 2
    .param p1, "pin"    # Ljava/lang/String;

    .prologue
    .line 421
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_1

    .line 422
    :cond_0
    const/4 v0, 0x0

    .line 424
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private resetDialogState()V
    .locals 1

    .prologue
    .line 429
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 430
    const/4 v0, 0x2

    iput v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 431
    const-string v0, ""

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 432
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->setDialogValues()V

    .line 433
    const/4 v0, 0x0

    iput v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 434
    return-void
.end method

.method private setDialogValues()V
    .locals 4

    .prologue
    const v3, 0x7f080650

    .line 265
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/androie/settings/EditPinPreference;->setText(Ljava/lang/String;)V

    .line 266
    const-string v0, ""

    .line 267
    .local v0, "message":Ljava/lang/String;
    iget v1, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    packed-switch v1, :pswitch_data_0

    .line 287
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 288
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 289
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 291
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    invoke-virtual {v1, v0}, Lcom/androie/settings/EditPinPreference;->setDialogMessage(Ljava/lang/CharSequence;)V

    .line 292
    return-void

    .line 269
    :pswitch_0
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v2, 0x7f08064a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 270
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    iget-boolean v1, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v3, 0x7f08064b

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v2, v1}, Lcom/androie/settings/EditPinPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v3, 0x7f08064c

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 275
    :pswitch_1
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v2, 0x7f08064d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 276
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androie/settings/EditPinPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 279
    :pswitch_2
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v2, 0x7f08064e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 280
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androie/settings/EditPinPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 283
    :pswitch_3
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v2, 0x7f08064f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 284
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androie/settings/EditPinPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 267
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private showPinDialog()V
    .locals 1

    .prologue
    .line 256
    iget v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    if-nez v0, :cond_0

    .line 262
    :goto_0
    return-void

    .line 259
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->setDialogValues()V

    .line 261
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    invoke-virtual {v0}, Lcom/androie/settings/EditPinPreference;->showPinDialog()V

    goto :goto_0
.end method

.method private tryChangeIccLockState()V
    .locals 4

    .prologue
    .line 356
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 357
    .local v0, "callback":Landroid/os/Message;
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    iget-boolean v2, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    iget-object v3, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    invoke-interface {v1, v2, v3, v0}, Lcom/android/internal/telephony/IccCard;->setIccLockEnabled(ZLjava/lang/String;Landroid/os/Message;)V

    .line 359
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 360
    return-void
.end method

.method private tryChangePin()V
    .locals 4

    .prologue
    .line 415
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x65

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 416
    .local v0, "callback":Landroid/os/Message;
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    iget-object v3, p0, Lcom/androie/settings/IccLockSettings;->mNewPin:Ljava/lang/String;

    invoke-interface {v1, v2, v3, v0}, Lcom/android/internal/telephony/IccCard;->changeIccLockPassword(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 418
    return-void
.end method

.method private updatePreferences()V
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/IccCard;->getIccLockEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 196
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 145
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 147
    invoke-static {}, Lcom/androie/settings/Utils;->isMonkeyRunning()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    invoke-virtual {p0}, Lcom/androie/settings/IccLockSettings;->finish()V

    .line 192
    :goto_0
    return-void

    .line 152
    :cond_0
    const v2, 0x7f050047

    invoke-virtual {p0, v2}, Lcom/androie/settings/IccLockSettings;->addPreferencesFromResource(I)V

    .line 154
    const-string v2, "sim_pin"

    invoke-virtual {p0, v2}, Lcom/androie/settings/IccLockSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/EditPinPreference;

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    .line 155
    const-string v2, "sim_toggle"

    invoke-virtual {p0, v2}, Lcom/androie/settings/IccLockSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    .line 156
    if-eqz p1, :cond_1

    const-string v2, "dialogState"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 157
    const-string v2, "dialogState"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 158
    const-string v2, "dialogPin"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 159
    const-string v2, "dialogError"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 160
    const-string v2, "enableState"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    .line 163
    iget v2, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    packed-switch v2, :pswitch_data_0

    .line 180
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    invoke-virtual {v2, p0}, Lcom/androie/settings/EditPinPreference;->setOnPinEnteredListener(Lcom/androie/settings/EditPinPreference$OnPinEnteredListener;)V

    .line 183
    invoke-virtual {p0}, Lcom/androie/settings/IccLockSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->setPersistent(Z)V

    .line 185
    invoke-virtual {p0}, Lcom/androie/settings/IccLockSettings;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 186
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "subscription"

    invoke-static {}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getDefaultSubscription()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 189
    .local v1, "subscription":I
    invoke-static {v1}, Lcom/codeaurora/telephony/msim/MSimPhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 190
    invoke-virtual {p0}, Lcom/androie/settings/IccLockSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    .line 191
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->updatePreferences()V

    goto :goto_0

    .line 165
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "subscription":I
    :pswitch_0
    const-string v2, "oldPinCode"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    goto :goto_1

    .line 169
    :pswitch_1
    const-string v2, "oldPinCode"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    .line 170
    const-string v2, "newPinCode"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mNewPin:Ljava/lang/String;

    goto :goto_1

    .line 163
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 217
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 218
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mSimStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/androie/settings/IccLockSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 219
    return-void
.end method

.method public onPinEntered(Lcom/androie/settings/EditPinPreference;Z)V
    .locals 4
    .param p1, "preference"    # Lcom/androie/settings/EditPinPreference;
    .param p2, "positiveResult"    # Z

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 295
    if-nez p2, :cond_0

    .line 296
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->resetDialogState()V

    .line 336
    :goto_0
    return-void

    .line 300
    :cond_0
    invoke-virtual {p1}, Lcom/androie/settings/EditPinPreference;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 301
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/androie/settings/IccLockSettings;->reasonablePin(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 303
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v1, 0x7f080651

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 304
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    goto :goto_0

    .line 307
    :cond_1
    iget v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 309
    :pswitch_0
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->tryChangeIccLockState()V

    goto :goto_0

    .line 312
    :pswitch_1
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    .line 313
    iput v3, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 314
    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 315
    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 316
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    goto :goto_0

    .line 319
    :pswitch_2
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mNewPin:Ljava/lang/String;

    .line 320
    const/4 v0, 0x4

    iput v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 321
    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 322
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    goto :goto_0

    .line 325
    :pswitch_3
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mNewPin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 326
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mRes:Landroid/content/res/Resources;

    const v1, 0x7f080652

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 327
    iput v3, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 328
    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPin:Ljava/lang/String;

    .line 329
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    goto :goto_0

    .line 331
    :cond_2
    iput-object v2, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    .line 332
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->tryChangePin()V

    goto :goto_0

    .line 307
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 339
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    if-ne p2, v2, :cond_2

    .line 341
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    iput-boolean v2, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    .line 343
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinToggle:Landroid/preference/CheckBoxPreference;

    iget-boolean v3, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    if-nez v3, :cond_0

    move v0, v1

    :cond_0
    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 344
    iput v1, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    .line 345
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    :cond_1
    move v0, v1

    .line 350
    :goto_0
    return v0

    .line 346
    :cond_2
    iget-object v2, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    if-ne p2, v2, :cond_1

    .line 347
    const/4 v1, 0x2

    iput v1, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 200
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 204
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 205
    .local v0, "filter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mSimStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/androie/settings/IccLockSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 207
    iget v1, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    if-eqz v1, :cond_0

    .line 208
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->showPinDialog()V

    .line 213
    :goto_0
    return-void

    .line 211
    :cond_0
    invoke-direct {p0}, Lcom/androie/settings/IccLockSettings;->resetDialogState()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "out"    # Landroid/os/Bundle;

    .prologue
    .line 228
    iget-object v0, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    invoke-virtual {v0}, Lcom/androie/settings/EditPinPreference;->isDialogOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    const-string v0, "dialogState"

    iget v1, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 230
    const-string v0, "dialogPin"

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mPinDialog:Lcom/androie/settings/EditPinPreference;

    invoke-virtual {v1}, Lcom/androie/settings/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    const-string v0, "dialogError"

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mError:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    const-string v0, "enableState"

    iget-boolean v1, p0, Lcom/androie/settings/IccLockSettings;->mToState:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 235
    iget v0, p0, Lcom/androie/settings/IccLockSettings;->mDialogState:I

    packed-switch v0, :pswitch_data_0

    .line 253
    :goto_0
    return-void

    .line 237
    :pswitch_0
    const-string v0, "oldPinCode"

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 241
    :pswitch_1
    const-string v0, "oldPinCode"

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mOldPin:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string v0, "newPinCode"

    iget-object v1, p0, Lcom/androie/settings/IccLockSettings;->mNewPin:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 251
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    goto :goto_0

    .line 235
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
