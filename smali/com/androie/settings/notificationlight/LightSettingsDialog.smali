.class public Lcom/androie/settings/notificationlight/LightSettingsDialog;
.super Landroid/app/AlertDialog;
.source "LightSettingsDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;
    }
.end annotation


# instance fields
.field private mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

.field private mHexColorInput:Landroid/widget/EditText;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mListener:Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;

.field private mNewColor:Lcom/androie/settings/notificationlight/ColorPanelView;

.field private mPulseSpeedOff:Landroid/widget/Spinner;

.field private mPulseSpeedOn:Landroid/widget/Spinner;

.field private mSelectionListener:Landroid/widget/AdapterView$OnItemSelectedListener;


# direct methods
.method protected constructor <init>(Landroid/content/Context;IIIZ)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "initialColor"    # I
    .param p3, "initialSpeedOn"    # I
    .param p4, "initialSpeedOff"    # I
    .param p5, "onOffChangeable"    # Z

    .prologue
    .line 88
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 143
    new-instance v0, Lcom/androie/settings/notificationlight/LightSettingsDialog$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog$1;-><init>(Lcom/androie/settings/notificationlight/LightSettingsDialog;)V

    iput-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mSelectionListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 90
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->init(IIIZ)V

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/notificationlight/LightSettingsDialog;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/LightSettingsDialog;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/notificationlight/LightSettingsDialog;)Landroid/widget/Spinner;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/LightSettingsDialog;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$200(Lcom/androie/settings/notificationlight/LightSettingsDialog;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/notificationlight/LightSettingsDialog;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method private init(IIIZ)V
    .locals 2
    .param p1, "color"    # I
    .param p2, "speedOn"    # I
    .param p3, "speedOff"    # I
    .param p4, "onOffChangeable"    # Z

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setFormat(I)V

    .line 96
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setUp(IIIZ)V

    .line 97
    return-void
.end method

.method private setUp(IIIZ)V
    .locals 6
    .param p1, "color"    # I
    .param p2, "speedOn"    # I
    .param p3, "speedOff"    # I
    .param p4, "onOffChangeable"    # Z

    .prologue
    const/4 v3, 0x1

    .line 108
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v4, "layout_inflater"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mInflater:Landroid/view/LayoutInflater;

    .line 110
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mInflater:Landroid/view/LayoutInflater;

    const v4, 0x7f040040

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 112
    .local v0, "layout":Landroid/view/View;
    const v2, 0x7f0c00a1

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/notificationlight/ColorPickerView;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    .line 113
    const v2, 0x7f0c00a3

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    .line 114
    const v2, 0x7f0c00a4

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/androie/settings/notificationlight/ColorPanelView;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mNewColor:Lcom/androie/settings/notificationlight/ColorPanelView;

    .line 116
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v2, p0}, Lcom/androie/settings/notificationlight/ColorPickerView;->setOnColorChangedListener(Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;)V

    .line 117
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v2, p1, v3}, Lcom/androie/settings/notificationlight/ColorPickerView;->setColor(IZ)V

    .line 119
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    invoke-virtual {v2, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 120
    const v2, 0x7f0c00a6

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    .line 121
    new-instance v1, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;

    const v2, 0x7f0b006a

    const v4, 0x7f0b006b

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v1, p0, v2, v4, v5}, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;-><init>(Lcom/androie/settings/notificationlight/LightSettingsDialog;IILjava/lang/Integer;)V

    .line 125
    .local v1, "pulseSpeedAdapter":Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 126
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;->getTimePosition(Ljava/lang/Integer;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/Spinner;->setSelection(I)V

    .line 127
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    iget-object v4, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mSelectionListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v2, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 129
    const v2, 0x7f0c00a7

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    iput-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    .line 130
    new-instance v1, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;

    .end local v1    # "pulseSpeedAdapter":Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;
    const v2, 0x7f0b006c

    const v4, 0x7f0b006d

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v1, p0, v2, v4, v5}, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;-><init>(Lcom/androie/settings/notificationlight/LightSettingsDialog;IILjava/lang/Integer;)V

    .line 133
    .restart local v1    # "pulseSpeedAdapter":Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 134
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/androie/settings/notificationlight/LightSettingsDialog$PulseSpeedAdapter;->getTimePosition(Ljava/lang/Integer;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/Spinner;->setSelection(I)V

    .line 136
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    invoke-virtual {v2, p4}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 137
    iget-object v4, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    if-eq p2, v3, :cond_0

    if-eqz p4, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {v4, v2}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 139
    invoke-virtual {p0, v0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setView(Landroid/view/View;)V

    .line 140
    const v2, 0x7f080184

    invoke-virtual {p0, v2}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->setTitle(I)V

    .line 141
    return-void

    .line 137
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 293
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "hexColor":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 296
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x23

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    .line 297
    .local v0, "color":I
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v2}, Lcom/androie/settings/notificationlight/ColorPickerView;->isAlphaSliderVisible()Z

    move-result v2

    if-nez v2, :cond_0

    .line 298
    const/high16 v2, -0x1000000

    or-int/2addr v0, v2

    .line 300
    :cond_0
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v2, v0}, Lcom/androie/settings/notificationlight/ColorPickerView;->setColor(I)V

    .line 301
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mNewColor:Lcom/androie/settings/notificationlight/ColorPanelView;

    invoke-virtual {v2, v0}, Lcom/androie/settings/notificationlight/ColorPanelView;->setColor(I)V

    .line 302
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mListener:Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;

    if-eqz v2, :cond_1

    .line 303
    iget-object v2, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mListener:Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;

    invoke-interface {v2, v0}, Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;->onColorChanged(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    .end local v0    # "color":I
    :cond_1
    :goto_0
    return-void

    .line 305
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 285
    return-void
.end method

.method public getColor()I
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v0}, Lcom/androie/settings/notificationlight/ColorPickerView;->getColor()I

    move-result v0

    return v0
