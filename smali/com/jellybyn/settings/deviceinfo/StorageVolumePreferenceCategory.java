package com.jellybyn.settings.deviceinfo;

public class StorageVolumePreferenceCategory extends android.preference.PreferenceCategory {
    private android.preference.Preference mFormatPreference;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemApps;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemAvailable;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemCache;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemDcim;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemDownloads;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemMisc;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemMusic;
    private com.jellybyn.settings.deviceinfo.StorageItemPreference mItemTotal;
    private java.util.List<com.jellybyn.settings.deviceinfo.StorageItemPreference> mItemUsers;
    private final com.jellybyn.settings.deviceinfo.StorageMeasurement mMeasure;
    private android.preference.Preference mMountTogglePreference;
    private com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementReceiver mReceiver;
    private final android.content.res.Resources mResources;
    private android.preference.Preference mStorageLow;
    private final android.os.storage.StorageManager mStorageManager;
    private long mTotalSize;
    private android.os.Handler mUpdateHandler;
    private com.jellybyn.settings.deviceinfo.UsageBarPreference mUsageBarPreference;
    private boolean mUsbConnected;
    private java.lang.String mUsbFunction;
    private final android.os.UserManager mUserManager;
    private final android.os.storage.StorageVolume mVolume;

    private StorageVolumePreferenceCategory(android.content.Context r2, android.os.storage.StorageVolume r3) {
        r1 = this;
        r1.<init>(r2);
        r0 = com.google.android.collect.Lists.newArrayList();
        r1.mItemUsers = r0;
        r0 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory$1;
        r0.<init>(r1);
        r1.mUpdateHandler = r0;
        r0 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory$2;
        r0.<init>(r1);
        r1.mReceiver = r0;
        r1.mVolume = r3;
        r0 = com.jellybyn.settings.deviceinfo.StorageMeasurement.getInstance(r2, r3);
        r1.mMeasure = r0;
        r0 = r2.getResources();
        r1.mResources = r0;
        r0 = android.os.storage.StorageManager.from(r2);
        r1.mStorageManager = r0;
        r0 = "user";
        r0 = r2.getSystemService(r0);
        r0 = (android.os.UserManager) r0;
        r1.mUserManager = r0;
        if (r3 == 0) goto L_0x003f;
    L_0x0037:
        r0 = r3.getDescription(r2);
    L_0x003b:
        r1.setTitle(r0);
        return;
    L_0x003f:
        r0 = 2131428384; // 0x7f0b0420 float:1.847841E38 double:1.053065541E-314;
        r0 = r2.getText(r0);
        goto L_0x003b;
    }

    static /* synthetic */ android.os.Handler access$000(com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory r1) {
        r0 = r1.mUpdateHandler;
        return r0;
    }

    public static com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory buildForInternal(android.content.Context r2) {
        r0 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory;
        r1 = 0;
        r0.<init>(r2, r1);
        return r0;
    }

    public static com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory buildForPhysical(android.content.Context r1, android.os.storage.StorageVolume r2) {
        r0 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory;
        r0.<init>(r1, r2);
        return r0;
    }

    private com.jellybyn.settings.deviceinfo.StorageItemPreference buildItem(int r3, int r4) {
        r2 = this;
        r0 = new com.jellybyn.settings.deviceinfo.StorageItemPreference;
        r1 = r2.getContext();
        r0.<init>(r1, r3, r4);
        return r0;
    }

    private java.lang.String formatSize(long r2) {
        r1 = this;
        r0 = r1.getContext();
        r0 = android.text.format.Formatter.formatFileSize(r0, r2);
        return r0;
    }

