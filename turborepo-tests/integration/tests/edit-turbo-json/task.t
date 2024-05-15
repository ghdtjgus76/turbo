Setup
  $ . ${TESTDIR}/../../../helpers/setup_integration_test.sh

Baseline task hashes
  $ cp "$TESTDIR/fixture-configs/a-baseline.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "843536e46620dad2"
  }
  {
    "taskId": "my-app#build",
    "hash": "bbfabe4612171fc1"
  }
  {
    "taskId": "util#build",
    "hash": "98d1cf4886bbc73d"
  }

Change only my-app#build
  $ cp "$TESTDIR/fixture-configs/b-change-only-my-app.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "843536e46620dad2"
  }
  {
    "taskId": "my-app#build",
    "hash": "0455e87c8abba36d"
  }
  {
    "taskId": "util#build",
    "hash": "98d1cf4886bbc73d"
  }

Change my-app#build dependsOn
  $ cp "$TESTDIR/fixture-configs/c-my-app-depends-on.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "843536e46620dad2"
  }
  {
    "taskId": "my-app#build",
    "hash": "8d584a4d18836787"
  }
  {
    "taskId": "util#build",
    "hash": "98d1cf4886bbc73d"
  }

Non-materially modifying the dep graph does nothing.
  $ cp "$TESTDIR/fixture-configs/d-depends-on-util.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "843536e46620dad2"
  }
  {
    "taskId": "my-app#build",
    "hash": "8d584a4d18836787"
  }
  {
    "taskId": "util#build",
    "hash": "98d1cf4886bbc73d"
  }


Change util#build impacts itself and my-app
  $ cp "$TESTDIR/fixture-configs/e-depends-on-util-but-modified.json" "$(pwd)/turbo.json" && git commit -am "no comment" --quiet
  $ ${TURBO} build --dry=json | jq -r '.tasks | sort_by(.taskId)[] | {taskId, hash}'
  {
    "taskId": "another#build",
    "hash": "843536e46620dad2"
  }
  {
    "taskId": "my-app#build",
    "hash": "239ff972999c4203"
  }
  {
    "taskId": "util#build",
    "hash": "70eb762a20d17252"
  }
