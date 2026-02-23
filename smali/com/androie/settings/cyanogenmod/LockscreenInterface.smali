.class public Lcom/androie/settings/cyanogenmod/LockscreenInterface;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "LockscreenInterface.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androie/settings/cyanogenmod/LockscreenInterface$DeviceAdminLockscreenReceiver;
    }
.end annotation


# instance fields
.field private mBatteryStatus:Landroid/preference/ListPreference;

.field private mCustomBackground:Landroid/preference/ListPreference;

.field private mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mEnableCamera:Landroid/preference/CheckBoxPreference;

.field private mEnableWidgets:Landroid/preference/CheckBoxPreference;

.field private mIsPrimary:Z

.field private mWallpaperImage:Ljava/io/File;

.field private mWallpaperTemporary:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 322
    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)Landroid/content/ContentResolver;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/cyanogenmod/LockscreenInterface;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateCustomBackgroundSummary()V

    return-void
.end method

.method private handleBackgroundSelection(I)Z
    .locals 16
    .param p1, "selection"    # I

    .prologue
    .line 247
    if-nez p1, :cond_2

    .line 248
    new-instance v1, Lcom/androie/settings/notificationlight/ColorPickerView;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-direct {v1, v13}, Lcom/androie/settings/notificationlight/ColorPickerView;-><init>(Landroid/content/Context;)V

    .line 249
    .local v1, "colorView":Lcom/androie/settings/notificationlight/ColorPickerView;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const-string v14, "lockscreen_background"

    const/4 v15, -0x1

    invoke-static {v13, v14, v15}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 252
    .local v3, "currentColor":I
    const/4 v13, -0x1

    if-eq v3, v13, :cond_0

    .line 253
    invoke-virtual {v1, v3}, Lcom/androie/settings/notificationlight/ColorPickerView;->setColor(I)V

    .line 255
    :cond_0
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Lcom/androie/settings/notificationlight/ColorPickerView;->setAlphaSliderVisible(Z)V

    .line 257
    new-instance v13, Landroid/app/AlertDialog$Builder;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v13, v14}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v14, 0x7f080267

    invoke-virtual {v13, v14}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v13

    const v14, 0x7f080073

    new-instance v15, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v1}, Lcom/androie/settings/cyanogenmod/LockscreenInterface$2;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenInterface;Lcom/androie/settings/notificationlight/ColorPickerView;)V

    invoke-virtual {v13, v14, v15}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v13

    const v14, 0x7f080458

    new-instance v15, Lcom/androie/settings/cyanogenmod/LockscreenInterface$1;

    invoke-direct/range {v15 .. v16}, Lcom/androie/settings/cyanogenmod/LockscreenInterface$1;-><init>(Lcom/androie/settings/cyanogenmod/LockscreenInterface;)V

    invoke-virtual {v13, v14, v15}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v13

    invoke-virtual {v13, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 319
    .end local v1    # "colorView":Lcom/androie/settings/notificationlight/ColorPickerView;
    .end local v3    # "currentColor":I
    :cond_1
    :goto_0
    const/4 v13, 0x0

    :goto_1
    return v13

    .line 275
    :cond_2
    const/4 v13, 0x1

    move/from16 v0, p1

    if-ne v0, v13, :cond_6

    .line 276
    new-instance v6, Landroid/content/Intent;

    const-string v13, "android.intent.action.GET_CONTENT"

    const/4 v14, 0x0

    invoke-direct {v6, v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 277
    .local v6, "intent":Landroid/content/Intent;
    const-string v13, "image/*"

    invoke-virtual {v6, v13}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    const-string v13, "crop"

    const-string v14, "true"

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 279
    const-string v13, "scale"

    const/4 v14, 0x1

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 280
    const-string v13, "scaleUpIfNeeded"

    const/4 v14, 0x0

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 281
    const-string v13, "outputFormat"

    sget-object v14, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v14}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 283
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v13

    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    .line 284
    .local v4, "display":Landroid/view/Display;
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 285
    .local v8, "rect":Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v12

    .line 287
    .local v12, "window":Landroid/view/Window;
    invoke-virtual {v12}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13, v8}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 289
    iget v9, v8, Landroid/graphics/Rect;->top:I

    .line 290
    .local v9, "statusBarHeight":I
    const v13, 0x1020002

    invoke-virtual {v12, v13}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v2

    .line 291
    .local v2, "contentViewTop":I
    sub-int v10, v2, v9

    .line 292
    .local v10, "titleBarHeight":I
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v13

    iget v13, v13, Landroid/content/res/Configuration;->orientation:I

    const/4 v14, 0x1

    if-ne v13, v14, :cond_3

    const/4 v7, 0x1

    .line 295
    .local v7, "isPortrait":Z
    :goto_2
    invoke-virtual {v4}, Landroid/view/Display;->getWidth()I

    move-result v11

    .line 296
    .local v11, "width":I
    invoke-virtual {v4}, Landroid/view/Display;->getHeight()I

    move-result v13

    sub-int v5, v13, v10

    .line 298
    .local v5, "height":I
    const-string v14, "aspectX"

    if-eqz v7, :cond_4

    move v13, v11

    :goto_3
    invoke-virtual {v6, v14, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 299
    const-string v13, "aspectY"

    if-eqz v7, :cond_5

    .end local v5    # "height":I
    :goto_4
    invoke-virtual {v6, v13, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 302
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->createNewFile()Z

    .line 303
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Ljava/io/File;->setWritable(ZZ)Z

    .line 304
    const-string v13, "output"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v14

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 305
    const-string v13, "return-data"

    const/4 v14, 0x0

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 306
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    const/16 v14, 0x400

    move-object/from16 v0, p0

    invoke-virtual {v13, v0, v6, v14}, Landroid/app/Activity;->startActivityFromFragment(Landroid/app/Fragment;Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 307
    :catch_0
    move-exception v13

    goto/16 :goto_0

    .line 292
    .end local v7    # "isPortrait":Z
    .end local v11    # "width":I
    :cond_3
    const/4 v7, 0x0

    goto :goto_2

    .restart local v5    # "height":I
    .restart local v7    # "isPortrait":Z
    .restart local v11    # "width":I
    :cond_4
    move v13, v5

    .line 298
    goto :goto_3

    :cond_5
    move v5, v11

    .line 299
    goto :goto_4

    .line 312
    .end local v2    # "contentViewTop":I
    .end local v4    # "display":Landroid/view/Display;
    .end local v5    # "height":I
    .end local v6    # "intent":Landroid/content/Intent;
    .end local v7    # "isPortrait":Z
    .end local v8    # "rect":Landroid/graphics/Rect;
    .end local v9    # "statusBarHeight":I
    .end local v10    # "titleBarHeight":I
    .end local v11    # "width":I
    .end local v12    # "window":Landroid/view/Window;
    :cond_6
    const/4 v13, 0x2

    move/from16 v0, p1

    if-ne v0, v13, :cond_1

    .line 313
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const-string v14, "lockscreen_background"

    const/4 v15, 0x0

    invoke-static {v13, v14, v15}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 315
    invoke-direct/range {p0 .. p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateCustomBackgroundSummary()V

    .line 316
    const/4 v13, 0x1

    goto/16 :goto_1

    .line 309
    .restart local v2    # "contentViewTop":I
    .restart local v4    # "display":Landroid/view/Display;
    .restart local v6    # "intent":Landroid/content/Intent;
    .restart local v7    # "isPortrait":Z
    .restart local v8    # "rect":Landroid/graphics/Rect;
    .restart local v9    # "statusBarHeight":I
    .restart local v10    # "titleBarHeight":I
    .restart local v11    # "width":I
    .restart local v12    # "window":Landroid/view/Window;
    :catch_1
    move-exception v13

    goto/16 :goto_0
.end method

.method private updateCustomBackgroundSummary()V
    .locals 4

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "lockscreen_background"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 159
    const v0, 0x7f08026c

    .line 160
    .local v0, "resId":I
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 168
    :goto_0
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 169
    return-void

    .line 161
    .end local v0    # "resId":I
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 162
    const v0, 0x7f08026b

    .line 163
    .restart local v0    # "resId":I
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0

    .line 165
    .end local v0    # "resId":I
    :cond_1
    const v0, 0x7f08026a

    .line 166
    .restart local v0    # "resId":I
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0
.end method

.method private updateKeyguardState(ZZ)V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 234
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/androie/settings/cyanogenmod/LockscreenInterface$DeviceAdminLockscreenReceiver;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 236
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v2, v1, v0}, Landroid/app/admin/DevicePolicyManager;->setActiveAdmin(Landroid/content/ComponentName;Z)V

    .line 237
    if-eqz p2, :cond_0

    const/4 v0, 0x0

    .line 240
    :cond_0
    if-nez p1, :cond_1

    .line 241
    or-int/lit8 v0, v0, 0x2

    .line 243
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v2, v1, v0}, Landroid/app/admin/DevicePolicyManager;->setKeyguardDisabledFeatures(Landroid/content/ComponentName;I)V

    .line 244
    return-void
.end method


# virtual methods
.method public hasButtons()Z
    .locals 2

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x111003e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 186
    const/16 v1, 0x400

    if-ne p1, v1, :cond_1

    .line 189
    const/4 v1, -0x1

    if-ne p2, v1, :cond_2

    .line 190
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperImage:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 193
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperImage:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->setReadOnly()Z

    .line 194
    const v0, 0x7f080268

    .line 195
    .local v0, "hintId":I
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "lockscreen_background"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 197
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateCustomBackgroundSummary()V

    .line 204
    :goto_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 207
    .end local v0    # "hintId":I
    :cond_1
    return-void

    .line 199
    :cond_2
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 200
    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 202
    :cond_3
    const v0, 0x7f080269

    .restart local v0    # "hintId":I
    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 93
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 95
    const v4, 0x7f050021

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->addPreferencesFromResource(I)V

    .line 96
    const-string v4, "lockscreen_general_category"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceCategory;

    .line 97
    .local v1, "generalCategory":Landroid/preference/PreferenceCategory;
    const-string v4, "lockscreen_widgets_category"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceCategory;

    .line 100
    .local v3, "widgetsCategory":Landroid/preference/PreferenceCategory;
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v4

    if-nez v4, :cond_4

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mIsPrimary:Z

    .line 101
    iget-boolean v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mIsPrimary:Z

    if-eqz v4, :cond_5

    .line 103
    const-string v4, "lockscreen_battery_status"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    .line 104
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    if-eqz v4, :cond_0

    .line 105
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 108
    :cond_0
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/androie/settings/Utils;->isPhone(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 109
    const-string v4, "lockscreen_maximize_widgets"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 113
    :cond_1
    const-string v4, "lockscreen_buttons"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceScreen;

    .line 114
    .local v2, "lockscreenButtons":Landroid/preference/PreferenceScreen;
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->hasButtons()Z

    move-result v4

    if-nez v4, :cond_2

    .line 115
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 127
    .end local v2    # "lockscreenButtons":Landroid/preference/PreferenceScreen;
    :cond_2
    :goto_1
    const-string v4, "lockscreen_background"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/ListPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    .line 128
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    invoke-virtual {v4, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 129
    invoke-direct {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateCustomBackgroundSummary()V

    .line 131
    const-string v4, "lockscreen_enable_widgets"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableWidgets:Landroid/preference/CheckBoxPreference;

    .line 132
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableWidgets:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 133
    const-string v4, "lockscreen_enable_camera"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    .line 134
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 136
    const-string v4, "device_policy"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/admin/DevicePolicyManager;

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 138
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mDPM:Landroid/app/admin/DevicePolicyManager;

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/app/admin/DevicePolicyManager;->getKeyguardDisabledFeatures(Landroid/content/ComponentName;)I

    move-result v0

    .line 139
    .local v0, "disabledFeatures":I
    iget-object v7, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableWidgets:Landroid/preference/CheckBoxPreference;

    and-int/lit8 v4, v0, 0x1

    if-nez v4, :cond_6

    move v4, v5

    :goto_2
    invoke-virtual {v7, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 140
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    and-int/lit8 v7, v0, 0x2

    if-nez v7, :cond_7

    :goto_3
    invoke-virtual {v4, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 143
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.camera"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 144
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 147
    :cond_3
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/lockwallpaper"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperImage:Ljava/io/File;

    .line 148
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/lockwallpaper.tmp"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mWallpaperTemporary:Ljava/io/File;

    .line 151
    const-string v4, "lock_clock"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {p0, v4, v3}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->removePreferenceIfPackageNotInstalled(Landroid/preference/Preference;Landroid/preference/PreferenceGroup;)Z

    .line 152
    return-void

    .end local v0    # "disabledFeatures":I
    :cond_4
    move v4, v6

    .line 100
    goto/16 :goto_0

    .line 119
    :cond_5
    const-string v4, "screen_security"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 120
    const-string v4, "lockscreen_maximize_widgets"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 122
    const-string v4, "lockscreen_battery_status"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 123
    const-string v4, "lockscreen_buttons"

    invoke-virtual {p0, v4}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_1

    .restart local v0    # "disabledFeatures":I
    :cond_6
    move v4, v6

    .line 139
    goto/16 :goto_2

    :cond_7
    move v5, v6

    .line 140
    goto/16 :goto_3
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "objValue"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 211
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 213
    .local v0, "cr":Landroid/content/ContentResolver;
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    if-ne p1, v4, :cond_0

    move-object v4, p2

    .line 214
    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 215
    .local v3, "value":I
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-virtual {v4, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v1

    .line 216
    .local v1, "index":I
    const-string v4, "lockscreen_always_show_battery"

    invoke-static {v0, v4, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 217
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    invoke-virtual {v6}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v6

    aget-object v6, v6, v1

    invoke-virtual {v4, v6}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    move v4, v5

    .line 230
    .end local v1    # "index":I
    .end local v3    # "value":I
    :goto_0
    return v4

    .line 219
    .restart local p2    # "objValue":Ljava/lang/Object;
    :cond_0
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    if-ne p1, v4, :cond_1

    .line 220
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mCustomBackground:Landroid/preference/ListPreference;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    .line 221
    .local v2, "selection":I
    invoke-direct {p0, v2}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->handleBackgroundSelection(I)Z

    move-result v4

    goto :goto_0

    .line 222
    .end local v2    # "selection":I
    :cond_1
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    if-ne p1, v4, :cond_2

    .line 223
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iget-object v6, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableWidgets:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v6

    invoke-direct {p0, v4, v6}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateKeyguardState(ZZ)V

    move v4, v5

    .line 224
    goto :goto_0

    .line 225
    .restart local p2    # "objValue":Ljava/lang/Object;
    :cond_2
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableWidgets:Landroid/preference/CheckBoxPreference;

    if-ne p1, v4, :cond_3

    .line 226
    iget-object v4, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mEnableCamera:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "objValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-direct {p0, v4, v6}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->updateKeyguardState(ZZ)V

    move v4, v5

    .line 227
    goto :goto_0

    .line 230
    .restart local p2    # "objValue":Ljava/lang/Object;
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 173
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 175
    iget-boolean v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mIsPrimary:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    if-eqz v2, :cond_0

    .line 176
    invoke-virtual {p0}, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 177
    .local v1, "cr":Landroid/content/ContentResolver;
    const-string v2, "lockscreen_always_show_battery"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 179
    .local v0, "batteryStatus":I
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 180
    iget-object v2, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/androie/settings/cyanogenmod/LockscreenInterface;->mBatteryStatus:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 182
    .end local v0    # "batteryStatus":I
    .end local v1    # "cr":Landroid/content/ContentResolver;
    :cond_0
    return-void
.end method
