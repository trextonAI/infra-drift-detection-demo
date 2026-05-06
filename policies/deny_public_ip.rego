package terraform

deny[msg] {
  input.resource.type == "azurerm_public_ip"
  msg = "Public IP is not allowed"
}
