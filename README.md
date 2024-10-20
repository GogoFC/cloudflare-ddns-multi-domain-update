# Cloudflare API DNS Update Script

### DDNS

Bash script written for Linux to dynamically update multiple DNS records in a single Zone.

Script will update all records in a zone unless listed in `excluded_subdomains` array.

If multiple records with the same name exist, script fails to update one of them. `"code":81058`.

### API Token

Create a token at [https://dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)

Use Edit zone DNS Template and select a specific Zone in Zone Resources.

Script uses a Bearer token. 

### Cron

Script is meant to be ran as a Cron job.
