.class Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
.super Landroid/preference/CheckBoxPreference;
.source "InputMethodAndSubtypeEnabler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SubtypeCheckBoxPreference"
.end annotation


# instance fields
.field private final mCollator:Ljava/text/Collator;

.field private final mIsSystemLanguage:Z

.field private final mIsSystemLocale:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/text/Collator;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "subtypeLocale"    # Ljava/lang/String;
    .param p3, "systemLocale"    # Ljava/lang/String;
    .param p4, "collator"    # Ljava/text/Collator;

    .prologue
    const/4 v0, 0x0

    .line 383
    invoke-direct {p0, p1}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 384
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    iput-boolean v0, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLocale:Z

    .line 386
    iput-boolean v0, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLanguage:Z

    .line 392
    :goto_0
    iput-object p4, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mCollator:Ljava/text/Collator;

    .line 393
    return-void

    .line 388
    :cond_0
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLocale:Z

    .line 389
    iget-boolean v1, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLocale:Z

    if-nez v1, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    iput-boolean v0, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLanguage:Z

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Landroid/preference/Preference;)I
    .locals 6
    .param p1, "p"    # Landroid/preference/Preference;

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 397
    instance-of v5, p1, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;

    if-eqz v5, :cond_5

    move-object v0, p1

    .line 398
    check-cast v0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;

    .line 399
    .local v0, "pref":Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
    invoke-virtual {p0}, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    .line 400
    .local v1, "t0":Ljava/lang/CharSequence;
    invoke-virtual {v0}, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    .line 401
    .local v2, "t1":Ljava/lang/CharSequence;
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 402
    const/4 v3, 0x0

    .line 425
    .end local v0    # "pref":Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
    .end local v1    # "t0":Ljava/lang/CharSequence;
    .end local v2    # "t1":Ljava/lang/CharSequence;
    :cond_0
    :goto_0
    return v3

    .line 404
    .restart local v0    # "pref":Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
    .restart local v1    # "t0":Ljava/lang/CharSequence;
    .restart local v2    # "t1":Ljava/lang/CharSequence;
    :cond_1
    iget-boolean v5, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLocale:Z

    if-nez v5, :cond_0

    .line 407
    iget-boolean v5, v0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLocale:Z

    if-eqz v5, :cond_2

    move v3, v4

    .line 408
    goto :goto_0

    .line 410
    :cond_2
    iget-boolean v5, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLanguage:Z

    if-nez v5, :cond_0

    .line 413
    iget-boolean v5, v0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mIsSystemLanguage:Z

    if-eqz v5, :cond_3

    move v3, v4

    .line 414
    goto :goto_0

    .line 416
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v3, v4

    .line 417
    goto :goto_0

    .line 419
    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 422
    iget-object v3, p0, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->mCollator:Ljava/text/Collator;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 424
    .end local v0    # "pref":Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;
    .end local v1    # "t0":Ljava/lang/CharSequence;
    .end local v2    # "t1":Ljava/lang/CharSequence;
    :cond_5
    invoke-static {}, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Illegal preference type."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    invoke-super {p0, p1}, Landroid/preference/CheckBoxPreference;->compareTo(Landroid/preference/Preference;)I

    move-result v3

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 376
    check-cast p1, Landroid/preference/Preference;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/androie/settings/inputmethod/InputMethodAndSubtypeEnabler$SubtypeCheckBoxPreference;->compareTo(Landroid/preference/Preference;)I

    move-result v0

    return v0
.end method
