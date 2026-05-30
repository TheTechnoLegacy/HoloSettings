package com.jellybyn.settings;

import android.content.Context;
import android.preference.PreferenceActivity.Header;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.TextView;
import com.jellybyn.settings.accounts.AuthenticatorHelper;
import com.jellybyn.settings.wifi.WifiEnabler;
import java.util.List;

class Settings$HeaderAdapter extends ArrayAdapter<Header> {
    private AuthenticatorHelper mAuthHelper;
    private LayoutInflater mInflater;
    private final WifiEnabler mWifiEnabler;

    public View getView(int i, View view, ViewGroup viewGroup) {
        HeaderViewHolder holder;
        Header header = (Header) getItem(i);
        int headerType = getHeaderType(header);
        View view2 = null;
        if (view == null) {
            holder = new HeaderViewHolder(null);
            switch (headerType) {
                case 0:
                    view2 = new TextView(getContext(), null, 16843272);
                    holder.title = (TextView) view2;
                    break;
                case 1:
                    view2 = this.mInflater.inflate(2130968664, viewGroup, false);
                    holder.icon = (ImageView) view2.findViewById(2131230756);
                    holder.title = (TextView) view2.findViewById(16908310);
                    holder.summary = (TextView) view2.findViewById(16908304);
                    break;
                case 2:
                    view2 = this.mInflater.inflate(2130968665, viewGroup, false);
                    holder.icon = (ImageView) view2.findViewById(2131230756);
                    holder.title = (TextView) view2.findViewById(16908310);
                    holder.summary = (TextView) view2.findViewById(16908304);
                    holder.switch_ = (Switch) view2.findViewById(2131230734);
                    break;
            }
            view2.setTag(holder);
        } else {
            view2 = view;
            holder = (HeaderViewHolder) view2.getTag();
        }
        switch (headerType) {
            case 0:
                holder.title.setText(header.getTitle(getContext().getResources()));
                break;
            case 1:
                break;
            case 2:
                if (header.id != 2131231208) {
                    Switch switchR = holder.switch_;
                    break;
                }
                this.mWifiEnabler.setSwitch(holder.switch_);
                break;
        }
        if (header.extras == null || !header.extras.containsKey("account_type")) {
            holder.icon.setImageResource(header.iconRes);
        } else {
            String string = header.extras.getString("account_type");
            LayoutParams layoutParams = holder.icon.getLayoutParams();
            layoutParams.width = getContext().getResources().getDimensionPixelSize(2131558425);
            layoutParams.height = layoutParams.width;
            holder.icon.setLayoutParams(layoutParams);
            holder.icon.setImageDrawable(this.mAuthHelper.getDrawableForType(getContext(), string));
        }
        holder.title.setText(header.getTitle(getContext().getResources()));
        CharSequence summary = header.getSummary(getContext().getResources());
        if (TextUtils.isEmpty(summary)) {
            holder.summary.setVisibility(8);
        } else {
            holder.summary.setVisibility(0);
            holder.summary.setText(summary);
        }
        return view2;
    }

    public Settings$HeaderAdapter(Context context, List<Header> objects, AuthenticatorHelper authenticatorHelper) {
        super(context, 0, objects);
        this.mAuthHelper = authenticatorHelper;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mWifiEnabler = new WifiEnabler(context, new Switch(context));
        Switch switchR = new Switch(context);
    }

    static int getHeaderType(Header header) {
        if (header.fragment == null && header.intent == null) {
            return 0;
        }
        return (header.id == 2131231208 || header.id == 2131231209) ? 2 : 1;
    }

    public void pause() {
        this.mWifiEnabler.pause();
    }

    public void resume() {
        this.mWifiEnabler.resume();
    }

    public int getItemViewType(int i) {
        return getHeaderType((Header) getItem(i));
    }

    public boolean areAllItemsEnabled() {
        return false;
    }

    public int getViewTypeCount() {
        return 3;
    }

    public boolean hasStableIds() {
        return true;
    }

    public boolean isEnabled(int i) {
        return getItemViewType(i) != 0;
    }
}