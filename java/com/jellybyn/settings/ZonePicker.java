package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.ListFragment;
import android.content.Context;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import org.xmlpull.v1.XmlPullParserException;

public class ZonePicker extends ListFragment {
    private SimpleAdapter mAlphabeticalAdapter;
    private ZoneSelectionListener mListener;
    private boolean mSortedByTimezone;
    private SimpleAdapter mTimezoneSortedAdapter;

    private static void addItem(List<HashMap<String, Object>> myData, String str, String str2, long j) {
        HashMap<String, Object> map = new HashMap();
        map.put("id", str);
        map.put("name", str2);
        int offset = TimeZone.getTimeZone(str).getOffset(j);
        int p = Math.abs(offset);
        StringBuilder name = new StringBuilder();
        name.append("GMT");
        if (offset < 0) {
            name.append('-');
        } else {
            name.append('+');
        }
        name.append(p / 3600000);
        name.append(':');
        int i = (p / 60000) % 60;
        if (i < 10) {
            name.append('0');
        }
        name.append(i);
        map.put("gmt", name.toString());
        map.put("offset", Integer.valueOf(offset));
        myData.add(map);
    }

    private static List<HashMap<String, Object>> getZones(Context context) {
        List<HashMap<String, Object>> myData = new ArrayList();
        long date = Calendar.getInstance().getTimeInMillis();
        try {
            XmlResourceParser xrp = context.getResources().getXml(2131034156);
            do {
            } while (xrp.next() != 2);
            xrp.next();
            loop1:
            while (xrp.getEventType() != 3) {
                while (xrp.getEventType() != 2) {
                    if (xrp.getEventType() == 1) {
                        break loop1;
                    }
                    xrp.next();
                }
                if (xrp.getName().equals("timezone")) {
                    addItem(myData, xrp.getAttributeValue(0), xrp.nextText(), date);
                }
                while (xrp.getEventType() != 3) {
                    xrp.next();
                }
                xrp.next();
            }
            xrp.close();
        } catch (XmlPullParserException e) {
            Log.e("ZonePicker", "Ill-formatted timezones.xml file");
        } catch (IOException e2) {
            Log.e("ZonePicker", "Unable to read timezones.xml file");
        }
        return myData;
    }

    public static SimpleAdapter constructTimezoneAdapter(Context context, boolean z, int i) {
        String[] from = new String[]{"name", "gmt"};
        int[] to = new int[]{16908308, 16908309};
        MyComparator myComparator = new MyComparator(z ? "name" : "offset");
        List zones = getZones(context);
        Collections.sort(zones, myComparator);
        return new SimpleAdapter(context, zones, i, from, to);
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        String tzId = (String) ((Map) listView.getItemAtPosition(i)).get("id");
        ((AlarmManager) getActivity().getSystemService("alarm")).setTimeZone(tzId);
        TimeZone tz = TimeZone.getTimeZone(tzId);
        if (this.mListener != null) {
            this.mListener.onZoneSelected(tz);
        } else {
            getActivity().onBackPressed();
        }
    }

    public static int getTimeZoneIndex(SimpleAdapter simpleAdapter, TimeZone timeZone) {
        String defaultId = timeZone.getID();
        int listSize = simpleAdapter.getCount();
        for (int i = 0; i < listSize; i++) {
            if (defaultId.equals((String) ((HashMap) simpleAdapter.getItem(i)).get("id"))) {
                return i;
            }
        }
        return -1;
    }

    private void setSorting(boolean z) {
        ListAdapter listAdapter = z ? this.mTimezoneSortedAdapter : this.mAlphabeticalAdapter;
        setListAdapter(listAdapter);
        this.mSortedByTimezone = z;
        int timeZoneIndex = getTimeZoneIndex(listAdapter, TimeZone.getDefault());
        if (timeZoneIndex >= 0) {
            setSelection(timeZoneIndex);
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        this.mTimezoneSortedAdapter = constructTimezoneAdapter(activity, false);
        this.mAlphabeticalAdapter = constructTimezoneAdapter(activity, true);
        setSorting(true);
        setHasOptionsMenu(true);
    }

    public void onPrepareOptionsMenu(Menu menu) {
        if (this.mSortedByTimezone) {
            menu.findItem(2).setVisible(false);
            menu.findItem(1).setVisible(true);
            return;
        }
        menu.findItem(2).setVisible(true);
        menu.findItem(1).setVisible(false);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 1:
                setSorting(false);
                return true;
            case 2:
                setSorting(true);
                return true;
            default:
                return false;
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 1, 0, 2131427594).setIcon(17301660);
        menu.add(0, 2, 0, 2131427595).setIcon(2130837585);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View view = super.onCreateView(layoutInflater, viewGroup, bundle);
        Utils.forcePrepareCustomPreferencesList(viewGroup, view, (ListView) view.findViewById(16908298), false);
        return view;
    }

    public static SimpleAdapter constructTimezoneAdapter(Context context, boolean z) {
        return constructTimezoneAdapter(context, z, 2130968620);
    }

    public static TimeZone obtainTimeZoneFromItem(Object obj) {
        return TimeZone.getTimeZone((String) ((Map) obj).get("id"));
    }
}