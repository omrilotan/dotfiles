_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]] ; then
    COMPREPLY=( $(compgen -W '--track-heap-objects --no-node-snapshot --abort-on-uncaught-exception --report-filename --max-old-space-size --perf-prof-unwinding-info --inspect-port --trace-tls --inspect-brk-node --report-uncaught-exception --report-on-fatalerror --report-signal --report-directory --inspect-brk --tls-min-v1.2 --tls-max-v1.3 --preserve-symlinks-main --interactive --tls-max-v1.2 --heap-prof-dir --no-deprecation --debug --tls-min-v1.1 --print --trace-deprecation --unhandled-rejections --trace-sync-io --report-on-signal --heap-prof-interval --perf-basic-prof --cpu-prof-interval --perf-basic-prof-only-functions --no-warnings --loader --cpu-prof-name --eval --cpu-prof --heap-prof-name --perf-prof --preserve-symlinks --heapsnapshot-signal --completion-bash --help --frozen-intrinsics --trace-warnings --expose-internals [has_policy_integrity_string] --inspect-publish-uid --inspect --experimental-wasm-modules --tls-min-v1.3 --redirect-warnings --tls-min-v1.0 --http-server-default-timeout --experimental-report --napi-modules --tls-cipher-list --no-force-async-hooks-checks --v8-options --heap-prof --input-type --policy-integrity --experimental-exports --prof-process [has_eval_string] --throw-deprecation --max-http-header-size [ssl_openssl_cert_store] --use-openssl-ca --icu-data-dir --require --use-bundled-ca --experimental-policy --version --experimental-vm-modules --es-module-specifier-resolution --stack-trace-limit --debug-brk --experimental-repl-await --title --experimental-worker --security-revert --pending-deprecation --debug-arraybuffer-allocations --zero-fill-buffers --check --trace-event-file-pattern --v8-pool-size --http-parser --experimental-modules --openssl-config --cpu-prof-dir --trace-event-categories --debug-port --prof-process --debug= -p -pe --security-reverts -i --print <arg> --inspect= --debug-brk= -e --inspect-brk-node= --inspect-brk= -v -c -h -r --trace-events-enabled' -- "${cur_word}") )
    return 0
  else
    COMPREPLY=( $(compgen -f "${cur_word}") )
    return 0
  fi
}
complete -F _node_complete node node_g
