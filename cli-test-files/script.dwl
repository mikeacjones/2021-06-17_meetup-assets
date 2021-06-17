%dw 2.0
output application/json
input payload text/plain
---
payload splitBy '\n' map read($, "application/json") filter $.item? map {
  available: $.available,
  sku: $.item.sku,
  locationId: $.location.id,
  id: $.id
}