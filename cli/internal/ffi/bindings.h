#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct Buffer {
  uint32_t len;
  uint8_t *data;
} Buffer;

void free_buffer(struct Buffer buffer);

struct Buffer get_turbo_data_dir(void);

struct Buffer changed_files(struct Buffer buffer);

struct Buffer previous_content(struct Buffer buffer);

struct Buffer recursive_copy(struct Buffer buffer);

struct Buffer verify_signature(struct Buffer buffer);

struct Buffer get_package_file_hashes_from_git_index(struct Buffer buffer);

struct Buffer get_package_file_hashes_from_processing_git_ignore(struct Buffer buffer);

struct Buffer get_package_file_hashes_from_inputs(struct Buffer buffer);

struct Buffer glob(struct Buffer buffer);

struct Buffer from_wildcards(struct Buffer buffer);

struct Buffer get_global_hashable_env_vars(struct Buffer buffer);

struct Buffer transitive_closure(struct Buffer buf);

struct Buffer subgraph(struct Buffer buf);

struct Buffer patches(struct Buffer buf);

struct Buffer global_change(struct Buffer buf);