set -euo pipefail
cd $(dirname "$0")
./generate.sh 2>/dev/null | jq . > builds.json.new
mv builds.json.new builds.json
