.class Lcom/jellybyn/settings/Settings$HeaderAdapter;
.super Landroid/widget/ArrayAdapter;
.source "Settings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jellybyn/settings/Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Landroid/preference/PreferenceActivity$Header;",
        ">;"
    }
.end annotation


# instance fields
.field private mAuthHelper:Lcom/jellybyn/settings/accounts/AuthenticatorHelper;

.field private mInflater:Landroid/view/LayoutInflater;

.field private final mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lcom/jellybyn/settings/accounts/AuthenticatorHelper;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "authenticatorHelper"    # Lcom/jellybyn/settings/accounts/AuthenticatorHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Landroid/preference/PreferenceActivity$Header;",
            ">;",
            "Lcom/jellybyn/settings/accounts/AuthenticatorHelper;",
            ")V"
        }
    .end annotation

    .prologue
    .line 631
    .local p2, "objects":Ljava/util/List;, "Ljava/util/List<Landroid/preference/PreferenceActivity$Header;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 633
    iput-object p3, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mAuthHelper:Lcom/jellybyn/settings/accounts/AuthenticatorHelper;

    .line 634
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 638
    new-instance v0, Lcom/jellybyn/settings/wifi/WifiEnabler;

    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p1, v1}, Lcom/jellybyn/settings/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/widget/Switch;)V

    iput-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    .line 639
    # new-instance v0, Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;

    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    # invoke-direct {v0, p1, v1}, Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;-><init>(Landroid/content/Context;Landroid/widget/Switch;)V

    # iput-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mBluetoothEnabler:Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;

    .line 640
    return-void
.end method

