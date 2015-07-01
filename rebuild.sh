#!/usr/bin/env bash

pkgver="3.0"
pkgname="shellter"
pkgzip="${pkgname}.zip"
pkgdir="${pkgname}-${pkgver}"
pkgurl="https://www.shellterproject.com/Downloads/Shellter/Latest/${pkgzip}"
bold(){ echo -e "\e[1m${1}\e[0m"; }

[[ "$1" == "--force" ]] || {
    test -e "${pkgzip}" \
            && echo -n "${pkgzip}: file exists. "   \
            && echo "Use ${0} --force to overwrite" \
            && exit 1

    test -e "${pkgname}" \
            && echo -n "${pkgname}: directory exists. " \
            && echo "Use ${0} --force to overwrite"     \
            && exit 1
}

[[ -f "${pkgzip}" ]] && rm "${pkgzip}"

# [[ -d "${pkgname}" ]] && rm -rf "${pkgname}"

bold
bold ">> Creating new release for ${pkgname}-${pkgver}"
bold ">> Downloading ${pkgurl}"
wget -U POLLANEGRA --no-check-certificate "${pkgurl}"
unzip "${pkgzip}"

bold ">> Coping new files from ${pkgname} to ${pkgdir}/${pkgname}/"
cp -r "${pkgname}"/* "${pkgdir}/${pkgname}/"
bold ">> Coping executable wrapper to ${pkgdir}/bin/shellter"
cp shellter.sh "${pkgdir}/bin/shellter"
bold ">> Deleting ${pkgzip} and ${pkgname}"
rm -rf "${pkgzip}" "${pkgname}"

bold ">> Building debian package ${pkgname}-${pkgver}"
cd "${pkgdir}"
debian/rules clean
debian/rules binary

bold ">> Done"
echo

exit 0
