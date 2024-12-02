variable "sst_db_database" {
  default = "none"
  type    = string
}

variable "sst_db_host" {
  default = "none"
  type    = string
}

variable "sst_db_password" {
  default = "none"
  type    = string
}

variable "sst_db_port" {
  default = 3306
  type    = number
}

variable "sst_db_type" {
  default = "none"
  type    = string
}

variable "sst_db_username" {
  default = "none"
  type    = string
}

variable "sst_port" {
  default = 3000
  type    = number
}

variable "private_subnets" {
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24",
  ]
  type = list(any)
}

variable "vpc_id" {
  default = "none"
  type    = string
}

variable "mking_db_database" {
  default = "none"
  type    = string
}

variable "mking_db_host" {
  default = "none"
  type    = string
}

variable "mking_db_password" {
  default = "none"
  type    = string
}

variable "mking_db_port" {
  default = 3306
  type    = number
}

variable "mking_db_type" {
  default = "none"
  type    = string
}

variable "mking_db_username" {
  default = "none"
  type    = string
}

variable "mking_port" {
  default = 3125
  type    = number
}
