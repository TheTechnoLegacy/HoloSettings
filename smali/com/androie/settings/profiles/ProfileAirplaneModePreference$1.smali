.class Lcom/androie/settings/profiles/ProfileAirplaneModePreference$1;
.super Ljava/lang/Object;
.source "ProfileAirplaneModePreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->createAirplaneModeDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;


# direct methods
.method constructor <init>(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;)V
    .locals 0

    .prologue
    .line 132
    iput-object p1, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$1;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 135
    iget-object v0, p0, Lcom/androie/settings/profiles/ProfileAirplaneModePreference$1;->this$0:Lcom/androie/settings/profiles/ProfileAirplaneModePreference;

    invoke-static {v0, p2}, Lcom/androie/settings/profiles/ProfileAirplaneModePreference;->access$002(Lcom/androie/settings/profiles/ProfileAirplaneModePreference;I)I

    .line 136
    return-void
.end method
