provider "proxmox" {
  pm_api_url      = "https://192.168.86.94:8006/api2/json"
  pm_api_token_id = "terraform_user@pam!terraform_user_api"
  pm_api_token_secret = "80dcfb40-756a-4a62-ab26-714a03892f2a"
  pm_tls_insecure = true
}