    private java.util.List<android.content.pm.UserInfo> getUsersExcluding(android.content.pm.UserInfo r5) {
        r4 = this;
        r2 = r4.mUserManager;
        r1 = r2.getUsers();
        r0 = r1.iterator();
    L_0x000a:
        r2 = r0.hasNext();
        if (r2 == 0) goto L_0x0020;
    L_0x0010:
        r2 = r0.next();
        r2 = (android.content.pm.UserInfo) r2;
        r2 = r2.id;
        r3 = r5.id;
        if (r2 != r3) goto L_0x000a;
    L_0x001c:
        r0.remove();
        goto L_0x000a;
    L_0x0020:
        return r1;
    }

    private void measure() {
        r1 = this;
        r0 = r1.mMeasure;
        r0.invalidate();
        r0 = r1.mMeasure;
        r0.measure();
        return;
    }

    private static long totalValues(java.util.HashMap<java.lang.String, java.lang.Long> r8, java.lang.String... r9) {
        r4 = 0;
        r0 = r9;
        r3 = r0.length;
        r1 = 0;
    L_0x0005:
        if (r1 >= r3) goto L_0x001d;
    L_0x0007:
        r2 = r0[r1];
        r6 = r8.containsKey(r2);
        if (r6 == 0) goto L_0x001a;
    L_0x000f:
        r6 = r8.get(r2);
        r6 = (java.lang.Long) r6;
        r6 = r6.longValue();
        r4 = r4 + r6;
    L_0x001a:
        r1 = r1 + 1;
        goto L_0x0005;
    L_0x001d:
        return r4;
    }

    private void updatePreference(com.jellybyn.settings.deviceinfo.StorageItemPreference r6, long r7) {
        r5 = this;
        r1 = 0;
        r1 = (r7 > r1 ? 1 : (r7 == r1 ? 0 : -1));
        if (r1 <= 0) goto L_0x001e;
    L_0x0006:
        r1 = r5.formatSize(r7);
        r6.setSummary(r1);
        r0 = r6.getOrder();
        r1 = r5.mUsageBarPreference;
        r2 = (float) r7;
        r3 = r5.mTotalSize;
        r3 = (float) r3;
        r2 = r2 / r3;
        r3 = r6.color;
        r1.addEntry(r0, r2, r3);
    L_0x001d:
        return;
    L_0x001e:
        r5.removePreference(r6);
        goto L_0x001d;
    }