.method static getHeaderType(Landroid/preference/PreferenceActivity$Header;)I
    .locals 4
    .param p0, "header"    # Landroid/preference/PreferenceActivity$Header;

    .prologue
    .line 594
    iget-object v0, p0, Landroid/preference/PreferenceActivity$Header;->fragment:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/preference/PreferenceActivity$Header;->intent:Landroid/content/Intent;

    if-nez v0, :cond_0

    .line 595
    const/4 v0, 0x0

    .line 599
    :goto_0
    return v0

    .line 596
    :cond_0
    iget-wide v0, p0, Landroid/preference/PreferenceActivity$Header;->id:J

    const-wide/32 v2, 0x7f0801e8

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    iget-wide v0, p0, Landroid/preference/PreferenceActivity$Header;->id:J

    const-wide/32 v2, 0x7f0801e9

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 597
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 599
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 611
    const/4 v0, 0x0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 605
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity$Header;

    .line 606
    .local v0, "header":Landroid/preference/PreferenceActivity$Header;
    invoke-static {v0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getHeaderType(Landroid/preference/PreferenceActivity$Header;)I

    move-result v1

    return v1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 645
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceActivity$Header;

    .line 646
    .local v1, "header":Landroid/preference/PreferenceActivity$Header;
    invoke-static {v1}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getHeaderType(Landroid/preference/PreferenceActivity$Header;)I

    move-result v2

    .line 647
    .local v2, "headerType":I
    const/4 v7, 0x0

    .line 649
    .local v7, "view":Landroid/view/View;
    if-nez p2, :cond_0

    .line 650
    new-instance v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;

    const/4 v8, 0x0

    invoke-direct {v3, v8}, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;-><init>(Lcom/jellybyn/settings/Settings$1;)V

    .line 651
    .local v3, "holder":Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;
    packed-switch v2, :pswitch_data_0

    .line 680
    :goto_0
    invoke-virtual {v7, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 687
    :goto_1
    packed-switch v2, :pswitch_data_1

    .line 728
    :goto_2
    return-object v7

    .line 653
    :pswitch_0
    new-instance v7, Landroid/widget/TextView;

    .end local v7    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    const/4 v9, 0x0

    const v10, 0x1010208

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .restart local v7    # "view":Landroid/view/View;
    move-object v8, v7

    .line 655
    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    goto :goto_0

    .line 659
    :pswitch_1
    iget-object v8, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f040059

    const/4 v10, 0x0

    invoke-virtual {v8, v9, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    .line 661
    const v8, 0x7f080024

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    .line 662
    const v8, 0x1020016

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    .line 664
    const v8, 0x1020010

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    .line 666
    const v8, 0x7f08000e

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Switch;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->switch_:Landroid/widget/Switch;

    goto :goto_0

    .line 670
    :pswitch_2
    iget-object v8, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v9, 0x7f040058

    const/4 v10, 0x0

    invoke-virtual {v8, v9, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    .line 673
    const v8, 0x7f080024

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    .line 674
    const v8, 0x1020016

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    .line 676
    const v8, 0x1020010

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    goto :goto_0

    .line 682
    .end local v3    # "holder":Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;
    :cond_0
    move-object v7, p2

    .line 683
    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;

    .restart local v3    # "holder":Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;
    goto/16 :goto_1

    .line 689
    :pswitch_3
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/preference/PreferenceActivity$Header;->getTitle(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 694
    :pswitch_4
    iget-wide v8, v1, Landroid/preference/PreferenceActivity$Header;->id:J

    const-wide/32 v10, 0x7f0801e8

    cmp-long v8, v8, v10

    if-nez v8, :cond_1

    .line 695
    iget-object v8, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    iget-object v9, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->switch_:Landroid/widget/Switch;

    invoke-virtual {v8, v9}, Lcom/jellybyn/settings/wifi/WifiEnabler;->setSwitch(Landroid/widget/Switch;)V

    .line 703
    :goto_3
    :pswitch_5
    iget-object v8, v1, Landroid/preference/PreferenceActivity$Header;->extras:Landroid/os/Bundle;

    if-eqz v8, :cond_2

    iget-object v8, v1, Landroid/preference/PreferenceActivity$Header;->extras:Landroid/os/Bundle;

    const-string v9, "account_type"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 705
    iget-object v8, v1, Landroid/preference/PreferenceActivity$Header;->extras:Landroid/os/Bundle;

    const-string v9, "account_type"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 707
    .local v0, "accType":Ljava/lang/String;
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 708
    .local v5, "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0d0019

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 710
    iget v8, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v8, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 711
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v8, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 712
    iget-object v8, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mAuthHelper:Lcom/jellybyn/settings/accounts/AuthenticatorHelper;

    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v8, v9, v0}, Lcom/jellybyn/settings/accounts/AuthenticatorHelper;->getDrawableForType(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 713
    .local v4, "icon":Landroid/graphics/drawable/Drawable;
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v8, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 717
    .end local v0    # "accType":Ljava/lang/String;
    .end local v4    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v5    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :goto_4
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/preference/PreferenceActivity$Header;->getTitle(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 718
    invoke-virtual {p0}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/preference/PreferenceActivity$Header;->getSummary(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    .line 719
    .local v6, "summary":Ljava/lang/CharSequence;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 720
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 721
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 697
    .end local v6    # "summary":Ljava/lang/CharSequence;
    :cond_1
    # iget-object v8, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mBluetoothEnabler:Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;

    iget-object v9, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->switch_:Landroid/widget/Switch;

    # invoke-virtual {v8, v9}, Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;->setSwitch(Landroid/widget/Switch;)V

    goto :goto_3

    .line 715
    :cond_2
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    iget v9, v1, Landroid/preference/PreferenceActivity$Header;->iconRes:I

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_4

    .line 723
    .restart local v6    # "summary":Ljava/lang/CharSequence;
    :cond_3
    iget-object v8, v3, Lcom/jellybyn/settings/Settings$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 651
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 687
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 621
    const/4 v0, 0x3

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 626
    const/4 v0, 0x1

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 616
    invoke-virtual {p0, p1}, Lcom/jellybyn/settings/Settings$HeaderAdapter;->getItemViewType(I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 737
    iget-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiEnabler;->pause()V

    .line 738
    # iget-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mBluetoothEnabler:Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;

    # invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;->pause()V

    .line 739
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 732
    iget-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mWifiEnabler:Lcom/jellybyn/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/jellybyn/settings/wifi/WifiEnabler;->resume()V

    .line 733
    # iget-object v0, p0, Lcom/jellybyn/settings/Settings$HeaderAdapter;->mBluetoothEnabler:Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;

    # invoke-virtual {v0}, Lcom/jellybyn/settings/bluetooth/BluetoothEnabler;->resume()V

    .line 734
    return-void
.end method
