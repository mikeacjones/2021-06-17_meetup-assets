%dw 2.0
import dw::jwt::HMAC
var secret = "sjadklfjalksdjfklasjkldfjaskldfjkljasjfkla"
var payload = {
    sub: 1234567890,
    name: "John Doe",
    iat: 1516239022
}
var validJWT = "yJ0eXAiOiAiSldUIiwiYWxnIjogIkhTMjU2In0.eyJzdWIiOiAxMjM0NTY3ODkwLCJuYW1lIjogIkpvaG4gRG9lIiwiaWF0IjogMTUxNjIzOTAyMn0.ieUWhvmk2uSj4GTFBeUuuYqmRZbX9W1g8d62EKWYn28"
---
HMAC::JWT(payload, secret)