package com.jellybyn.settings.applications;

public class ApplicationsState {
    public static final com.jellybyn.settings.applications.ApplicationsState.AppFilter ALL_ENABLED_FILTER = null;
    public static final java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> ALPHA_COMPARATOR = null;
    public static final com.jellybyn.settings.applications.ApplicationsState.AppFilter DISABLED_FILTER = null;
    public static final java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> EXTERNAL_SIZE_COMPARATOR = null;
    public static final java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> INTERNAL_SIZE_COMPARATOR = null;
    public static final com.jellybyn.settings.applications.ApplicationsState.AppFilter ON_SD_CARD_FILTER = null;
    static final java.util.regex.Pattern REMOVE_DIACRITICALS_PATTERN = null;
    public static final java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> SIZE_COMPARATOR = null;
    public static final com.jellybyn.settings.applications.ApplicationsState.AppFilter THIRD_PARTY_FILTER = null;
    static com.jellybyn.settings.applications.ApplicationsState sInstance;
    static final java.lang.Object sLock = null;
    final java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.Session> mActiveSessions;
    final java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mAppEntries;
    java.util.List<android.content.pm.ApplicationInfo> mApplications;
    final com.jellybyn.settings.applications.ApplicationsState.BackgroundHandler mBackgroundHandler;
    final android.content.Context mContext;
    java.lang.String mCurComputingSizePkg;
    long mCurId;
    final java.util.HashMap<java.lang.String, com.jellybyn.settings.applications.ApplicationsState.AppEntry> mEntriesMap;
    boolean mHaveDisabledApps;
    final com.jellybyn.settings.applications.InterestingConfigChanges mInterestingConfigChanges;
    final com.jellybyn.settings.applications.ApplicationsState.MainHandler mMainHandler;
    com.jellybyn.settings.applications.ApplicationsState.PackageIntentReceiver mPackageIntentReceiver;
    final android.content.pm.PackageManager mPm;
    final java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.Session> mRebuildingSessions;
    boolean mResumed;
    final int mRetrieveFlags;
    final java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.Session> mSessions;
    boolean mSessionsChanged;
    final android.os.HandlerThread mThread;

    static class 1 implements java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> {
        private final java.text.Collator sCollator;

        1() {
            r1 = this;
            r1.<init>();
            r0 = java.text.Collator.getInstance();
            r1.sCollator = r0;
            return;
        }

        public int compare(com.jellybyn.settings.applications.ApplicationsState.AppEntry r7, com.jellybyn.settings.applications.ApplicationsState.AppEntry r8) {
            r6 = this;
            r5 = 8388608; // 0x800000 float:1.1754944E-38 double:4.144523E-317;
            r3 = 0;
            r2 = 1;
            r4 = r7.info;
            r4 = r4.enabled;
            if (r4 == 0) goto L_0x0026;
        L_0x000a:
            r4 = r7.info;
            r4 = r4.flags;
            r4 = r4 & r5;
            if (r4 == 0) goto L_0x0026;
        L_0x0011:
            r0 = r2;
        L_0x0012:
            r4 = r8.info;
            r4 = r4.enabled;
            if (r4 == 0) goto L_0x0028;
        L_0x0018:
            r4 = r8.info;
            r4 = r4.flags;
            r4 = r4 & r5;
            if (r4 == 0) goto L_0x0028;
        L_0x001f:
            r1 = r2;
        L_0x0020:
            if (r0 == r1) goto L_0x002a;
        L_0x0022:
            if (r0 == 0) goto L_0x0025;
        L_0x0024:
            r2 = -1;
        L_0x0025:
            return r2;
        L_0x0026:
            r0 = r3;
            goto L_0x0012;
        L_0x0028:
            r1 = r3;
            goto L_0x0020;
        L_0x002a:
            r2 = r6.sCollator;
            r3 = r7.label;
            r4 = r8.label;
            r2 = r2.compare(r3, r4);
            goto L_0x0025;
        }

        public /* bridge */ /* synthetic */ int compare(java.lang.Object r2, java.lang.Object r3) {
            r1 = this;
            r2 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r2;
            r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;
            r0 = r1.compare(r2, r3);
            return r0;
        }
    }

    static class 2 implements java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> {
        private final java.text.Collator sCollator;

        2() {
            r1 = this;
            r1.<init>();
            r0 = java.text.Collator.getInstance();
            r1.sCollator = r0;
            return;
        }

