# Ubuntu TODO List

## Change Caps-Lock to Ctrl
1. Install "dconf-editor".
2. Go to `/org/gnome/desktop/input-sources/xkb-options`.
3. Input `['ctrl:nocaps']` in "Custom value".

## Time gap in dual boot environment
```
$ sudo timedatectl set-local-rtc true
```

## Setting Fonts
1. Install Fonts and Copy to `/usr/share/fonts/truetype`.
2. Run the following command to update the fonts list.  
```
$ fc-cache -fv
```
3. Run the following command to check the correct name of the font.  
```
$ fc-list | grep "font name"
```
4. Configure settings for each application.

## PGP key setting for GitHub and Git
1. Run the following command to generate the gpg key.  
```
$ gpg --full-generate
```
2. Run the following command to check your key ID.  
```
$ gpg --list-secret-keys --keyid-format LONG
```
3. Copy your key ID.  
```
/Users/****/.gnupg/pubring.kbx  
------------------------------  
sec rsa4096/<your key ID> 20XX-XX-XX [SC]  
    ***  
uid [ultimate] ***** <***@***>  
ssb rsa4096/*** 20XX-XX-XX [E]
```

### Register your key ID in Git
4. Edit `.gitconfig` as follows.
```
[user]
  signingKey = <your key ID>

[gpg]
  program = /usr/bin/gpg
```

### Register public key on GitHub
5. Run the following command to output your public key to the file.  
```
$ gpg --armor --export <your key ID> > public.key
```
6. Open the file you just output, and copy from `---BEGIN PGP PUBLIC KEY BLOCK---` to `---END PGP PUBLIC KEY BLOCK---`.
7. You access to your GitHub page, and go to `Settings -> SSH and GPG keys -> New GPG key`.
8. Paste the public key you copied eariler.

## Problem changing to UK keyboard layout at login
1. Move to `/usr/share/ibus/component/`
2. Edit mozc.xml as follows using your favorite editor.
```
<layout>default</layout>  ->  <layout>jp</layout>
```