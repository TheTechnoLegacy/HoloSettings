.class public Lcom/androie/settings/cyanogenmod/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private configureCPU(Landroid/content/Context;)V
    .locals 11
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    const/4 v10, 0x0

    .line 88
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    .line 90
    .local v8, "prefs":Landroid/content/SharedPreferences;
    const-string v9, "pref_cpu_set_on_boot"

    invoke-interface {v8, v9, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-nez v9, :cond_0

    .line 91
    const-string v9, "BootReceiver"

    const-string v10, "CPU restore disabled by user preference."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :goto_0
    return-void

    .line 95
    :cond_0
    const-string v9, "pref_cpu_gov"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "governor":Ljava/lang/String;
    const-string v9, "pref_cpu_freq_min"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 97
    .local v6, "minFrequency":Ljava/lang/String;
    const-string v9, "pref_cpu_freq_max"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 98
    .local v5, "maxFrequency":Ljava/lang/String;
    const-string v9, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies"

    invoke-static {v9}, Lcom/androie/settings/Utils;->fileReadOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "availableFrequenciesLine":Ljava/lang/String;
    const-string v9, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors"

    invoke-static {v9}, Lcom/androie/settings/Utils;->fileReadOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "availableGovernorsLine":Ljava/lang/String;
    if-eqz v1, :cond_1

    if-nez v3, :cond_3

    :cond_1
    if-eqz v0, :cond_2

    if-nez v6, :cond_3

    if-nez v5, :cond_3

    :cond_2
    const/4 v7, 0x1

    .line 102
    .local v7, "noSettings":Z
    :cond_3
    const/4 v2, 0x0

    .line 103
    .local v2, "frequencies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 105
    .local v4, "governors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v7, :cond_4

    .line 106
    const-string v9, "BootReceiver"

    const-string v10, "No CPU settings saved. Nothing to restore."

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 108
    :cond_4
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/BootReceiver;->initFreqCapFiles(Landroid/content/Context;)V

    .line 109
    if-eqz v1, :cond_5

    .line 110
    const-string v9, " "

    invoke-virtual {v1, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 112
    :cond_5
    if-eqz v0, :cond_6

    .line 113
    const-string v9, " "

    invoke-virtual {v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 115
    :cond_6
    if-eqz v5, :cond_7

    if-eqz v2, :cond_7

    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 116
    sget-object v9, Lcom/androie/settings/cyanogenmod/Processor;->FREQ_MAX_FILE:Ljava/lang/String;

    invoke-static {v9, v5}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    .line 118
    :cond_7
    if-eqz v6, :cond_8

    if-eqz v2, :cond_8

    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 119
    sget-object v9, Lcom/androie/settings/cyanogenmod/Processor;->FREQ_MIN_FILE:Ljava/lang/String;

    invoke-static {v9, v6}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    .line 121
    :cond_8
    if-eqz v3, :cond_9

    if-eqz v4, :cond_9

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 122
    const-string v9, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

    invoke-static {v9, v3}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    .line 124
    :cond_9
    const-string v9, "BootReceiver"

    const-string v10, "CPU settings restored."

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private configureIOSched(Landroid/content/Context;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 129
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 131
    .local v4, "prefs":Landroid/content/SharedPreferences;
    const-string v5, "pref_io_sched_set_on_boot"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_0

    .line 132
    const-string v5, "BootReceiver"

    const-string v6, "IOSched restore disabled by user preference."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :goto_0
    return-void

    .line 136
    :cond_0
    const-string v5, "pref_io_sched"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "ioscheduler":Ljava/lang/String;
    const-string v5, "/sys/block/mmcblk0/queue/scheduler"

    invoke-static {v5}, Lcom/androie/settings/Utils;->fileReadOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "availableIOSchedulersLine":Ljava/lang/String;
    if-eqz v0, :cond_1

    if-nez v1, :cond_2

    :cond_1
    const/4 v3, 0x1

    .line 139
    .local v3, "noSettings":Z
    :cond_2
    const/4 v2, 0x0

    .line 141
    .local v2, "ioschedulers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_3

    .line 142
    const-string v5, "BootReceiver"

    const-string v6, "No I/O scheduler settings saved. Nothing to restore."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 144
    :cond_3
    if-eqz v0, :cond_4

    .line 145
    const-string v5, "["

    const-string v6, ""

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "]"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 147
    :cond_4
    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 148
    const-string v5, "/sys/block/mmcblk0/queue/scheduler"

    invoke-static {v5, v1}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    .line 150
    :cond_5
    const-string v5, "BootReceiver"

    const-string v6, "I/O scheduler settings restored."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private configureKSM(Landroid/content/Context;)V
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 155
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 157
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "pref_ksm"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 159
    .local v0, "ksm":Z
    const-string v3, "/sys/kernel/mm/ksm/run"

    if-eqz v0, :cond_0

    const-string v2, "1"

    :goto_0
    invoke-static {v3, v2}, Lcom/androie/settings/Utils;->fileWriteOneLine(Ljava/lang/String;Ljava/lang/String;)Z

    .line 160
    const-string v2, "BootReceiver"

    const-string v3, "KSM settings restored."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    return-void

    .line 159
    :cond_0
    const-string v2, "0"

    goto :goto_0
.end method

.method private initFreqCapFiles(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 81
    sget-boolean v0, Lcom/androie/settings/cyanogenmod/Processor;->freqCapFilesInitialized:Z

    if-eqz v0, :cond_0

    .line 85
    :goto_0
    return-void

    .line 82
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08036d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/cyanogenmod/Processor;->FREQ_MAX_FILE:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08036e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/androie/settings/cyanogenmod/Processor;->FREQ_MIN_FILE:Ljava/lang/String;

    .line 84
    const/4 v0, 0x1

    sput-boolean v0, Lcom/androie/settings/cyanogenmod/Processor;->freqCapFilesInitialized:Z

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 45
    const-string v0, "sys.cpufreq.restored"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    const-string v0, "sys.cpufreq.restored"

    const-string v1, "true"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/BootReceiver;->configureCPU(Landroid/content/Context;)V

    .line 53
    :goto_0
    const-string v0, "sys.iosched.restored"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 55
    const-string v0, "sys.iosched.restored"

    const-string v1, "true"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/BootReceiver;->configureIOSched(Landroid/content/Context;)V

    .line 61
    :goto_1
    const-string v0, "/sys/kernel/mm/ksm/run"

    invoke-static {v0}, Lcom/androie/settings/Utils;->fileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const-string v0, "sys.ksm.restored"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 64
    const-string v0, "sys.ksm.restored"

    const-string v1, "true"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-direct {p0, p1}, Lcom/androie/settings/cyanogenmod/BootReceiver;->configureKSM(Landroid/content/Context;)V

    .line 72
    :cond_0
    :goto_2
    invoke-static {p1}, Lcom/androie/settings/cyanogenmod/DisplayColor;->restore(Landroid/content/Context;)V

    .line 73
    invoke-static {p1}, Lcom/androie/settings/cyanogenmod/DisplayGamma;->restore(Landroid/content/Context;)V

    .line 74
    invoke-static {p1}, Lcom/androie/settings/cyanogenmod/VibratorIntensity;->restore(Landroid/content/Context;)V

    .line 75
    invoke-static {p1}, Lcom/androie/settings/DisplaySettings;->restore(Landroid/content/Context;)V

    .line 76
    invoke-static {p1}, Lcom/androie/settings/LocationSettings;->restore(Landroid/content/Context;)V

    .line 77
    return-void

    .line 50
    :cond_1
    const-string v0, "sys.cpufreq.restored"

    const-string v1, "false"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 58
    :cond_2
    const-string v0, "sys.iosched.restored"

    const-string v1, "false"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 67
    :cond_3
    const-string v0, "sys.ksm.restored"

    const-string v1, "false"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method
