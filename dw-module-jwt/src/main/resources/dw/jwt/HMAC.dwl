%dw 2.0
import HMACBinary from dw::Crypto
import dw::jwt::Common

fun signJWT(content: String, key: String, alg) =
    Common::base64URL(HMACBinary(key as Binary, content as Binary, alg))

/** JWT with header, payload, and signature by specific algorithm. valid algorithms dictated by HMACWith */
fun JWT(header: Object, payload: Object, signingKey: String, algorithm: String) = do {
    var jwt = Common::JWT(header, payload)
    ---
    "$(jwt).$(signJWT(jwt, signingKey, algorithm))"
}

/** JWT with header, payload, and signed with HMAC-SHA256*/
fun JWT(header: Object, payload: Object, signingKey: String) = do {
    JWT({ (header - 'alg' - 'typ'), typ: 'JWT', alg: 'HS256' }, payload, signingKey, 'HmacSHA256')
}

/** JWT with payload and automatically generated header, signed with HMAC-SHA256 */
fun JWT(payload: Object, signingKey: String) =
    JWT({ typ: 'JWT', alg: 'HS256'}, payload, signingKey, 'HmacSHA256')