## Remove passphrase on macOS

[How do I remove the passphrase for the SSH key without having to create a new key?](https://stackoverflow.com/questions/112396/how-do-i-remove-the-passphrase-for-the-ssh-key-without-having-to-create-a-new-ke)
> Important: Beware that when executing commands they will typically be logged in your ~/.bash_history file (or similar) in plain text including all arguments provided (i.e. the passphrases in this case). It is therefore is recommended that you use the first option unless you have a specific reason to do otherwise. Notice though that you can still use -f keyfile without having to specify -P nor -N, and that the keyfile defaults to ~/.ssh/id_rsa, so in many cases it's not even needed.
>
> You might want to consider using ssh-agent, which can cache the passphrase for a time. The latest versions of gpg-agent also support the protocol that is used by ssh-agent.

```sh
$ ssh-keygen -p
```

```sh
$ ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
```

[How do I remove the passphrase for the SSH key without having to create a new key?](https://stackoverflow.com/questions/112396/how-do-i-remove-the-passphrase-for-the-ssh-key-without-having-to-create-a-new-ke)
