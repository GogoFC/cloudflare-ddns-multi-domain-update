# Cloudflare DDNS Update Script

Update DDNS records for multiple subdomains via Cloudflare API

Script will update all records in a zone unless listed in `excluded_subdomains` array.

If multiple records with the same name exist, script fails to update one of them. `"code":81058`

