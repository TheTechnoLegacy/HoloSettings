package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.NetworkTemplate;
import android.widget.NumberPicker;
import com.jellybyn.settings.DataUsageSummary.WarningEditorFragment;
import com.jellybyn.settings.net.NetworkPolicyEditor;

class DataUsageSummary$WarningEditorFragment$1 implements OnClickListener {
    final /* synthetic */ WarningEditorFragment this$0;
    final /* synthetic */ NumberPicker val$bytesPicker;
    final /* synthetic */ NetworkPolicyEditor val$editor;
    final /* synthetic */ DataUsageSummary val$target;
    final /* synthetic */ NetworkTemplate val$template;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$bytesPicker.clearFocus();
        this.val$editor.setPolicyWarningBytes(this.val$template, ((long) this.val$bytesPicker.getValue()) * 1048576);
        DataUsageSummary.access$600(this.val$target, false);
    }

    DataUsageSummary$WarningEditorFragment$1(WarningEditorFragment warningEditorFragment, NumberPicker numberPicker, NetworkPolicyEditor networkPolicyEditor, NetworkTemplate networkTemplate, DataUsageSummary dataUsageSummary) {
        this.this$0 = warningEditorFragment;
        this.val$bytesPicker = numberPicker;
        this.val$editor = networkPolicyEditor;
        this.val$template = networkTemplate;
        this.val$target = dataUsageSummary;
    }
}