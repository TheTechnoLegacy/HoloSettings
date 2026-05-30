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

public class DataUsageSummary$WarningEditorFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle bundle) {
        Context context = getActivity();
        DataUsageSummary target = (DataUsageSummary) getTargetFragment();
        NetworkPolicyEditor editor = DataUsageSummary.access$2700(target);
        Builder builder = new Builder(context);
        View view = LayoutInflater.from(builder.getContext()).inflate(2130968611, null, false);
        NumberPicker bytesPicker = (NumberPicker) view.findViewById(2131230787);
        NetworkTemplate template = (NetworkTemplate) getArguments().getParcelable("template");
        long warningBytes = editor.getPolicyWarningBytes(template);
        long limitBytes = editor.getPolicyLimitBytes(template);
        bytesPicker.setMinValue(0);
        if (limitBytes != -1) {
            bytesPicker.setMaxValue(((int) (limitBytes / 1048576)) - 1);
        } else {
            bytesPicker.setMaxValue(Integer.MAX_VALUE);
        }
        bytesPicker.setValue((int) (warningBytes / 1048576));
        bytesPicker.setWrapSelectorWheel(false);
        builder.setTitle(2131428993);
        builder.setView(view);
        builder.setPositiveButton(2131428992, new 1(this, bytesPicker, editor, template, target));
        return builder.create();
    }

    public static void show(DataUsageSummary dataUsageSummary) {
        if (dataUsageSummary.isAdded()) {
            Bundle args = new Bundle();
            args.putParcelable("template", DataUsageSummary.access$2600(dataUsageSummary));
            DataUsageSummary$WarningEditorFragment dialog = new DataUsageSummary$WarningEditorFragment();
            dialog.setArguments(args);
            dialog.setTargetFragment(dataUsageSummary, 0);
            dialog.show(dataUsageSummary.getFragmentManager(), "warningEditor");
        }
    }
}