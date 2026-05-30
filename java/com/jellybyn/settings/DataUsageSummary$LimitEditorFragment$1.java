package com.jellybyn.settings;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.NetworkTemplate;
import android.widget.NumberPicker;
import com.jellybyn.settings.DataUsageSummary.LimitEditorFragment;
import com.jellybyn.settings.net.NetworkPolicyEditor;

class DataUsageSummary$LimitEditorFragment$1 implements OnClickListener {
    final /* synthetic */ LimitEditorFragment this$0;
    final /* synthetic */ NumberPicker val$bytesPicker;
    final /* synthetic */ NetworkPolicyEditor val$editor;
    final /* synthetic */ DataUsageSummary val$target;
    final /* synthetic */ NetworkTemplate val$template;

    public void onClick(DialogInterface dialogInterface, int i) {
        this.val$bytesPicker.clearFocus();
        this.val$editor.setPolicyLimitBytes(this.val$template, ((long) this.val$bytesPicker.getValue()) * 1048576);
        DataUsageSummary.access$600(this.val$target, false);
    }

    DataUsageSummary$LimitEditorFragment$1(LimitEditorFragment limitEditorFragment, NumberPicker numberPicker, NetworkPolicyEditor networkPolicyEditor, NetworkTemplate networkTemplate, DataUsageSummary dataUsageSummary) {
        this.this$0 = limitEditorFragment;
        this.val$bytesPicker = numberPicker;
        this.val$editor = networkPolicyEditor;
        this.val$template = networkTemplate;
        this.val$target = dataUsageSummary;
    }
}