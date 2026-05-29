package com.jellybyn.settings.deviceinfo;

public class FileItemInfoLayout extends android.widget.RelativeLayout implements android.widget.Checkable {
    private static final int sLengthExternalStorageDirPrefix = 0;
    private android.widget.CheckBox mCheckbox;
    private android.widget.TextView mFileNameView;
    private android.widget.TextView mFileSizeView;

    static {
        r0 = new android.os.Environment$UserEnvironment;
        r1 = android.os.UserHandle.myUserId();
        r0.<init>(r1);
        r0 = r0.getExternalStorageDirectory();
        r0 = r0.getAbsolutePath();
        r0 = r0.length();
        r0 = r0 + 1;
        sLengthExternalStorageDirPrefix = r0;
        return;
    }

    public FileItemInfoLayout(android.content.Context r2) {
        r1 = this;
        r0 = 0;
        r1.<init>(r2, r0);
        return;
    }

    public FileItemInfoLayout(android.content.Context r2, android.util.AttributeSet r3) {
        r1 = this;
        r0 = 0;
        r1.<init>(r2, r3, r0);
        return;
    }

    public FileItemInfoLayout(android.content.Context r1, android.util.AttributeSet r2, int r3) {
        r0 = this;
        r0.<init>(r1, r2, r3);
        return;
    }

    public android.widget.CheckBox getCheckBox() {
        r1 = this;
        r0 = r1.mCheckbox;
        return r0;
    }

    @android.view.ViewDebug.ExportedProperty
    public boolean isChecked() {
        r1 = this;
        r0 = r1.mCheckbox;
        r0 = r0.isChecked();
        return r0;
    }

    protected void onFinishInflate() {
        r1 = this;
        super.onFinishInflate();
        r0 = 2131231027; // 0x7f080133 float:1.8078123E38 double:1.052968034E-314;
        r0 = r1.findViewById(r0);
        r0 = (android.widget.TextView) r0;
        r1.mFileNameView = r0;
        r0 = 2131231028; // 0x7f080134 float:1.8078125E38 double:1.0529680343E-314;
        r0 = r1.findViewById(r0);
        r0 = (android.widget.TextView) r0;
        r1.mFileSizeView = r0;
        r0 = 2131231026; // 0x7f080132 float:1.8078121E38 double:1.0529680333E-314;
        r0 = r1.findViewById(r0);
        r0 = (android.widget.CheckBox) r0;
        r1.mCheckbox = r0;
        return;
    }

    public void setChecked(boolean r2) {
        r1 = this;
        r0 = r1.mCheckbox;
        r0.setChecked(r2);
        return;
    }

    public void setFileName(java.lang.String r3) {
        r2 = this;
        r0 = r2.mFileNameView;
        r1 = sLengthExternalStorageDirPrefix;
        r1 = r3.substring(r1);
        r0.setText(r1);
        return;
    }

    public void setFileSize(java.lang.String r2) {
        r1 = this;
        r0 = r1.mFileSizeView;
        r0.setText(r2);
        return;
    }

    public void toggle() {
        r1 = this;
        r0 = r1.mCheckbox;
        r0 = r0.isChecked();
        if (r0 != 0) goto L_0x000d;
    L_0x0008:
        r0 = 1;
    L_0x0009:
        r1.setChecked(r0);
        return;
    L_0x000d:
        r0 = 0;
        goto L_0x0009;
    }
}