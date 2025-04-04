# Encrypt the key.pem file using the KMS key

aws kms encrypt \
 --key-id alias/smart-city-ssh-key \
 --plaintext fileb://key.pem \
 --output text \
 --query CiphertextBlob > key.pem.encrypted

# The encrypted file can be decrypted when needed with:

aws kms decrypt \
 --ciphertext-blob fileb://<(base64 --decode key.pem.encrypted) \
 --output text \
 --query Plaintext \
 | base64 --decode > key.pem.decrypted
