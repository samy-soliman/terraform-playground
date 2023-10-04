module "network" {
  source="./network"
  subnet_config = var.subnet_config
  vpc_cidr_block = var.vpc_cidr_block
  project_tag = var.project_tag
}