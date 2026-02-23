.class public Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
.super Landroid/app/AlertDialog;
.source "AutoBrightnessCustomizeDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$BrightnessSeekBarChangeListener;,
        Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;,
        Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSplitDialog;,
        Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSetupDialog;,
        Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

.field private mConfigList:Landroid/widget/ListView;

.field private mDialogPosition:I

.field private mHelpDialog:Landroid/app/AlertDialog;

.field private mIsDefault:Z

.field private mLightSensor:Landroid/hardware/Sensor;

.field private mLightSensorListener:Landroid/hardware/SensorEventListener;

.field private mMinLevel:I

.field private mPreviewDialog:Landroid/app/AlertDialog;

.field private mSensorLevel:Landroid/widget/TextView;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSetupDialog:Landroid/app/AlertDialog;

.field private mSplitDialog:Landroid/app/AlertDialog;

.field private mWasRestored:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 99
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 86
    new-instance v0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$1;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensorListener:Landroid/hardware/SensorEventListener;

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorLevel:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showPreview()V

    return-void
.end method

.method static synthetic access$1100(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;I)F
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->progressToBrightness(I)F

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    iget v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    return v0
.end method

.method static synthetic access$1500(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;F)F
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # F

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->percentToBrightness(F)F

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showHelp()V

    return-void
.end method

