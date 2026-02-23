.class Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;
.super Ljava/lang/Object;
.source "NotificationLightSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

.field final synthetic val$item:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;


# direct methods
.method constructor <init>(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;)V
    .locals 0

    .prologue
    .line 522
    iput-object p1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    iput-object p2, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->val$item:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 528
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    iget-object v1, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;->this$1:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;

    invoke-static {v1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->access$200(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->val$item:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    invoke-static {v1, v2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 529
    .local v0, "index":I
    if-gez v0, :cond_0

    .line 530
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    iget-object v1, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;->this$1:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;

    invoke-static {v1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->access$200(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;)Ljava/util/List;

    move-result-object v1

    neg-int v2, v0

    add-int/lit8 v2, v2, -0x1

    iget-object v3, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->val$item:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    invoke-interface {v1, v2, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 534
    :goto_0
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    iget-object v1, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;->this$1:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;

    invoke-virtual {v1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->notifyDataSetChanged()V

    .line 535
    return-void

    .line 532
    :cond_0
    iget-object v1, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->this$2:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;

    iget-object v1, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1;->this$1:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;

    invoke-static {v1}, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;->access$200(Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    iget-object v1, v1, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    iget-object v2, p0, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageAdapter$1$1;->val$item:Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;

    iget-object v2, v2, Lcom/androie/settings/notificationlight/NotificationLightSettings$PackageItem;->activityTitles:Ljava/util/TreeSet;

    invoke-virtual {v1, v2}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method
