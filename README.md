# pw

pw is a deterministic password generator.

Create passwords based on your master password with the following method.

```
master-password,comma,separated,values | SHA-3-512 | Base64
```

See [Usage] for examples.

[Usage]: docs/manual.md#usage

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

## Contributing

Report bugs on the [issue tracker],
ask questions on the [IRC channel],
send patches on the [mailing list].

[Issue tracker]: https://github.com/taupiqueur/pw/issues
[IRC channel]: https://web.libera.chat/gamja/#taupiqueur
[Mailing list]: https://github.com/taupiqueur/pw/pulls
