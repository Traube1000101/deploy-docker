# deploy-docker.sh

Builds and deploys a docker image to a registry

## Push new version to AUR
### Prerequisite - add remote
```sh
git remote add aur-remote ssh://aur@aur.archlinux.org/"$(grep -m1 '^pkgname=' PKGBUILD | cut -d= -f2)".git
```
### 1. Create a new release tagged with v%pkgver%, use the version defined in the PKGBUILD
### 2. Use the AUR branch to deploy the package
```sh
git switch aur
```
### 3. Create BLAKE2 checksum
```bash
( export $(grep -E '^(pkgname|pkgver)=' PKGBUILD); curl -sL "$(grep -oP '^source=\(\K".*?"' PKGBUILD | tr -d '"' | envsubst)" | b2sum | cut -d' ' -f1 )
```
### 4. Update value of b2sums in PKGBUILD with the generated checksum
```sh
vim PKGBUILD
```
### 5. Update the .SRCINFO with the new PKGBUILD
```sh
makepkg --printsrcinfo >| .SRCINFO
```

### 6. Commit
```sh
git commit -m "FITTING MESSAGE"
```

### 7. Push
```sh
git push aur-remote aur:master
```


