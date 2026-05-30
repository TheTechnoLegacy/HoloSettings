package com.jellybyn.settings;

import android.app.Fragment;
import android.content.ContentResolver;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.UserManager;
import android.text.Editable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import com.android.internal.widget.LockPatternUtils;

public class OwnerInfoSettings extends Fragment {
    private CheckBox mCheckbox;
    private LockPatternUtils mLockPatternUtils;
    private EditText mNickname;
    private EditText mOwnerInfo;
    private boolean mShowNickname;
    private int mUserId;
    private View mView;

    private void initView(View view) {
        ContentResolver res = getActivity().getContentResolver();
        String info = this.mLockPatternUtils.getOwnerInfo(this.mUserId);
        boolean enabled = this.mLockPatternUtils.isOwnerInfoEnabled();
        this.mCheckbox = (CheckBox) this.mView.findViewById(2131230915);
        this.mOwnerInfo = (EditText) this.mView.findViewById(2131230916);
        this.mOwnerInfo.setText(info);
        this.mOwnerInfo.setEnabled(enabled);
        this.mNickname = (EditText) this.mView.findViewById(2131230914);
        if (this.mShowNickname) {
            this.mNickname.setText(UserManager.get(getActivity()).getUserName());
            this.mNickname.setSelected(true);
        } else {
            this.mNickname.setVisibility(8);
        }
        this.mCheckbox.setChecked(enabled);
        if (UserHandle.myUserId() != 0) {
            if (UserManager.get(getActivity()).isLinkedUser()) {
                this.mCheckbox.setText(2131427609);
            } else {
                this.mCheckbox.setText(2131427607);
            }
        }
        this.mCheckbox.setOnCheckedChangeListener(new 1(this));
    }

    void saveChanges() {
        ContentResolver res = getActivity().getContentResolver();
        this.mLockPatternUtils.setOwnerInfo(this.mOwnerInfo.getText().toString(), this.mUserId);
        if (this.mShowNickname) {
            String userName = UserManager.get(getActivity()).getUserName();
            Editable text = this.mNickname.getText();
            if (!TextUtils.isEmpty(text) && !text.equals(userName)) {
                UserManager.get(getActivity()).setUserName(UserHandle.myUserId(), text.toString());
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle args = getArguments();
        if (args != null && args.containsKey("show_nickname")) {
            this.mShowNickname = args.getBoolean("show_nickname");
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mView = layoutInflater.inflate(2130968651, viewGroup, false);
        this.mUserId = UserHandle.myUserId();
        this.mLockPatternUtils = new LockPatternUtils(getActivity());
        initView(this.mView);
        return this.mView;
    }

    public void onPause() {
        super.onPause();
        saveChanges();
    }
}