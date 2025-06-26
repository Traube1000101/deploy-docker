# Maintainer: Traube1000101 <girlscoutcookies420@gmx.net>
pkgname=deploy-docker
pkgver=1.0
pkgrel=1
pkgdesc="Builds and deploys a docker image to a registry"
arch=('any')
url="https://github.com/Traube1000101/${pkgname}"
license=('GPL-3.0')
depends=(
    'bash'
    'docker'
    'util-linux'
)
source=("https://github.com/Traube1000101/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('027e95e77aeb7bf33c0016ac0893136417489be72ebecd69c9e7bb75d20003351ec7576ebc9b28df6b60f842b05dbbcc6e3bb0f6e140c5864a5116b006d8493d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR="$pkgdir" install
    install -D -m444 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
