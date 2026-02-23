.class public Lcom/androie/settings/notificationlight/ApplicationLightPreference;
.super Landroid/preference/DialogPreference;
.source "ApplicationLightPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mColorValue:I

.field private mLightColorView:Landroid/widget/ImageView;

.field private mOffValue:I

.field private mOffValueView:Landroid/widget/TextView;

.field private mOnOffChangeable:Z

.field private mOnValue:I

.field private mOnValueView:Landroid/widget/TextView;

.field private mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

.field private mResources:Landroid/content/res/Resources;

.field private mTestDialog:Landroid/app/AlertDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "AppLightPreference"

    sput-object v0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;III)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "color"    # I
    .param p3, "onValue"    # I
    .param p4, "offValue"    # I

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, v0}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    iput-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    .line 82
    iput p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    .line 83
    iput p3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    .line 84
    iput p4, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    .line 86
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->init()V

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIIZ)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "color"    # I
    .param p3, "onValue"    # I
    .param p4, "offValue"    # I
    .param p5, "onOffChangeable"    # Z

    .prologue
    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, v0}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    iput-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    .line 98
    iput p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    .line 99
    iput p3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    .line 100
    iput p4, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    .line 101
    iput-boolean p5, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    .line 102
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->init()V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/16 v1, 0x3e8

    .line 66
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    .line 67
    const v0, 0xffffff

    iput v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    .line 68
    iput v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    .line 69
    iput v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    .line 71
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->init()V

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/notificationlight/ApplicationLightPreference;III)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->showTestDialog(III)V

    return-void
.end method

