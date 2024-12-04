---
title: Manage app policies
ms.date: 05/21/2023
ms.topic: how-to
description: Manage your app governance policies.
---

# Manage app policies

Use app governance to manage OAuth policies for Microsoft 365, Google Workspace, and Salesforce.

You might need to manage your app policies as follows to keep up-to-date with your organization's apps, respond to new app-based attacks, and for ongoing changes to your app compliance needs:

- Create new policies targeted at new apps
- Change the status of an existing policy (active, inactive, audit mode)
- Change the conditions of an existing policy
- Change the actions of an existing policy for auto-remediation of alerts

<a name='manage-oauth-app-policies-for-azure-ad'></a>

## Manage OAuth app policies for Microsoft Entra ID

Here's an example of a process for managing an existing policy for Microsoft Entra apps:

1. Edit the policy:

    - Change the settings of the policy.
    - If needed, change the status to **Audit mode** for testing.

1. Check for expected behavior, such as alerts generated.
1. If the behavior isn't expected, go back to step 1.
1. If the behavior is expected, edit the policy and change its status to active (if needed).

For example:

:::image type="content" source="media/app-governance/mapg-manage-policy-process.png" alt-text="Diagram of the manage app policy workflow." lightbox="media/app-governance/mapg-manage-policy-process.png" border="false":::

> [!NOTE]
> Following the change in the **Activity type** filter, policies with the previous filter will have a "LEGACY" label attached to the filter and if the policies are edited or deleted the filter can't be restored.

## Editing an app policy configuration

To change the configuration of an existing app policy:

- Select the policy in the policy list, and then select **Edit** on the app policy pane.
- Select the vertical ellipses for the policy in the list, and then select **Edit**.

For the **Edit policy** page, step through the pages and make the appropriate changes:

- **Description**: Change the description to make it easier to understand the policy's purpose.
- **Severity**
- **Policy settings**: Change the set of apps to which the policy applies. You can also choose to use the existing conditions or modify the conditions
- **Actions**: Change the autoremediation action for alerts generated by the policy.
- **Status**: Change the policy status.

## Deleting an app policy

To delete an app policy, you can:

- Select the policy in the policy list, and then select **Delete** on the app policy pane.
- Select the vertical ellipses for the policy in the list, and then select **Delete**.

An alternative to deleting an app policy is to change its status to inactive. Once inactive, the policy doesn't generate alerts. For example, rather than deleting an app policy for an app with a specific set of conditions that are useful for a future policy, rename the app policy to indicate its usefulness and set its status to inactive. You can later return to the policy and modify it for a similar app and set its status to audit mode or inactive.

## Next steps

[Investigate predefined app policy alerts](app-governance-investigate-predefined-policies.md)