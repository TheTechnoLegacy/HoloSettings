package com.jellybyn.settings;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.os.AsyncResult;
import android.os.Bundle;
import android.os.Handler;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;

public class BandMode extends Activity {
    private static final String[] BAND_NAMES = new String[]{"Automatic", "EURO Band", "USA Band", "JAPAN Band", "AUS Band", "AUS2 Band"};
    private ListView mBandList;
    private ArrayAdapter mBandListAdapter;
    private OnItemClickListener mBandSelectionHandler = new 1(this);
    private Handler mHandler = new 2(this);
    private Phone mPhone = null;
    private DialogInterface mProgressPanel;
    private BandListItem mTargetBand = null;

    private void bandListLoaded(AsyncResult asyncResult) {
        int i;
        if (this.mProgressPanel != null) {
            this.mProgressPanel.dismiss();
        }
        clearList();
        boolean addBandSuccess = false;
        if (asyncResult.result != null) {
            int[] iArr = (int[]) asyncResult.result;
            int i2 = iArr[0];
            if (i2 > 0) {
                for (i = 1; i < i2; i++) {
                    this.mBandListAdapter.add(new BandListItem(iArr[i]));
                }
                addBandSuccess = true;
            }
        }
        if (!addBandSuccess) {
            for (i = 0; i < 6; i++) {
                this.mBandListAdapter.add(new BandListItem(i));
            }
        }
        this.mBandList.requestFocus();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(5);
        setContentView(2130968589);
        setTitle(getString(2131427535));
        getWindow().setLayout(-1, -2);
        this.mPhone = PhoneFactory.getDefaultPhone();
        this.mBandList = (ListView) findViewById(2131230739);
        this.mBandListAdapter = new ArrayAdapter(this, 17367043);
        this.mBandList.setAdapter(this.mBandListAdapter);
        this.mBandList.setOnItemClickListener(this.mBandSelectionHandler);
        loadBandList();
    }

    private void displayBandSelectionResult(Throwable th) {
        String status = getString(2131427537) + " [" + this.mTargetBand.toString() + "] ";
        this.mProgressPanel = new Builder(this).setMessage(th != null ? status + getString(2131427538) : status + getString(2131427539)).setPositiveButton(17039370, null).show();
    }

    private void loadBandList() {
        this.mProgressPanel = new Builder(this).setMessage(getString(2131427536)).show();
        this.mPhone.queryAvailableBandMode(this.mHandler.obtainMessage(100));
    }

    private void clearList() {
        while (this.mBandListAdapter.getCount() > 0) {
            this.mBandListAdapter.remove(this.mBandListAdapter.getItem(0));
        }
    }
}