gcloud config config-helper --format=json | jq -r '.credential.access_token' | xclip -sel clip
