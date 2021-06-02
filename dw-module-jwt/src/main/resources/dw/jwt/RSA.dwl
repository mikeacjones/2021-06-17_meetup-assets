%dw 2.0
import java!RSAHelper
import dw::jwt::Common

fun cleanKey(key: String) =
    key replace "\n" with "" replace /(-+)(BEGIN|END)(\sRSA)? (PRIVATE|PUBLIC) KEY(-+)/ with ""

fun signJWT(jwt: String, privateKey: String) =
    RSAHelper::signString(jwt, cleanKey(privateKey))

/** JWT with header, payload, and signature by specific algorithm. valid algorithms dictated by HMACWith */
fun PKCS8JWT(header: Object, payload: Object, pkcs8privateKey: String) = do {
    var jwt = Common::JWT({ (header - "alg" - "typ"), alg: 'RS256', typ: 'JWT' }, payload)
    ---
    "$(jwt).$(signJWT(jwt, pkcs8privateKey))"
}

/** JWT with payload and automatically generated header, signed with HMAC-SHA256 */
fun PKCS8JWT(payload: Object, pkcs8privateKey: String) =
    PKCS8JWT({ typ: 'JWT', alg: 'RS256'}, payload, pkcs8privateKey)