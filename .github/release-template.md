## libarchive-zig {{VERSION}}

Zig package for libarchive multi-format archive and compression library.

**Version scheme**: `<upstream-version>[-<build-number>]`
- Base version matches upstream libarchive
- Build number increments for package-only changes

### Usage

```sh
zig fetch --save https://github.com/{{REPO}}/archive/refs/tags/{{VERSION}}.tar.gz
```

In your `build.zig`:

```zig
const libarchive_dep = b.dependency("libarchive", .{
    .target = target,
    .optimize = optimize,
});
your_compilation.linkLibrary(libarchive_dep.artifact("archive"));
```

### What's included

- Static library (`libarchive.a` on Linux/macOS, `archive.lib` on Windows)
- Headers (`archive.h`, `archive_entry.h`, etc.)
- Cross-compilation support:
  - Linux: x86_64, aarch64
  - macOS: x86_64 (Intel), aarch64 (Apple Silicon)
  - Windows: x86_64, aarch64

### Features

- Multi-format archive support (tar, zip, 7z, rar, iso9660, etc.)
- Compression support (gzip, bzip2, xz, zstd, etc.)
- Read and write support for most formats
- Streaming API for efficient processing

### Cross-compilation example

```sh
zig build -Dtarget=aarch64-linux -Doptimize=ReleaseSafe
zig build -Dtarget=x86_64-windows -Doptimize=ReleaseSafe
```

### Note

Cross-compiling to macOS requires CoreServices framework.

