package com.jellybyn.settings.fuelgauge;

enum PowerUsageDetail$DrainType {
    private static final /* synthetic */ com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType[] $VALUES = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType APP = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType BLUETOOTH = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType CELL = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType IDLE = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType PHONE = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType SCREEN = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType USER = null;
    public static final com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType WIFI = null;

    static {
        r7 = 4;
        r6 = 3;
        r5 = 2;
        r4 = 1;
        r3 = 0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "IDLE";
        r0.<init>(r1, r3);
        IDLE = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "CELL";
        r0.<init>(r1, r4);
        CELL = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "PHONE";
        r0.<init>(r1, r5);
        PHONE = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "WIFI";
        r0.<init>(r1, r6);
        WIFI = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "BLUETOOTH";
        r0.<init>(r1, r7);
        BLUETOOTH = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "SCREEN";
        r2 = 5;
        r0.<init>(r1, r2);
        SCREEN = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "APP";
        r2 = 6;
        r0.<init>(r1, r2);
        APP = r0;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType;
        r1 = "USER";
        r2 = 7;
        r0.<init>(r1, r2);
        USER = r0;
        r0 = 8;
        r0 = new com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType[r0];
        r1 = IDLE;
        r0[r3] = r1;
        r1 = CELL;
        r0[r4] = r1;
        r1 = PHONE;
        r0[r5] = r1;
        r1 = WIFI;
        r0[r6] = r1;
        r1 = BLUETOOTH;
        r0[r7] = r1;
        r1 = 5;
        r2 = SCREEN;
        r0[r1] = r2;
        r1 = 6;
        r2 = APP;
        r0[r1] = r2;
        r1 = 7;
        r2 = USER;
        r0[r1] = r2;
        $VALUES = r0;
        return;
    }

    private PowerUsageDetail$DrainType(java.lang.String r1, int r2) {
        r0 = this;
        r0.<init>(r1, r2);
        return;
    }

    public static com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType valueOf(java.lang.String r1) {
        r0 = com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType.class;
        r0 = java.lang.Enum.valueOf(r0, r1);
        r0 = (com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType) r0;
        return r0;
    }

    public static com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType[] values() {
        r0 = $VALUES;
        r0 = r0.clone();
        r0 = (com.jellybyn.settings.fuelgauge.PowerUsageDetail$DrainType[]) r0;
        return r0;
    }
}