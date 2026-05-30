package com.jellybyn.settings;

import android.R;
import android.app.Activity;
import android.app.ActivityManagerNative;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

public class Display extends Activity implements OnClickListener {
    private Configuration mCurConfig = new Configuration();
    private DisplayMetrics mDisplayMetrics;
    private Spinner mFontSize;
    private OnItemSelectedListener mFontSizeChanged = new 1(this);
    private TextView mPreview;
    private TypedValue mTextSizeTyped;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2130968625);
        this.mFontSize = (Spinner) findViewById(2131230838);
        this.mFontSize.setOnItemSelectedListener(this.mFontSizeChanged);
        states = new String[3];
        Resources r = getResources();
        states[0] = r.getString(2131427380);
        states[1] = r.getString(2131427381);
        states[2] = r.getString(2131427382);
        ArrayAdapter<String> adapter = new ArrayAdapter(this, 17367048, states);
        adapter.setDropDownViewResource(17367049);
        this.mFontSize.setAdapter(adapter);
        this.mPreview = (TextView) findViewById(2131230839);
        this.mPreview.setText(r.getText(2131427383));
        Button save = (Button) findViewById(2131230840);
        save.setText(r.getText(2131427384));
        save.setOnClickListener(this);
        this.mTextSizeTyped = new TypedValue();
        TypedArray styledAttributes = obtainStyledAttributes(R.styleable.TextView);
        styledAttributes.getValue(2, this.mTextSizeTyped);
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        this.mDisplayMetrics = new DisplayMetrics();
        this.mDisplayMetrics.density = metrics.density;
        this.mDisplayMetrics.heightPixels = metrics.heightPixels;
        this.mDisplayMetrics.scaledDensity = metrics.scaledDensity;
        this.mDisplayMetrics.widthPixels = metrics.widthPixels;
        this.mDisplayMetrics.xdpi = metrics.xdpi;
        this.mDisplayMetrics.ydpi = metrics.ydpi;
        styledAttributes.recycle();
    }

    public void onResume() {
        super.onResume();
        try {
            this.mCurConfig.updateFrom(ActivityManagerNative.getDefault().getConfiguration());
        } catch (RemoteException e) {
        }
        if (this.mCurConfig.fontScale < 1.0f) {
            this.mFontSize.setSelection(0);
        } else if (this.mCurConfig.fontScale > 1.0f) {
            this.mFontSize.setSelection(2);
        } else {
            this.mFontSize.setSelection(1);
        }
        updateFontScale();
    }

    private void updateFontScale() {
        this.mDisplayMetrics.scaledDensity = this.mDisplayMetrics.density * this.mCurConfig.fontScale;
        this.mPreview.setTextSize(0, this.mTextSizeTyped.getDimension(this.mDisplayMetrics));
    }

    public void onClick(View view) {
        try {
            ActivityManagerNative.getDefault().updatePersistentConfiguration(this.mCurConfig);
        } catch (RemoteException e) {
        }
        finish();
    }
}