#!/bin/bash
set -e

# -------------------- USER CONFIG --------------------
# Ask user input or set as environment variables
read -rp "🌍 Country (C): " COUNTRY
read -rp "🏙️  State (ST): " STATE
read -rp "🏡 Locality/City (L): " LOCALITY
read -rp "🏢 Organization (O): " ORG
read -rp "💼 Org Unit (OU): " ORG_UNIT
read -rp "🌐 Domain (e.g., internal.home): " DOMAIN

ROOT_CA_NAME="my-rootCA"
WILDCARD_CN="*.${DOMAIN}"
CERT_NAME="wildcard.${DOMAIN}"
DAYS_VALID_CA=3650
DAYS_VALID_CERT=825
# ------------------------------------------------------

# Step 1: Create Root CA key and cert
echo "🔐 Creating Root CA..."
openssl genrsa -out ${ROOT_CA_NAME}.key 4096
openssl req -x509 -new -nodes -key ${ROOT_CA_NAME}.key -sha256 -days ${DAYS_VALID_CA} \
  -out ${ROOT_CA_NAME}.crt \
  -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORG}/OU=${ORG_UNIT}/CN=${ORG} Root CA"

# Step 2: Create CSR config
echo "📝 Creating CSR configuration..."
cat > ${CERT_NAME}.cnf <<EOF
[req]
default_bits       = 2048
prompt             = no
default_md         = sha256
distinguished_name = dn
req_extensions     = req_ext

[dn]
C  = ${COUNTRY}
ST = ${STATE}
L  = ${LOCALITY}
O  = ${ORG}
OU = ${ORG_UNIT}
CN = ${WILDCARD_CN}

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${WILDCARD_CN}
DNS.2 = ${DOMAIN}
EOF

# Step 2: Generate private key and CSR
echo "🔐 Generating private key and CSR..."
openssl genrsa -out ${CERT_NAME}.key 2048
openssl req -new -key ${CERT_NAME}.key -out ${CERT_NAME}.csr -config ${CERT_NAME}.cnf

# Step 3: Create cert extension config
echo "📝 Creating certificate extension configuration..."
cat > v3_ext.cnf <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${WILDCARD_CN}
DNS.2 = ${DOMAIN}
EOF

# Step 3: Sign the CSR
echo "🔏 Signing the certificate with the Root CA..."
openssl x509 -req -in ${CERT_NAME}.csr -CA ${ROOT_CA_NAME}.crt -CAkey ${ROOT_CA_NAME}.key \
  -CAcreateserial -out ${CERT_NAME}.crt -days ${DAYS_VALID_CERT} -sha256 -extfile v3_ext.cnf

# Summary
echo "✅ Certificate created successfully:"
echo "- CA Cert: ${ROOT_CA_NAME}.crt"
echo "- Server Cert: ${CERT_NAME}.crt"
echo "- Server Key: ${CERT_NAME}.key"

# Trust on Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "🛡️  Trusting CA on Linux system..."
    sudo cp ${ROOT_CA_NAME}.crt /usr/local/share/ca-certificates/
    sudo update-ca-certificates
fi
