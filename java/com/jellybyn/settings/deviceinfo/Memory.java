package com.jellybyn.settings.deviceinfo;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserManager;
import android.os.storage.IMountService;
import android.os.storage.IMountService.Stub;
import android.os.storage.StorageEventListener;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;
import com.google.android.collect.Lists;
import com.jellybyn.settings.SettingsPreferenceFragment;
import com.jellybyn.settings.Utils;
import java.util.ArrayList;
import java.util.Iterator;

public class Memory extends SettingsPreferenceFragment {
    private static String sClickedMountPoint;
    private static Preference sLastClickedMountToggle;
    private ArrayList<StorageVolumePreferenceCategory> mCategories = Lists.newArrayList();
    private final BroadcastReceiver mMediaScannerReceiver = new 1(this);
    private IMountService mMountService;
    StorageEventListener mStorageListener = new 1(this);
    private StorageManager mStorageManager;
    private UsbManager mUsbManager;

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if ("cache".equals(preference.getKey())) {
            ConfirmClearCacheFragment.show(this);
            return true;
        }
        Iterator i$ = this.mCategories.iterator();
        while (i$.hasNext()) {
            StorageVolumePreferenceCategory storageVolumePreferenceCategory = (StorageVolumePreferenceCategory) i$.next();
            Intent intentForClick = storageVolumePreferenceCategory.intentForClick(preference);
            if (intentForClick == null) {
                StorageVolume storageVolume = storageVolumePreferenceCategory.getStorageVolume();
                if (storageVolume != null && storageVolumePreferenceCategory.mountToggleClicked(preference)) {
                    sLastClickedMountToggle = preference;
                    sClickedMountPoint = storageVolume.getPath();
                    String volumeState = this.mStorageManager.getVolumeState(storageVolume.getPath());
                    if ("mounted".equals(volumeState) || "mounted_ro".equals(volumeState)) {
                        unmount();
                        return true;
                    }
                    mount();
                    return true;
                }
            } else if (Utils.isMonkeyRunning()) {
                return true;
            } else {
                startActivity(intentForClick);
                return true;
            }
        }
        return false;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context context = getActivity();
        this.mUsbManager = (UsbManager) getSystemService("usb");
        this.mStorageManager = StorageManager.from(context);
        this.mStorageManager.registerListener(this.mStorageListener);
        addPreferencesFromResource(2131034125);
        addCategory(StorageVolumePreferenceCategory.buildForInternal(context));
        for (StorageVolume storageVolume : this.mStorageManager.getVolumeList()) {
            if (!storageVolume.isEmulated()) {
                addCategory(StorageVolumePreferenceCategory.buildForPhysical(context, storageVolume));
            }
        }
        setHasOptionsMenu(true);
    }

    public void onResume() {
        super.onResume();
        IntentFilter intentFilter = new IntentFilter("android.intent.action.MEDIA_SCANNER_STARTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_FINISHED");
        intentFilter.addDataScheme("file");
        getActivity().registerReceiver(this.mMediaScannerReceiver, intentFilter);
        intentFilter = new IntentFilter();
        intentFilter.addAction("android.hardware.usb.action.USB_STATE");
        getActivity().registerReceiver(this.mMediaScannerReceiver, intentFilter);
        Iterator i$ = this.mCategories.iterator();
        while (i$.hasNext()) {
            ((StorageVolumePreferenceCategory) i$.next()).onResume();
        }
    }

    private void doUnmount() {
        Toast.makeText(getActivity(), 2131428141, 0).show();
        IMountService mountService = getMountService();
        try {
            sLastClickedMountToggle.setEnabled(false);
            sLastClickedMountToggle.setTitle(getString(2131428142));
            sLastClickedMountToggle.setSummary(getString(2131428143));
            mountService.unmountVolume(sClickedMountPoint, true, false);
        } catch (RemoteException e) {
            showDialogInner(2);
        }
    }

    private synchronized IMountService getMountService() {
        if (this.mMountService == null) {
            IBinder service = ServiceManager.getService("mount");
            if (service != null) {
                this.mMountService = Stub.asInterface(service);
            } else {
                Log.e("MemorySettings", "Can't get mount service");
            }
        }
        return this.mMountService;
    }

    private void unmount() {
        try {
            if (hasAppsAccessingStorage()) {
                showDialogInner(1);
            } else {
                doUnmount();
            }
        } catch (RemoteException e) {
            Log.e("MemorySettings", "Is MountService running?");
            showDialogInner(2);
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 2131231243:
                if (getActivity() instanceof PreferenceActivity) {
                    ((PreferenceActivity) getActivity()).startPreferencePanel(UsbSettings.class.getCanonicalName(), null, 2131428147, null, this, 0);
                } else {
                    startFragment(this, UsbSettings.class.getCanonicalName(), -1, null);
                }
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    private void mount() {
        IMountService mountService = getMountService();
        if (mountService != null) {
            try {
                mountService.mountVolume(sClickedMountPoint);
                return;
            } catch (RemoteException e) {
                return;
            }
        }
        Log.e("MemorySettings", "Mount service is null, can't mount");
    }

    public void onPrepareOptionsMenu(Menu menu) {
        MenuItem usb = menu.findItem(2131231243);
        boolean z = (isMassStorageEnabled() || ((UserManager) getActivity().getSystemService("user")).hasUserRestriction("no_usb_file_transfer")) ? false : true;
        usb.setVisible(z);
    }

    public Dialog onCreateDialog(int i) {
        switch (i) {
            case 1:
                return new Builder(getActivity()).setTitle(2131428137).setPositiveButton(2131428389, new 1(this)).setNegativeButton(2131427562, null).setMessage(2131428138).create();
            case 2:
                return new Builder(getActivity()).setTitle(2131428139).setNeutralButton(2131428389, null).setMessage(2131428140).create();
            default:
                return null;
        }
    }

    public void onPause() {
        super.onPause();
        getActivity().unregisterReceiver(this.mMediaScannerReceiver);
        Iterator i$ = this.mCategories.iterator();
        while (i$.hasNext()) {
            ((StorageVolumePreferenceCategory) i$.next()).onPause();
        }
    }

    private void addCategory(StorageVolumePreferenceCategory storageVolumePreferenceCategory) {
        this.mCategories.add(storageVolumePreferenceCategory);
        getPreferenceScreen().addPreference(storageVolumePreferenceCategory);
        storageVolumePreferenceCategory.init();
    }

    private boolean hasAppsAccessingStorage() throws RemoteException {
        int[] stUsers = getMountService().getStorageUsers(sClickedMountPoint);
        if (stUsers == null || stUsers.length > 0) {
        }
        return true;
    }

    public void onDestroy() {
        if (!(this.mStorageManager == null || this.mStorageListener == null)) {
            this.mStorageManager.unregisterListener(this.mStorageListener);
        }
        super.onDestroy();
    }

    private boolean isMassStorageEnabled() {
        StorageVolume primary = StorageManager.getPrimaryVolume(this.mStorageManager.getVolumeList());
        return primary != null && primary.allowMassStorage();
    }

    private void onCacheCleared() {
        Iterator i$ = this.mCategories.iterator();
        while (i$.hasNext()) {
            ((StorageVolumePreferenceCategory) i$.next()).onCacheCleared();
        }
    }

    private void showDialogInner(int i) {
        removeDialog(i);
        showDialog(i);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(2131755010, menu);
    }
}