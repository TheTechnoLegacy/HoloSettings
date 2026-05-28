package com.jellybyn.settings.inputmethod;

import android.app.Fragment;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import com.android.internal.app.LocalePicker.LocaleSelectionListener;
import com.jellybyn.settings.inputmethod.UserDictionaryAddWordContents.LocaleRenderer;
import java.util.Locale;

public class UserDictionaryAddWordFragment extends Fragment implements OnItemSelectedListener, LocaleSelectionListener {
    private UserDictionaryAddWordContents mContents;
    private boolean mIsDeleting = false;
    private View mRootView;

    private void updateSpinner() {
        Spinner localeSpinner = (Spinner) this.mRootView.findViewById(2131231080);
        ArrayAdapter<LocaleRenderer> adapter = new ArrayAdapter(getActivity(), 17367048, this.mContents.getLocalesList(getActivity()));
        adapter.setDropDownViewResource(17367049);
        localeSpinner.setAdapter(adapter);
        localeSpinner.setOnItemSelectedListener(this);
    }

    public void onItemSelected(AdapterView<?> parent, View view, int i, long j) {
        LocaleRenderer locale = (LocaleRenderer) parent.getItemAtPosition(i);
        if (locale.isMoreLanguages()) {
            ((PreferenceActivity) getActivity()).startPreferenceFragment(new UserDictionaryLocalePicker(this), true);
        } else {
            this.mContents.updateLocale(locale.getLocaleString());
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mRootView = layoutInflater.inflate(2130968707, null);
        this.mIsDeleting = false;
        if (this.mContents == null) {
            this.mContents = new UserDictionaryAddWordContents(this.mRootView, getArguments());
        }
        return this.mRootView;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 1) {
            return false;
        }
        this.mContents.delete(getActivity());
        this.mIsDeleting = true;
        getActivity().onBackPressed();
        return true;
    }

    public void onPause() {
        super.onPause();
        if (!this.mIsDeleting) {
            this.mContents.apply(getActivity(), null);
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menu.add(0, 1, 0, 2131428891).setIcon(17301564).setShowAsAction(5);
    }

    public void onLocaleSelected(Locale locale) {
        this.mContents.updateLocale(locale.toString());
        getActivity().onBackPressed();
    }

    public void onNothingSelected(AdapterView<?> adapterView) {
        this.mContents.updateLocale(getArguments().getString("locale"));
    }

    public void onResume() {
        super.onResume();
        updateSpinner();
    }
}