.class public Lcom/androie/settings/ApnPreference;
.super Landroid/preference/Preference;
.source "ApnPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# static fields
.field private static mCurrentChecked:Landroid/widget/CompoundButton;

.field private static mSelectedKey:Ljava/lang/String;


# instance fields
.field private mProtectFromCheckedChange:Z

.field private mSelectable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 59
    sput-object v0, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    .line 60
    sput-object v0, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mSelectable:Z

    .line 56
    invoke-direct {p0}, Lcom/androie/settings/ApnPreference;->init()V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mSelectable:Z

    .line 48
    invoke-direct {p0}, Lcom/androie/settings/ApnPreference;->init()V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mSelectable:Z

    .line 39
    invoke-direct {p0}, Lcom/androie/settings/ApnPreference;->init()V

    .line 40
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 93
    const v0, 0x7f040090

    invoke-virtual {p0, v0}, Lcom/androie/settings/ApnPreference;->setWidgetLayoutResource(I)V

    .line 94
    return-void
.end method


# virtual methods
.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "convertView"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x1

    .line 66
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 68
    .local v2, "view":Landroid/view/View;
    const v4, 0x1020001

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 69
    .local v3, "widget":Landroid/view/View;
    if-eqz v3, :cond_1

    instance-of v4, v3, Landroid/widget/RadioButton;

    if-eqz v4, :cond_1

    move-object v1, v3

    .line 70
    check-cast v1, Landroid/widget/RadioButton;

    .line 71
    .local v1, "rb":Landroid/widget/RadioButton;
    invoke-virtual {v1, v6}, Landroid/widget/RadioButton;->setClickable(Z)V

    .line 72
    iget-boolean v4, p0, Lcom/androie/settings/ApnPreference;->mSelectable:Z

    if-eqz v4, :cond_2

    .line 73
    invoke-virtual {v1, p0}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 75
    invoke-virtual {p0}, Lcom/androie/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 76
    .local v0, "isChecked":Z
    if-eqz v0, :cond_0

    .line 77
    sput-object v1, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 78
    invoke-virtual {p0}, Lcom/androie/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    .line 81
    :cond_0
    iput-boolean v6, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 82
    invoke-virtual {v1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 83
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 89
    .end local v0    # "isChecked":Z
    .end local v1    # "rb":Landroid/widget/RadioButton;
    :cond_1
    :goto_0
    return-object v2

    .line 85
    .restart local v1    # "rb":Landroid/widget/RadioButton;
    :cond_2
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/widget/RadioButton;->setVisibility(I)V

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v3, 0x0

    .line 105
    const-string v0, "ApnPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/androie/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-boolean v0, p0, Lcom/androie/settings/ApnPreference;->mProtectFromCheckedChange:Z

    if-eqz v0, :cond_0

    .line 121
    :goto_0
    return-void

    .line 110
    :cond_0
    if-eqz p2, :cond_2

    .line 111
    sget-object v0, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    if-eqz v0, :cond_1

    .line 112
    sget-object v0, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 114
    :cond_1
    sput-object p1, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 115
    invoke-virtual {p0}, Lcom/androie/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    .line 116
    sget-object v0, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/androie/settings/ApnPreference;->callChangeListener(Ljava/lang/Object;)Z

    goto :goto_0

    .line 118
    :cond_2
    sput-object v3, Lcom/androie/settings/ApnPreference;->mCurrentChecked:Landroid/widget/CompoundButton;

    .line 119
    sput-object v3, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    goto :goto_0
.end method

.method public setChecked()V
    .locals 1

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/androie/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/ApnPreference;->mSelectedKey:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setSelectable(Z)V
    .locals 0
    .param p1, "selectable"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/androie/settings/ApnPreference;->mSelectable:Z

    .line 125
    return-void
.end method
