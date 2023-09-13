# Manual

## Name

```
pw - A deterministic password generator.
```

## Synopsis

```
pw [switches] [--] [arguments]
```

## Description

pw is a deterministic password generator.

Create passwords based on your master password with the following method.

```
base64(sha3_512("master_password,then,comma,separated,values"))
```

## Usage

If you don’t have a master password yet:

``` sh
pw --init
```

<details><summary>OpenSSL command</summary>

``` sh
openssl rand -base64 16 | tr -d '\n' | openssl dgst -binary -sha3-512 | openssl enc -A -base64
```

</details>

Generates 16 random bytes that are encoded into [Base64], then passed to the password generator.

[Base64]: https://en.wikipedia.org/wiki/Base64

Set your user—`taupiqueur@kanto`—password:

``` sh
pw --length=10 kanto taupiqueur
```

Sign up Google:

``` sh
pw --length=10 google.com taupiqueur.kanto
```

<details><summary>OpenSSL command</summary>

``` sh
printf 'Strong password,google.com,taupiqueur.kanto' | openssl dgst -binary -sha3-512 | openssl enc -A -base64 | head -c 10
```

</details>

Pet name:

``` sh
pw --length=10 google.com taupiqueur.kanto Bunny
```

<details><summary>OpenSSL command</summary>

``` sh
printf 'Strong password,google.com,taupiqueur.kanto,Bunny' | openssl dgst -binary -sha3-512 | openssl enc -A -base64 | head -c 10
```

</details>

Sign up Apple:

``` sh
pw --length=10 apple.com taupiqueur.kanto@gmail.com
```

<details><summary>OpenSSL command</summary>

``` sh
printf 'Strong password,apple.com,taupiqueur.kanto@gmail.com' | openssl dgst -binary -sha3-512 | openssl enc -A -base64 | head -c 10
```

</details>

Show password before hashing:

``` sh
pw --show google.com taupiqueur.kanto
```

<details><summary>Show password</summary>

```
Strong password,google.com,taupiqueur.kanto
```

</details>

The method format is [comma-separated values], from generic to specific.

[Comma-separated values]: https://en.wikipedia.org/wiki/Comma-separated_values

Copy password:

``` sh
pw --copy google.com taupiqueur.kanto
```

Attempt to set the terminal clipboard content using the [xterm escape sequence].

[xterm escape sequence]: https://xfree86.org/current/ctlseqs.html#:~:text=clipboard

### Advanced usage

If a special character is required, just add an apostrophe—for [prime].

[Prime]: <https://en.wikipedia.org/wiki/Prime_(symbol)#:~:text=Use in mathematics>

On the contrary, if special characters are not allowed, use the `--alphanumeric-only` option
to drop the `+`, `/` and `=` characters from the [Base64 table].

[Base64 table]: https://en.wikipedia.org/wiki/Base64#Base64_table

The option exists to mitigate the need to tweak your password in a second pipe—and probably a third pipe for copying.

Finally, you might want to specify a version to your password:

```
pw --length=10 kanto taupiqueur 2
```

<details><summary>OpenSSL command</summary>

``` sh
printf 'Strong password,kanto,taupiqueur,2' | openssl dgst -binary -sha3-512 | openssl enc -A -base64 | head -c 10
```

</details>

### In practice?

Depending on my situation here are the tools I use:

- I use `pw` to create passwords I need to remember and remember one password.
- I use [Google Password Manager] and the **Suggest strong password** feature for passwords I want to be random.

[Google Password Manager]: https://passwords.google.com

## Options

The options are as follows:

###### `-i`
###### `--init`

Generate a secure, random password.

###### `-l <length>`
###### `--length=<length>`

Specifies the password length.

###### `-a`
###### `--alphanumeric-only`

Remove non-alphanumeric characters.

###### `-s`
###### `--show`

Show password.

###### `-c`
###### `--copy`

Copy password.

Attempt to set the terminal clipboard content using the [xterm escape sequence].

[xterm escape sequence]: https://xfree86.org/current/ctlseqs.html#:~:text=clipboard

###### `-`

Read master password from **stdin**.

###### `-r`
###### `--rescue`

Rescue mode.

Print all password methods to date.

###### `-h`
###### `--help`

Show this help.

###### `-V`
###### `--version`

Show version.

## Environment

The following environment variables have an effect on `pw`.

###### MASTER_PASSWORD

Specifies the master password.