.method static synthetic access$2002(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    return p1
.end method

.method static synthetic access$300(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showResetConfirmation()V

    return-void
.end method

.method static synthetic access$500(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->updateSettings(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;F)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # F

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->brightnessToProgress(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    return-object v0
.end method

.method static synthetic access$800(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;F)F
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;
    .param p1, "x1"    # F

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->brightnessToPercent(F)F

    move-result v0

    return v0
.end method

.method private brightnessToPercent(F)F
    .locals 2
    .param p1, "brightness"    # F

    .prologue
    .line 883
    iget v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 884
    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr v0, p1

    iget v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    rsub-int v1, v1, 0xff

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method private brightnessToProgress(F)I
    .locals 1
    .param p1, "brightness"    # F

    .prologue
    .line 893
    iget v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 894
    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    return v0
.end method

.method private fetchItems(Ljava/lang/String;)[I
    .locals 6
    .param p1, "setting"    # Ljava/lang/String;

    .prologue
    .line 447
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, p1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 448
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 449
    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 450
    .local v4, "values":[Ljava/lang/String;
    if-eqz v4, :cond_1

    array-length v5, v4

    if-eqz v5, :cond_1

    .line 451
    array-length v5, v4

    new-array v2, v5, [I

    .line 454
    .local v2, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v4

    if-ge v1, v5, :cond_0

    .line 456
    :try_start_0
    aget-object v5, v4, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aput v5, v2, v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 457
    :catch_0
    move-exception v0

    .line 461
    :cond_0
    array-length v5, v4

    if-ne v1, v5, :cond_1

    .line 467
    .end local v1    # "i":I
    .end local v2    # "result":[I
    .end local v4    # "values":[Ljava/lang/String;
    :goto_1
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private percentToBrightness(F)F
    .locals 3
    .param p1, "percent"    # F

    .prologue
    .line 888
    iget v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    rsub-int v1, v1, 0xff

    int-to-float v1, v1

    mul-float/2addr v1, p1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float v0, v1, v2

    .line 889
    .local v0, "brightness":F
    iget v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    return v1
.end method

.method private progressToBrightness(I)F
    .locals 3
    .param p1, "progress"    # I

    .prologue
    .line 898
    int-to-float v1, p1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float v0, v1, v2

    .line 899
    .local v0, "brightness":F
    iget v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    return v1
.end method

.method private putItems(Ljava/lang/String;[I)V
    .locals 4
    .param p1, "setting"    # Ljava/lang/String;
    .param p2, "values"    # [I

    .prologue
    .line 471
    const/4 v2, 0x0

    .line 472
    .local v2, "value":Ljava/lang/String;
    if-eqz p2, :cond_2

    .line 473
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 474
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_1

    .line 475
    if-lez v1, :cond_0

    .line 476
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    :cond_0
    aget v3, p2, v1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 474
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 480
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 482
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3, p1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 483
    return-void
.end method

.method private putSettings()V
    .locals 3

    .prologue
    .line 435
    const/4 v0, 0x0

    .local v0, "lux":[I
    const/4 v1, 0x0

    .line 437
    .local v1, "values":[I
    iget-boolean v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    if-nez v2, :cond_0

    .line 438
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getLuxValues()[I

    move-result-object v0

    .line 439
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getBacklightValues()[I

    move-result-object v1

    .line 442
    :cond_0
    const-string v2, "auto_brightness_lux"

    invoke-direct {p0, v2, v0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->putItems(Ljava/lang/String;[I)V

    .line 443
    const-string v2, "auto_brightness_backlight"

    invoke-direct {p0, v2, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->putItems(Ljava/lang/String;[I)V

    .line 444
    return-void
.end method

.method private showHelp()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 342
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 356
    :goto_0
    return-void

    .line 346
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f040010

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 348
    .local v0, "v":Landroid/view/View;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f08028a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08027b

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    .line 354
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 355
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showPreview()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 359
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 387
    :goto_0
    return-void

    .line 363
    :cond_0
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v7}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getCount()I

    move-result v1

    .line 364
    .local v1, "n":I
    new-array v5, v1, [F

    .line 365
    .local v5, "x":[F
    new-array v6, v1, [F

    .line 367
    .local v6, "y":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 368
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v7, v0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;

    .line 369
    .local v3, "row":Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;
    iget v7, v3, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;->lux:I

    int-to-float v7, v7

    aput v7, v5, v0

    .line 371
    iget v7, v3, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;->backlight:I

    int-to-float v7, v7

    const/high16 v8, 0x437f0000    # 255.0f

    div-float/2addr v7, v8

    aput v7, v6, v0

    .line 367
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 374
    .end local v3    # "row":Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRow;
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f040013

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 375
    .local v4, "v":Landroid/view/View;
    const v7, 0x7f0c001e

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/cyanogenmod/CubicSplinePreviewView;

    .line 377
    .local v2, "preview":Lcom/androie/settings/cyanogenmod/CubicSplinePreviewView;
    invoke-virtual {v2, v5, v6}, Lcom/androie/settings/cyanogenmod/CubicSplinePreviewView;->setSpline([F[F)V

    .line 379
    new-instance v7, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x7f080289

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f08027b

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    iput-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    .line 385
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 386
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showResetConfirmation()V
    .locals 4

    .prologue
    .line 418
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f080281

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080282

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080073

    new-instance v3, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$4;

    invoke-direct {v3, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$4;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080458

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 431
    .local v0, "d":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 432
    return-void
.end method

.method private showSetup(ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "state"    # Landroid/os/Bundle;

    .prologue
    .line 390
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 401
    :goto_0
    return-void

    .line 394
    :cond_0
    iput p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    .line 395
    new-instance v0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSetupDialog;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSetupDialog;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    .line 396
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 397
    if-eqz p2, :cond_1

    .line 398
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 400
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showSplitDialog(ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "state"    # Landroid/os/Bundle;

    .prologue
    .line 404
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 415
    :goto_0
    return-void

    .line 408
    :cond_0
    iput p1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    .line 409
    new-instance v0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSplitDialog;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$RowSplitDialog;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    .line 410
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 411
    if-eqz p2, :cond_1

    .line 412
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 414
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private updateSettings(Z)V
    .locals 5
    .param p1, "forceDefault"    # Z

    .prologue
    .line 317
    const/4 v0, 0x0

    .local v0, "lux":[I
    const/4 v2, 0x0

    .line 319
    .local v2, "values":[I
    if-nez p1, :cond_0

    .line 320
    const-string v3, "auto_brightness_lux"

    invoke-direct {p0, v3}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->fetchItems(Ljava/lang/String;)[I

    move-result-object v0

    .line 321
    const-string v3, "auto_brightness_backlight"

    invoke-direct {p0, v3}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->fetchItems(Ljava/lang/String;)[I

    move-result-object v2

    .line 324
    :cond_0
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    array-length v3, v0

    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    if-eq v3, v4, :cond_1

    .line 325
    const-string v3, "AutoBrightnessCustomizeDialog"

    const-string v4, "Found invalid backlight settings, ignoring"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    const/4 v2, 0x0

    .line 329
    :cond_1
    if-eqz v0, :cond_2

    if-nez v2, :cond_3

    .line 330
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 331
    .local v1, "res":Landroid/content/res/Resources;
    const v3, 0x107002f

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    .line 332
    const v3, 0x1070030

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    .line 333
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    .line 338
    .end local v1    # "res":Landroid/content/res/Resources;
    :goto_0
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v3, v0, v2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->initFromSettings([I[I)V

    .line 339
    return-void

    .line 335
    :cond_3
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 230
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 231
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->putSettings()V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 232
    :cond_1
    const/4 v0, -0x2

    if-ne p2, v0, :cond_0

    .line 233
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->cancel()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 105
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f04003d

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 106
    .local v3, "view":Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setView(Landroid/view/View;)V

    .line 107
    const v4, 0x7f080276

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setTitle(I)V

    .line 108
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setCancelable(Z)V

    .line 110
    const/4 v4, -0x1

    const v5, 0x104000a

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 111
    const/4 v4, -0x3

    const v5, 0x7f08027c

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 113
    const/4 v4, -0x2

    const/high16 v5, 0x1040000

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 115
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 117
    const-string v4, "sensor"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/SensorManager;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorManager:Landroid/hardware/SensorManager;

    .line 118
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v5, 0x5

    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v4

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensor:Landroid/hardware/Sensor;

    .line 120
    const-string v4, "power"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    .line 121
    .local v2, "pm":Landroid/os/PowerManager;
    invoke-virtual {v2}, Landroid/os/PowerManager;->getMinimumAbsoluteScreenBrightness()I

    move-result v4

    iput v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mMinLevel:I

    .line 123
    const v4, 0x7f0c0098

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorLevel:Landroid/widget/TextView;

    .line 125
    const v4, 0x7f0c0099

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 126
    .local v1, "more":Landroid/widget/ImageButton;
    new-instance v4, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;

    invoke-direct {v4, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$2;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    const v4, 0x102000a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mConfigList:Landroid/widget/ListView;

    .line 150
    new-instance v4, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v4, p0, v0, v5}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    .line 151
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mConfigList:Landroid/widget/ListView;

    iget-object v5, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 152
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mConfigList:Landroid/widget/ListView;

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->registerForContextMenu(Landroid/view/View;)V

    .line 153
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 7
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 195
    move-object v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 197
    .local v0, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    const v1, 0x7f080284

    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(I)Landroid/view/ContextMenu;

    .line 199
    const v1, 0x7f080285

    invoke-interface {p1, v3, v2, v3, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v4

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    iget v5, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-static {v1, v5}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->access$400(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;I)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 201
    const v1, 0x7f080286

    invoke-interface {p1, v3, v6, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    iget v5, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v4, v5}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->canSplitRow(I)Z

    move-result v4

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 203
    const/4 v1, 0x3

    const v4, 0x7f080287

    invoke-interface {p1, v3, v1, v6, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getCount()I

    move-result v4

    if-le v4, v2, :cond_1

    :goto_1
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 205
    return-void

    :cond_0
    move v1, v3

    .line 199
    goto :goto_0

    :cond_1
    move v2, v3

    .line 203
    goto :goto_1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v1, 0x0

    .line 239
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    if-ne p1, v0, :cond_1

    .line 240
    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 241
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    if-ne p1, v0, :cond_2

    .line 242
    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    goto :goto_0

    .line 243
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    if-ne p1, v0, :cond_3

    .line 244
    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    goto :goto_0

    .line 245
    :cond_3
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    if-ne p1, v0, :cond_0

    .line 246
    iput-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 5
    .param p1, "featureId"    # I
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 209
    invoke-interface {p2}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 211
    .local v0, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget v1, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 213
    .local v1, "position":I
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    packed-switch v3, :pswitch_data_0

    .line 225
    :goto_0
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 215
    :pswitch_0
    invoke-direct {p0, v1, v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showSetup(ILandroid/os/Bundle;)V

    goto :goto_1

    .line 218
    :pswitch_1
    invoke-direct {p0, v1, v4}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showSplitDialog(ILandroid/os/Bundle;)V

    goto :goto_0

    .line 221
    :pswitch_2
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v3, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->removeRow(I)V

    goto :goto_1

    .line 213
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 287
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 289
    const-string v4, "AutoBrightnessCustomize:isDefault"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    .line 290
    const-string v4, "AutoBrightnessCustomize:dialogPosition"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    .line 292
    const-string v4, "AutoBrightnessCustomize:luxValues"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    .line 293
    .local v1, "lux":[I
    const-string v4, "AutoBrightnessCustomize:backlightValues"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v0

    .line 294
    .local v0, "backlight":[I
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v4, v1, v0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->initFromSettings([I[I)V

    .line 296
    const-string v4, "AutoBrightnessCustomize:setupState"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 297
    .local v2, "setupState":Landroid/os/Bundle;
    if-eqz v2, :cond_0

    .line 298
    iget v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    invoke-direct {p0, v4, v2}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showSetup(ILandroid/os/Bundle;)V

    .line 301
    :cond_0
    const-string v4, "AutoBrightnessCustomize:splitState"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 302
    .local v3, "splitState":Landroid/os/Bundle;
    if-eqz v3, :cond_1

    .line 303
    iget v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    invoke-direct {p0, v4, v3}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showSplitDialog(ILandroid/os/Bundle;)V

    .line 306
    :cond_1
    const-string v4, "AutoBrightnessCustomize:helpShowing"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 307
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showHelp()V

    .line 309
    :cond_2
    const-string v4, "AutoBrightnessCustomize:previewShowing"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 310
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->showPreview()V

    .line 313
    :cond_3
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mWasRestored:Z

    .line 314
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 261
    invoke-super {p0}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v2

    .line 263
    .local v2, "state":Landroid/os/Bundle;
    const-string v3, "AutoBrightnessCustomize:isDefault"

    iget-boolean v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mIsDefault:Z

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 264
    const-string v3, "AutoBrightnessCustomize:luxValues"

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v6}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getLuxValues()[I

    move-result-object v6

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 265
    const-string v3, "AutoBrightnessCustomize:backlightValues"

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mAdapter:Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;

    invoke-virtual {v6}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$SettingRowAdapter;->getBacklightValues()[I

    move-result-object v6

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 266
    const-string v3, "AutoBrightnessCustomize:dialogPosition"

    iget v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mDialogPosition:I

    invoke-virtual {v2, v3, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 267
    const-string v6, "AutoBrightnessCustomize:helpShowing"

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v4

    :goto_0
    invoke-virtual {v2, v6, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 268
    const-string v3, "AutoBrightnessCustomize:previewShowing"

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v6

    if-eqz v6, :cond_3

    :goto_1
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 270
    const/4 v0, 0x0

    .line 271
    .local v0, "setupState":Landroid/os/Bundle;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 272
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    .line 274
    :cond_0
    const-string v3, "AutoBrightnessCustomize:setupState"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 276
    const/4 v1, 0x0

    .line 277
    .local v1, "splitState":Landroid/os/Bundle;
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 278
    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v1

    .line 280
    :cond_1
    const-string v3, "AutoBrightnessCustomize:splitState"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 282
    return-object v2

    .end local v0    # "setupState":Landroid/os/Bundle;
    .end local v1    # "splitState":Landroid/os/Bundle;
    :cond_2
    move v3, v5

    .line 267
    goto :goto_0

    :cond_3
    move v4, v5

    .line 268
    goto :goto_1
.end method

.method protected onStart()V
    .locals 5

    .prologue
    .line 157
    iget-boolean v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mWasRestored:Z

    if-nez v1, :cond_0

    .line 158
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->updateSettings(Z)V

    .line 161
    :cond_0
    invoke-super {p0}, Landroid/app/AlertDialog;->onStart()V

    .line 163
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensor:Landroid/hardware/Sensor;

    const/4 v4, 0x3

    invoke-virtual {v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 166
    const/4 v1, -0x3

    invoke-virtual {p0, v1}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 167
    .local v0, "neutralButton":Landroid/widget/Button;
    new-instance v1, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$3;

    invoke-direct {v1, p0}, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog$3;-><init>(Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    return-void
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 177
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 178
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mLightSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 179
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mHelpDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 183
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mPreviewDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 186
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSetupDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 188
    :cond_2
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 189
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/AutoBrightnessCustomizeDialog;->mSplitDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 191
    :cond_3
    return-void
.end method
