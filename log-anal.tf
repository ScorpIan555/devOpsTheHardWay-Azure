resource "azurerm_log_analytics_workspace" "Log_Analytics_WorkSpace" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    # Ref article on terraform workspaces:  https://medium.com/devops-mojo/terraform-workspaces-overview-what-is-terraform-workspace-introduction-getting-started-519848392724#:~:text=Workspaces%20in%20Terraform%20are%20simply%20independently%20managed%20state,directories.%20We%20can%20manage%20multiple%20environments%20with%20Workspaces.
    name                = "${var.name}-la"
    location            = var.location
    resource_group_name = data.azurerm_resource_group.resource_group.name
    sku                 = "PerGB2018"  # https://azure.microsoft.com/en-us/blog/introducing-a-new-way-to-purchase-azure-monitoring-services/
}

resource "azurerm_log_analytics_solution" "Log_Analytics_Solution_ContainerInsights" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.location
    resource_group_name   = data.azurerm_resource_group.resource_group.name
    workspace_resource_id = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.id
    workspace_name        = azurerm_log_analytics_workspace.Log_Analytics_WorkSpace.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}
