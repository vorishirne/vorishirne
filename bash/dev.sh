jwt() {
  [[ -z $1 ]] && echo "No input provided" && return 1
  payload=$(awk -F . '{print $2}' <<< "$1")
  [[ -z $payload ]] && echo "No payload found in token" && return 1
  payload=$(base64 -d <<< "$payload")
  [[ -z $payload ]] && echo "payload is not base64 encoded" && return 1
  jq '.' <<< $payload
}
