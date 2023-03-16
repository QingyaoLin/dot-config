{ lib, stdenv, fetchurl, polkit, gtk3, pkg-config, intltool }:

stdenv.mkDerivation rec {
  pname = "polkit-gnome";
  version = "0.105";

  src = fetchurl {
    url = "mirror://gnome/sources/polkit-gnome/${version}/${pname}-${version}.tar.xz";
    sha256 = "0sckmcbxyj6sbrnfc5p5lnw27ccghsid6v6wxq09mgxqcd4lk10p";
  };

  buildInputs = [ polkit gtk3 ];
  nativeBuildInputs = [ pkg-config intltool ];

  postInstall =
  ''
    mkdir -p $out/bin
    cp $out/libexec/polkit-gnome-authentication-agent-1 $out/bin
  '';

  meta = {
    homepage = "https://gitlab.gnome.org/Archive/policykit-gnome";
    description = "A dbus session bus service that is used to bring up authentication dialogs";
    license = lib.licenses.lgpl2Plus;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.linux;
  };
}
