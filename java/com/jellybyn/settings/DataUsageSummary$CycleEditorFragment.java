package com.jellybyn.settings;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.net.NetworkTemplate;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.NumberPicker;
import com.jellybyn.settings.net.NetworkPolicyEditor;

public class DataUsageSummary$CycleEditorFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        DataUsageSummary target = (DataUsageSummary) getTargetFragment();
        NetworkPolicyEditor editor = DataUsageSummary.access$2700(target);
        Builder builder = new Builder(context);
        View view = LayoutInflater.from(builder.getContext()).inflate(2130968613, null, false);
        NumberPicker cycleDayPicker = (NumberPicker) view.findViewById(2131230796);
        NetworkTemplate template = (NetworkTemplate) getArguments().getParcelable("template");
        int cycleDay = editor.getPolicyCycleDay(template);
        cycleDayPicker.setMinValue(1);
        cycleDayPicker.setMaxValue(31);
        cycleDayPicker.setValue(cycleDay);
        cycleDayPicker.setWrapSelectorWheel(true);
        builder.setTitle(2131428990);
        builder.setView(view);
        builder.setPositiveButton(2131428992, new 1(this, cycleDayPicker, editor, template, target));
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            Bundle args = new Bundle();
            args.putParcelable("template", DataUsageSummary.access$2600(dataUsageSummary));
            DataUsageSummary$CycleEditorFragment dialog = new DataUsageSummary$CycleEditorFragment();
            dialog.setArguments(args);
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "cycleEditor");
        }
    }
}