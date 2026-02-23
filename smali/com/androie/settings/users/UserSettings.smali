.class public Lcom/androie/settings/users/UserSettings;
.super Lcom/androie/settings/SettingsPreferenceFragment;
.source "UserSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final USER_DRAWABLES:[I


# instance fields
.field private mAddUser:Landroid/preference/Preference;

.field private mAddedUserId:I

.field private mAddingUser:Z

.field private mHandler:Landroid/os/Handler;

.field private mIsOwner:Z

.field private mMePreference:Landroid/preference/Preference;

.field private mNicknamePreference:Lcom/androie/settings/SelectableEditTextPreference;

.field private mProfileExists:Z

.field private mRemovingUserId:I

.field private mUserChangeReceiver:Landroid/content/BroadcastReceiver;

.field private mUserIcons:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mUserListCategory:Landroid/preference/PreferenceGroup;

.field private final mUserLock:Ljava/lang/Object;

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 111
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androie/settings/users/UserSettings;->USER_DRAWABLES:[I

    return-void

    :array_0
    .array-data 4
        0x7f020018
        0x7f020019
        0x7f02001a
        0x7f02001b
        0x7f02001c
        0x7f02001d
        0x7f02001e
        0x7f02001f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Lcom/androie/settings/SettingsPreferenceFragment;-><init>()V

    .line 129
    const/4 v1, -0x1

    iput v1, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    .line 130
    iput v0, p0, Lcom/androie/settings/users/UserSettings;->mAddedUserId:I

    .line 134
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    .line 136
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    .line 137
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    .line 140
    new-instance v0, Lcom/androie/settings/users/UserSettings$1;

    invoke-direct {v0, p0}, Lcom/androie/settings/users/UserSettings$1;-><init>(Lcom/androie/settings/users/UserSettings;)V

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mHandler:Landroid/os/Handler;

    .line 157
    new-instance v0, Lcom/androie/settings/users/UserSettings$2;

    invoke-direct {v0, p0}, Lcom/androie/settings/users/UserSettings$2;-><init>(Lcom/androie/settings/users/UserSettings;)V

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/androie/settings/users/UserSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->updateUserList()V

    return-void
.end method

.method static synthetic access$100(Lcom/androie/settings/users/UserSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->onUserCreated(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/androie/settings/users/UserSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->removeUserNow()V

    return-void
.end method

.method static synthetic access$1100(Lcom/androie/settings/users/UserSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->addUserNow(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/androie/settings/users/UserSettings;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget v0, p0, Lcom/androie/settings/users/UserSettings;->mAddedUserId:I

    return v0
.end method

.method static synthetic access$1300(Lcom/androie/settings/users/UserSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->switchUserNow(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/androie/settings/users/UserSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->onAddUserClicked(I)V

    return-void
.end method

.method static synthetic access$1500(Lcom/androie/settings/users/UserSettings;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->launchChooseLockscreen()V

    return-void
.end method

.method static synthetic access$1600(Lcom/androie/settings/users/UserSettings;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/androie/settings/users/UserSettings;)Landroid/content/pm/UserInfo;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->createTrustedUser()Landroid/content/pm/UserInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/androie/settings/users/UserSettings;)Landroid/content/pm/UserInfo;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->createLimitedUser()Landroid/content/pm/UserInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1902(Lcom/androie/settings/users/UserSettings;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    return p1
.end method

.method static synthetic access$200(Lcom/androie/settings/users/UserSettings;IZ)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Lcom/androie/settings/users/UserSettings;->onManageUserClicked(IZ)V

    return-void
.end method

.method static synthetic access$300(Lcom/androie/settings/users/UserSettings;)I
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    return v0
.end method

.method static synthetic access$302(Lcom/androie/settings/users/UserSettings;I)I
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    return p1
.end method

.method static synthetic access$400(Lcom/androie/settings/users/UserSettings;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$500(Lcom/androie/settings/users/UserSettings;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/androie/settings/users/UserSettings;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->finishLoadProfile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/androie/settings/users/UserSettings;)Landroid/os/UserManager;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/androie/settings/users/UserSettings;Landroid/content/pm/UserInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;
    .param p1, "x1"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->assignProfilePhoto(Landroid/content/pm/UserInfo;)V

    return-void
.end method

.method static synthetic access$900(Lcom/androie/settings/users/UserSettings;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/androie/settings/users/UserSettings;

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->getProfileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addUserNow(I)V
    .locals 2
    .param p1, "userType"    # I

    .prologue
    .line 570
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 571
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    .line 573
    new-instance v0, Lcom/androie/settings/users/UserSettings$11;

    invoke-direct {v0, p0, p1}, Lcom/androie/settings/users/UserSettings$11;-><init>(Lcom/androie/settings/users/UserSettings;I)V

    invoke-virtual {v0}, Lcom/androie/settings/users/UserSettings$11;->start()V

    .line 595
    monitor-exit v1

    .line 596
    return-void

    .line 595
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private assignDefaultPhoto(Landroid/content/pm/UserInfo;)V
    .locals 5
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 700
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget-object v2, Lcom/androie/settings/users/UserSettings;->USER_DRAWABLES:[I

    iget v3, p1, Landroid/content/pm/UserInfo;->id:I

    sget-object v4, Lcom/androie/settings/users/UserSettings;->USER_DRAWABLES:[I

    array-length v4, v4

    rem-int/2addr v3, v4

    aget v2, v2, v3

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 702
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    iget v2, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v2, v0}, Landroid/os/UserManager;->setUserIcon(ILandroid/graphics/Bitmap;)V

    .line 703
    return-void
.end method

.method private assignProfilePhoto(Landroid/content/pm/UserInfo;)V
    .locals 1
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 686
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/androie/settings/Utils;->copyMeProfilePhoto(Landroid/content/Context;Landroid/content/pm/UserInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 687
    invoke-direct {p0, p1}, Lcom/androie/settings/users/UserSettings;->assignDefaultPhoto(Landroid/content/pm/UserInfo;)V

    .line 689
    :cond_0
    return-void
.end method

.method private createLimitedUser()Landroid/content/pm/UserInfo;
    .locals 14

    .prologue
    const/4 v13, 0x1

    .line 340
    iget-object v10, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f080a4d

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x8

    invoke-virtual {v10, v11, v12}, Landroid/os/UserManager;->createUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;

    move-result-object v7

    .line 343
    .local v7, "newUserInfo":Landroid/content/pm/UserInfo;
    iget v9, v7, Landroid/content/pm/UserInfo;->id:I

    .line 344
    .local v9, "userId":I
    new-instance v8, Landroid/os/UserHandle;

    invoke-direct {v8, v9}, Landroid/os/UserHandle;-><init>(I)V

    .line 345
    .local v8, "user":Landroid/os/UserHandle;
    iget-object v10, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    const-string v11, "no_modify_accounts"

    invoke-virtual {v10, v11, v13, v8}, Landroid/os/UserManager;->setUserRestriction(Ljava/lang/String;ZLandroid/os/UserHandle;)V

    .line 346
    iget-object v10, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    const-string v11, "no_share_location"

    invoke-virtual {v10, v11, v13, v8}, Landroid/os/UserManager;->setUserRestriction(Ljava/lang/String;ZLandroid/os/UserHandle;)V

    .line 347
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "location_providers_allowed"

    const-string v12, ""

    invoke-static {v10, v11, v12, v9}, Landroid/provider/Settings$Secure;->putStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 349
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    sget-object v11, Lcom/androie/settings/users/UserSettings;->USER_DRAWABLES:[I

    sget-object v12, Lcom/androie/settings/users/UserSettings;->USER_DRAWABLES:[I

    array-length v12, v12

    rem-int v12, v9, v12

    aget v11, v11, v12

    invoke-static {v10, v11}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 352
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    iget-object v10, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v10, v9, v4}, Landroid/os/UserManager;->setUserIcon(ILandroid/graphics/Bitmap;)V

    .line 354
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-static {v10}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 355
    .local v2, "am":Landroid/accounts/AccountManager;
    invoke-virtual {v2}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v1

    .line 356
    .local v1, "accounts":[Landroid/accounts/Account;
    if-eqz v1, :cond_0

    .line 357
    move-object v3, v1

    .local v3, "arr$":[Landroid/accounts/Account;
    array-length v6, v3

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v0, v3, v5

    .line 358
    .local v0, "account":Landroid/accounts/Account;
    invoke-virtual {v2, v0, v8}, Landroid/accounts/AccountManager;->addSharedAccount(Landroid/accounts/Account;Landroid/os/UserHandle;)Z

    .line 357
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 361
    .end local v0    # "account":Landroid/accounts/Account;
    .end local v3    # "arr$":[Landroid/accounts/Account;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_0
    return-object v7
.end method

.method private createTrustedUser()Landroid/content/pm/UserInfo;
    .locals 4

    .prologue
    .line 365
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080a4c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/UserManager;->createUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 367
    .local v0, "newUserInfo":Landroid/content/pm/UserInfo;
    if-eqz v0, :cond_0

    .line 368
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->assignDefaultPhoto(Landroid/content/pm/UserInfo;)V

    .line 370
    :cond_0
    return-object v0
.end method

.method private encircle(I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "iconResId"    # I

    .prologue
    .line 764
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 765
    .local v0, "icon":Landroid/graphics/Bitmap;
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    return-object v1
.end method

.method private encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 769
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/androie/settings/users/CircleFramedDrawable;->getInstance(Landroid/content/Context;Landroid/graphics/Bitmap;)Lcom/androie/settings/users/CircleFramedDrawable;

    move-result-object v0

    .line 770
    .local v0, "circled":Landroid/graphics/drawable/Drawable;
    return-object v0
.end method

.method private finishLoadProfile(Ljava/lang/String;)V
    .locals 6
    .param p1, "profileName"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_1

    .line 284
    :cond_0
    :goto_0
    return-void

    .line 277
    :cond_1
    iget-object v2, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    const v3, 0x7f080a3a

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {p0, v3, v4}, Lcom/androie/settings/users/UserSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 278
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    .line 279
    .local v1, "myUserId":I
    iget-object v2, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v2, v1}, Landroid/os/UserManager;->getUserIcon(I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 280
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 281
    iget-object v2, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 282
    iget-object v2, p0, Lcom/androie/settings/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method private getProfileName()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 692
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/androie/settings/Utils;->getMeProfileName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 693
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 694
    iput-boolean v2, p0, Lcom/androie/settings/users/UserSettings;->mProfileExists:Z

    .line 696
    :cond_0
    return-object v0
.end method

.method private hasLockscreenSecurity()Z
    .locals 2

    .prologue
    .line 287
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    .line 288
    .local v0, "lpu":Lcom/android/internal/widget/LockPatternUtils;
    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isLockPasswordEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isLockPatternEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isInitialized(Landroid/content/pm/UserInfo;)Z
    .locals 1
    .param p1, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 760
    iget v0, p1, Landroid/content/pm/UserInfo;->flags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private launchChooseLockscreen()V
    .locals 3

    .prologue
    .line 292
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.app.action.SET_NEW_PASSWORD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 293
    .local v0, "chooseLockIntent":Landroid/content/Intent;
    const-string v1, "minimum_quality"

    const/high16 v2, 0x10000

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 295
    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/androie/settings/users/UserSettings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 296
    return-void
.end method

.method private loadIconsAsync(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 667
    .local p1, "missingIcons":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 668
    .local v0, "resources":Landroid/content/res/Resources;
    new-instance v1, Lcom/androie/settings/users/UserSettings$12;

    invoke-direct {v1, p0}, Lcom/androie/settings/users/UserSettings$12;-><init>(Lcom/androie/settings/users/UserSettings;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/List;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v1, v2}, Lcom/androie/settings/users/UserSettings$12;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 683
    return-void
.end method

.method private loadProfile()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 253
    iput-boolean v1, p0, Lcom/androie/settings/users/UserSettings;->mProfileExists:Z

    .line 254
    new-instance v0, Lcom/androie/settings/users/UserSettings$3;

    invoke-direct {v0, p0}, Lcom/androie/settings/users/UserSettings$3;-><init>(Lcom/androie/settings/users/UserSettings;)V

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/androie/settings/users/UserSettings$3;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 273
    return-void
.end method

.method private onAddUserClicked(I)V
    .locals 3
    .param p1, "userType"    # I

    .prologue
    .line 312
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 313
    :try_start_0
    iget v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    if-nez v0, :cond_0

    .line 314
    packed-switch p1, :pswitch_data_0

    .line 327
    :cond_0
    :goto_0
    monitor-exit v1

    .line 328
    return-void

    .line 316
    :pswitch_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    goto :goto_0

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 319
    :pswitch_1
    :try_start_1
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->hasLockscreenSecurity()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 320
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->addUserNow(I)V

    goto :goto_0

    .line 322
    :cond_1
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 314
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onManageUserClicked(IZ)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x0

    .line 374
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v0, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 375
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-eqz v1, :cond_1

    .line 376
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 377
    const-string v0, "user_id"

    invoke-virtual {v2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 378
    const-string v0, "new_user"

    invoke-virtual {v2, v0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 379
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/androie/settings/users/AppRestrictionsFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f080a72

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    .line 396
    :cond_0
    :goto_0
    return-void

    .line 383
    :cond_1
    iget v1, v0, Landroid/content/pm/UserInfo;->id:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 385
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 386
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 387
    const-string v1, "show_nickname"

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 389
    :cond_2
    iget v1, v0, Landroid/content/pm/UserInfo;->id:I

    if-nez v1, :cond_3

    const v3, 0x7f080482

    .line 392
    :goto_1
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    const-class v1, Lcom/androie/settings/OwnerInfoSettings;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Landroid/preference/PreferenceActivity;->startPreferencePanel(Ljava/lang/String;Landroid/os/Bundle;ILjava/lang/CharSequence;Landroid/app/Fragment;I)V

    goto :goto_0

    .line 389
    :cond_3
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_4

    const v3, 0x7f080488

    goto :goto_1

    :cond_4
    const v3, 0x7f080486

    goto :goto_1
.end method

.method private onRemoveUserClicked(I)V
    .locals 3
    .param p1, "userId"    # I

    .prologue
    .line 331
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 332
    :try_start_0
    iget v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    if-nez v0, :cond_0

    .line 333
    iput p1, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    .line 334
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    .line 336
    :cond_0
    monitor-exit v1

    .line 337
    return-void

    .line 336
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private onUserCreated(I)V
    .locals 1
    .param p1, "userId"    # I

    .prologue
    .line 399
    iput p1, p0, Lcom/androie/settings/users/UserSettings;->mAddedUserId:I

    .line 400
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v0, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 401
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    .line 405
    :goto_0
    return-void

    .line 403
    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    goto :goto_0
.end method

.method private removeThisUser()V
    .locals 3

    .prologue
    .line 561
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/app/IActivityManager;->switchUser(I)Z

    .line 562
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/UserManager;->removeUser(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 567
    :goto_0
    return-void

    .line 564
    :catch_0
    move-exception v0

    .line 565
    .local v0, "re":Landroid/os/RemoteException;
    const-string v1, "UserSettings"

    const-string v2, "Unable to remove self user"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private removeUserNow()V
    .locals 2

    .prologue
    .line 545
    iget v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 546
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->removeThisUser()V

    .line 557
    :goto_0
    return-void

    .line 548
    :cond_0
    new-instance v0, Lcom/androie/settings/users/UserSettings$10;

    invoke-direct {v0, p0}, Lcom/androie/settings/users/UserSettings$10;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v0}, Lcom/androie/settings/users/UserSettings$10;->start()V

    goto :goto_0
.end method

.method private setPhotoId(Landroid/preference/Preference;Landroid/content/pm/UserInfo;)V
    .locals 3
    .param p1, "pref"    # Landroid/preference/Preference;
    .param p2, "user"    # Landroid/content/pm/UserInfo;

    .prologue
    .line 706
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    iget v2, p2, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 707
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 708
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->encircle(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 710
    :cond_0
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 713
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/os/UserManager;->setUserName(ILjava/lang/String;)V

    .line 714
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mNicknamePreference:Lcom/androie/settings/SelectableEditTextPreference;

    invoke-virtual {v0, p1}, Lcom/androie/settings/SelectableEditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 715
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 716
    return-void
.end method

.method private switchUserNow(I)V
    .locals 1
    .param p1, "userId"    # I

    .prologue
    .line 600
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/app/IActivityManager;->switchUser(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 604
    :goto_0
    return-void

    .line 601
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private updateUserList()V
    .locals 13

    .prologue
    const v12, 0x7f020018

    const/4 v8, 0x1

    const/4 v11, 0x0

    const/4 v2, 0x0

    .line 607
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 664
    :goto_0
    return-void

    .line 608
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v1, v8}, Landroid/os/UserManager;->getUsers(Z)Ljava/util/List;

    move-result-object v10

    .line 610
    .local v10, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 611
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v11}, Landroid/preference/PreferenceGroup;->setOrderingAsAdded(Z)V

    .line 612
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    iget-object v3, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 614
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 615
    .local v7, "missingIcons":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/pm/UserInfo;

    .line 617
    .local v9, "user":Landroid/content/pm/UserInfo;
    iget v1, v9, Landroid/content/pm/UserInfo;->id:I

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v3

    if-ne v1, v3, :cond_3

    .line 618
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    .line 631
    .local v0, "pref":Landroid/preference/Preference;
    :goto_2
    invoke-direct {p0, v9}, Lcom/androie/settings/users/UserSettings;->isInitialized(Landroid/content/pm/UserInfo;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 632
    invoke-virtual {v9}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_7

    const v1, 0x7f080a38

    :goto_3
    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    .line 638
    :cond_2
    :goto_4
    iget-object v1, v9, Landroid/content/pm/UserInfo;->iconPath:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 639
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserIcons:Landroid/util/SparseArray;

    iget v3, v9, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_9

    .line 640
    iget v1, v9, Landroid/content/pm/UserInfo;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 641
    invoke-direct {p0, v12}, Lcom/androie/settings/users/UserSettings;->encircle(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 620
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_3
    new-instance v0, Lcom/androie/settings/users/UserPreference;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget v3, v9, Landroid/content/pm/UserInfo;->id:I

    iget-boolean v4, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-eqz v4, :cond_5

    invoke-virtual {v9}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v4, p0

    :goto_5
    iget-boolean v5, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-eqz v5, :cond_6

    move-object v5, p0

    :goto_6
    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 623
    .restart local v0    # "pref":Landroid/preference/Preference;
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 624
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v9, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 625
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 626
    iget v1, v9, Landroid/content/pm/UserInfo;->id:I

    if-nez v1, :cond_4

    .line 627
    const v1, 0x7f080a39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    .line 629
    :cond_4
    iget-object v1, v9, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_2

    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_5
    move-object v4, v2

    .line 620
    goto :goto_5

    :cond_6
    move-object v5, v2

    goto :goto_6

    .line 632
    .restart local v0    # "pref":Landroid/preference/Preference;
    :cond_7
    const v1, 0x7f080a37

    goto :goto_3

    .line 635
    :cond_8
    invoke-virtual {v9}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 636
    const v1, 0x7f080a34

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_4

    .line 643
    :cond_9
    invoke-direct {p0, v0, v9}, Lcom/androie/settings/users/UserSettings;->setPhotoId(Landroid/preference/Preference;Landroid/content/pm/UserInfo;)V

    goto/16 :goto_1

    .line 648
    .end local v0    # "pref":Landroid/preference/Preference;
    .end local v9    # "user":Landroid/content/pm/UserInfo;
    :cond_a
    iget-boolean v1, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    if-eqz v1, :cond_b

    .line 649
    new-instance v0, Lcom/androie/settings/users/UserPreference;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/16 v3, -0xa

    move-object v4, v2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 651
    .restart local v0    # "pref":Landroid/preference/Preference;
    invoke-virtual {v0, v11}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 652
    const v1, 0x7f080a4c

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(I)V

    .line 653
    invoke-direct {p0, v12}, Lcom/androie/settings/users/UserSettings;->encircle(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 654
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 656
    .end local v0    # "pref":Landroid/preference/Preference;
    :cond_b
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 659
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_c

    .line 660
    invoke-direct {p0, v7}, Lcom/androie/settings/users/UserSettings;->loadIconsAsync(Ljava/util/List;)V

    .line 662
    :cond_c
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-static {}, Landroid/os/UserManager;->getMaxSupportedUsers()I

    move-result v1

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v2

    if-le v1, v2, :cond_d

    .line 663
    .local v8, "moreUsers":Z
    :goto_7
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    invoke-virtual {v1, v8}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_0

    .end local v8    # "moreUsers":Z
    :cond_d
    move v8, v11

    .line 662
    goto :goto_7
.end method


# virtual methods
.method public getHelpResource()I
    .locals 1

    .prologue
    .line 812
    const v0, 0x7f080a6b

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 300
    invoke-super {p0, p1, p2, p3}, Lcom/androie/settings/SettingsPreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 302
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 303
    if-eqz p2, :cond_1

    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->hasLockscreenSecurity()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 304
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->addUserNow(I)V

    .line 309
    :cond_0
    :goto_0
    return-void

    .line 306
    :cond_1
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 775
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/androie/settings/users/UserPreference;

    if-eqz v1, :cond_0

    .line 776
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/users/UserPreference;

    invoke-virtual {v1}, Lcom/androie/settings/users/UserPreference;->getUserId()I

    move-result v0

    .line 777
    .local v0, "userId":I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 786
    .end local v0    # "userId":I
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 779
    .restart local v0    # "userId":I
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->onRemoveUserClicked(I)V

    goto :goto_0

    .line 782
    :pswitch_2
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/androie/settings/users/UserSettings;->onManageUserClicked(IZ)V

    goto :goto_0

    .line 777
    nop

    :pswitch_data_0
    .packed-switch 0x7f0c0171
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 174
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 176
    if-eqz p1, :cond_1

    .line 177
    const-string v0, "adding_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    const-string v0, "adding_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/users/UserSettings;->mAddedUserId:I

    .line 180
    :cond_0
    const-string v0, "removing_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 181
    const-string v0, "removing_user"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    .line 185
    :cond_1
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "user"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    .line 186
    const v0, 0x7f050054

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->addPreferencesFromResource(I)V

    .line 187
    const-string v0, "user_list"

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mUserListCategory:Landroid/preference/PreferenceGroup;

    .line 188
    new-instance v0, Lcom/androie/settings/users/UserPreference;

    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v3

    iget-object v4, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v4}, Landroid/os/UserManager;->isLinkedUser()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v4, v2

    :goto_0
    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/androie/settings/users/UserPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    .line 190
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    const-string v1, "user_me"

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 192
    iget-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-eqz v0, :cond_2

    .line 193
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    const v1, 0x7f080a39

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(I)V

    .line 195
    :cond_2
    const-string v0, "user_add"

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/androie/settings/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    .line 196
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 197
    iget-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-eqz v0, :cond_3

    invoke-static {}, Landroid/os/UserManager;->getMaxSupportedUsers()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_4

    .line 198
    :cond_3
    const-string v0, "user_add"

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->removePreference(Ljava/lang/String;)V

    .line 200
    :cond_4
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->loadProfile()V

    .line 201
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->setHasOptionsMenu(Z)V

    .line 202
    new-instance v6, Landroid/content/IntentFilter;

    const-string v0, "android.intent.action.USER_REMOVED"

    invoke-direct {v6, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 203
    .local v6, "filter":Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.USER_INFO_CHANGED"

    invoke-virtual {v6, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 204
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/androie/settings/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    sget-object v5, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    iget-object v8, p0, Lcom/androie/settings/users/UserSettings;->mHandler:Landroid/os/Handler;

    move-object v7, v2

    invoke-virtual/range {v3 .. v8}, Landroid/app/Activity;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 206
    return-void

    .end local v6    # "filter":Landroid/content/IntentFilter;
    :cond_5
    move-object v4, p0

    .line 188
    goto :goto_0
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 16
    .param p1, "dialogId"    # I

    .prologue
    .line 416
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 417
    .local v2, "context":Landroid/content/Context;
    if-nez v2, :cond_0

    const/4 v9, 0x0

    .line 540
    :goto_0
    return-object v9

    .line 418
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 540
    const/4 v9, 0x0

    goto :goto_0

    .line 420
    :pswitch_0
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v4, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    move-object/from16 v0, p0

    iget v5, v0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    if-ne v1, v5, :cond_1

    const v1, 0x7f080a4e

    :goto_1
    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    move-object/from16 v0, p0

    iget v5, v0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    if-ne v1, v5, :cond_3

    const v1, 0x7f080a51

    :goto_2
    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x7f080a56

    new-instance v5, Lcom/androie/settings/users/UserSettings$4;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/androie/settings/users/UserSettings$4;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v4, 0x1040000

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 439
    .local v9, "dlg":Landroid/app/Dialog;
    goto :goto_0

    .line 420
    .end local v9    # "dlg":Landroid/app/Dialog;
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    invoke-virtual {v1, v5}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_2

    const v1, 0x7f080a50

    goto :goto_1

    :cond_2
    const v1, 0x7f080a4f

    goto :goto_1

    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    invoke-virtual {v1, v5}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_4

    const v1, 0x7f080a53

    goto :goto_2

    :cond_4
    const v1, 0x7f080a52

    goto :goto_2

    .line 442
    :pswitch_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a49

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x104000a

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    goto/16 :goto_0

    .line 447
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/app/Activity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 449
    .local v12, "preferences":Landroid/content/SharedPreferences;
    const-string v1, "key_add_user_long_message_displayed"

    const/4 v4, 0x0

    invoke-interface {v12, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 451
    .local v10, "longMessageDisplayed":Z
    if-eqz v10, :cond_5

    const v11, 0x7f080a43

    .line 454
    .local v11, "messageResId":I
    :goto_3
    const/4 v1, 0x2

    move/from16 v0, p1

    if-ne v0, v1, :cond_6

    const/4 v13, 0x1

    .line 456
    .local v13, "userType":I
    :goto_4
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a41

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x104000a

    new-instance v5, Lcom/androie/settings/users/UserSettings$5;

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v13, v10, v12}, Lcom/androie/settings/users/UserSettings$5;-><init>(Lcom/androie/settings/users/UserSettings;IZLandroid/content/SharedPreferences;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v4, 0x1040000

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 471
    .restart local v9    # "dlg":Landroid/app/Dialog;
    goto/16 :goto_0

    .line 451
    .end local v9    # "dlg":Landroid/app/Dialog;
    .end local v11    # "messageResId":I
    .end local v13    # "userType":I
    :cond_5
    const v11, 0x7f080a42

    goto :goto_3

    .line 454
    .restart local v11    # "messageResId":I
    :cond_6
    const/4 v13, 0x2

    goto :goto_4

    .line 474
    .end local v10    # "longMessageDisplayed":Z
    .end local v11    # "messageResId":I
    .end local v12    # "preferences":Landroid/content/SharedPreferences;
    :pswitch_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a44

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x7f080a45

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x7f080a47

    new-instance v5, Lcom/androie/settings/users/UserSettings$6;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/androie/settings/users/UserSettings$6;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x7f080a48

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 485
    .restart local v9    # "dlg":Landroid/app/Dialog;
    goto/16 :goto_0

    .line 488
    .end local v9    # "dlg":Landroid/app/Dialog;
    :pswitch_4
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a46

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x104000a

    new-instance v5, Lcom/androie/settings/users/UserSettings$7;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/androie/settings/users/UserSettings$7;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v4, 0x1040000

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 498
    .restart local v9    # "dlg":Landroid/app/Dialog;
    goto/16 :goto_0

    .line 501
    .end local v9    # "dlg":Landroid/app/Dialog;
    :pswitch_5
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 502
    .local v3, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 503
    .local v8, "addUserItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "title"

    const v4, 0x7f080a3f

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/androie/settings/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    const-string v1, "summary"

    const v4, 0x7f080a3d

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/androie/settings/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 506
    .local v7, "addProfileItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "title"

    const v4, 0x7f080a40

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/androie/settings/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    const-string v1, "summary"

    const v4, 0x7f080a3e

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/androie/settings/users/UserSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 509
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 510
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a3c

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v14

    new-instance v1, Landroid/widget/SimpleAdapter;

    const v4, 0x7f0400c1

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v15, "title"

    aput-object v15, v5, v6

    const/4 v6, 0x1

    const-string v15, "summary"

    aput-object v15, v5, v6

    const/4 v6, 0x2

    new-array v6, v6, [I

    fill-array-data v6, :array_0

    invoke-direct/range {v1 .. v6}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    new-instance v4, Lcom/androie/settings/users/UserSettings$8;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/androie/settings/users/UserSettings$8;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v14, v1, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 523
    .restart local v9    # "dlg":Landroid/app/Dialog;
    goto/16 :goto_0

    .line 526
    .end local v3    # "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v7    # "addProfileItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "addUserItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "dlg":Landroid/app/Dialog;
    :pswitch_6
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f080a35

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v4, 0x7f080a36

    new-instance v5, Lcom/androie/settings/users/UserSettings$9;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/androie/settings/users/UserSettings$9;-><init>(Lcom/androie/settings/users/UserSettings;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v4, 0x1040000

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 537
    .restart local v9    # "dlg":Landroid/app/Dialog;
    goto/16 :goto_0

    .line 418
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 510
    :array_0
    .array-data 4
        0x7f0c0038
        0x7f0c00f3
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 231
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "user"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserManager;

    .line 232
    .local v2, "um":Landroid/os/UserManager;
    iget-boolean v3, p0, Lcom/androie/settings/users/UserSettings;->mIsOwner:Z

    if-nez v3, :cond_0

    const-string v3, "no_remove_user"

    invoke-virtual {v2, v3}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 233
    iget-object v3, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v3}, Landroid/os/UserManager;->getUserName()Ljava/lang/String;

    move-result-object v0

    .line 234
    .local v0, "nickname":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080a4b

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v0, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v6, v7, v6, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    .line 236
    .local v1, "removeThisUser":Landroid/view/MenuItem;
    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 238
    .end local v0    # "nickname":Ljava/lang/String;
    .end local v1    # "removeThisUser":Landroid/view/MenuItem;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/androie/settings/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 239
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 217
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 218
    invoke-virtual {p0}, Lcom/androie/settings/users/UserSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 219
    return-void
.end method

.method public onDialogShowing()V
    .locals 0

    .prologue
    .line 409
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onDialogShowing()V

    .line 411
    invoke-virtual {p0, p0}, Lcom/androie/settings/users/UserSettings;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 412
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 790
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserLock:Ljava/lang/Object;

    monitor-enter v1

    .line 791
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mAddingUser:Z

    .line 792
    const/4 v0, -0x1

    iput v0, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    .line 793
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->updateUserList()V

    .line 794
    monitor-exit v1

    .line 795
    return-void

    .line 794
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 243
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 244
    .local v0, "itemId":I
    if-ne v0, v1, :cond_0

    .line 245
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/androie/settings/users/UserSettings;->onRemoveUserClicked(I)V

    .line 248
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 799
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mNicknamePreference:Lcom/androie/settings/SelectableEditTextPreference;

    if-ne p1, v1, :cond_1

    move-object v0, p2

    .line 800
    check-cast v0, Ljava/lang/String;

    .line 801
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mNicknamePreference:Lcom/androie/settings/SelectableEditTextPreference;

    if-ne p1, v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 803
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->setUserName(Ljava/lang/String;)V

    .line 805
    :cond_0
    const/4 v1, 0x1

    .line 807
    .end local v0    # "value":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 720
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mMePreference:Landroid/preference/Preference;

    if-ne p1, v0, :cond_3

    .line 722
    iget-boolean v0, p0, Lcom/androie/settings/users/UserSettings;->mProfileExists:Z

    if-nez v0, :cond_1

    .line 723
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.INSERT"

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 725
    const-string v1, "newLocalProfile"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 731
    :goto_0
    const-string v1, "finishActivityOnSaveCompleted"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 734
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v1}, Landroid/os/UserManager;->isLinkedUser()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 735
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    invoke-direct {p0, v0, v5}, Lcom/androie/settings/users/UserSettings;->onManageUserClicked(IZ)V

    .line 756
    :cond_0
    :goto_1
    return v5

    .line 727
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.EDIT"

    sget-object v2, Landroid/provider/ContactsContract$Profile;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0

    .line 737
    :cond_2
    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 739
    :cond_3
    instance-of v0, p1, Lcom/androie/settings/users/UserPreference;

    if-eqz v0, :cond_6

    .line 740
    check-cast p1, Lcom/androie/settings/users/UserPreference;

    invoke-virtual {p1}, Lcom/androie/settings/users/UserPreference;->getUserId()I

    move-result v0

    .line 742
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v1, v0}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 743
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    if-eqz v1, :cond_4

    .line 744
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    goto :goto_1

    .line 746
    :cond_4
    invoke-direct {p0, v0}, Lcom/androie/settings/users/UserSettings;->isInitialized(Landroid/content/pm/UserInfo;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 747
    iget-object v1, p0, Lcom/androie/settings/users/UserSettings;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/androie/settings/users/UserSettings;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x2

    iget v4, v0, Landroid/content/pm/UserInfo;->id:I

    iget v0, v0, Landroid/content/pm/UserInfo;->serialNumber:I

    invoke-virtual {v2, v3, v4, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 749
    :cond_5
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 750
    iget v0, v0, Landroid/content/pm/UserInfo;->id:I

    invoke-direct {p0, v0, v5}, Lcom/androie/settings/users/UserSettings;->onManageUserClicked(IZ)V

    goto :goto_1

    .line 753
    :cond_6
    iget-object v0, p0, Lcom/androie/settings/users/UserSettings;->mAddUser:Landroid/preference/Preference;

    if-ne p1, v0, :cond_0

    .line 754
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/androie/settings/users/UserSettings;->showDialog(I)V

    goto :goto_1
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 210
    invoke-super {p0}, Lcom/androie/settings/SettingsPreferenceFragment;->onResume()V

    .line 211
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->loadProfile()V

    .line 212
    invoke-direct {p0}, Lcom/androie/settings/users/UserSettings;->updateUserList()V

    .line 213
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 223
    invoke-super {p0, p1}, Lcom/androie/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 225
    const-string v0, "adding_user"

    iget v1, p0, Lcom/androie/settings/users/UserSettings;->mAddedUserId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 226
    const-string v0, "removing_user"

    iget v1, p0, Lcom/androie/settings/users/UserSettings;->mRemovingUserId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 227
    return-void
.end method
