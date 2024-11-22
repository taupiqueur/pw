# pw

pw is a deterministic password generator that lets you
create passwords based on your master password with the following method.

```
base64(sha3_512("master_password,then,comma,separated,values"))
```

## Features

- Simple method.
- Avoids concepts and options when possible.
- Always provide `openssl` equivalent, so you don’t depend on the tool itself.
- Copy passwords to the clipboard.
- Show typos in your master password.

## Installation

### Nightly builds

Download the [Nightly builds].

[Nightly builds]: https://github.com/taupiqueur/pw/releases/nightly

### Build from source

[Install Crystal] with [the shards command].

[Install Crystal]: https://crystal-lang.org/install/
[The shards command]: https://crystal-lang.org/reference/master/the_shards_command/

``` sh
git clone https://github.com/taupiqueur/pw.git
cd pw
make install
```

## Documentation

See the [manual] for setup and usage instructions.

[Manual]: docs/manual.md

pw is also documented via man pages.
For a list of available man pages,
refer to `man -k pw` or [pw(1)].

[pw(1)]: https://taupiqueur.github.io/pw/pw.1.html

## Contributing

Report bugs on the [issue tracker],
ask questions on the [IRC channel],
send patches on the [mailing list].

[Issue tracker]: https://github.com/taupiqueur/pw/issues
[IRC channel]: https://web.libera.chat/gamja/#taupiqueur
[Mailing list]: https://github.com/taupiqueur/pw/pulls
