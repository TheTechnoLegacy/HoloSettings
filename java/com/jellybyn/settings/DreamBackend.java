package com.jellybyn.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.Settings.Secure;
import android.service.dreams.IDreamManager;
import android.service.dreams.IDreamManager.Stub;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import com.android.internal.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DreamBackend {
    private static final String TAG = (DreamSettings.class.getSimpleName() + ".Backend");
    private final DreamInfoComparator mComparator = new DreamInfoComparator(getDefaultDream());
    private final Context mContext;
    private final IDreamManager mDreamManager = Stub.asInterface(ServiceManager.getService("dreams"));
    private final boolean mDreamsActivatedOnDockByDefault;
    private final boolean mDreamsActivatedOnSleepByDefault;
    private final boolean mDreamsEnabledByDefault;

    private static ComponentName getSettingsComponentName(PackageManager packageManager, ResolveInfo resolveInfo) {
        if (resolveInfo == null || resolveInfo.serviceInfo == null || resolveInfo.serviceInfo.metaData == null) {
            return null;
        }
        String cn = null;
        XmlResourceParser parser = null;
        Exception caughtException = null;
        try {
            parser = resolveInfo.serviceInfo.loadXmlMetaData(packageManager, "android.service.dream");
            if (parser == null) {
                Log.w(TAG, "No android.service.dream meta-data");
                if (parser == null) {
                    return null;
                }
                parser.close();
                return null;
            }
            Resources resourcesForApplication = packageManager.getResourcesForApplication(resolveInfo.serviceInfo.applicationInfo);
            AttributeSet asAttributeSet = Xml.asAttributeSet(parser);
            int next;
            do {
                next = parser.next();
                if (next == 1) {
                    break;
                }
            } while (next != 2);
            if ("dream".equals(parser.getName())) {
                TypedArray obtainAttributes = resourcesForApplication.obtainAttributes(asAttributeSet, R.styleable.Dream);
                cn = obtainAttributes.getString(0);
                obtainAttributes.recycle();
                if (parser != null) {
                    parser.close();
                }
                if (caughtException != null) {
                    Log.w(TAG, "Error parsing : " + resolveInfo.serviceInfo.packageName, caughtException);
                    return null;
                }
                if (cn != null && cn.indexOf(47) < 0) {
                    cn = resolveInfo.serviceInfo.packageName + "/" + cn;
                }
                return cn != null ? ComponentName.unflattenFromString(cn) : null;
            } else {
                Log.w(TAG, "Meta-data does not start with dream tag");
                if (parser == null) {
                    return null;
                }
                parser.close();
                return null;
            }
        } catch (Exception e) {
            caughtException = e;
            if (parser != null) {
                parser.close();
            }
        } catch (Exception e2) {
            caughtException = e2;
            if (parser != null) {
                parser.close();
            }
        } catch (Exception e22) {
            caughtException = e22;
            if (parser != null) {
                parser.close();
            }
        } catch (Throwable th) {
            if (parser != null) {
                parser.close();
            }
        }
    }

    public List<DreamInfo> getDreamInfos() {
        logd("getDreamInfos()", new Object[0]);
        ComponentName activeDream = getActiveDream();
        PackageManager pm = this.mContext.getPackageManager();
        List<ResolveInfo> resolveInfos = pm.queryIntentServices(new Intent("android.service.dreams.DreamService"), 128);
        List<DreamInfo> dreamInfos = new ArrayList(resolveInfos.size());
        for (ResolveInfo resolveInfo : resolveInfos) {
            if (resolveInfo.serviceInfo != null) {
                DreamInfo dreamInfo = new DreamInfo();
                dreamInfo.caption = resolveInfo.loadLabel(pm);
                dreamInfo.icon = resolveInfo.loadIcon(pm);
                dreamInfo.componentName = getDreamComponentName(resolveInfo);
                dreamInfo.isActive = dreamInfo.componentName.equals(activeDream);
                dreamInfo.settingsComponentName = getSettingsComponentName(pm, resolveInfo);
                dreamInfos.add(dreamInfo);
            }
        }
        Collections.sort(dreamInfos, this.mComparator);
        return dreamInfos;
    }

    public CharSequence getActiveDreamName() {
        ComponentName cn = getActiveDream();
        if (cn == null) {
            return null;
        }
        PackageManager pm = this.mContext.getPackageManager();
        try {
            ServiceInfo serviceInfo = pm.getServiceInfo(cn, 0);
            return serviceInfo != null ? serviceInfo.loadLabel(pm) : null;
        } catch (NameNotFoundException e) {
            return null;
        }
    }

    public DreamBackend(Context context) {
        this.mContext = context;
        this.mDreamsEnabledByDefault = context.getResources().getBoolean(17891395);
        this.mDreamsActivatedOnSleepByDefault = context.getResources().getBoolean(17891397);
        this.mDreamsActivatedOnDockByDefault = context.getResources().getBoolean(17891396);
    }

    public void setActiveDream(ComponentName componentName) {
        logd("setActiveDream(%s)", componentName);
        if (this.mDreamManager != null) {
            try {
                ComponentName[] componentNameArr = new ComponentName[]{componentName};
                IDreamManager iDreamManager = this.mDreamManager;
                if (componentName == null) {
                    componentNameArr = null;
                }
                iDreamManager.setDreamComponents(componentNameArr);
            } catch (RemoteException e) {
                Log.w(TAG, "Failed to set active dream to " + componentName, e);
            }
        }
    }

    public ComponentName getActiveDream() {
        if (this.mDreamManager == null) {
            return null;
        }
        try {
            ComponentName[] dreamComponents = this.mDreamManager.getDreamComponents();
            return (dreamComponents == null || dreamComponents.length <= 0) ? null : dreamComponents[0];
        } catch (RemoteException e) {
            Log.w(TAG, "Failed to get active dream", e);
            return null;
        }
    }

    public void startDreaming() {
        logd("startDreaming()", new Object[0]);
        if (this.mDreamManager != null) {
            try {
                this.mDreamManager.dream();
            } catch (RemoteException e) {
                Log.w(TAG, "Failed to dream", e);
            }
        }
    }

    public ComponentName getDefaultDream() {
        ComponentName componentName = null;
        if (this.mDreamManager == null) {
            return componentName;
        }
        try {
            return this.mDreamManager.getDefaultDreamComponent();
        } catch (RemoteException e) {
            Log.w(TAG, "Failed to get default dream", e);
            return componentName;
        }
    }

    public void launchSettings(DreamInfo dreamInfo) {
        logd("launchSettings(%s)", dreamInfo);
        if (dreamInfo != null && dreamInfo.settingsComponentName != null) {
            this.mContext.startActivity(new Intent().setComponent(dreamInfo.settingsComponentName));
        }
    }

    private static ComponentName getDreamComponentName(ResolveInfo resolveInfo) {
        return (resolveInfo == null || resolveInfo.serviceInfo == null) ? null : new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name);
    }

    private void setBoolean(String str, boolean z) {
        Secure.putInt(this.mContext.getContentResolver(), str, z ? 1 : 0);
    }

    public void setActivatedOnDock(boolean z) {
        logd("setActivatedOnDock(%s)", Boolean.valueOf(z));
        setBoolean("screensaver_activate_on_dock", z);
    }

    public void setActivatedOnSleep(boolean z) {
        logd("setActivatedOnSleep(%s)", Boolean.valueOf(z));
        setBoolean("screensaver_activate_on_sleep", z);
    }

    public void setEnabled(boolean z) {
        logd("setEnabled(%s)", Boolean.valueOf(z));
        setBoolean("screensaver_enabled", z);
    }

    private boolean getBoolean(String str, boolean z) {
        return Secure.getInt(this.mContext.getContentResolver(), str, z ? 1 : 0) == 1;
    }

    private static void logd(String str, Object... objArr) {
    }

    public boolean isActivatedOnDock() {
        return getBoolean("screensaver_activate_on_dock", this.mDreamsActivatedOnDockByDefault);
    }

    public boolean isActivatedOnSleep() {
        return getBoolean("screensaver_activate_on_sleep", this.mDreamsActivatedOnSleepByDefault);
    }

    public boolean isEnabled() {
        return getBoolean("screensaver_enabled", this.mDreamsEnabledByDefault);
    }
}