.class Lcom/androie/settings/cyanogenmod/IconPicker$1;
.super Ljava/lang/Object;
.source "IconPicker.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/cyanogenmod/IconPicker;->pickIcon(ILjava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androie/settings/cyanogenmod/IconPicker;

.field final synthetic val$fragmentId:I

.field final synthetic val$image:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/androie/settings/cyanogenmod/IconPicker;Ljava/io/File;I)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->this$0:Lcom/androie/settings/cyanogenmod/IconPicker;

    iput-object p2, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->val$image:Ljava/io/File;

    iput p3, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->val$fragmentId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->this$0:Lcom/androie/settings/cyanogenmod/IconPicker;

    iget-object v1, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->val$image:Ljava/io/File;

    iget v2, p0, Lcom/androie/settings/cyanogenmod/IconPicker$1;->val$fragmentId:I

    invoke-static {v0, p2, v1, v2}, Lcom/androie/settings/cyanogenmod/IconPicker;->access$000(Lcom/androie/settings/cyanogenmod/IconPicker;ILjava/io/File;I)V

    .line 89
    return-void
.end method
