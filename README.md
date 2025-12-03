[![CI](https://github.com/daniel-heater-imprivata/libarchive-zig/actions/workflows/ci.yaml/badge.svg)](https://github.com/daniel-heater-imprivata/libarchive-zig/actions)

# libarchive

This is [libarchive](https://github.com/libarchive/libarchive), packaged for [Zig](https://ziglang.org/).

Forked from [allyourcodebase/libarchive-zig](https://github.com/allyourcodebase/libarchive-zig).

## Usage

```sh
zig fetch --save https://github.com/daniel-heater-imprivata/libarchive-zig/archive/refs/tags/3.8.1.tar.gz
```

In your `build.zig`:

```zig
const libarchive_dep = b.dependency("libarchive", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(libarchive_dep.artifact("archive"));
```

## Features

- Multi-format archive support: tar, zip, 7z, rar, iso9660, cpio, ar
- Compression: gzip, bzip2, xz, zstd, lz4
- Read and write support for most formats
- Streaming API for large archives
- Cross-platform: Linux, macOS, Windows
- Cross-compilation ready

## Development

Uses [devbox](https://www.jetify.com/devbox) for reproducible builds.

```sh
devbox run test
devbox run test-cross
```

Cross-compile:
```sh
zig build -Dtarget=aarch64-linux -Doptimize=ReleaseSafe
```

## Versioning

Format: `<upstream-version>[-<build-number>]`

Examples:
- `3.8.1` - Matches libarchive 3.8.1
- `3.8.1-1` - Package update (build changes, CI fixes)
- `3.8.2` - New upstream libarchive version

## Releasing

Package update (build changes, CI fixes):
```sh
git tag 3.8.1-1
git push origin 3.8.1-1
```

Upstream update (new libarchive version):
```sh
# Update build.zig.zon: .version, .dependencies.upstream.url, .dependencies.upstream.hash
git commit -am "Update to libarchive 3.8.2"
git tag 3.8.2
git push origin main 3.8.2
```
