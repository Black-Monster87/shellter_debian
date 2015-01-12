#!/bin/sh

pkgver="2.0"
pkgname="shellter"
pkgzip="${pkgname}.zip"
pkgdir="${pkgname}-${pkgver}"
pkgurl="https://www.shellterproject.com/Downloads/Shellter/Latest/${pkgzip}"

test -e "${pkgzip}" \
	&& echo "${pkgzip}: file exists" \
	&& exit 1

test -e "${pkgname}" \
	&& echo "${pkgzip}: directory exists" \
	&& exit 1

echo
echo ">> Creating new release for ${pkgname}-${pkgver}"
echo ">> Downloading ${pkgurl}"
wget -U POLLANEGRA --no-check-certificate "${pkgurl}"
unzip "${pkgzip}"

echo ">> Coping new files from ${pkgname} to ${pkgdir}/${pkgname}/"
echo cp -r "${pkgname}"/* "${pkgdir}/${pkgname}/"
echo ">> Coping executable wrapper to ${pkgdir}/bin/shellter"
echo cp shellter.sh "${pkgdir}/bin/shellter"
echo ">> Deleting ${pkgzip} and ${pkgname}"
echo rm -rf "${pkgzip}" "${pkgname}"

echo ">> Building debian package ${pkgname}-${pkgver}"
echo cd "${pkgdir}"
echo debian/rules clean
echo debian/rules binary

echo ">> Done"
echo

exit 0
