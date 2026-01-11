resource "azurerm_windows_virtual_machine" "windows_virtual_machines" {
  for_each = var.windows_virtual_machines

  location                                               = each.value.location
  name                                                   = each.value.name
  network_interface_ids                                  = each.value.network_interface_ids
  resource_group_name                                    = each.value.resource_group_name
  size                                                   = each.value.size
  os_managed_disk_id                                     = each.value.os_managed_disk_id
  patch_assessment_mode                                  = each.value.patch_assessment_mode
  patch_mode                                             = each.value.patch_mode
  platform_fault_domain                                  = each.value.platform_fault_domain
  priority                                               = each.value.priority
  provision_vm_agent                                     = each.value.provision_vm_agent
  proximity_placement_group_id                           = each.value.proximity_placement_group_id
  source_image_id                                        = each.value.source_image_id
  secure_boot_enabled                                    = each.value.secure_boot_enabled
  max_bid_price                                          = each.value.max_bid_price
  tags                                                   = each.value.tags
  timezone                                               = each.value.timezone
  user_data                                              = each.value.user_data
  virtual_machine_scale_set_id                           = each.value.virtual_machine_scale_set_id
  vm_agent_platform_updates_enabled                      = each.value.vm_agent_platform_updates_enabled
  reboot_setting                                         = each.value.reboot_setting
  license_type                                           = each.value.license_type
  eviction_policy                                        = each.value.eviction_policy
  extensions_time_budget                                 = each.value.extensions_time_budget
  admin_password                                         = each.value.admin_password
  admin_username                                         = each.value.admin_username
  allow_extension_operations                             = each.value.allow_extension_operations
  automatic_updates_enabled                              = each.value.automatic_updates_enabled
  availability_set_id                                    = each.value.availability_set_id
  bypass_platform_safety_checks_on_user_schedule_enabled = each.value.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_id                          = each.value.capacity_reservation_group_id
  hotpatching_enabled                                    = each.value.hotpatching_enabled
  computer_name                                          = each.value.computer_name
  dedicated_host_group_id                                = each.value.dedicated_host_group_id
  dedicated_host_id                                      = each.value.dedicated_host_id
  disk_controller_type                                   = each.value.disk_controller_type
  edge_zone                                              = each.value.edge_zone
  enable_automatic_updates                               = each.value.enable_automatic_updates
  encryption_at_host_enabled                             = each.value.encryption_at_host_enabled
  vtpm_enabled                                           = each.value.vtpm_enabled
  custom_data                                            = each.value.custom_data
  zone                                                   = each.value.zone

  os_disk {
    caching = each.value.os_disk.caching
    dynamic "diff_disk_settings" {
      for_each = each.value.os_disk.diff_disk_settings != null ? [each.value.os_disk.diff_disk_settings] : []
      content {
        option    = diff_disk_settings.value.option
        placement = diff_disk_settings.value.placement
      }
    }
    disk_encryption_set_id           = each.value.os_disk.disk_encryption_set_id
    disk_size_gb                     = each.value.os_disk.disk_size_gb
    name                             = each.value.os_disk.name
    secure_vm_disk_encryption_set_id = each.value.os_disk.secure_vm_disk_encryption_set_id
    security_encryption_type         = each.value.os_disk.security_encryption_type
    storage_account_type             = each.value.os_disk.storage_account_type
    write_accelerator_enabled        = each.value.os_disk.write_accelerator_enabled
  }

  dynamic "additional_capabilities" {
    for_each = each.value.additional_capabilities != null ? [each.value.additional_capabilities] : []
    content {
      hibernation_enabled = additional_capabilities.value.hibernation_enabled
      ultra_ssd_enabled   = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "additional_unattend_content" {
    for_each = each.value.additional_unattend_content != null ? [each.value.additional_unattend_content] : []
    content {
      content = additional_unattend_content.value.content
      setting = additional_unattend_content.value.setting
    }
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? [each.value.boot_diagnostics] : []
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  dynamic "gallery_application" {
    for_each = each.value.gallery_application != null ? each.value.gallery_application : []
    content {
      automatic_upgrade_enabled                   = gallery_application.value.automatic_upgrade_enabled
      configuration_blob_uri                      = gallery_application.value.configuration_blob_uri
      order                                       = gallery_application.value.order
      tag                                         = gallery_application.value.tag
      treat_failure_as_deployment_failure_enabled = gallery_application.value.treat_failure_as_deployment_failure_enabled
      version_id                                  = gallery_application.value.version_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "os_image_notification" {
    for_each = each.value.os_image_notification != null ? [each.value.os_image_notification] : []
    content {
      timeout = os_image_notification.value.timeout
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? [each.value.secret] : []
    content {
      certificate {
        store = secret.value.certificate.store
        url   = secret.value.certificate.url
      }
      key_vault_id = secret.value.key_vault_id
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference != null ? [each.value.source_image_reference] : []
    content {
      offer     = source_image_reference.value.offer
      publisher = source_image_reference.value.publisher
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  dynamic "termination_notification" {
    for_each = each.value.termination_notification != null ? [each.value.termination_notification] : []
    content {
      enabled = termination_notification.value.enabled
      timeout = termination_notification.value.timeout
    }
  }

  dynamic "winrm_listener" {
    for_each = each.value.winrm_listener != null ? [each.value.winrm_listener] : []
    content {
      certificate_url = winrm_listener.value.certificate_url
      protocol        = winrm_listener.value.protocol
    }
  }
}