.method static synthetic access$102(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    return p1
.end method

.method static synthetic access$202(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    return p1
.end method

.method static synthetic access$302(Lcom/androie/settings/notificationlight/ApplicationLightPreference;I)I
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    return p1
.end method

.method static synthetic access$400(Lcom/androie/settings/notificationlight/ApplicationLightPreference;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->updatePreferenceViews()V

    return-void
.end method

.method static synthetic access$500(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/androie/settings/notificationlight/ApplicationLightPreference;)Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    return-object v0
.end method

.method static synthetic access$602(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;)Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    return-object p1
.end method

.method static synthetic access$700(Lcom/androie/settings/notificationlight/ApplicationLightPreference;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$702(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/ApplicationLightPreference;
    .param p1, "x1"    # Landroid/app/AlertDialog;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method private static createRectShape(III)Landroid/graphics/drawable/ShapeDrawable;
    .locals 2
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "color"    # I

    .prologue
    .line 317
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 318
    .local v0, "shape":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    .line 319
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    .line 320
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 321
    return-object v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 106
    const v0, 0x7f040080

    invoke-virtual {p0, v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->setLayoutResource(I)V

    .line 107
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    .line 108
    return-void
.end method

.method private mapLengthValue(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 5
    .param p1, "time"    # Ljava/lang/Integer;

    .prologue
    .line 325
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x3e8

    if-ne v3, v4, :cond_0

    .line 326
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f080186

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 338
    :goto_0
    return-object v3

    .line 329
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0b006a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, "timeNames":[Ljava/lang/String;
    iget-object v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0b006b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    .line 332
    .local v2, "timeValues":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_2

    .line 333
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 334
    aget-object v3, v1, v0

    goto :goto_0

    .line 332
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 338
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f080187

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private mapSpeedValue(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 5
    .param p1, "time"    # Ljava/lang/Integer;

    .prologue
    .line 342
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x3e8

    if-ne v3, v4, :cond_0

    .line 343
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f080186

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 355
    :goto_0
    return-object v3

    .line 346
    :cond_0
    iget-object v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0b006c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 347
    .local v1, "timeNames":[Ljava/lang/String;
    iget-object v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0b006d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    .line 349
    .local v2, "timeValues":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_2

    .line 350
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 351
    aget-object v3, v1, v0

    goto :goto_0

    .line 349
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 355
    :cond_2
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f080187

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private showTestDialog(III)V
    .locals 5
    .param p1, "color"    # I
    .param p2, "speedOn"    # I
    .param p3, "speedOff"    # I

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 193
    .local v0, "context":Landroid/content/Context;
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    if-eqz v2, :cond_0

    .line 194
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 196
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_1

    .line 197
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 200
    :cond_1
    new-instance v2, Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;-><init>(Lcom/androie/settings/notificationlight/ApplicationLightPreference;III)V

    iput-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    .line 202
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 203
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 204
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mReceiver:Lcom/androie/settings/notificationlight/ApplicationLightPreference$ScreenReceiver;

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 206
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f080188

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f08018b

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f08018c

    new-instance v4, Lcom/androie/settings/notificationlight/ApplicationLightPreference$3;

    invoke-direct {v4, p0, v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference$3;-><init>(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Landroid/content/Context;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    .line 220
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mTestDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 221
    return-void
.end method

.method private updatePreferenceViews()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 127
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f070012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v1, v2

    .line 128
    .local v1, "width":I
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f070013

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v0, v2

    .line 130
    .local v0, "height":I
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mLightColorView:Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 131
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mLightColorView:Landroid/widget/ImageView;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 132
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mLightColorView:Landroid/widget/ImageView;

    const/high16 v3, -0x1000000

    iget v4, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    add-int/2addr v3, v4

    invoke-static {v1, v0, v3}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->createRectShape(III)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 134
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValueView:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 135
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValueView:Landroid/widget/TextView;

    iget v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mapLengthValue(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValueView:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    .line 138
    iget v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    if-ne v2, v5, :cond_3

    .line 139
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValueView:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 143
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValueView:Landroid/widget/TextView;

    iget v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mapSpeedValue(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    :cond_2
    return-void

    .line 141
    :cond_3
    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValueView:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method protected createDialog()Landroid/app/Dialog;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 167
    new-instance v0, Lcom/androie/settings/notificationlight/LightSettingsDialog;

    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, -0x1000000

    iget v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    iget v4, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    iget-boolean v5, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/notificationlight/LightSettingsDialog;-><init>(Landroid/content/Context;IIIZ)V

    .line 169
    .local v0, "d":Lcom/androie/settings/notificationlight/LightSettingsDialog;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setAlphaSliderVisible(Z)V

    .line 171
    const/4 v1, -0x1

    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f080073

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;

    invoke-direct {v3, p0, v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference$2;-><init>(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Lcom/androie/settings/notificationlight/LightSettingsDialog;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 182
    const/4 v2, -0x3

    iget-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f080188

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v1, v6

    check-cast v1, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v2, v3, v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 184
    const/4 v1, -0x2

    iget-object v2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f080458

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    check-cast v6, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2, v6}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 187
    return-object v0
.end method

.method public getColor()I
    .locals 1

    .prologue
    .line 228
    iget v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    return v0
.end method

.method public getOffValue()I
    .locals 1

    .prologue
    .line 251
    iget v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    return v0
.end method

.method public getOnValue()I
    .locals 1

    .prologue
    .line 242
    iget v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 112
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindView(Landroid/view/View;)V

    .line 114
    const v1, 0x7f0c0139

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mLightColorView:Landroid/widget/ImageView;

    .line 115
    const v1, 0x7f0c0137

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValueView:Landroid/widget/TextView;

    .line 116
    const v1, 0x7f0c0138

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValueView:Landroid/widget/TextView;

    .line 120
    const v1, 0x1020010

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 121
    .local v0, "tView":Landroid/widget/TextView;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 123
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->updatePreferenceViews()V

    .line 124
    return-void
.end method

.method public setAllValues(III)V
    .locals 1
    .param p1, "color"    # I
    .param p2, "onValue"    # I
    .param p3, "offValue"    # I

    .prologue
    .line 255
    iput p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    .line 256
    iput p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    .line 257
    iput p3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    .line 258
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    .line 259
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->updatePreferenceViews()V

    .line 260
    return-void
.end method

.method public setAllValues(IIIZ)V
    .locals 0
    .param p1, "color"    # I
    .param p2, "onValue"    # I
    .param p3, "offValue"    # I
    .param p4, "onOffChangeable"    # Z

    .prologue
    .line 263
    iput p1, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mColorValue:I

    .line 264
    iput p2, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnValue:I

    .line 265
    iput p3, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOffValue:I

    .line 266
    iput-boolean p4, p0, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->mOnOffChangeable:Z

    .line 267
    invoke-direct {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->updatePreferenceViews()V

    .line 268
    return-void
.end method

.method protected showDialog(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 149
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->showDialog(Landroid/os/Bundle;)V

    .line 151
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lcom/androie/settings/notificationlight/LightSettingsDialog;

    .line 154
    .local v0, "d":Lcom/androie/settings/notificationlight/LightSettingsDialog;
    const v1, 0x102001b

    invoke-virtual {v0, v1}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;

    invoke-direct {v2, p0, v0}, Lcom/androie/settings/notificationlight/ApplicationLightPreference$1;-><init>(Lcom/androie/settings/notificationlight/ApplicationLightPreference;Lcom/androie/settings/notificationlight/LightSettingsDialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    return-void
.end method
