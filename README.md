# Cloudflare DDNS Update Script

### Bash script written for Linux.

Updates DDNS records for multiple subdomains in a zone via Cloudflare API.

Script will update all records in a zone unless listed in `excluded_subdomains` array.

If multiple records with the same name exist, script fails to update one of them. `"code":81058`.

### API Token

Create a token at [https://dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)

Use Edit zone DNS Template and select a specific Zone in Zone Resources.

The script is made to work with Bearer token. 

### Cron

Script is meant to be ran as a Cron job.

