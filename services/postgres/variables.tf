variable "postgres_config" {
  type = object({
    password = string
  })
}

variable "namespace" {
	type = string
	default = "furink"
}
