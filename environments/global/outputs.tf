output "project_global_id" {
  description = "ID of the global project"
  value       = digitalocean_project.global.id
}

output "project_dev_id" {
  description = "ID of the development project"
  value       = digitalocean_project.dev.id
}

output "project_prod_id" {
  description = "ID of the production project"
  value       = digitalocean_project.prod.id
}
