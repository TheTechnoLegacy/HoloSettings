package com.jellybyn.settings;

import android.app.Activity;
import android.app.ActivityManager;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.IWindowManager;
import android.view.IWindowManager.Stub;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.Toast;
import com.android.internal.widget.LockPatternUtils;
import com.jellybyn.settings.AppWidgetLoader.ItemConstructor;
import java.util.List;

public class KeyguardAppWidgetPickActivity extends Activity implements OnItemClickListener, ItemConstructor<Item> {
    private boolean mAddingToKeyguard = true;
    private AppWidgetAdapter mAppWidgetAdapter;
    private int mAppWidgetId;
    private AppWidgetLoader<Item> mAppWidgetLoader;
    private AppWidgetManager mAppWidgetManager;
    private Bundle mExtraConfigureOptions;
    private GridView mGridView;
    private List<Item> mItems;
    private LockPatternUtils mLockPatternUtils;
    private Intent mResultData;

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 126 || i == 127) {
            int appWidgetId = intent == null ? 0 : intent.getIntExtra("appWidgetId", 0);
            if (i == 126 && i2 == -1) {
                AppWidgetProviderInfo appWidgetInfo = AppWidgetManager.getInstance(this).getAppWidgetInfo(appWidgetId);
                if (appWidgetInfo.configure != null) {
                    Intent intent2 = new Intent("android.appwidget.action.APPWIDGET_CONFIGURE");
                    intent2.setComponent(appWidgetInfo.configure);
                    intent2.addFlags(8388608);
                    intent2.putExtra("appWidgetId", appWidgetId);
                    startActivityForResultSafely(intent2, 127);
                    return;
                }
                onActivityResult(127, -1, intent);
            } else if (i == 127 && i2 == -1) {
                this.mLockPatternUtils.addAppWidget(appWidgetId, 0);
                finishDelayedAndShowLockScreen(appWidgetId);
            } else {
                if (this.mAddingToKeyguard && this.mAppWidgetId != 0) {
                    AppWidgetHost.deleteAppWidgetIdForSystem(this.mAppWidgetId, ActivityManager.getCurrentUser());
                }
                finishDelayedAndShowLockScreen(0);
            }
        }
    }

    protected void onCreate(Bundle bundle) {
        setContentView(2130968635);
        super.onCreate(bundle);
        setResultData(0, null);
        Intent intent = getIntent();
        if (intent.hasExtra("appWidgetId")) {
            this.mAppWidgetId = intent.getIntExtra("appWidgetId", 0);
        } else {
            finish();
        }
        this.mExtraConfigureOptions = intent.getBundleExtra("appWidgetOptions");
        this.mGridView = (GridView) findViewById(2131230888);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131558431);
        if (dimensionPixelSize < displayMetrics.widthPixels) {
            this.mGridView.getLayoutParams().width = dimensionPixelSize;
        }
        this.mAppWidgetManager = AppWidgetManager.getInstance(this);
        this.mAppWidgetLoader = new AppWidgetLoader(this, this.mAppWidgetManager, this);
        this.mItems = this.mAppWidgetLoader.getItems(getIntent());
        this.mAppWidgetAdapter = new AppWidgetAdapter(this, this.mItems);
        this.mGridView.setAdapter(this.mAppWidgetAdapter);
        this.mGridView.setOnItemClickListener(this);
        this.mLockPatternUtils = new LockPatternUtils(this);
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        int result;
        Item item = (Item) this.mItems.get(i);
        Intent intent = item.getIntent();
        if (item.extras != null) {
            result = -1;
            setResultData(-1, intent);
        } else {
            try {
                if (this.mAddingToKeyguard && this.mAppWidgetId == 0) {
                    this.mAppWidgetId = AppWidgetHost.allocateAppWidgetIdForSystem(1262836039, ActivityManager.getCurrentUser());
                }
                this.mAppWidgetManager.bindAppWidgetId(this.mAppWidgetId, intent.getComponent(), this.mExtraConfigureOptions);
                result = -1;
            } catch (IllegalArgumentException e) {
                result = 0;
            }
            setResultData(result, null);
        }
        if (this.mAddingToKeyguard) {
            onActivityResult(126, result, this.mResultData);
        } else {
            finish();
        }
    }

    private void finishDelayedAndShowLockScreen(int i) {
        IWindowManager iWm = Stub.asInterface(ServiceManager.getService("window"));
        Bundle opts = null;
        if (i != 0) {
            opts = new Bundle();
            opts.putInt("showappwidget", i);
        }
        try {
            iWm.lockNow(opts);
        } catch (RemoteException e) {
        }
        ViewGroup viewGroup = (ViewGroup) findViewById(2131230810);
        viewGroup.setBackgroundColor(-16777216);
        int childCount = viewGroup.getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            viewGroup.getChildAt(i2).setVisibility(4);
        }
        this.mGridView.postDelayed(new 1(this), 500);
    }

    public Item createItem(Context context, AppWidgetProviderInfo appWidgetProviderInfo, Bundle bundle) {
        Item item = new Item(context, appWidgetProviderInfo.label);
        item.appWidgetPreviewId = appWidgetProviderInfo.previewImage;
        item.iconId = appWidgetProviderInfo.icon;
        item.packageName = appWidgetProviderInfo.provider.getPackageName();
        item.className = appWidgetProviderInfo.provider.getClassName();
        item.extras = bundle;
        return item;
    }

    void startActivityForResultSafely(Intent intent, int i) {
        try {
            startActivityForResult(intent, i);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, 2131428321, 0).show();
        } catch (SecurityException e2) {
            Toast.makeText(this, 2131428321, 0).show();
            Log.e("KeyguardAppWidgetPickActivity", "Settings does not have the permission to launch " + intent, e2);
        }
    }

    void setResultData(int i, Intent intent) {
        Intent intent2 = intent != null ? intent : new Intent();
        intent2.putExtra("appWidgetId", this.mAppWidgetId);
        this.mResultData = intent2;
        setResult(i, intent2);
    }

    protected void onDestroy() {
        if (this.mAppWidgetAdapter != null) {
            this.mAppWidgetAdapter.cancelAllWidgetPreviewLoaders();
        }
        super.onDestroy();
    }
}