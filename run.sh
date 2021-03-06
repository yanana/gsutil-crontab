#!/bin/sh


prepare() {
  if [ ! -z "${DOWNLOAD_DIR}" ] && [ ! -d "${DOWNLOAD_DIR}" ]; then
    mkdir -p "${DOWNLOAD_DIR}"
  fi
}

run_gsutil() {
  /bin/gsutil_wrapper "$@"
}

main() {
  prepare
  run_gsutil "$@" && exec crond -f -c /root/crontabs
}

main "$@"
