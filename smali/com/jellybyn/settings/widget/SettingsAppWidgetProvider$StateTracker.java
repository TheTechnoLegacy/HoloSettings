package com.jellybyn.settings.widget;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.RemoteViews;

abstract class SettingsAppWidgetProvider$StateTracker {
    private Boolean mActualState;
    private boolean mDeferredStateChangeRequestNeeded;
    private boolean mInTransition;
    private Boolean mIntendedState;

    protected final void setCurrentState(Context context, int i) {
        boolean wasInTransition = this.mInTransition;
        switch (i) {
            case 0:
                this.mInTransition = false;
                this.mActualState = Boolean.valueOf(false);
                break;
            case 1:
                this.mInTransition = false;
                this.mActualState = Boolean.valueOf(true);
                break;
            case 2:
                this.mInTransition = true;
                this.mActualState = Boolean.valueOf(false);
                break;
            case 3:
                this.mInTransition = true;
                this.mActualState = Boolean.valueOf(true);
                break;
        }
        if (wasInTransition && !this.mInTransition && this.mDeferredStateChangeRequestNeeded) {
            Log.v("SettingsAppWidgetProvider", "processing deferred state change");
            if (this.mActualState != null && this.mIntendedState != null && this.mIntendedState.equals(this.mActualState)) {
                Log.v("SettingsAppWidgetProvider", "... but intended state matches, so no changes.");
            } else if (this.mIntendedState != null) {
                this.mInTransition = true;
                requestStateChange(context, this.mIntendedState.booleanValue());
            }
            this.mDeferredStateChangeRequestNeeded = false;
        }
    }

    public final void setImageViewResources(Context context, RemoteViews remoteViews) {
        int containerId = getContainerId();
        int buttonId = getButtonId();
        int indicatorId = getIndicatorId();
        int pos = getPosition();
        switch (getTriState(context)) {
            case 0:
                remoteViews.setContentDescription(containerId, getContentDescription(context, 2131428744));
                remoteViews.setImageViewResource(buttonId, getButtonImageId(false));
                remoteViews.setImageViewResource(indicatorId, SettingsAppWidgetProvider.access$400()[pos]);
                return;
            case 1:
                remoteViews.setContentDescription(containerId, getContentDescription(context, 2131428743));
                remoteViews.setImageViewResource(buttonId, getButtonImageId(true));
                remoteViews.setImageViewResource(indicatorId, SettingsAppWidgetProvider.access$500()[pos]);
                return;
            case 5:
                if (isTurningOn()) {
                    remoteViews.setContentDescription(containerId, getContentDescription(context, 2131428745));
                    remoteViews.setImageViewResource(buttonId, getButtonImageId(true));
                    remoteViews.setImageViewResource(indicatorId, SettingsAppWidgetProvider.access$600()[pos]);
                    return;
                }
                remoteViews.setContentDescription(containerId, getContentDescription(context, 2131428746));
                remoteViews.setImageViewResource(buttonId, getButtonImageId(false));
                remoteViews.setImageViewResource(indicatorId, SettingsAppWidgetProvider.access$400()[pos]);
                return;
            default:
                return;
        }
    }

    public final void toggleState(Context context) {
        boolean newState = false;
        switch (getTriState(context)) {
            case 0:
                newState = true;
                break;
            case 1:
                newState = false;
                break;
            case 5:
                if (this.mIntendedState != null) {
                    newState = !this.mIntendedState.booleanValue();
                    break;
                }
                break;
        }
        this.mIntendedState = Boolean.valueOf(newState);
        if (this.mInTransition) {
            this.mDeferredStateChangeRequestNeeded = true;
            return;
        }
        this.mInTransition = true;
        requestStateChange(context, newState);
    }

    public final int getTriState(Context context) {
        if (this.mInTransition) {
            return 5;
        }
        switch (getActualState(context)) {
            case 0:
                return 0;
            case 1:
                return 1;
            default:
                return 5;
        }
    }

    private SettingsAppWidgetProvider$StateTracker() {
        this.mInTransition = false;
        this.mActualState = null;
        this.mIntendedState = null;
        this.mDeferredStateChangeRequestNeeded = false;
    }

    private final String getContentDescription(Context context, int i) {
        String gadget = context.getString(getButtonDescription());
        String state = context.getString(i);
        return context.getString(2131428742, new Object[]{gadget, state});
    }

    public int getPosition() {
        return 1;
    }

    public final boolean isTurningOn() {
        return this.mIntendedState != null && this.mIntendedState.booleanValue();
    }

    public abstract int getActualState(Context context);

    public abstract int getButtonDescription();

    public abstract int getButtonId();

    public abstract int getButtonImageId(boolean z);

    public abstract int getContainerId();

    public abstract int getIndicatorId();

    public abstract void onActualStateChange(Context context, Intent intent);

    protected abstract void requestStateChange(Context context, boolean z);
}