        public int compare(com.jellybyn.settings.applications.ApplicationsState.AppEntry r5, com.jellybyn.settings.applications.ApplicationsState.AppEntry r6) {
            r4 = this;
            r0 = r5.size;
            r2 = r6.size;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 >= 0) goto L_0x000a;
        L_0x0008:
            r0 = 1;
        L_0x0009:
            return r0;
        L_0x000a:
            r0 = r5.size;
            r2 = r6.size;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 <= 0) goto L_0x0014;
        L_0x0012:
            r0 = -1;
            goto L_0x0009;
        L_0x0014:
            r0 = r4.sCollator;
            r1 = r5.label;
            r2 = r6.label;
            r0 = r0.compare(r1, r2);
            goto L_0x0009;
        }

        public /* bridge */ /* synthetic */ int compare(java.lang.Object r2, java.lang.Object r3) {
            r1 = this;
            r2 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r2;
            r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;
            r0 = r1.compare(r2, r3);
            return r0;
        }
    }

    static class 3 implements java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> {
        private final java.text.Collator sCollator;

        3() {
            r1 = this;
            r1.<init>();
            r0 = java.text.Collator.getInstance();
            r1.sCollator = r0;
            return;
        }

        public int compare(com.jellybyn.settings.applications.ApplicationsState.AppEntry r5, com.jellybyn.settings.applications.ApplicationsState.AppEntry r6) {
            r4 = this;
            r0 = r5.internalSize;
            r2 = r6.internalSize;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 >= 0) goto L_0x000a;
        L_0x0008:
            r0 = 1;
        L_0x0009:
            return r0;
        L_0x000a:
            r0 = r5.internalSize;
            r2 = r6.internalSize;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 <= 0) goto L_0x0014;
        L_0x0012:
            r0 = -1;
            goto L_0x0009;
        L_0x0014:
            r0 = r4.sCollator;
            r1 = r5.label;
            r2 = r6.label;
            r0 = r0.compare(r1, r2);
            goto L_0x0009;
        }

        public /* bridge */ /* synthetic */ int compare(java.lang.Object r2, java.lang.Object r3) {
            r1 = this;
            r2 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r2;
            r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;
            r0 = r1.compare(r2, r3);
            return r0;
        }
    }

    static class 4 implements java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> {
        private final java.text.Collator sCollator;

        4() {
            r1 = this;
            r1.<init>();
            r0 = java.text.Collator.getInstance();
            r1.sCollator = r0;
            return;
        }

        public int compare(com.jellybyn.settings.applications.ApplicationsState.AppEntry r5, com.jellybyn.settings.applications.ApplicationsState.AppEntry r6) {
            r4 = this;
            r0 = r5.externalSize;
            r2 = r6.externalSize;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 >= 0) goto L_0x000a;
        L_0x0008:
            r0 = 1;
        L_0x0009:
            return r0;
        L_0x000a:
            r0 = r5.externalSize;
            r2 = r6.externalSize;
            r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
            if (r0 <= 0) goto L_0x0014;
        L_0x0012:
            r0 = -1;
            goto L_0x0009;
        L_0x0014:
            r0 = r4.sCollator;
            r1 = r5.label;
            r2 = r6.label;
            r0 = r0.compare(r1, r2);
            goto L_0x0009;
        }

        public /* bridge */ /* synthetic */ int compare(java.lang.Object r2, java.lang.Object r3) {
            r1 = this;
            r2 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r2;
            r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;
            r0 = r1.compare(r2, r3);
            return r0;
        }
    }

    public interface AppFilter {
        boolean filterApp(android.content.pm.ApplicationInfo r1);

        void init();
    }

    static class 5 implements com.jellybyn.settings.applications.ApplicationsState.AppFilter {
        5() {
            r0 = this;
            r0.<init>();
            return;
        }

        public boolean filterApp(android.content.pm.ApplicationInfo r3) {
            r2 = this;
            r0 = 1;
            r1 = r3.flags;
            r1 = r1 & 128;
            if (r1 == 0) goto L_0x0008;
        L_0x0007:
            return r0;
        L_0x0008:
            r1 = r3.flags;
            r1 = r1 & 1;
            if (r1 == 0) goto L_0x0007;
        L_0x000e:
            r0 = 0;
            goto L_0x0007;
        }

        public void init() {
            r0 = this;
            return;
        }
    }

    static class 6 implements com.jellybyn.settings.applications.ApplicationsState.AppFilter {
        final com.jellybyn.settings.applications.CanBeOnSdCardChecker mCanBeOnSdCardChecker;

        6() {
            r1 = this;
            r1.<init>();
            r0 = new com.jellybyn.settings.applications.CanBeOnSdCardChecker;
            r0.<init>();
            r1.mCanBeOnSdCardChecker = r0;
            return;
        }

        public boolean filterApp(android.content.pm.ApplicationInfo r2) {
            r1 = this;
            r0 = r1.mCanBeOnSdCardChecker;
            r0 = r0.check(r2);
            return r0;
        }

        public void init() {
            r1 = this;
            r0 = r1.mCanBeOnSdCardChecker;
            r0.init();
            return;
        }
    }

    static class 7 implements com.jellybyn.settings.applications.ApplicationsState.AppFilter {
        7() {
            r0 = this;
            r0.<init>();
            return;
        }

        public boolean filterApp(android.content.pm.ApplicationInfo r2) {
            r1 = this;
            r0 = r2.enabled;
            if (r0 != 0) goto L_0x0006;
        L_0x0004:
            r0 = 1;
        L_0x0005:
            return r0;
        L_0x0006:
            r0 = 0;
            goto L_0x0005;
        }

        public void init() {
            r0 = this;
            return;
        }
    }

    static class 8 implements com.jellybyn.settings.applications.ApplicationsState.AppFilter {
        8() {
            r0 = this;
            r0.<init>();
            return;
        }

        public boolean filterApp(android.content.pm.ApplicationInfo r2) {
            r1 = this;
            r0 = r2.enabled;
            if (r0 == 0) goto L_0x0006;
        L_0x0004:
            r0 = 1;
        L_0x0005:
            return r0;
        L_0x0006:
            r0 = 0;
            goto L_0x0005;
        }

        public void init() {
            r0 = this;
            return;
        }
    }

    public static class SizeInfo {
        long cacheSize;
        long codeSize;
        long dataSize;
        long externalCacheSize;
        long externalCodeSize;
        long externalDataSize;

        public SizeInfo() {
            r0 = this;
            r0.<init>();
            return;
        }
    }

    public static class AppEntry extends com.jellybyn.settings.applications.ApplicationsState.SizeInfo {
        final java.io.File apkFile;
        long externalSize;
        java.lang.String externalSizeStr;
        android.graphics.drawable.Drawable icon;
        final long id;
        android.content.pm.ApplicationInfo info;
        long internalSize;
        java.lang.String internalSizeStr;
        java.lang.String label;
        boolean mounted;
        java.lang.String normalizedLabel;
        long size;
        long sizeLoadStart;
        boolean sizeStale;
        java.lang.String sizeStr;

        AppEntry(android.content.Context r3, android.content.pm.ApplicationInfo r4, long r5) {
            r2 = this;
            r2.<init>();
            r0 = new java.io.File;
            r1 = r4.sourceDir;
            r0.<init>(r1);
            r2.apkFile = r0;
            r2.id = r5;
            r2.info = r4;
            r0 = -1;
            r2.size = r0;
            r0 = 1;
            r2.sizeStale = r0;
            r2.ensureLabel(r3);
            return;
        }

        boolean ensureIconLocked(android.content.Context r4, android.content.pm.PackageManager r5) {
            r3 = this;
            r1 = 0;
            r0 = 1;
            r2 = r3.icon;
            if (r2 != 0) goto L_0x0028;
        L_0x0006:
            r2 = r3.apkFile;
            r2 = r2.exists();
            if (r2 == 0) goto L_0x0017;
        L_0x000e:
            r1 = r3.info;
            r1 = r1.loadIcon(r5);
            r3.icon = r1;
        L_0x0016:
            return r0;
        L_0x0017:
            r3.mounted = r1;
            r0 = r4.getResources();
            r2 = 17302926; // 0x108058e float:2.498324E-38 double:8.5487813E-317;
            r0 = r0.getDrawable(r2);
            r3.icon = r0;
        L_0x0026:
            r0 = r1;
            goto L_0x0016;
        L_0x0028:
            r2 = r3.mounted;
            if (r2 != 0) goto L_0x0026;
        L_0x002c:
            r2 = r3.apkFile;
            r2 = r2.exists();
            if (r2 == 0) goto L_0x0026;
        L_0x0034:
            r3.mounted = r0;
            r1 = r3.info;
            r1 = r1.loadIcon(r5);
            r3.icon = r1;
            goto L_0x0016;
        }

        void ensureLabel(android.content.Context r4) {
            r3 = this;
            r1 = r3.label;
            if (r1 == 0) goto L_0x0008;
        L_0x0004:
            r1 = r3.mounted;
            if (r1 != 0) goto L_0x0019;
        L_0x0008:
            r1 = r3.apkFile;
            r1 = r1.exists();
            if (r1 != 0) goto L_0x001a;
        L_0x0010:
            r1 = 0;
            r3.mounted = r1;
            r1 = r3.info;
            r1 = r1.packageName;
            r3.label = r1;
        L_0x0019:
            return;
        L_0x001a:
            r1 = 1;
            r3.mounted = r1;
            r1 = r3.info;
            r2 = r4.getPackageManager();
            r0 = r1.loadLabel(r2);
            if (r0 == 0) goto L_0x0030;
        L_0x0029:
            r1 = r0.toString();
        L_0x002d:
            r3.label = r1;
            goto L_0x0019;
        L_0x0030:
            r1 = r3.info;
            r1 = r1.packageName;
            goto L_0x002d;
        }

        java.lang.String getNormalizedLabel() {
            r1 = this;
            r0 = r1.normalizedLabel;
            if (r0 == 0) goto L_0x0007;
        L_0x0004:
            r0 = r1.normalizedLabel;
        L_0x0006:
            return r0;
        L_0x0007:
            r0 = r1.label;
            r0 = com.jellybyn.settings.applications.ApplicationsState.normalize(r0);
            r1.normalizedLabel = r0;
            r0 = r1.normalizedLabel;
            goto L_0x0006;
        }
    }

    class BackgroundHandler extends android.os.Handler {
        boolean mRunning;
        final android.content.pm.IPackageStatsObserver.Stub mStatsObserver;
        final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

        class 1 extends android.content.pm.IPackageStatsObserver.Stub {
            final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState.BackgroundHandler this$1;

            1(com.jellybyn.settings.applications.ApplicationsState.BackgroundHandler r1) {
                r0 = this;
                r0.this$1 = r1;
                r0.<init>();
                return;
            }

            public void onGetStatsCompleted(android.content.pm.PackageStats r17, boolean r18) {
                r16 = this;
                r9 = 0;
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r11 = r10.mEntriesMap;
                monitor-enter(r11);
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x013a }
                r10 = r10.this$0;	 Catch:{ all -> 0x013a }
                r10 = r10.mEntriesMap;	 Catch:{ all -> 0x013a }
                r0 = r17;
                r12 = r0.packageName;	 Catch:{ all -> 0x013a }
                r1 = r10.get(r12);	 Catch:{ all -> 0x013a }
                r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;	 Catch:{ all -> 0x013a }
                if (r1 == 0) goto L_0x0108;
            L_0x001e:
                monitor-enter(r1);	 Catch:{ all -> 0x013a }
                r10 = 0;
                r1.sizeStale = r10;	 Catch:{ all -> 0x0137 }
                r12 = 0;
                r1.sizeLoadStart = r12;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = r0.externalCodeSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.externalObbSize;	 Catch:{ all -> 0x0137 }
                r2 = r12 + r14;
                r0 = r17;
                r12 = r0.externalDataSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.externalMediaSize;	 Catch:{ all -> 0x0137 }
                r4 = r12 + r14;
                r12 = r2 + r4;
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = com.jellybyn.settings.applications.ApplicationsState.access$100(r10, r0);	 Catch:{ all -> 0x0137 }
                r7 = r12 + r14;
                r12 = r1.size;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r7 ? 1 : (r12 == r7 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x0050:
                r12 = r1.cacheSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.cacheSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x005a:
                r12 = r1.codeSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.codeSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x0064:
                r12 = r1.dataSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.dataSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x006e:
                r12 = r1.externalCodeSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x0074:
                r12 = r1.externalDataSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r4 ? 1 : (r12 == r4 ? 0 : -1));
                if (r10 != 0) goto L_0x0084;
            L_0x007a:
                r12 = r1.externalCacheSize;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r14 = r0.externalCacheSize;	 Catch:{ all -> 0x0137 }
                r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
                if (r10 == 0) goto L_0x00e9;
            L_0x0084:
                r1.size = r7;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = r0.cacheSize;	 Catch:{ all -> 0x0137 }
                r1.cacheSize = r12;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = r0.codeSize;	 Catch:{ all -> 0x0137 }
                r1.codeSize = r12;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = r0.dataSize;	 Catch:{ all -> 0x0137 }
                r1.dataSize = r12;	 Catch:{ all -> 0x0137 }
                r1.externalCodeSize = r2;	 Catch:{ all -> 0x0137 }
                r1.externalDataSize = r4;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = r0.externalCacheSize;	 Catch:{ all -> 0x0137 }
                r1.externalCacheSize = r12;	 Catch:{ all -> 0x0137 }
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r12 = r1.size;	 Catch:{ all -> 0x0137 }
                r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
                r1.sizeStr = r10;	 Catch:{ all -> 0x0137 }
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = com.jellybyn.settings.applications.ApplicationsState.access$100(r10, r0);	 Catch:{ all -> 0x0137 }
                r1.internalSize = r12;	 Catch:{ all -> 0x0137 }
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r12 = r1.internalSize;	 Catch:{ all -> 0x0137 }
                r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
                r1.internalSizeStr = r10;	 Catch:{ all -> 0x0137 }
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r0 = r17;
                r12 = com.jellybyn.settings.applications.ApplicationsState.access$300(r10, r0);	 Catch:{ all -> 0x0137 }
                r1.externalSize = r12;	 Catch:{ all -> 0x0137 }
                r0 = r16;
                r10 = r0.this$1;	 Catch:{ all -> 0x0137 }
                r10 = r10.this$0;	 Catch:{ all -> 0x0137 }
                r12 = r1.externalSize;	 Catch:{ all -> 0x0137 }
                r10 = com.jellybyn.settings.applications.ApplicationsState.access$200(r10, r12);	 Catch:{ all -> 0x0137 }
                r1.externalSizeStr = r10;	 Catch:{ all -> 0x0137 }
                r9 = 1;
            L_0x00e9:
                monitor-exit(r1);	 Catch:{ all -> 0x0137 }
                if (r9 == 0) goto L_0x0108;
            L_0x00ec:
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r10 = r10.mMainHandler;
                r12 = 4;
                r0 = r17;
                r13 = r0.packageName;
                r6 = r10.obtainMessage(r12, r13);
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r10 = r10.mMainHandler;
                r10.sendMessage(r6);
            L_0x0108:
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r10 = r10.mCurComputingSizePkg;
                if (r10 == 0) goto L_0x0124;
            L_0x0112:
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r10 = r10.mCurComputingSizePkg;
                r0 = r17;
                r12 = r0.packageName;
                r10 = r10.equals(r12);
                if (r10 == 0) goto L_0x0135;
            L_0x0124:
                r0 = r16;
                r10 = r0.this$1;
                r10 = r10.this$0;
                r12 = 0;
                r10.mCurComputingSizePkg = r12;
                r0 = r16;
                r10 = r0.this$1;
                r12 = 4;
                r10.sendEmptyMessage(r12);
            L_0x0135:
                monitor-exit(r11);
                return;
            L_0x0137:
                r10 = move-exception;
                monitor-exit(r1);
                throw r10;
            L_0x013a:
                r10 = move-exception;
                monitor-exit(r11);
                throw r10;
            }
        }

        BackgroundHandler(com.jellybyn.settings.applications.ApplicationsState r2, android.os.Looper r3) {
            r1 = this;
            r1.this$0 = r2;
            r1.<init>(r3);
            r0 = new com.jellybyn.settings.applications.ApplicationsState$BackgroundHandler$1;
            r0.<init>(r1);
            r1.mStatsObserver = r0;
            return;
        }

        public void handleMessage(android.os.Message r17) {
            r16 = this;
            r8 = 0;
            r0 = r16;
            r10 = r0.this$0;
            r11 = r10.mEntriesMap;
            monitor-enter(r11);
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x003f }
            r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x003f }
            r10 = r10.size();	 Catch:{ all -> 0x003f }
            if (r10 <= 0) goto L_0x0029;
        L_0x0014:
            r9 = new java.util.ArrayList;	 Catch:{ all -> 0x003f }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x003f }
            r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x003f }
            r9.<init>(r10);	 Catch:{ all -> 0x003f }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x022e }
            r10 = r10.mRebuildingSessions;	 Catch:{ all -> 0x022e }
            r10.clear();	 Catch:{ all -> 0x022e }
            r8 = r9;
        L_0x0029:
            monitor-exit(r11);
            if (r8 == 0) goto L_0x0042;
        L_0x002c:
            r2 = 0;
        L_0x002d:
            r10 = r8.size();
            if (r2 >= r10) goto L_0x0042;
        L_0x0033:
            r10 = r8.get(r2);
            r10 = (com.jellybyn.settings.applications.ApplicationsState.Session) r10;
            r10.handleRebuildList();
            r2 = r2 + 1;
            goto L_0x002d;
        L_0x003f:
            r10 = move-exception;
        L_0x0040:
            monitor-exit(r11);
            throw r10;
        L_0x0042:
            r0 = r17;
            r10 = r0.what;
            switch(r10) {
                case 1: goto L_0x0049;
                case 2: goto L_0x004a;
                case 3: goto L_0x00c1;
                case 4: goto L_0x015d;
                default: goto L_0x0049;
            };
        L_0x0049:
            return;
        L_0x004a:
            r7 = 0;
            r0 = r16;
            r10 = r0.this$0;
            r11 = r10.mEntriesMap;
            monitor-enter(r11);
            r2 = 0;
        L_0x0053:
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10 = r10.mApplications;	 Catch:{ all -> 0x00b7 }
            r10 = r10.size();	 Catch:{ all -> 0x00b7 }
            if (r2 >= r10) goto L_0x00ac;
        L_0x005f:
            r10 = 6;
            if (r7 >= r10) goto L_0x00ac;
        L_0x0062:
            r0 = r16;
            r10 = r0.mRunning;	 Catch:{ all -> 0x00b7 }
            if (r10 != 0) goto L_0x0086;
        L_0x0068:
            r10 = 1;
            r0 = r16;
            r0.mRunning = r10;	 Catch:{ all -> 0x00b7 }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10 = r10.mMainHandler;	 Catch:{ all -> 0x00b7 }
            r12 = 6;
            r13 = 1;
            r13 = java.lang.Integer.valueOf(r13);	 Catch:{ all -> 0x00b7 }
            r4 = r10.obtainMessage(r12, r13);	 Catch:{ all -> 0x00b7 }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10 = r10.mMainHandler;	 Catch:{ all -> 0x00b7 }
            r10.sendMessage(r4);	 Catch:{ all -> 0x00b7 }
        L_0x0086:
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10 = r10.mApplications;	 Catch:{ all -> 0x00b7 }
            r3 = r10.get(r2);	 Catch:{ all -> 0x00b7 }
            r3 = (android.content.pm.ApplicationInfo) r3;	 Catch:{ all -> 0x00b7 }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10 = r10.mEntriesMap;	 Catch:{ all -> 0x00b7 }
            r12 = r3.packageName;	 Catch:{ all -> 0x00b7 }
            r10 = r10.get(r12);	 Catch:{ all -> 0x00b7 }
            if (r10 != 0) goto L_0x00a9;
        L_0x00a0:
            r7 = r7 + 1;
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x00b7 }
            r10.getEntryLocked(r3);	 Catch:{ all -> 0x00b7 }
        L_0x00a9:
            r2 = r2 + 1;
            goto L_0x0053;
        L_0x00ac:
            monitor-exit(r11);	 Catch:{ all -> 0x00b7 }
            r10 = 6;
            if (r7 < r10) goto L_0x00ba;
        L_0x00b0:
            r10 = 2;
            r0 = r16;
            r0.sendEmptyMessage(r10);
            goto L_0x0049;
        L_0x00b7:
            r10 = move-exception;
            monitor-exit(r11);
            throw r10;
        L_0x00ba:
            r10 = 3;
            r0 = r16;
            r0.sendEmptyMessage(r10);
            goto L_0x0049;
        L_0x00c1:
            r7 = 0;
            r0 = r16;
            r10 = r0.this$0;
            r11 = r10.mEntriesMap;
            monitor-enter(r11);
            r2 = 0;
        L_0x00ca:
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x012d }
            r10 = r10.mAppEntries;	 Catch:{ all -> 0x012d }
            r10 = r10.size();	 Catch:{ all -> 0x012d }
            if (r2 >= r10) goto L_0x0130;
        L_0x00d6:
            r10 = 2;
            if (r7 >= r10) goto L_0x0130;
        L_0x00d9:
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x012d }
            r10 = r10.mAppEntries;	 Catch:{ all -> 0x012d }
            r1 = r10.get(r2);	 Catch:{ all -> 0x012d }
            r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;	 Catch:{ all -> 0x012d }
            r10 = r1.icon;	 Catch:{ all -> 0x012d }
            if (r10 == 0) goto L_0x00ed;
        L_0x00e9:
            r10 = r1.mounted;	 Catch:{ all -> 0x012d }
            if (r10 != 0) goto L_0x0127;
        L_0x00ed:
            monitor-enter(r1);	 Catch:{ all -> 0x012d }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x012a }
            r10 = r10.mContext;	 Catch:{ all -> 0x012a }
            r0 = r16;
            r12 = r0.this$0;	 Catch:{ all -> 0x012a }
            r12 = r12.mPm;	 Catch:{ all -> 0x012a }
            r10 = r1.ensureIconLocked(r10, r12);	 Catch:{ all -> 0x012a }
            if (r10 == 0) goto L_0x0126;
        L_0x0100:
            r0 = r16;
            r10 = r0.mRunning;	 Catch:{ all -> 0x012a }
            if (r10 != 0) goto L_0x0124;
        L_0x0106:
            r10 = 1;
            r0 = r16;
            r0.mRunning = r10;	 Catch:{ all -> 0x012a }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x012a }
            r10 = r10.mMainHandler;	 Catch:{ all -> 0x012a }
            r12 = 6;
            r13 = 1;
            r13 = java.lang.Integer.valueOf(r13);	 Catch:{ all -> 0x012a }
            r4 = r10.obtainMessage(r12, r13);	 Catch:{ all -> 0x012a }
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x012a }
            r10 = r10.mMainHandler;	 Catch:{ all -> 0x012a }
            r10.sendMessage(r4);	 Catch:{ all -> 0x012a }
        L_0x0124:
            r7 = r7 + 1;
        L_0x0126:
            monitor-exit(r1);	 Catch:{ all -> 0x012a }
        L_0x0127:
            r2 = r2 + 1;
            goto L_0x00ca;
        L_0x012a:
            r10 = move-exception;
            monitor-exit(r1);	 Catch:{ all -> 0x012a }
            throw r10;
        L_0x012d:
            r10 = move-exception;
            monitor-exit(r11);
            throw r10;
        L_0x0130:
            monitor-exit(r11);
            if (r7 <= 0) goto L_0x014a;
        L_0x0133:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r11 = 3;
            r10 = r10.hasMessages(r11);
            if (r10 != 0) goto L_0x014a;
        L_0x0140:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r11 = 3;
            r10.sendEmptyMessage(r11);
        L_0x014a:
            r10 = 2;
            if (r7 < r10) goto L_0x0155;
        L_0x014d:
            r10 = 3;
            r0 = r16;
            r0.sendEmptyMessage(r10);
            goto L_0x0049;
        L_0x0155:
            r10 = 4;
            r0 = r16;
            r0.sendEmptyMessage(r10);
            goto L_0x0049;
        L_0x015d:
            r0 = r16;
            r10 = r0.this$0;
            r11 = r10.mEntriesMap;
            monitor-enter(r11);
            r0 = r16;
            r10 = r0.this$0;	 Catch:{ all -> 0x016f }
            r10 = r10.mCurComputingSizePkg;	 Catch:{ all -> 0x016f }
            if (r10 == 0) goto L_0x0172;
        L_0x016c:
            monitor-exit(r11);	 Catch:{ all -> 0x016f }
            goto L_0x0049;
        L_0x016f:
            r10 = move-exception;
            monitor-exit(r11);	 Catch:{ all -> 0x016f }
            throw r10;
        L_0x0172:
            r5 = android.os.SystemClock.uptimeMillis();
            r2 = 0;
        L_0x0177:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mAppEntries;
            r10 = r10.size();
            if (r2 >= r10) goto L_0x01f6;
        L_0x0183:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mAppEntries;
            r1 = r10.get(r2);
            r1 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r1;
            r12 = r1.size;
            r14 = -1;
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 == 0) goto L_0x019b;
        L_0x0197:
            r10 = r1.sizeStale;
            if (r10 == 0) goto L_0x01f3;
        L_0x019b:
            r12 = r1.sizeLoadStart;
            r14 = 0;
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 == 0) goto L_0x01ad;
        L_0x01a3:
            r12 = r1.sizeLoadStart;
            r14 = 20000; // 0x4e20 float:2.8026E-41 double:9.8813E-320;
            r14 = r5 - r14;
            r10 = (r12 > r14 ? 1 : (r12 == r14 ? 0 : -1));
            if (r10 >= 0) goto L_0x01f0;
        L_0x01ad:
            r0 = r16;
            r10 = r0.mRunning;
            if (r10 != 0) goto L_0x01d1;
        L_0x01b3:
            r10 = 1;
            r0 = r16;
            r0.mRunning = r10;
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r12 = 6;
            r13 = 1;
            r13 = java.lang.Integer.valueOf(r13);
            r4 = r10.obtainMessage(r12, r13);
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r10.sendMessage(r4);
        L_0x01d1:
            r1.sizeLoadStart = r5;
            r0 = r16;
            r10 = r0.this$0;
            r12 = r1.info;
            r12 = r12.packageName;
            r10.mCurComputingSizePkg = r12;
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mPm;
            r0 = r16;
            r12 = r0.this$0;
            r12 = r12.mCurComputingSizePkg;
            r0 = r16;
            r13 = r0.mStatsObserver;
            r10.getPackageSizeInfo(r12, r13);
        L_0x01f0:
            monitor-exit(r11);
            goto L_0x0049;
        L_0x01f3:
            r2 = r2 + 1;
            goto L_0x0177;
        L_0x01f6:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r12 = 5;
            r10 = r10.hasMessages(r12);
            if (r10 != 0) goto L_0x022b;
        L_0x0203:
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r12 = 5;
            r10.sendEmptyMessage(r12);
            r10 = 0;
            r0 = r16;
            r0.mRunning = r10;
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r12 = 6;
            r13 = 0;
            r13 = java.lang.Integer.valueOf(r13);
            r4 = r10.obtainMessage(r12, r13);
            r0 = r16;
            r10 = r0.this$0;
            r10 = r10.mMainHandler;
            r10.sendMessage(r4);
        L_0x022b:
            monitor-exit(r11);
            goto L_0x0049;
        L_0x022e:
            r10 = move-exception;
            r8 = r9;
            goto L_0x0040;
        }
    }

    public interface Callbacks {
        void onAllSizesComputed();

        void onPackageIconChanged();

        void onPackageListChanged();

        void onPackageSizeChanged(java.lang.String r1);

        void onRebuildComplete(java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> r1);

        void onRunningStateChanged(boolean r1);
    }

    class MainHandler extends android.os.Handler {
        final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

        MainHandler(com.jellybyn.settings.applications.ApplicationsState r1) {
            r0 = this;
            r0.this$0 = r1;
            r0.<init>();
            return;
        }

        public void handleMessage(android.os.Message r5) {
            r4 = this;
            r2 = r4.this$0;
            r2.rebuildActiveSessions();
            r2 = r5.what;
            switch(r2) {
                case 1: goto L_0x000b;
                case 2: goto L_0x0021;
                case 3: goto L_0x003e;
                case 4: goto L_0x005b;
                case 5: goto L_0x007c;
                case 6: goto L_0x0099;
                default: goto L_0x000a;
            };
        L_0x000a:
            return;
        L_0x000b:
            r1 = r5.obj;
            r1 = (com.jellybyn.settings.applications.ApplicationsState.Session) r1;
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.contains(r1);
            if (r2 == 0) goto L_0x000a;
        L_0x0019:
            r2 = r1.mCallbacks;
            r3 = r1.mLastAppList;
            r2.onRebuildComplete(r3);
            goto L_0x000a;
        L_0x0021:
            r0 = 0;
        L_0x0022:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.size();
            if (r0 >= r2) goto L_0x000a;
        L_0x002c:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.get(r0);
            r2 = (com.jellybyn.settings.applications.ApplicationsState.Session) r2;
            r2 = r2.mCallbacks;
            r2.onPackageListChanged();
            r0 = r0 + 1;
            goto L_0x0022;
        L_0x003e:
            r0 = 0;
        L_0x003f:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.size();
            if (r0 >= r2) goto L_0x000a;
        L_0x0049:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.get(r0);
            r2 = (com.jellybyn.settings.applications.ApplicationsState.Session) r2;
            r2 = r2.mCallbacks;
            r2.onPackageIconChanged();
            r0 = r0 + 1;
            goto L_0x003f;
        L_0x005b:
            r0 = 0;
        L_0x005c:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.size();
            if (r0 >= r2) goto L_0x000a;
        L_0x0066:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.get(r0);
            r2 = (com.jellybyn.settings.applications.ApplicationsState.Session) r2;
            r3 = r2.mCallbacks;
            r2 = r5.obj;
            r2 = (java.lang.String) r2;
            r3.onPackageSizeChanged(r2);
            r0 = r0 + 1;
            goto L_0x005c;
        L_0x007c:
            r0 = 0;
        L_0x007d:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.size();
            if (r0 >= r2) goto L_0x000a;
        L_0x0087:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.get(r0);
            r2 = (com.jellybyn.settings.applications.ApplicationsState.Session) r2;
            r2 = r2.mCallbacks;
            r2.onAllSizesComputed();
            r0 = r0 + 1;
            goto L_0x007d;
        L_0x0099:
            r0 = 0;
        L_0x009a:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.size();
            if (r0 >= r2) goto L_0x000a;
        L_0x00a4:
            r2 = r4.this$0;
            r2 = r2.mActiveSessions;
            r2 = r2.get(r0);
            r2 = (com.jellybyn.settings.applications.ApplicationsState.Session) r2;
            r3 = r2.mCallbacks;
            r2 = r5.arg1;
            if (r2 == 0) goto L_0x00bb;
        L_0x00b4:
            r2 = 1;
        L_0x00b5:
            r3.onRunningStateChanged(r2);
            r0 = r0 + 1;
            goto L_0x009a;
        L_0x00bb:
            r2 = 0;
            goto L_0x00b5;
        }
    }

    private class PackageIntentReceiver extends android.content.BroadcastReceiver {
        final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

        private PackageIntentReceiver(com.jellybyn.settings.applications.ApplicationsState r1) {
            r0 = this;
            r0.this$0 = r1;
            r0.<init>();
            return;
        }

        /* synthetic */ PackageIntentReceiver(com.jellybyn.settings.applications.ApplicationsState r1, com.jellybyn.settings.applications.ApplicationsState.1 r2) {
            r0 = this;
            r0.<init>(r1);
            return;
        }

        public void onReceive(android.content.Context r10, android.content.Intent r11) {
            r9 = this;
            r0 = r11.getAction();
            r8 = "android.intent.action.PACKAGE_ADDED";
            r8 = r8.equals(r0);
            if (r8 == 0) goto L_0x001a;
        L_0x000c:
            r3 = r11.getData();
            r7 = r3.getEncodedSchemeSpecificPart();
            r8 = r9.this$0;
            r8.addPackage(r7);
        L_0x0019:
            return;
        L_0x001a:
            r8 = "android.intent.action.PACKAGE_REMOVED";
            r8 = r8.equals(r0);
            if (r8 == 0) goto L_0x0030;
        L_0x0022:
            r3 = r11.getData();
            r7 = r3.getEncodedSchemeSpecificPart();
            r8 = r9.this$0;
            r8.removePackage(r7);
            goto L_0x0019;
        L_0x0030:
            r8 = "android.intent.action.PACKAGE_CHANGED";
            r8 = r8.equals(r0);
            if (r8 == 0) goto L_0x0046;
        L_0x0038:
            r3 = r11.getData();
            r7 = r3.getEncodedSchemeSpecificPart();
            r8 = r9.this$0;
            r8.invalidatePackage(r7);
            goto L_0x0019;
        L_0x0046:
            r8 = "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE";
            r8 = r8.equals(r0);
            if (r8 != 0) goto L_0x0056;
        L_0x004e:
            r8 = "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE";
            r8 = r8.equals(r0);
            if (r8 == 0) goto L_0x0019;
        L_0x0056:
            r8 = "android.intent.extra.changed_package_list";
            r6 = r11.getStringArrayExtra(r8);
            if (r6 == 0) goto L_0x0019;
        L_0x005e:
            r8 = r6.length;
            if (r8 == 0) goto L_0x0019;
        L_0x0061:
            r8 = "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE";
            r2 = r8.equals(r0);
            if (r2 == 0) goto L_0x0019;
        L_0x0069:
            r1 = r6;
            r5 = r1.length;
            r4 = 0;
        L_0x006c:
            if (r4 >= r5) goto L_0x0019;
        L_0x006e:
            r7 = r1[r4];
            r8 = r9.this$0;
            r8.invalidatePackage(r7);
            r4 = r4 + 1;
            goto L_0x006c;
        }

        void registerReceiver() {
            r3 = this;
            r0 = new android.content.IntentFilter;
            r2 = "android.intent.action.PACKAGE_ADDED";
            r0.<init>(r2);
            r2 = "android.intent.action.PACKAGE_REMOVED";
            r0.addAction(r2);
            r2 = "android.intent.action.PACKAGE_CHANGED";
            r0.addAction(r2);
            r2 = "package";
            r0.addDataScheme(r2);
            r2 = r3.this$0;
            r2 = r2.mContext;
            r2.registerReceiver(r3, r0);
            r1 = new android.content.IntentFilter;
            r1.<init>();
            r2 = "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE";
            r1.addAction(r2);
            r2 = "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE";
            r1.addAction(r2);
            r2 = r3.this$0;
            r2 = r2.mContext;
            r2.registerReceiver(r3, r1);
            return;
        }

        void unregisterReceiver() {
            r1 = this;
            r0 = r1.this$0;
            r0 = r0.mContext;
            r0.unregisterReceiver(r1);
            return;
        }
    }

    public class Session {
        final com.jellybyn.settings.applications.ApplicationsState.Callbacks mCallbacks;
        java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mLastAppList;
        boolean mRebuildAsync;
        java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mRebuildComparator;
        com.jellybyn.settings.applications.ApplicationsState.AppFilter mRebuildFilter;
        boolean mRebuildRequested;
        java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> mRebuildResult;
        final java.lang.Object mRebuildSync;
        boolean mResumed;
        final /* synthetic */ com.jellybyn.settings.applications.ApplicationsState this$0;

        Session(com.jellybyn.settings.applications.ApplicationsState r2, com.jellybyn.settings.applications.ApplicationsState.Callbacks r3) {
            r1 = this;
            r1.this$0 = r2;
            r1.<init>();
            r0 = new java.lang.Object;
            r0.<init>();
            r1.mRebuildSync = r0;
            r1.mCallbacks = r3;
            return;
        }

        void handleRebuildList() {
            r11 = this;
            r9 = r11.mRebuildSync;
            monitor-enter(r9);
            r8 = r11.mRebuildRequested;	 Catch:{ all -> 0x0062 }
            if (r8 != 0) goto L_0x0009;
        L_0x0007:
            monitor-exit(r9);	 Catch:{ all -> 0x0062 }
        L_0x0008:
            return;
        L_0x0009:
            r3 = r11.mRebuildFilter;	 Catch:{ all -> 0x0062 }
            r1 = r11.mRebuildComparator;	 Catch:{ all -> 0x0062 }
            r8 = 0;
            r11.mRebuildRequested = r8;	 Catch:{ all -> 0x0062 }
            r8 = 0;
            r11.mRebuildFilter = r8;	 Catch:{ all -> 0x0062 }
            r8 = 0;
            r11.mRebuildComparator = r8;	 Catch:{ all -> 0x0062 }
            monitor-exit(r9);	 Catch:{ all -> 0x0062 }
            r8 = -2;
            android.os.Process.setThreadPriority(r8);
            if (r3 == 0) goto L_0x0020;
        L_0x001d:
            r3.init();
        L_0x0020:
            r8 = r11.this$0;
            r9 = r8.mEntriesMap;
            monitor-enter(r9);
            r0 = new java.util.ArrayList;	 Catch:{ all -> 0x0065 }
            r8 = r11.this$0;	 Catch:{ all -> 0x0065 }
            r8 = r8.mApplications;	 Catch:{ all -> 0x0065 }
            r0.<init>(r8);	 Catch:{ all -> 0x0065 }
            monitor-exit(r9);	 Catch:{ all -> 0x0065 }
            r4 = new java.util.ArrayList;
            r4.<init>();
            r5 = 0;
        L_0x0035:
            r8 = r0.size();
            if (r5 >= r8) goto L_0x006b;
        L_0x003b:
            r6 = r0.get(r5);
            r6 = (android.content.pm.ApplicationInfo) r6;
            if (r3 == 0) goto L_0x0049;
        L_0x0043:
            r8 = r3.filterApp(r6);
            if (r8 == 0) goto L_0x005f;
        L_0x0049:
            r8 = r11.this$0;
            r9 = r8.mEntriesMap;
            monitor-enter(r9);
            r8 = r11.this$0;	 Catch:{ all -> 0x0068 }
            r2 = r8.getEntryLocked(r6);	 Catch:{ all -> 0x0068 }
            r8 = r11.this$0;	 Catch:{ all -> 0x0068 }
            r8 = r8.mContext;	 Catch:{ all -> 0x0068 }
            r2.ensureLabel(r8);	 Catch:{ all -> 0x0068 }
            r4.add(r2);	 Catch:{ all -> 0x0068 }
            monitor-exit(r9);	 Catch:{ all -> 0x0068 }
        L_0x005f:
            r5 = r5 + 1;
            goto L_0x0035;
        L_0x0062:
            r8 = move-exception;
            monitor-exit(r9);
            throw r8;
        L_0x0065:
            r8 = move-exception;
            monitor-exit(r9);
            throw r8;
        L_0x0068:
            r8 = move-exception;
            monitor-exit(r9);
            throw r8;
        L_0x006b:
            java.util.Collections.sort(r4, r1);
            r9 = r11.mRebuildSync;
            monitor-enter(r9);
            r8 = r11.mRebuildRequested;	 Catch:{ all -> 0x00a5 }
            if (r8 != 0) goto L_0x0082;
        L_0x0075:
            r11.mLastAppList = r4;	 Catch:{ all -> 0x00a5 }
            r8 = r11.mRebuildAsync;	 Catch:{ all -> 0x00a5 }
            if (r8 != 0) goto L_0x0089;
        L_0x007b:
            r11.mRebuildResult = r4;	 Catch:{ all -> 0x00a5 }
            r8 = r11.mRebuildSync;	 Catch:{ all -> 0x00a5 }
            r8.notifyAll();	 Catch:{ all -> 0x00a5 }
        L_0x0082:
            monitor-exit(r9);	 Catch:{ all -> 0x00a5 }
            r8 = 10;
            android.os.Process.setThreadPriority(r8);
            goto L_0x0008;
        L_0x0089:
            r8 = r11.this$0;
            r8 = r8.mMainHandler;
            r10 = 1;
            r8 = r8.hasMessages(r10, r11);
            if (r8 != 0) goto L_0x0082;
        L_0x0094:
            r8 = r11.this$0;
            r8 = r8.mMainHandler;
            r10 = 1;
            r7 = r8.obtainMessage(r10, r11);
            r8 = r11.this$0;
            r8 = r8.mMainHandler;
            r8.sendMessage(r7);
            goto L_0x0082;
        L_0x00a5:
            r8 = move-exception;
            monitor-exit(r9);
            throw r8;
        }

        public void pause() {
            r3 = this;
            r0 = r3.this$0;
            r1 = r0.mEntriesMap;
            monitor-enter(r1);
            r0 = r3.mResumed;	 Catch:{ all -> 0x0020 }
            if (r0 == 0) goto L_0x001e;
        L_0x0009:
            r0 = 0;
            r3.mResumed = r0;	 Catch:{ all -> 0x0020 }
            r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
            r2 = 1;
            r0.mSessionsChanged = r2;	 Catch:{ all -> 0x0020 }
            r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
            r0 = r0.mBackgroundHandler;	 Catch:{ all -> 0x0020 }
            r2 = 1;
            r0.removeMessages(r2, r3);	 Catch:{ all -> 0x0020 }
            r0 = r3.this$0;	 Catch:{ all -> 0x0020 }
            r0.doPauseIfNeededLocked();	 Catch:{ all -> 0x0020 }
        L_0x001e:
            monitor-exit(r1);	 Catch:{ all -> 0x0020 }
            return;
        L_0x0020:
            r0 = move-exception;
            monitor-exit(r1);	 Catch:{ all -> 0x0020 }
            throw r0;
        }

        java.util.ArrayList<com.jellybyn.settings.applications.ApplicationsState.AppEntry> rebuild(com.jellybyn.settings.applications.ApplicationsState.AppFilter r12, java.util.Comparator<com.jellybyn.settings.applications.ApplicationsState.AppEntry> r13) {
            r11 = this;
            r6 = r11.mRebuildSync;
            monitor-enter(r6);
            r5 = r11.this$0;	 Catch:{ all -> 0x0056 }
            r7 = r5.mEntriesMap;	 Catch:{ all -> 0x0056 }
            monitor-enter(r7);	 Catch:{ all -> 0x0056 }
            r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
            r5 = r5.mRebuildingSessions;	 Catch:{ all -> 0x0053 }
            r5.add(r11);	 Catch:{ all -> 0x0053 }
            r5 = 1;
            r11.mRebuildRequested = r5;	 Catch:{ all -> 0x0053 }
            r5 = 0;
            r11.mRebuildAsync = r5;	 Catch:{ all -> 0x0053 }
            r11.mRebuildFilter = r12;	 Catch:{ all -> 0x0053 }
            r11.mRebuildComparator = r13;	 Catch:{ all -> 0x0053 }
            r5 = 0;
            r11.mRebuildResult = r5;	 Catch:{ all -> 0x0053 }
            r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
            r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
            r8 = 1;
            r5 = r5.hasMessages(r8);	 Catch:{ all -> 0x0053 }
            if (r5 != 0) goto L_0x0037;
        L_0x0027:
            r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
            r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
            r8 = 1;
            r0 = r5.obtainMessage(r8);	 Catch:{ all -> 0x0053 }
            r5 = r11.this$0;	 Catch:{ all -> 0x0053 }
            r5 = r5.mBackgroundHandler;	 Catch:{ all -> 0x0053 }
            r5.sendMessage(r0);	 Catch:{ all -> 0x0053 }
        L_0x0037:
            monitor-exit(r7);	 Catch:{ all -> 0x0053 }
            r7 = android.os.SystemClock.uptimeMillis();
            r9 = 250; // 0xfa float:3.5E-43 double:1.235E-321;
            r3 = r7 + r9;
        L_0x0040:
            r5 = r11.mRebuildResult;
            if (r5 != 0) goto L_0x004c;
        L_0x0044:
            r1 = android.os.SystemClock.uptimeMillis();
            r5 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1));
            if (r5 < 0) goto L_0x0059;
        L_0x004c:
            r5 = 1;
            r11.mRebuildAsync = r5;
            r5 = r11.mRebuildResult;
            monitor-exit(r6);
            return r5;
        L_0x0053:
            r5 = move-exception;
            monitor-exit(r7);
            throw r5;
        L_0x0056:
            r5 = move-exception;
            monitor-exit(r6);
            throw r5;
        L_0x0059:
            r5 = r11.mRebuildSync;	 Catch:{ InterruptedException -> 0x0061 }
            r7 = r3 - r1;
            r5.wait(r7);	 Catch:{ InterruptedException -> 0x0061 }
            goto L_0x0040;
        L_0x0061:
            r5 = move-exception;
            goto L_0x0040;
        }

        public void resume() {
            r3 = this;
            r0 = r3.this$0;
            r1 = r0.mEntriesMap;
            monitor-enter(r1);
            r0 = r3.mResumed;	 Catch:{ all -> 0x0018 }
            if (r0 != 0) goto L_0x0016;
        L_0x0009:
            r0 = 1;
            r3.mResumed = r0;	 Catch:{ all -> 0x0018 }
            r0 = r3.this$0;	 Catch:{ all -> 0x0018 }
            r2 = 1;
            r0.mSessionsChanged = r2;	 Catch:{ all -> 0x0018 }
            r0 = r3.this$0;	 Catch:{ all -> 0x0018 }
            r0.doResumeIfNeededLocked();	 Catch:{ all -> 0x0018 }
        L_0x0016:
            monitor-exit(r1);	 Catch:{ all -> 0x0018 }
            return;
        L_0x0018:
            r0 = move-exception;
            monitor-exit(r1);	 Catch:{ all -> 0x0018 }
            throw r0;
        }
    }

    static {
        r0 = "\\p{InCombiningDiacriticalMarks}+";
        r0 = java.util.regex.Pattern.compile(r0);
        REMOVE_DIACRITICALS_PATTERN = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$1;
        r0.<init>();
        ALPHA_COMPARATOR = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$2;
        r0.<init>();
        SIZE_COMPARATOR = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$3;
        r0.<init>();
        INTERNAL_SIZE_COMPARATOR = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$4;
        r0.<init>();
        EXTERNAL_SIZE_COMPARATOR = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$5;
        r0.<init>();
        THIRD_PARTY_FILTER = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$6;
        r0.<init>();
        ON_SD_CARD_FILTER = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$7;
        r0.<init>();
        DISABLED_FILTER = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$8;
        r0.<init>();
        ALL_ENABLED_FILTER = r0;
        r0 = new java.lang.Object;
        r0.<init>();
        sLock = r0;
        return;
    }

    private ApplicationsState(android.app.Application r5) {
        r4 = this;
        r1 = 1;
        r4.<init>();
        r0 = new java.util.ArrayList;
        r0.<init>();
        r4.mSessions = r0;
        r0 = new java.util.ArrayList;
        r0.<init>();
        r4.mRebuildingSessions = r0;
        r0 = new com.jellybyn.settings.applications.InterestingConfigChanges;
        r0.<init>();
        r4.mInterestingConfigChanges = r0;
        r0 = new java.util.HashMap;
        r0.<init>();
        r4.mEntriesMap = r0;
        r0 = new java.util.ArrayList;
        r0.<init>();
        r4.mAppEntries = r0;
        r0 = new java.util.ArrayList;
        r0.<init>();
        r4.mApplications = r0;
        r4.mCurId = r1;
        r0 = new java.util.ArrayList;
        r0.<init>();
        r4.mActiveSessions = r0;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$MainHandler;
        r0.<init>(r4);
        r4.mMainHandler = r0;
        r4.mContext = r5;
        r0 = r4.mContext;
        r0 = r0.getPackageManager();
        r4.mPm = r0;
        r0 = new android.os.HandlerThread;
        r1 = "ApplicationsState.Loader";
        r2 = 10;
        r0.<init>(r1, r2);
        r4.mThread = r0;
        r0 = r4.mThread;
        r0.start();
        r0 = new com.jellybyn.settings.applications.ApplicationsState$BackgroundHandler;
        r1 = r4.mThread;
        r1 = r1.getLooper();
        r0.<init>(r4, r1);
        r4.mBackgroundHandler = r0;
        r0 = android.os.UserHandle.myUserId();
        if (r0 != 0) goto L_0x007d;
    L_0x006c:
        r0 = 41472; // 0xa200 float:5.8115E-41 double:2.049E-319;
        r4.mRetrieveFlags = r0;
    L_0x0071:
        r1 = r4.mEntriesMap;
        monitor-enter(r1);
        r0 = r4.mEntriesMap;	 Catch:{ InterruptedException -> 0x0086 }
        r2 = 1;
        r0.wait(r2);	 Catch:{ InterruptedException -> 0x0086 }
    L_0x007b:
        monitor-exit(r1);	 Catch:{ all -> 0x0083 }
        return;
    L_0x007d:
        r0 = 33280; // 0x8200 float:4.6635E-41 double:1.64425E-319;
        r4.mRetrieveFlags = r0;
        goto L_0x0071;
    L_0x0083:
        r0 = move-exception;
        monitor-exit(r1);
        throw r0;
    L_0x0086:
        r0 = move-exception;
        goto L_0x007b;
    }

    static /* synthetic */ long access$100(com.jellybyn.settings.applications.ApplicationsState r2, android.content.pm.PackageStats r3) {
        r0 = r2.getTotalInternalSize(r3);
        return r0;
    }

    static /* synthetic */ java.lang.String access$200(com.jellybyn.settings.applications.ApplicationsState r1, long r2) {
        r0 = r1.getSizeStr(r2);
        return r0;
    }

    static /* synthetic */ long access$300(com.jellybyn.settings.applications.ApplicationsState r2, android.content.pm.PackageStats r3) {
        r0 = r2.getTotalExternalSize(r3);
        return r0;
    }

    static com.jellybyn.settings.applications.ApplicationsState getInstance(android.app.Application r2) {
        r1 = sLock;
        monitor-enter(r1);
        r0 = sInstance;	 Catch:{ all -> 0x0012 }
        if (r0 != 0) goto L_0x000e;
    L_0x0007:
        r0 = new com.jellybyn.settings.applications.ApplicationsState;	 Catch:{ all -> 0x0012 }
        r0.<init>(r2);	 Catch:{ all -> 0x0012 }
        sInstance = r0;	 Catch:{ all -> 0x0012 }
    L_0x000e:
        r0 = sInstance;	 Catch:{ all -> 0x0012 }
        monitor-exit(r1);	 Catch:{ all -> 0x0012 }
        return r0;
    L_0x0012:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x0012 }
        throw r0;
    }

    private java.lang.String getSizeStr(long r3) {
        r2 = this;
        r0 = 0;
        r0 = (r3 > r0 ? 1 : (r3 == r0 ? 0 : -1));
        if (r0 < 0) goto L_0x000d;
    L_0x0006:
        r0 = r2.mContext;
        r0 = android.text.format.Formatter.formatFileSize(r0, r3);
    L_0x000c:
        return r0;
    L_0x000d:
        r0 = 0;
        goto L_0x000c;
    }

    private long getTotalExternalSize(android.content.pm.PackageStats r5) {
        r4 = this;
        if (r5 == 0) goto L_0x0011;
    L_0x0002:
        r0 = r5.externalCodeSize;
        r2 = r5.externalDataSize;
        r0 = r0 + r2;
        r2 = r5.externalCacheSize;
        r0 = r0 + r2;
        r2 = r5.externalMediaSize;
        r0 = r0 + r2;
        r2 = r5.externalObbSize;
        r0 = r0 + r2;
    L_0x0010:
        return r0;
    L_0x0011:
        r0 = -2;
        goto L_0x0010;
    }

    private long getTotalInternalSize(android.content.pm.PackageStats r5) {
        r4 = this;
        if (r5 == 0) goto L_0x0008;
    L_0x0002:
        r0 = r5.codeSize;
        r2 = r5.dataSize;
        r0 = r0 + r2;
    L_0x0007:
        return r0;
    L_0x0008:
        r0 = -2;
        goto L_0x0007;
    }

    public static java.lang.String normalize(java.lang.String r3) {
        r1 = java.text.Normalizer.Form.NFD;
        r0 = java.text.Normalizer.normalize(r3, r1);
        r1 = REMOVE_DIACRITICALS_PATTERN;
        r1 = r1.matcher(r0);
        r2 = "";
        r1 = r1.replaceAll(r2);
        r1 = r1.toLowerCase();
        return r1;
    }

    void addPackage(java.lang.String r5) {
        r4 = this;
        r2 = r4.mEntriesMap;	 Catch:{ NameNotFoundException -> 0x0014 }
        monitor-enter(r2);	 Catch:{ NameNotFoundException -> 0x0014 }
        r1 = r4.mResumed;	 Catch:{ all -> 0x0011 }
        if (r1 != 0) goto L_0x0009;
    L_0x0007:
        monitor-exit(r2);	 Catch:{ all -> 0x0011 }
    L_0x0008:
        return;
    L_0x0009:
        r1 = r4.indexOfApplicationInfoLocked(r5);	 Catch:{ all -> 0x0011 }
        if (r1 < 0) goto L_0x0016;
    L_0x000f:
        monitor-exit(r2);	 Catch:{ all -> 0x0011 }
        goto L_0x0008;
    L_0x0011:
        r1 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0011 }
        throw r1;
    L_0x0014:
        r1 = move-exception;
        goto L_0x0008;
    L_0x0016:
        r1 = r4.mPm;
        r3 = r4.mRetrieveFlags;
        r0 = r1.getApplicationInfo(r5, r3);
        r1 = r0.enabled;
        if (r1 != 0) goto L_0x002c;
    L_0x0022:
        r1 = r0.enabledSetting;
        r3 = 3;
        if (r1 == r3) goto L_0x0029;
    L_0x0027:
        monitor-exit(r2);
        goto L_0x0008;
    L_0x0029:
        r1 = 1;
        r4.mHaveDisabledApps = r1;
    L_0x002c:
        r1 = r4.mApplications;
        r1.add(r0);
        r1 = r4.mBackgroundHandler;
        r3 = 2;
        r1 = r1.hasMessages(r3);
        if (r1 != 0) goto L_0x0040;
    L_0x003a:
        r1 = r4.mBackgroundHandler;
        r3 = 2;
        r1.sendEmptyMessage(r3);
    L_0x0040:
        r1 = r4.mMainHandler;
        r3 = 2;
        r1 = r1.hasMessages(r3);
        if (r1 != 0) goto L_0x004f;
    L_0x0049:
        r1 = r4.mMainHandler;
        r3 = 2;
        r1.sendEmptyMessage(r3);
    L_0x004f:
        monitor-exit(r2);
        goto L_0x0008;
    }

    void doPauseIfNeededLocked() {
        r2 = this;
        r1 = r2.mResumed;
        if (r1 != 0) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        r0 = 0;
    L_0x0006:
        r1 = r2.mSessions;
        r1 = r1.size();
        if (r0 >= r1) goto L_0x001d;
    L_0x000e:
        r1 = r2.mSessions;
        r1 = r1.get(r0);
        r1 = (com.jellybyn.settings.applications.ApplicationsState.Session) r1;
        r1 = r1.mResumed;
        if (r1 != 0) goto L_0x0004;
    L_0x001a:
        r0 = r0 + 1;
        goto L_0x0006;
    L_0x001d:
        r1 = 0;
        r2.mResumed = r1;
        r1 = r2.mPackageIntentReceiver;
        if (r1 == 0) goto L_0x0004;
    L_0x0024:
        r1 = r2.mPackageIntentReceiver;
        r1.unregisterReceiver();
        r1 = 0;
        r2.mPackageIntentReceiver = r1;
        goto L_0x0004;
    }

    void doResumeIfNeededLocked() {
        r8 = this;
        r7 = 0;
        r6 = 2;
        r5 = 1;
        r3 = r8.mResumed;
        if (r3 == 0) goto L_0x0008;
    L_0x0007:
        return;
    L_0x0008:
        r8.mResumed = r5;
        r3 = r8.mPackageIntentReceiver;
        if (r3 != 0) goto L_0x001a;
    L_0x000e:
        r3 = new com.jellybyn.settings.applications.ApplicationsState$PackageIntentReceiver;
        r3.<init>(r8, r7);
        r8.mPackageIntentReceiver = r3;
        r3 = r8.mPackageIntentReceiver;
        r3.registerReceiver();
    L_0x001a:
        r3 = r8.mPm;
        r4 = r8.mRetrieveFlags;
        r3 = r3.getInstalledApplications(r4);
        r8.mApplications = r3;
        r3 = r8.mApplications;
        if (r3 != 0) goto L_0x002f;
    L_0x0028:
        r3 = new java.util.ArrayList;
        r3.<init>();
        r8.mApplications = r3;
    L_0x002f:
        r3 = r8.mInterestingConfigChanges;
        r4 = r8.mContext;
        r4 = r4.getResources();
        r3 = r3.applyNewConfig(r4);
        if (r3 == 0) goto L_0x006e;
    L_0x003d:
        r3 = r8.mEntriesMap;
        r3.clear();
        r3 = r8.mAppEntries;
        r3.clear();
    L_0x0047:
        r3 = 0;
        r8.mHaveDisabledApps = r3;
        r1 = 0;
    L_0x004b:
        r3 = r8.mApplications;
        r3 = r3.size();
        if (r1 >= r3) goto L_0x0095;
    L_0x0053:
        r3 = r8.mApplications;
        r2 = r3.get(r1);
        r2 = (android.content.pm.ApplicationInfo) r2;
        r3 = r2.enabled;
        if (r3 != 0) goto L_0x0086;
    L_0x005f:
        r3 = r2.enabledSetting;
        r4 = 3;
        if (r3 == r4) goto L_0x0084;
    L_0x0064:
        r3 = r8.mApplications;
        r3.remove(r1);
        r1 = r1 + -1;
    L_0x006b:
        r1 = r1 + 1;
        goto L_0x004b;
    L_0x006e:
        r1 = 0;
    L_0x006f:
        r3 = r8.mAppEntries;
        r3 = r3.size();
        if (r1 >= r3) goto L_0x0047;
    L_0x0077:
        r3 = r8.mAppEntries;
        r3 = r3.get(r1);
        r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;
        r3.sizeStale = r5;
        r1 = r1 + 1;
        goto L_0x006f;
    L_0x0084:
        r8.mHaveDisabledApps = r5;
    L_0x0086:
        r3 = r8.mEntriesMap;
        r4 = r2.packageName;
        r0 = r3.get(r4);
        r0 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r0;
        if (r0 == 0) goto L_0x006b;
    L_0x0092:
        r0.info = r2;
        goto L_0x006b;
    L_0x0095:
        r8.mCurComputingSizePkg = r7;
        r3 = r8.mBackgroundHandler;
        r3 = r3.hasMessages(r6);
        if (r3 != 0) goto L_0x0007;
    L_0x009f:
        r3 = r8.mBackgroundHandler;
        r3.sendEmptyMessage(r6);
        goto L_0x0007;
    }

    void ensureIcon(com.jellybyn.settings.applications.ApplicationsState.AppEntry r3) {
        r2 = this;
        r0 = r3.icon;
        if (r0 == 0) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        monitor-enter(r3);
        r0 = r2.mContext;	 Catch:{ all -> 0x000f }
        r1 = r2.mPm;	 Catch:{ all -> 0x000f }
        r3.ensureIconLocked(r0, r1);	 Catch:{ all -> 0x000f }
        monitor-exit(r3);	 Catch:{ all -> 0x000f }
        goto L_0x0004;
    L_0x000f:
        r0 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x000f }
        throw r0;
    }

    com.jellybyn.settings.applications.ApplicationsState.AppEntry getEntry(java.lang.String r6) {
        r5 = this;
        r4 = r5.mEntriesMap;
        monitor-enter(r4);
        r3 = r5.mEntriesMap;	 Catch:{ all -> 0x002f }
        r0 = r3.get(r6);	 Catch:{ all -> 0x002f }
        r0 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r0;	 Catch:{ all -> 0x002f }
        if (r0 != 0) goto L_0x002a;
    L_0x000d:
        r1 = 0;
    L_0x000e:
        r3 = r5.mApplications;	 Catch:{ all -> 0x002f }
        r3 = r3.size();	 Catch:{ all -> 0x002f }
        if (r1 >= r3) goto L_0x002a;
    L_0x0016:
        r3 = r5.mApplications;	 Catch:{ all -> 0x002f }
        r2 = r3.get(r1);	 Catch:{ all -> 0x002f }
        r2 = (android.content.pm.ApplicationInfo) r2;	 Catch:{ all -> 0x002f }
        r3 = r2.packageName;	 Catch:{ all -> 0x002f }
        r3 = r6.equals(r3);	 Catch:{ all -> 0x002f }
        if (r3 == 0) goto L_0x002c;
    L_0x0026:
        r0 = r5.getEntryLocked(r2);	 Catch:{ all -> 0x002f }
    L_0x002a:
        monitor-exit(r4);	 Catch:{ all -> 0x002f }
        return r0;
    L_0x002c:
        r1 = r1 + 1;
        goto L_0x000e;
    L_0x002f:
        r3 = move-exception;
        monitor-exit(r4);	 Catch:{ all -> 0x002f }
        throw r3;
    }

    com.jellybyn.settings.applications.ApplicationsState.AppEntry getEntryLocked(android.content.pm.ApplicationInfo r7) {
        r6 = this;
        r1 = r6.mEntriesMap;
        r2 = r7.packageName;
        r0 = r1.get(r2);
        r0 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r0;
        if (r0 != 0) goto L_0x0027;
    L_0x000c:
        r0 = new com.jellybyn.settings.applications.ApplicationsState$AppEntry;
        r1 = r6.mContext;
        r2 = r6.mCurId;
        r4 = 1;
        r4 = r4 + r2;
        r6.mCurId = r4;
        r0.<init>(r1, r7, r2);
        r1 = r6.mEntriesMap;
        r2 = r7.packageName;
        r1.put(r2, r0);
        r1 = r6.mAppEntries;
        r1.add(r0);
    L_0x0026:
        return r0;
    L_0x0027:
        r1 = r0.info;
        if (r1 == r7) goto L_0x0026;
    L_0x002b:
        r0.info = r7;
        goto L_0x0026;
    }

    public boolean haveDisabledApps() {
        r1 = this;
        r0 = r1.mHaveDisabledApps;
        return r0;
    }

    int indexOfApplicationInfoLocked(java.lang.String r3) {
        r2 = this;
        r1 = r2.mApplications;
        r1 = r1.size();
        r0 = r1 + -1;
    L_0x0008:
        if (r0 < 0) goto L_0x001e;
    L_0x000a:
        r1 = r2.mApplications;
        r1 = r1.get(r0);
        r1 = (android.content.pm.ApplicationInfo) r1;
        r1 = r1.packageName;
        r1 = r1.equals(r3);
        if (r1 == 0) goto L_0x001b;
    L_0x001a:
        return r0;
    L_0x001b:
        r0 = r0 + -1;
        goto L_0x0008;
    L_0x001e:
        r0 = -1;
        goto L_0x001a;
    }

    void invalidatePackage(java.lang.String r1) {
        r0 = this;
        r0.removePackage(r1);
        r0.addPackage(r1);
        return;
    }

    public com.jellybyn.settings.applications.ApplicationsState.Session newSession(com.jellybyn.settings.applications.ApplicationsState.Callbacks r4) {
        r3 = this;
        r0 = new com.jellybyn.settings.applications.ApplicationsState$Session;
        r0.<init>(r3, r4);
        r2 = r3.mEntriesMap;
        monitor-enter(r2);
        r1 = r3.mSessions;	 Catch:{ all -> 0x000f }
        r1.add(r0);	 Catch:{ all -> 0x000f }
        monitor-exit(r2);	 Catch:{ all -> 0x000f }
        return r0;
    L_0x000f:
        r1 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x000f }
        throw r1;
    }

    void rebuildActiveSessions() {
        r4 = this;
        r3 = r4.mEntriesMap;
        monitor-enter(r3);
        r2 = r4.mSessionsChanged;	 Catch:{ all -> 0x002d }
        if (r2 != 0) goto L_0x0009;
    L_0x0007:
        monitor-exit(r3);	 Catch:{ all -> 0x002d }
    L_0x0008:
        return;
    L_0x0009:
        r2 = r4.mActiveSessions;	 Catch:{ all -> 0x002d }
        r2.clear();	 Catch:{ all -> 0x002d }
        r0 = 0;
    L_0x000f:
        r2 = r4.mSessions;	 Catch:{ all -> 0x002d }
        r2 = r2.size();	 Catch:{ all -> 0x002d }
        if (r0 >= r2) goto L_0x002b;
    L_0x0017:
        r2 = r4.mSessions;	 Catch:{ all -> 0x002d }
        r1 = r2.get(r0);	 Catch:{ all -> 0x002d }
        r1 = (com.jellybyn.settings.applications.ApplicationsState.Session) r1;	 Catch:{ all -> 0x002d }
        r2 = r1.mResumed;	 Catch:{ all -> 0x002d }
        if (r2 == 0) goto L_0x0028;
    L_0x0023:
        r2 = r4.mActiveSessions;	 Catch:{ all -> 0x002d }
        r2.add(r1);	 Catch:{ all -> 0x002d }
    L_0x0028:
        r0 = r0 + 1;
        goto L_0x000f;
    L_0x002b:
        monitor-exit(r3);	 Catch:{ all -> 0x002d }
        goto L_0x0008;
    L_0x002d:
        r2 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x002d }
        throw r2;
    }

    void removePackage(java.lang.String r8) {
        r7 = this;
        r5 = r7.mEntriesMap;
        monitor-enter(r5);
        r2 = r7.indexOfApplicationInfoLocked(r8);	 Catch:{ all -> 0x005d }
        if (r2 < 0) goto L_0x0058;
    L_0x0009:
        r4 = r7.mEntriesMap;	 Catch:{ all -> 0x005d }
        r0 = r4.get(r8);	 Catch:{ all -> 0x005d }
        r0 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r0;	 Catch:{ all -> 0x005d }
        if (r0 == 0) goto L_0x001d;
    L_0x0013:
        r4 = r7.mEntriesMap;	 Catch:{ all -> 0x005d }
        r4.remove(r8);	 Catch:{ all -> 0x005d }
        r4 = r7.mAppEntries;	 Catch:{ all -> 0x005d }
        r4.remove(r0);	 Catch:{ all -> 0x005d }
    L_0x001d:
        r4 = r7.mApplications;	 Catch:{ all -> 0x005d }
        r3 = r4.get(r2);	 Catch:{ all -> 0x005d }
        r3 = (android.content.pm.ApplicationInfo) r3;	 Catch:{ all -> 0x005d }
        r4 = r7.mApplications;	 Catch:{ all -> 0x005d }
        r4.remove(r2);	 Catch:{ all -> 0x005d }
        r4 = r3.enabled;	 Catch:{ all -> 0x005d }
        if (r4 != 0) goto L_0x0049;
    L_0x002e:
        r4 = 0;
        r7.mHaveDisabledApps = r4;	 Catch:{ all -> 0x005d }
        r1 = 0;
    L_0x0032:
        r4 = r7.mApplications;	 Catch:{ all -> 0x005d }
        r4 = r4.size();	 Catch:{ all -> 0x005d }
        if (r1 >= r4) goto L_0x0049;
    L_0x003a:
        r4 = r7.mApplications;	 Catch:{ all -> 0x005d }
        r4 = r4.get(r1);	 Catch:{ all -> 0x005d }
        r4 = (android.content.pm.ApplicationInfo) r4;	 Catch:{ all -> 0x005d }
        r4 = r4.enabled;	 Catch:{ all -> 0x005d }
        if (r4 != 0) goto L_0x005a;
    L_0x0046:
        r4 = 1;
        r7.mHaveDisabledApps = r4;	 Catch:{ all -> 0x005d }
    L_0x0049:
        r4 = r7.mMainHandler;	 Catch:{ all -> 0x005d }
        r6 = 2;
        r4 = r4.hasMessages(r6);	 Catch:{ all -> 0x005d }
        if (r4 != 0) goto L_0x0058;
    L_0x0052:
        r4 = r7.mMainHandler;	 Catch:{ all -> 0x005d }
        r6 = 2;
        r4.sendEmptyMessage(r6);	 Catch:{ all -> 0x005d }
    L_0x0058:
        monitor-exit(r5);	 Catch:{ all -> 0x005d }
        return;
    L_0x005a:
        r1 = r1 + 1;
        goto L_0x0032;
    L_0x005d:
        r4 = move-exception;
        monitor-exit(r5);	 Catch:{ all -> 0x005d }
        throw r4;
    }

    void requestSize(java.lang.String r5) {
        r4 = this;
        r2 = r4.mEntriesMap;
        monitor-enter(r2);
        r1 = r4.mEntriesMap;	 Catch:{ all -> 0x0018 }
        r0 = r1.get(r5);	 Catch:{ all -> 0x0018 }
        r0 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r0;	 Catch:{ all -> 0x0018 }
        if (r0 == 0) goto L_0x0016;
    L_0x000d:
        r1 = r4.mPm;	 Catch:{ all -> 0x0018 }
        r3 = r4.mBackgroundHandler;	 Catch:{ all -> 0x0018 }
        r3 = r3.mStatsObserver;	 Catch:{ all -> 0x0018 }
        r1.getPackageSizeInfo(r5, r3);	 Catch:{ all -> 0x0018 }
    L_0x0016:
        monitor-exit(r2);	 Catch:{ all -> 0x0018 }
        return;
    L_0x0018:
        r1 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x0018 }
        throw r1;
    }

    long sumCacheSizes() {
        r7 = this;
        r1 = 0;
        r4 = r7.mEntriesMap;
        monitor-enter(r4);
        r3 = r7.mAppEntries;	 Catch:{ all -> 0x001f }
        r3 = r3.size();	 Catch:{ all -> 0x001f }
        r0 = r3 + -1;
    L_0x000d:
        if (r0 < 0) goto L_0x001d;
    L_0x000f:
        r3 = r7.mAppEntries;	 Catch:{ all -> 0x001f }
        r3 = r3.get(r0);	 Catch:{ all -> 0x001f }
        r3 = (com.jellybyn.settings.applications.ApplicationsState.AppEntry) r3;	 Catch:{ all -> 0x001f }
        r5 = r3.cacheSize;	 Catch:{ all -> 0x001f }
        r1 = r1 + r5;
        r0 = r0 + -1;
        goto L_0x000d;
    L_0x001d:
        monitor-exit(r4);	 Catch:{ all -> 0x001f }
        return r1;
    L_0x001f:
        r3 = move-exception;
        monitor-exit(r4);	 Catch:{ all -> 0x001f }
        throw r3;
    }
}