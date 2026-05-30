package com.jellybyn.settings;

import android.os.AsyncTask;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

class DevelopmentSettings$SystemPropPoker extends AsyncTask<Void, Void, Void> {
    protected Void doInBackground(Void... voidArr) {
        try {
            for (String service : ServiceManager.listServices()) {
                IBinder obj = ServiceManager.checkService(service);
                if (obj != null) {
                    Parcel data = Parcel.obtain();
                    try {
                        obj.transact(1599295570, data, null, 0);
                    } catch (RemoteException e) {
                    } catch (Exception e2) {
                        Log.i("DevelopmentSettings", "Somone wrote a bad service '" + service + "' that doesn't like to be poked: " + e2);
                    }
                    data.recycle();
                }
            }
        } catch (RemoteException e3) {
        }
        return null;
    }

    DevelopmentSettings$SystemPropPoker() {
    }
}