    private void updatePreferencesFromState() {
        r7 = this;
        r6 = 2131428136; // 0x7f0b0328 float:1.8477908E38 double:1.0530654186E-314;
        r3 = 2131428130; // 0x7f0b0322 float:1.8477896E38 double:1.0530654156E-314;
        r5 = 0;
        r4 = 1;
        r1 = r7.mVolume;
        if (r1 != 0) goto L_0x000d;
    L_0x000c:
        return;
    L_0x000d:
        r1 = r7.mMountTogglePreference;
        r1.setEnabled(r4);
        r1 = r7.mStorageManager;
        r2 = r7.mVolume;
        r2 = r2.getPath();
        r0 = r1.getVolumeState(r2);
        r1 = "mounted_ro";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x00b6;
    L_0x0026:
        r1 = r7.mItemAvailable;
        r2 = 2131428117; // 0x7f0b0315 float:1.847787E38 double:1.053065409E-314;
        r1.setTitle(r2);
        r1 = r7.mFormatPreference;
        if (r1 == 0) goto L_0x0037;
    L_0x0032:
        r1 = r7.mFormatPreference;
        r7.removePreference(r1);
    L_0x0037:
        r1 = "mounted";
        r1 = r1.equals(r0);
        if (r1 != 0) goto L_0x0047;
    L_0x003f:
        r1 = "mounted_ro";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x00c0;
    L_0x0047:
        r1 = r7.mMountTogglePreference;
        r1.setEnabled(r4);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r3 = 2131428127; // 0x7f0b031f float:1.847789E38 double:1.053065414E-314;
        r2 = r2.getString(r3);
        r1.setTitle(r2);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r3 = 2131428128; // 0x7f0b0320 float:1.8477892E38 double:1.0530654146E-314;
        r2 = r2.getString(r3);
        r1.setSummary(r2);
    L_0x0068:
        r1 = r7.mUsbConnected;
        if (r1 == 0) goto L_0x012f;
    L_0x006c:
        r1 = "mtp";
        r2 = r7.mUsbFunction;
        r1 = r1.equals(r2);
        if (r1 != 0) goto L_0x0080;
    L_0x0076:
        r1 = "ptp";
        r2 = r7.mUsbFunction;
        r1 = r1.equals(r2);
        if (r1 == 0) goto L_0x012f;
    L_0x0080:
        r1 = r7.mMountTogglePreference;
        r1.setEnabled(r5);
        r1 = "mounted";
        r1 = r1.equals(r0);
        if (r1 != 0) goto L_0x0095;
    L_0x008d:
        r1 = "mounted_ro";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x00a0;
    L_0x0095:
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r2 = r2.getString(r6);
        r1.setSummary(r2);
    L_0x00a0:
        r1 = r7.mFormatPreference;
        if (r1 == 0) goto L_0x000c;
    L_0x00a4:
        r1 = r7.mFormatPreference;
        r1.setEnabled(r5);
        r1 = r7.mFormatPreference;
        r2 = r7.mResources;
        r2 = r2.getString(r6);
        r1.setSummary(r2);
        goto L_0x000c;
    L_0x00b6:
        r1 = r7.mItemAvailable;
        r2 = 2131428116; // 0x7f0b0314 float:1.8477867E38 double:1.0530654087E-314;
        r1.setTitle(r2);
        goto L_0x0037;
    L_0x00c0:
        r1 = "unmounted";
        r1 = r1.equals(r0);
        if (r1 != 0) goto L_0x00d8;
    L_0x00c8:
        r1 = "nofs";
        r1 = r1.equals(r0);
        if (r1 != 0) goto L_0x00d8;
    L_0x00d0:
        r1 = "unmountable";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x0110;
    L_0x00d8:
        r1 = r7.mMountTogglePreference;
        r1.setEnabled(r4);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r2 = r2.getString(r3);
        r1.setTitle(r2);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r3 = 2131428131; // 0x7f0b0323 float:1.8477898E38 double:1.053065416E-314;
        r2 = r2.getString(r3);
        r1.setSummary(r2);
    L_0x00f6:
        r1 = r7.mUsageBarPreference;
        r7.removePreference(r1);
        r1 = r7.mItemTotal;
        r7.removePreference(r1);
        r1 = r7.mItemAvailable;
        r7.removePreference(r1);
        r1 = r7.mFormatPreference;
        if (r1 == 0) goto L_0x0068;
    L_0x0109:
        r1 = r7.mFormatPreference;
        r7.removePreference(r1);
        goto L_0x0068;
    L_0x0110:
        r1 = r7.mMountTogglePreference;
        r1.setEnabled(r5);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r2 = r2.getString(r3);
        r1.setTitle(r2);
        r1 = r7.mMountTogglePreference;
        r2 = r7.mResources;
        r3 = 2131428129; // 0x7f0b0321 float:1.8477894E38 double:1.053065415E-314;
        r2 = r2.getString(r3);
        r1.setSummary(r2);
        goto L_0x00f6;
    L_0x012f:
        r1 = r7.mFormatPreference;
        if (r1 == 0) goto L_0x000c;
    L_0x0133:
        r1 = r7.mFormatPreference;
        r1.setEnabled(r4);
        r1 = r7.mFormatPreference;
        r2 = r7.mResources;
        r3 = 2131428133; // 0x7f0b0325 float:1.8477902E38 double:1.053065417E-314;
        r2 = r2.getString(r3);
        r1.setSummary(r2);
        goto L_0x000c;
    }

    public android.os.storage.StorageVolume getStorageVolume() {
        r1 = this;
        r0 = r1.mVolume;
        return r0;
    }

