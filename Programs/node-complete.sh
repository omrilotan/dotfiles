_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]] ; then
    COMPREPLY=( $(compgen -W '--track-heap-objects --no-node-snapshot --interpreted-frames-native-stack --inspect-brk --tls-min-v1.1 --report-filename --max-old-space-size --preserve-symlinks-main --perf-prof-unwinding-info --inspect-port --trace-tls --inspect-brk-node --report-uncaught-exception --v8-pool-size --report-on-fatalerror --experimental-modules --report-signal --report-directory --no-deprecation --eval --debug --trace-event-categories --experimental-worker --heap-prof-dir --tls-min-v1.2 --tls-max-v1.3 --cpu-prof-name --es-module-specifier-resolution --v8-options --force-context-aware --napi-modules --abort-on-uncaught-exception --experimental-report --http-server-default-timeout --require --test-udp-no-try-send --trace-sync-io --throw-deprecation --report-on-signal --print --trace-deprecation --heap-prof-interval --perf-basic-prof --cpu-prof-interval --heap-prof --no-warnings [has_eval_string] --cpu-prof --perf-basic-prof-only-functions --cpu-prof-dir --heap-prof-name --preserve-symlinks --max-http-header-size --perf-prof --inspect --heapsnapshot-signal --trace-warnings [ssl_openssl_cert_store] --expose-internals --http-parser --experimental-loader --inspect-publish-uid --experimental-wasm-modules --tls-min-v1.3 --tls-min-v1.0 --redirect-warnings [has_policy_integrity_string] --tls-cipher-list --no-force-async-hooks-checks --pending-deprecation --input-type --experimental-json-modules --insecure-http-parser --use-openssl-ca --enable-source-maps --policy-integrity --debug-arraybuffer-allocations --experimental-exports --prof-process --unhandled-rejections --tls-max-v1.2 --interactive --openssl-config --icu-data-dir --zero-fill-buffers --use-bundled-ca --experimental-policy --version --experimental-vm-modules --frozen-intrinsics --completion-bash --help --stack-trace-limit --debug-brk --experimental-repl-await --title --security-revert --check --trace-event-file-pattern --debug-port --debug= -p -pe --debug-brk= --inspect-brk-node= --security-reverts -i --print <arg> --inspect= -e -c --prof-process --loader --inspect-brk= -v -h -r --trace-events-enabled' -- "${cur_word}") )
    return 0
  else
    COMPREPLY=( $(compgen -f "${cur_word}") )
    return 0
  fi
}
complete -F _node_complete node node_g
