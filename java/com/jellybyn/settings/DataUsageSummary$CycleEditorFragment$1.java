package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.NetworkTemplate;
import android.text.format.Time;
import android.widget.NumberPicker;
import com.jellybyn.settings.DataUsageSummary.CycleEditorFragment;
import com.jellybyn.settings.net.NetworkPolicyEditor;

class DataUsageSummary$CycleEditorFragment$1 implements OnClickListener {
    final /* synthetic */ CycleEditorFragment this$0;
    final /* synthetic */ NumberPicker val$cycleDayPicker;
    final /* synthetic */ NetworkPolicyEditor val$editor;
    final /* synthetic */ DataUsageSummary val$target;
    final /* synthetic */ NetworkTemplate val$template;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$cycleDayPicker.clearFocus();
        this.val$editor.setPolicyCycleDay(this.val$template, this.val$cycleDayPicker.getValue(), new Time().timezone);
        DataUsageSummary.access$600(this.val$target, true);
    }

    DataUsageSummary$CycleEditorFragment$1(CycleEditorFragment cycleEditorFragment, NumberPicker numberPicker, NetworkPolicyEditor networkPolicyEditor, NetworkTemplate networkTemplate, DataUsageSummary dataUsageSummary) {
        this.this$0 = cycleEditorFragment;
        this.val$cycleDayPicker = numberPicker;
        this.val$editor = networkPolicyEditor;
        this.val$template = networkTemplate;
        this.val$target = dataUsageSummary;
    }
}