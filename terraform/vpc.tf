module "net" {
  source              = "git::https://github.com/terraform-yc-modules/terraform-yc-vpc.git?ref=1.0.9"
  labels              = { tag = "hexlet-devops" }
  network_description = "hexlet project"
  network_name        = "vpc-hexlet2"
  create_vpc          = true
  create_nat_gw       = true
  s3_private_endpoint = {
    enable = true
    private_dns_records_enabled = false
  }
  public_subnets = [
    {
      "v4_cidr_blocks" : ["10.121.0.0/16"],
      "zone" : "ru-central1-a"
    }
  ]
  private_subnets = [
    {
      "v4_cidr_blocks" : ["10.221.0.0/16"],
      "zone" : "ru-central1-a"
    },
  ]
  routes_private_subnets = [
    {
      destination_prefix : "172.16.0.0/16",
      next_hop_address : "10.231.0.10"
    },
  ]
}