.end method

.method public getPulseSpeedOff()I
    .locals 2

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getPulseSpeedOn()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOff:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public getPulseSpeedOn()I
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mPulseSpeedOn:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public onColorChanged(I)V
    .locals 8
    .param p1, "color"    # I

    .prologue
    .line 170
    iget-object v3, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v3}, Lcom/androie/settings/notificationlight/ColorPickerView;->isAlphaSliderVisible()Z

    move-result v1

    .line 171
    .local v1, "hasAlpha":Z
    if-eqz v1, :cond_1

    const-string v0, "%08x"

    .line 172
    .local v0, "format":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_2

    const/4 v2, -0x1

    .line 174
    .local v2, "mask":I
    :goto_1
    iget-object v3, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mNewColor:Lcom/androie/settings/notificationlight/ColorPanelView;

    invoke-virtual {v3, p1}, Lcom/androie/settings/notificationlight/ColorPanelView;->setColor(I)V

    .line 175
    iget-object v3, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    and-int v7, p1, v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v3, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mListener:Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;

    if-eqz v3, :cond_0

    .line 178
    iget-object v3, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mListener:Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;

    invoke-interface {v3, p1}, Lcom/androie/settings/notificationlight/ColorPickerView$OnColorChangedListener;->onColorChanged(I)V

    .line 180
    :cond_0
    return-void

    .line 171
    .end local v0    # "format":Ljava/lang/String;
    .end local v2    # "mask":I
    :cond_1
    const-string v0, "%06x"

    goto :goto_0

    .line 172
    .restart local v0    # "format":Ljava/lang/String;
    :cond_2
    const v2, 0xffffff

    goto :goto_1
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 313
    if-nez p2, :cond_0

    .line 314
    iget-object v1, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 315
    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 317
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 321
    .end local v0    # "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    :goto_0
    return-void

    .line 319
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_0
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 164
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 165
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    const-string v1, "LightSettingsDialog:color"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/androie/settings/notificationlight/ColorPickerView;->setColor(IZ)V

    .line 166
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 157
    invoke-super {p0}, Landroid/app/AlertDialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    .line 158
    .local v0, "state":Landroid/os/Bundle;
    const-string v1, "LightSettingsDialog:color"

    invoke-virtual {p0}, Lcom/androie/settings/notificationlight/LightSettingsDialog;->getColor()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 159
    return-object v0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 289
    return-void
.end method

.method public setAlphaSliderVisible(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    .line 183
    iget-object v1, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mHexColorInput:Landroid/widget/EditText;

    const/4 v0, 0x1

    new-array v2, v0, [Landroid/text/InputFilter;

    const/4 v3, 0x0

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    if-eqz p1, :cond_0

    const/16 v0, 0x8

    :goto_0
    invoke-direct {v4, v0}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 184
    iget-object v0, p0, Lcom/androie/settings/notificationlight/LightSettingsDialog;->mColorPicker:Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual {v0, p1}, Lcom/androie/settings/notificationlight/ColorPickerView;->setAlphaSliderVisible(Z)V

    .line 185
    return-void

    .line 183
    :cond_0
    const/4 v0, 0x6

    goto :goto_0
.end method
