Setup
  $ . ${TESTDIR}/../../../../helpers/setup_integration_test.sh single_package "yarn@1.22.17"

Check
  $ ${TURBO} run build
  \xe2\x80\xa2 Running build (esc)
  \xe2\x80\xa2 Remote caching disabled (esc)
  build: cache miss, executing afb463ba87360c5c
  build: yarn run v1.22.17
  build: warning package.json: No license field
  build: $ echo building > foo.txt
  build: Done in \s*[\.0-9]+m?s\. (re)
  
   Tasks:    1 successful, 1 total
  Cached:    0 cached, 1 total
    Time:\s*[\.0-9]+m?s  (re)
  
  $ ${TURBO} run build
  \xe2\x80\xa2 Running build (esc)
  \xe2\x80\xa2 Remote caching disabled (esc)
  build: cache hit, replaying logs afb463ba87360c5c
  build: yarn run v1.22.17
  build: warning package.json: No license field
  build: $ echo building > foo.txt
  build: Done in \s*[\.0-9]+m?s\. (re)
  
   Tasks:    1 successful, 1 total
  Cached:    1 cached, 1 total
    Time:\s*[\.0-9]+m?s >>> FULL TURBO (re)
  