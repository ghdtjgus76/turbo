Setup
  $ . ${TESTDIR}/../../../helpers/setup_integration_test.sh

Baseline task hashes
  $ cp "$TESTDIR/fixture-configs/a-baseline.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "3d66b7d5a7af669e"
  }
  {
    "taskId": "my-app#build",
    "hash": "1b40c54f003c4273"
  }
  {
    "taskId": "util#build",
    "hash": "63990c36d6d57746"
  }

Change only my-app#build
  $ cp "$TESTDIR/fixture-configs/b-change-only-my-app.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "3d66b7d5a7af669e"
  }
  {
    "taskId": "my-app#build",
    "hash": "36b5a7718a45bb5b"
  }
  {
    "taskId": "util#build",
    "hash": "63990c36d6d57746"
  }

Change my-app#build dependsOn
  $ cp "$TESTDIR/fixture-configs/c-my-app-depends-on.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "3d66b7d5a7af669e"
  }
  {
    "taskId": "my-app#build",
    "hash": "eecfc1bfccacfbb1"
  }
  {
    "taskId": "util#build",
    "hash": "63990c36d6d57746"
  }

Non-materially modifying the dep graph does nothing.
  $ cp "$TESTDIR/fixture-configs/d-depends-on-util.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "3d66b7d5a7af669e"
  }
  {
    "taskId": "my-app#build",
    "hash": "eecfc1bfccacfbb1"
  }
  {
    "taskId": "util#build",
    "hash": "63990c36d6d57746"
  }


Change util#build impacts itself and my-app
  $ cp "$TESTDIR/fixture-configs/e-depends-on-util-but-modified.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "3d66b7d5a7af669e"
  }
  {
    "taskId": "my-app#build",
    "hash": "4266442dc8ba7127"
  }
  {
    "taskId": "util#build",
    "hash": "7eda96b17c6995b0"
  }
