---
layout: page
title: Creating SSH keys for remote authentication
excerpt: "."
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}


Secure-shell (SSH) keys are a pair of cryptographic keys that can be used to
authenticate who you are when you communicate with a remote computer (i.e., a
server).
The two parts of an SSH key pair are a **public key**, which you can freely share,
and a **private key**, which you should never share.

Once a key-pair is in place, a remote computer can verify who you are by
sending a riddle (an encrypted message) that only your computer can solve.
The riddle is created using your public key and can only be solved (decrypted)
with the corresponding private key that only you possess.
Your computer returns the solution to the riddle (the decrypted message) to the
remote computer, proving that you have the corresponding private key.
This entire authentication riddle game takes place automatically, and you are
freed from the burden of entering a username and password.

Below is a short video and instructions on how to create and use
SSH keys.

<iframe width="560" height="315" src="https://www.youtube.com/embed/M9rc286eJII" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Check if you have SSH keys

The fist thing we need to do is check to see if you already have
SSH keys on your computer.
To do this,
open your terminal and enter:

    ls ~/.ssh

If you see `id_rsa` and `id_rsa.pub` listed, you already have a pair of SSH
keys.

## Create a pair of SSH keys

If you don't see these listed (or the `.ssh` directory does not exist),
you need to create a pair of SSH keys.
To do this, we will use `ssh-keygen`.
When you enter this on the command line, it will prompt you with some options;
simply hit enter for each prompt to accept the default (note, if you already
have a pair of SSH keys, skip this step):

    ssh-keygen
    
Now, when you:

    ls ~/.ssh

You should see the files `id_rsa` and `id_rsa.pub` listed.

<dl>
<dt>`id_rsa`</dt>
    <dd>This is the private component of your SSH key pair; do not share it
    with anyone.</dd>
<dt>`id_rsa.pub`</dt>
    <dd>This is the public component of your SSH key pair and can be safely
    shared.</dd>
</dl>

## Register your public key with GitHub

Log in to your |github|_ account, and go to the "Settings" for your account
(there should be a drop down near the top right corner of the |github|_ page,
with a "Settings" option).
Along the left side of your settings page, there should be an "SSH and GPG
keys" link; click on this.

Open a shell (terminal) session on your computer and enter:

    cat ~/.ssh/id_rsa.pub

The output of this command will show your public SSH key, which should look
something like:

    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaZow6ifUAg3g7Qj7N5zJ5fMnQoP
    mpAhUqwsvHu/BoXH17TcqP4HdcNoDcprVRwAJL/6ECabdzDyUlGThMKB8w3APqQjqa
    7yc98ymdK0LXDpU0IuWCktW9pyn72XizE1bSIOhDkrFKGmtpLW/0jxGhcRN6OtCUI4
    V98c2AuU3RKZeTSgfEAWnPJcCQaJkvzktVXO55rsNRe6UxqV4B6O/29YhBeCqyLDL6
    VUa7hT+4cqVX8gjLjgDq8jWwxkgeifEt9G1j41 jamie@jamie-XPS-13-9350

Copy the content of this output.
Now, go back to GitHub and click "New SSH key."
Paste your copied SSH key into the "Key" field on GitHub.
Enter a "Title" that will help you remember what computer the key is from
(e.g., dell-laptop).
Then hit "Add SSH Key."


## Setting up passwordless SSH login with any server

You can also use your SSH key pair to allow you to log in to servers (e.g., a
computer cluster) more securely and without using your password.
To do this, you need to put the contents of your `id_rsa.pub` file into the
`~/.ssh/authorized_keys` file in your home directory on the server you use.
You can do this with one command entered on *your* computer::

    cat ~/.ssh/id_rsa.pub | ssh YOUR-AU-USERNAME@SERVER-ADDRESS "cat >> ~/.ssh/authorized_keys"

Now, after you start a fresh shell session, you should be able to log in to
your account on the server without entering your password.
Rather, your identity is confirmed automatically using the SSH keys.
