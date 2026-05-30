package com.jellybyn.settings;

import android.app.ActivityManager;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.UserManager;
import android.preference.Preference;
import android.preference.PreferenceActivity.Header;
import android.preference.PreferenceFrameLayout;
import android.preference.PreferenceFrameLayout.LayoutParams;
import android.preference.PreferenceGroup;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.Profile;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class Utils {
    public static boolean updateHeaderToSpecificActivityFromMetaDataOrRemove(Context context, List<Header> target, Header header) {
        Intent intent = header.intent;
        if (intent != null) {
            PackageManager pm = context.getPackageManager();
            List<ResolveInfo> list = pm.queryIntentActivities(intent, 128);
            int listSize = list.size();
            for (int i = 0; i < listSize; i++) {
                ResolveInfo resolveInfo = (ResolveInfo) list.get(i);
                if ((resolveInfo.activityInfo.applicationInfo.flags & 1) != 0) {
                    String title = null;
                    String summary = null;
                    try {
                        Resources resourcesForApplication = pm.getResourcesForApplication(resolveInfo.activityInfo.packageName);
                        Bundle bundle = resolveInfo.activityInfo.metaData;
                        if (!(resourcesForApplication == null || bundle == null)) {
                            Drawable icon = resourcesForApplication.getDrawable(bundle.getInt("com.jellybyn.settings.icon"));
                            title = resourcesForApplication.getString(bundle.getInt("com.jellybyn.settings.title"));
                            summary = resourcesForApplication.getString(bundle.getInt("com.jellybyn.settings.summary"));
                        }
                    } catch (NameNotFoundException e) {
                    } catch (NotFoundException e2) {
                    }
                    if (TextUtils.isEmpty(title)) {
                        title = resolveInfo.loadLabel(pm).toString();
                    }
                    header.title = title;
                    header.summary = summary;
                    header.intent = new Intent().setClassName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
                    return true;
                }
            }
        }
        target.remove(header);
        return false;
    }

    public static int getTetheringLabel(ConnectivityManager connectivityManager) {
        String[] usbRegexs = connectivityManager.getTetherableUsbRegexs();
        String[] wifiRegexs = connectivityManager.getTetherableWifiRegexs();
        String[] bluetoothRegexs = connectivityManager.getTetherableBluetoothRegexs();
        boolean usbAvailable = usbRegexs.length != 0;
        boolean wifiAvailable = wifiRegexs.length != 0;
        boolean bluetoothAvailable = bluetoothRegexs.length != 0;
        if (wifiAvailable && usbAvailable && bluetoothAvailable) {
            return 2131428228;
        }
        if (wifiAvailable && usbAvailable) {
            return 2131428228;
        }
        if (wifiAvailable && bluetoothAvailable) {
            return 2131428228;
        }
        if (wifiAvailable) {
            return 2131428225;
        }
        if (usbAvailable && bluetoothAvailable) {
            return 2131428227;
        }
        return usbAvailable ? 2131428224 : 2131428226;
    }

    public static String getBatteryStatus(Resources resources, Intent intent) {
        Intent intent2 = intent;
        int plugType = intent2.getIntExtra("plugged", 0);
        int status = intent2.getIntExtra("status", 1);
        if (status == 2) {
            String statusString = resources.getString(2131427401);
            if (plugType <= 0) {
                return statusString;
            }
            int i = plugType == 1 ? 2131427402 : plugType == 2 ? 2131427403 : 2131427404;
            return statusString + " " + resources.getString(i);
        } else if (status == 3) {
            return resources.getString(2131427405);
        } else {
            if (status == 4) {
                return resources.getString(2131427406);
            }
            return status == 5 ? resources.getString(2131427407) : resources.getString(2131427400);
        }
    }

    private static String getLocalProfileGivenName(Context context) {
        ContentResolver cr = context.getContentResolver();
        Cursor localRawProfile = cr.query(Profile.CONTENT_RAW_CONTACTS_URI, new String[]{"_id"}, "account_type IS NULL AND account_name IS NULL", null, null);
        if (localRawProfile == null) {
            return null;
        }
        try {
            if (!localRawProfile.moveToFirst()) {
                return null;
            }
            long localRowProfileId = localRawProfile.getLong(0);
            localRawProfile.close();
            Cursor structuredName = cr.query(Profile.CONTENT_URI.buildUpon().appendPath("data").build(), new String[]{"data2", "data3"}, "raw_contact_id=" + localRowProfileId, null, null);
            if (structuredName == null) {
                return null;
            }
            try {
                if (!structuredName.moveToFirst()) {
                    return null;
                }
                String string = structuredName.getString(0);
                if (TextUtils.isEmpty(string)) {
                    string = structuredName.getString(1);
                }
                structuredName.close();
                return string;
            } finally {
                structuredName.close();
            }
        } finally {
            localRawProfile.close();
        }
    }

    public static boolean updatePreferenceToSpecificActivityOrRemove(Context context, PreferenceGroup preferenceGroup, String str, int i) {
        Preference preference = preferenceGroup.findPreference(str);
        if (preference == null) {
            return false;
        }
        Intent intent = preference.getIntent();
        if (intent != null) {
            PackageManager packageManager = context.getPackageManager();
            List queryIntentActivities = packageManager.queryIntentActivities(intent, 0);
            int size = queryIntentActivities.size();
            for (int i2 = 0; i2 < size; i2++) {
                ResolveInfo resolveInfo = (ResolveInfo) queryIntentActivities.get(i2);
                if ((resolveInfo.activityInfo.applicationInfo.flags & 1) != 0) {
                    preference.setIntent(new Intent().setClassName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name));
                    if ((i & 1) != 0) {
                        preference.setTitle(resolveInfo.loadLabel(packageManager));
                    }
                    return true;
                }
            }
        }
        preferenceGroup.removePreference(preference);
        return false;
    }

    public static boolean copyMeProfilePhoto(Context context, UserInfo userInfo) {
        InputStream avatarDataStream = Contacts.openContactPhotoInputStream(context.getContentResolver(), Profile.CONTENT_URI, true);
        if (avatarDataStream == null) {
            return false;
        }
        ((UserManager) context.getSystemService("user")).setUserIcon(userInfo != null ? userInfo.id : UserHandle.myUserId(), BitmapFactory.decodeStream(avatarDataStream));
        try {
            avatarDataStream.close();
            return true;
        } catch (IOException e) {
            return true;
        }
    }

    public static void prepareCustomPreferencesList(ViewGroup viewGroup, View view, View view2, boolean z) {
        if ((view2.getScrollBarStyle() == 33554432) && (viewGroup instanceof PreferenceFrameLayout)) {
            ((LayoutParams) view.getLayoutParams()).removeBorders = true;
            Resources res = view2.getResources();
            int paddingSide = res.getDimensionPixelSize(17104937);
            int paddingBottom = res.getDimensionPixelSize(17104936);
            int i = z ? 0 : paddingSide;
            view2.setPaddingRelative(i, 0, i, paddingBottom);
        }
    }

    public static Locale createLocaleFromString(String str) {
        if (str == null) {
            return Locale.getDefault();
        }
        String[] brokenDownLocale = str.split("_", 3);
        if (1 == brokenDownLocale.length) {
            return new Locale(brokenDownLocale[0]);
        }
        return 2 == brokenDownLocale.length ? new Locale(brokenDownLocale[0], brokenDownLocale[1]) : new Locale(brokenDownLocale[0], brokenDownLocale[1], brokenDownLocale[2]);
    }

    private static String formatIpAddresses(LinkProperties linkProperties) {
        String addresses = null;
        if (linkProperties != null) {
            Iterator<InetAddress> iter = linkProperties.getAddresses().iterator();
            if (iter.hasNext()) {
                addresses = "";
                while (iter.hasNext()) {
                    addresses = addresses + ((InetAddress) iter.next()).getHostAddress();
                    if (iter.hasNext()) {
                        addresses = addresses + ", ";
                    }
                }
            }
        }
        return addresses;
    }

    private static final String getProfileDisplayName(Context context) {
        String str = null;
        Cursor profile = context.getContentResolver().query(Profile.CONTENT_URI, new String[]{"display_name"}, null, null, null);
        if (profile != null) {
            try {
                if (profile.moveToFirst()) {
                    str = profile.getString(0);
                    profile.close();
                }
            } finally {
                profile.close();
            }
        }
        return str;
    }

    public static Dialog buildGlobalChangeWarningDialog(Context context, int i, Runnable runnable) {
        Builder builder = new Builder(context);
        builder.setTitle(i);
        builder.setMessage(2131429109);
        builder.setPositiveButton(17039370, new 1(runnable));
        builder.setNegativeButton(17039360, null);
        return builder.create();
    }

    public static void forcePrepareCustomPreferencesList(ViewGroup viewGroup, View view, ListView listView, boolean z) {
        listView.setScrollBarStyle(33554432);
        listView.setClipToPadding(false);
        prepareCustomPreferencesList(viewGroup, view, listView, z);
    }

    public static String getBatteryPercentage(Intent intent) {
        int level = intent.getIntExtra("level", 0);
        return String.valueOf((level * 100) / intent.getIntExtra("scale", 100)) + "%";
    }

    public static String getDefaultIpAddresses(Context context) {
        return formatIpAddresses(((ConnectivityManager) context.getSystemService("connectivity")).getActiveLinkProperties());
    }

    public static String getMeProfileName(Context context, boolean z) {
        return z ? getProfileDisplayName(context) : getShorterNameIfPossible(context);
    }

    public static String getWifiIpAddresses(Context context) {
        return formatIpAddresses(((ConnectivityManager) context.getSystemService("connectivity")).getLinkProperties(1));
    }

    private static String getShorterNameIfPossible(Context context) {
        String given = getLocalProfileGivenName(context);
        return !TextUtils.isEmpty(given) ? given : getProfileDisplayName(context);
    }

    public static boolean isVoiceCapable(Context context) {
        TelephonyManager telephony = (TelephonyManager) context.getSystemService("phone");
        return telephony != null && telephony.isVoiceCapable();
    }

    public static boolean isWifiOnly(Context context) {
        return !((ConnectivityManager) context.getSystemService("connectivity")).isNetworkSupported(0);
    }

    public static boolean hasMultipleUsers(Context context) {
        return ((UserManager) context.getSystemService("user")).getUsers().size() > 1;
    }

    public static boolean isMonkeyRunning() {
        return ActivityManager.isUserAMonkey();
    }
}