    public void init() {
        r22 = this;
        r6 = r22.getContext();
        r9 = 0;
        goto L_0x0006;
    L_0x0006:
        r0 = r22;
        r14 = r0.getUsersExcluding(r9);
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        if (r19 != 0) goto L_0x01f8;
    L_0x0014:
        r19 = r14.size();
        if (r19 <= 0) goto L_0x01f8;
    L_0x001a:
        r17 = 1;
    L_0x001c:
        r19 = new com.jellybyn.settings.deviceinfo.UsageBarPreference;
        r0 = r19;
        r0.<init>(r6);
        r0 = r19;
        r1 = r22;
        r1.mUsageBarPreference = r0;
        r0 = r22;
        r0 = r0.mUsageBarPreference;
        r19 = r0;
        r20 = -2;
        r19.setOrder(r20);
        r0 = r22;
        r0 = r0.mUsageBarPreference;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r19 = 2131428118; // 0x7f0b0316 float:1.8477871E38 double:1.0530654097E-314;
        r20 = 0;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemTotal = r0;
        r19 = 2131428116; // 0x7f0b0314 float:1.8477867E38 double:1.0530654087E-314;
        r20 = 2131361795; // 0x7f0a0003 float:1.8343352E38 double:1.053032642E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemAvailable = r0;
        r0 = r22;
        r0 = r0.mItemTotal;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemAvailable;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r19 = 2131428120; // 0x7f0b0318 float:1.8477876E38 double:1.0530654107E-314;
        r20 = 2131361796; // 0x7f0a0004 float:1.8343354E38 double:1.0530326423E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemApps = r0;
        r19 = 2131428123; // 0x7f0b031b float:1.8477882E38 double:1.053065412E-314;
        r20 = 2131361798; // 0x7f0a0006 float:1.8343359E38 double:1.0530326433E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemDcim = r0;
        r19 = 2131428124; // 0x7f0b031c float:1.8477884E38 double:1.0530654126E-314;
        r20 = 2131361799; // 0x7f0a0007 float:1.834336E38 double:1.0530326437E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemMusic = r0;
        r19 = 2131428122; // 0x7f0b031a float:1.847788E38 double:1.0530654117E-314;
        r20 = 2131361797; // 0x7f0a0005 float:1.8343356E38 double:1.053032643E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemDownloads = r0;
        r19 = 2131428126; // 0x7f0b031e float:1.8477888E38 double:1.0530654136E-314;
        r20 = 2131361800; // 0x7f0a0008 float:1.8343363E38 double:1.053032644E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemCache = r0;
        r19 = 2131428125; // 0x7f0b031d float:1.8477886E38 double:1.053065413E-314;
        r20 = 2131361801; // 0x7f0a0009 float:1.8343365E38 double:1.0530326447E-314;
        r0 = r22;
        r1 = r19;
        r2 = r20;
        r19 = r0.buildItem(r1, r2);
        r0 = r19;
        r1 = r22;
        r1.mItemMisc = r0;
        r0 = r22;
        r0 = r0.mItemCache;
        r19 = r0;
        r20 = "cache";
        r19.setKey(r20);
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        if (r19 == 0) goto L_0x0129;
    L_0x011d:
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        r19 = r19.isPrimary();
        if (r19 == 0) goto L_0x01fc;
    L_0x0129:
        r16 = 1;
    L_0x012b:
        if (r16 == 0) goto L_0x0204;
    L_0x012d:
        if (r17 == 0) goto L_0x0143;
    L_0x012f:
        r19 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory$PreferenceHeader;
        r0 = r9.name;
        r20 = r0;
        r0 = r19;
        r1 = r20;
        r0.<init>(r6, r1);
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
    L_0x0143:
        r0 = r22;
        r0 = r0.mItemApps;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemDcim;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemMusic;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemDownloads;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemCache;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r0 = r22;
        r0 = r0.mItemMisc;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        if (r17 == 0) goto L_0x0204;
    L_0x0193:
        r19 = new com.jellybyn.settings.deviceinfo.StorageVolumePreferenceCategory$PreferenceHeader;
        r20 = 2131428154; // 0x7f0b033a float:1.8477944E38 double:1.0530654275E-314;
        r0 = r19;
        r1 = r20;
        r0.<init>(r6, r1);
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
        r7 = 0;
        r11 = r14.iterator();
    L_0x01ab:
        r19 = r11.hasNext();
        if (r19 == 0) goto L_0x0204;
    L_0x01b1:
        r12 = r11.next();
        r12 = (android.content.pm.UserInfo) r12;
        r8 = r7 + 1;
        r19 = r7 % 2;
        if (r19 != 0) goto L_0x0200;
    L_0x01bd:
        r5 = 2131361802; // 0x7f0a000a float:1.8343367E38 double:1.053032645E-314;
    L_0x01c0:
        r18 = new com.jellybyn.settings.deviceinfo.StorageItemPreference;
        r19 = r22.getContext();
        r0 = r12.name;
        r20 = r0;
        r0 = r12.id;
        r21 = r0;
        r0 = r18;
        r1 = r19;
        r2 = r20;
        r3 = r21;
        r0.<init>(r1, r2, r5, r3);
        r0 = r22;
        r0 = r0.mItemUsers;
        r19 = r0;
        r0 = r19;
        r1 = r18;
        r0.add(r1);
        r0 = r22;
        r1 = r18;
        r0.addPreference(r1);
        r7 = r8;
        goto L_0x01ab;
        r10 = move-exception;
        r19 = new java.lang.RuntimeException;
        r20 = "Failed to get current user";
        r19.<init>(r20);
        throw r19;
    L_0x01f8:
        r17 = 0;
        goto L_0x001c;
    L_0x01fc:
        r16 = 0;
        goto L_0x012b;
    L_0x0200:
        r5 = 2131361803; // 0x7f0a000b float:1.8343369E38 double:1.0530326457E-314;
        goto L_0x01c0;
    L_0x0204:
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        if (r19 == 0) goto L_0x02d8;
    L_0x020c:
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        r13 = r19.isRemovable();
    L_0x0216:
        r19 = new android.preference.Preference;
        r0 = r19;
        r0.<init>(r6);
        r0 = r19;
        r1 = r22;
        r1.mMountTogglePreference = r0;
        if (r13 == 0) goto L_0x024a;
    L_0x0225:
        r0 = r22;
        r0 = r0.mMountTogglePreference;
        r19 = r0;
        r20 = 2131428127; // 0x7f0b031f float:1.847789E38 double:1.053065414E-314;
        r19.setTitle(r20);
        r0 = r22;
        r0 = r0.mMountTogglePreference;
        r19 = r0;
        r20 = 2131428128; // 0x7f0b0320 float:1.8477892E38 double:1.0530654146E-314;
        r19.setSummary(r20);
        r0 = r22;
        r0 = r0.mMountTogglePreference;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
    L_0x024a:
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        if (r19 == 0) goto L_0x02db;
    L_0x0252:
        r0 = r22;
        r0 = r0.mVolume;
        r19 = r0;
        r4 = r19.isPrimary();
    L_0x025c:
        if (r4 == 0) goto L_0x0290;
    L_0x025e:
        r19 = new android.preference.Preference;
        r0 = r19;
        r0.<init>(r6);
        r0 = r19;
        r1 = r22;
        r1.mFormatPreference = r0;
        r0 = r22;
        r0 = r0.mFormatPreference;
        r19 = r0;
        r20 = 2131428132; // 0x7f0b0324 float:1.84779E38 double:1.0530654166E-314;
        r19.setTitle(r20);
        r0 = r22;
        r0 = r0.mFormatPreference;
        r19 = r0;
        r20 = 2131428133; // 0x7f0b0325 float:1.8477902E38 double:1.053065417E-314;
        r19.setSummary(r20);
        r0 = r22;
        r0 = r0.mFormatPreference;
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);
    L_0x0290:
        r15 = android.app.ActivityThread.getPackageManager();
        r19 = r15.isStorageLow();	 Catch:{ RemoteException -> 0x02fb }
        if (r19 == 0) goto L_0x02dd;
    L_0x029a:
        r19 = new android.preference.Preference;	 Catch:{ RemoteException -> 0x02fb }
        r0 = r19;
        r0.<init>(r6);	 Catch:{ RemoteException -> 0x02fb }
        r0 = r19;
        r1 = r22;
        r1.mStorageLow = r0;	 Catch:{ RemoteException -> 0x02fb }
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        r20 = -1;
        r19.setOrder(r20);	 Catch:{ RemoteException -> 0x02fb }
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        r20 = 2131428144; // 0x7f0b0330 float:1.8477924E38 double:1.0530654225E-314;
        r19.setTitle(r20);	 Catch:{ RemoteException -> 0x02fb }
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        r20 = 2131428145; // 0x7f0b0331 float:1.8477926E38 double:1.053065423E-314;
        r19.setSummary(r20);	 Catch:{ RemoteException -> 0x02fb }
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.addPreference(r1);	 Catch:{ RemoteException -> 0x02fb }
    L_0x02d7:
        return;
    L_0x02d8:
        r13 = 0;
        goto L_0x0216;
    L_0x02db:
        r4 = 0;
        goto L_0x025c;
    L_0x02dd:
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        if (r19 == 0) goto L_0x02d7;
    L_0x02e5:
        r0 = r22;
        r0 = r0.mStorageLow;	 Catch:{ RemoteException -> 0x02fb }
        r19 = r0;
        r0 = r22;
        r1 = r19;
        r0.removePreference(r1);	 Catch:{ RemoteException -> 0x02fb }
        r19 = 0;
        r0 = r19;
        r1 = r22;
        r1.mStorageLow = r0;	 Catch:{ RemoteException -> 0x02fb }
        goto L_0x02d7;
    L_0x02fb:
        r19 = move-exception;
        goto L_0x02d7;
    }

    public android.content.Intent intentForClick(android.preference.Preference r4) {
        r3 = this;
        r2 = 1;
        r0 = 0;
        r4.getKey();
        r1 = r3.mFormatPreference;
        if (r4 != r1) goto L_0x0021;
    L_0x0009:
        r0 = new android.content.Intent;
        r1 = "android.intent.action.VIEW";
        r0.<init>(r1);
        r1 = r3.getContext();
        r2 = com.jellybyn.settings.MediaFormat.class;
        r0.setClass(r1, r2);
        r1 = "storage_volume";
        r2 = r3.mVolume;
        r0.putExtra(r1, r2);
    L_0x0020:
        return r0;
    L_0x0021:
        r1 = r3.mItemApps;
        if (r4 != r1) goto L_0x0036;
    L_0x0025:
        r0 = new android.content.Intent;
        r1 = "android.intent.action.MANAGE_PACKAGE_STORAGE";
        r0.<init>(r1);
        r1 = r3.getContext();
        r2 = com.jellybyn.settings.Settings.ManageApplicationsActivity.class;
        r0.setClass(r1, r2);
        goto L_0x0020;
    L_0x0036:
        r1 = r3.mItemDownloads;
        if (r4 != r1) goto L_0x0048;
    L_0x003a:
        r0 = new android.content.Intent;
        r1 = "android.intent.action.VIEW_DOWNLOADS";
        r0.<init>(r1);
        r1 = "android.app.DownloadManager.extra_sortBySize";
        r0 = r0.putExtra(r1, r2);
        goto L_0x0020;
    L_0x0048:
        r1 = r3.mItemMusic;
        if (r4 != r1) goto L_0x0059;
    L_0x004c:
        r0 = new android.content.Intent;
        r1 = "android.intent.action.GET_CONTENT";
        r0.<init>(r1);
        r1 = "audio/mp3";
        r0.setType(r1);
        goto L_0x0020;
    L_0x0059:
        r1 = r3.mItemDcim;
        if (r4 != r1) goto L_0x006f;
    L_0x005d:
        r0 = new android.content.Intent;
        r1 = "android.intent.action.VIEW";
        r0.<init>(r1);
        r1 = "android.intent.extra.LOCAL_ONLY";
        r0.putExtra(r1, r2);
        r1 = "vnd.android.cursor.dir/image";
        r0.setType(r1);
        goto L_0x0020;
    L_0x006f:
        r1 = r3.mItemMisc;
        if (r4 != r1) goto L_0x0020;
    L_0x0073:
        r0 = r3.getContext();
        r1 = r0.getApplicationContext();
        r0 = new android.content.Intent;
        r2 = com.jellybyn.settings.deviceinfo.MiscFilesHandler.class;
        r0.<init>(r1, r2);
        r1 = "storage_volume";
        r2 = r3.mVolume;
        r0.putExtra(r1, r2);
        goto L_0x0020;
    }

    public boolean mountToggleClicked(android.preference.Preference r2) {
        r1 = this;
        r0 = r1.mMountTogglePreference;
        if (r2 != r0) goto L_0x0006;
    L_0x0004:
        r0 = 1;
    L_0x0005:
        return r0;
    L_0x0006:
        r0 = 0;
        goto L_0x0005;
    }

    public void onCacheCleared() {
        r0 = this;
        r0.measure();
        return;
    }

    public void onMediaScannerFinished() {
        r0 = this;
        r0.measure();
        return;
    }

    public void onPause() {
        r1 = this;
        r0 = r1.mMeasure;
        r0.cleanUp();
        return;
    }

    public void onResume() {
        r2 = this;
        r0 = r2.mMeasure;
        r1 = r2.mReceiver;
        r0.setReceiver(r1);
        r2.measure();
        return;
    }

    public void onStorageStateChanged() {
        r0 = this;
        r0.measure();
        return;
    }

    public void onUsbStateChanged(boolean r1, java.lang.String r2) {
        r0 = this;
        r0.mUsbConnected = r1;
        r0.mUsbFunction = r2;
        r0.measure();
        return;
    }

    public void updateApproximate(long r7, long r9) {
        r6 = this;
        r2 = r6.mItemTotal;
        r3 = r6.formatSize(r7);
        r2.setSummary(r3);
        r2 = r6.mItemAvailable;
        r3 = r6.formatSize(r9);
        r2.setSummary(r3);
        r6.mTotalSize = r7;
        r0 = r7 - r9;
        r2 = r6.mUsageBarPreference;
        r2.clear();
        r2 = r6.mUsageBarPreference;
        r3 = 0;
        r4 = (float) r0;
        r5 = (float) r7;
        r4 = r4 / r5;
        r5 = -7829368; // 0xffffffffff888888 float:NaN double:NaN;
        r2.addEntry(r3, r4, r5);
        r2 = r6.mUsageBarPreference;
        r2.commit();
        r6.updatePreferencesFromState();
        return;
    }

    public void updateDetails(com.jellybyn.settings.deviceinfo.StorageMeasurement.MeasurementDetails r17) {
        r16 = this;
        r0 = r16;
        r12 = r0.mVolume;
        if (r12 == 0) goto L_0x0010;
    L_0x0006:
        r0 = r16;
        r12 = r0.mVolume;
        r12 = r12.isPrimary();
        if (r12 == 0) goto L_0x0014;
    L_0x0010:
        r8 = 1;
    L_0x0011:
        if (r8 != 0) goto L_0x0016;
    L_0x0013:
        return;
    L_0x0014:
        r8 = 0;
        goto L_0x0011;
    L_0x0016:
        r0 = r16;
        r12 = r0.mItemTotal;
        r0 = r17;
        r13 = r0.totalSize;
        r0 = r16;
        r13 = r0.formatSize(r13);
        r12.setSummary(r13);
        r0 = r16;
        r12 = r0.mItemAvailable;
        r0 = r17;
        r13 = r0.availSize;
        r0 = r16;
        r13 = r0.formatSize(r13);
        r12.setSummary(r13);
        r0 = r16;
        r12 = r0.mUsageBarPreference;
        r12.clear();
        r0 = r16;
        r12 = r0.mItemApps;
        r0 = r17;
        r13 = r0.appsSize;
        r0 = r16;
        r0.updatePreference(r12, r13);
        r0 = r17;
        r12 = r0.mediaSize;
        r13 = 3;
        r13 = new java.lang.String[r13];
        r14 = 0;
        r15 = android.os.Environment.DIRECTORY_DCIM;
        r13[r14] = r15;
        r14 = 1;
        r15 = android.os.Environment.DIRECTORY_MOVIES;
        r13[r14] = r15;
        r14 = 2;
        r15 = android.os.Environment.DIRECTORY_PICTURES;
        r13[r14] = r15;
        r1 = totalValues(r12, r13);
        r0 = r16;
        r12 = r0.mItemDcim;
        r0 = r16;
        r0.updatePreference(r12, r1);
        r0 = r17;
        r12 = r0.mediaSize;
        r13 = 5;
        r13 = new java.lang.String[r13];
        r14 = 0;
        r15 = android.os.Environment.DIRECTORY_MUSIC;
        r13[r14] = r15;
        r14 = 1;
        r15 = android.os.Environment.DIRECTORY_ALARMS;
        r13[r14] = r15;
        r14 = 2;
        r15 = android.os.Environment.DIRECTORY_NOTIFICATIONS;
        r13[r14] = r15;
        r14 = 3;
        r15 = android.os.Environment.DIRECTORY_RINGTONES;
        r13[r14] = r15;
        r14 = 4;
        r15 = android.os.Environment.DIRECTORY_PODCASTS;
        r13[r14] = r15;
        r6 = totalValues(r12, r13);
        r0 = r16;
        r12 = r0.mItemMusic;
        r0 = r16;
        r0.updatePreference(r12, r6);
        r0 = r17;
        r12 = r0.mediaSize;
        r13 = 1;
        r13 = new java.lang.String[r13];
        r14 = 0;
        r15 = android.os.Environment.DIRECTORY_DOWNLOADS;
        r13[r14] = r15;
        r3 = totalValues(r12, r13);
        r0 = r16;
        r12 = r0.mItemDownloads;
        r0 = r16;
        r0.updatePreference(r12, r3);
        r0 = r16;
        r12 = r0.mItemCache;
        r0 = r17;
        r13 = r0.cacheSize;
        r0 = r16;
        r0.updatePreference(r12, r13);
        r0 = r16;
        r12 = r0.mItemMisc;
        r0 = r17;
        r13 = r0.miscSize;
        r0 = r16;
        r0.updatePreference(r12, r13);
        r0 = r16;
        r12 = r0.mItemUsers;
        r5 = r12.iterator();
    L_0x00d7:
        r12 = r5.hasNext();
        if (r12 == 0) goto L_0x00f3;
    L_0x00dd:
        r9 = r5.next();
        r9 = (com.jellybyn.settings.deviceinfo.StorageItemPreference) r9;
        r0 = r17;
        r12 = r0.usersSize;
        r13 = r9.userHandle;
        r10 = r12.get(r13);
        r0 = r16;
        r0.updatePreference(r9, r10);
        goto L_0x00d7;
    L_0x00f3:
        r0 = r16;
        r12 = r0.mUsageBarPreference;
        r12.commit();
        goto L_0x0013;
    }
}