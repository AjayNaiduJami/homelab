# ✅ Create a Trusted Wildcard Certificate via a Private CA

This guide walks you through creating your own trusted Private Certificate Authority (CA) and using it to issue a wildcard TLS certificate for internal use.

---

## 🔐 Step 1: Create Your Private Certificate Authority (CA)

```bash
# Generate the CA private key
openssl genrsa -out my-rootCA.key 4096

# Create the self-signed CA certificate (valid for 10 years)
openssl req -x509 -new -nodes -key my-rootCA.key -sha256 -days 3650 -out my-rootCA.crt \
  -subj "/C=US/ST=State/L=City/O=MyOrg/OU=IT/CN=MyOrg Root CA"
```

### 🧾 Step 2: Create a Wildcard Certificate Signing Request (CSR)

Create a file wildcard.internal.home.cnf:

```ini
[req]
default_bits       = 2048
prompt             = no
default_md         = sha256
distinguished_name = dn
req_extensions     = req_ext

[dn]
C  = US
ST = State
L  = City
O  = MyOrg
OU = IT
CN = *.internal.home

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.internal.home
DNS.2 = internal.home
```
Generate the private key and CSR:

```bash
# Generate private key
openssl genrsa -out wildcard.internal.home.key 2048

# Generate CSR
openssl req -new -key wildcard.internal.home.key \
  -out wildcard.internal.home.csr \
  -config wildcard.internal.home.cnf
```

## 🧾 Step 3: Sign the CSR with Your Root CA

Create a file v3_ext.cnf:

```ini
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.internal.home
DNS.2 = internal.home
```

Now sign the CSR:

```bash
openssl x509 -req -in wildcard.internal.home.csr \
  -CA my-rootCA.crt -CAkey my-rootCA.key -CAcreateserial \
  -out wildcard.internal.home.crt -days 825 -sha256 \
  -extfile v3_ext.cnf
```

## 🧰 Step 4: Trust the Root CA on Client Machines

Linux:
```bash
sudo cp my-rootCA.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```
macOS:
- Open Keychain Access
- Import my-rootCA.crt
- Mark as Always Trust

Windows:
- Run mmc
- File → Add Snap-in → Certificates (Computer Account)
- Import into Trusted Root Certification Authorities

## 🌐 Step 5: Use the Signed Cert in NGINX

```nginx
ssl_certificate     /etc/nginx/ssl/wildcard.internal.home.crt;
ssl_certificate_key /etc/nginx/ssl/wildcard.internal.home.key;
```

## 🛠 Optional: Automate the Process
[Generate Cert](../scripts/generate-wildcard-cert.sh)