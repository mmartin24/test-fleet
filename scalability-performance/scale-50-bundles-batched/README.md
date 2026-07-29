# scale-50-bundles-batched

Private copy of `../scale-50-bundles`, used only by dartboard's
`qa/scripts/new-tests/42-run-batch-rollout-test.sh`.

Every bundle's `fleet.yaml` here has `rolloutStrategy.autoPartitionSize: 10`
instead of the original `100%`, so each bundle stages its rollout across
its 50 target clusters in batches of 10 instead of all at once.

This is a separate copy (not a shared edit of `../scale-50-bundles`)
because `autoPartitionSize` lives per-bundle in `fleet.yaml`, and the
original bundles are also used by dartboard's other test scenarios
(`40`, `41`, `43`, `44`, `46`, `50`), which rely on the default
all-at-once (`100%`) behavior as their baseline.
