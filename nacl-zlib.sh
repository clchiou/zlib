#!/bin/bash
#
# Copyright (c) 2013 Che-Liang Chiou. All rights reserved.
# Use of this source code is governed by the GNU General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#

source pkg_info
source ../common.sh

# TODO(clchiou): Build static targets for now to fix build
# errors.  Switch to use shared library someday.
export MAKE_TARGETS=static

CustomConfigureStep() {
  Banner "Configuring ${PACKAGE_NAME}"
  ChangeDir ${NACL_PACKAGES_REPOSITORY}/${PACKAGE_DIR}
  CC=${NACLCC} AR="${NACLAR}" RANLIB=${NACLRANLIB} CFLAGS="-Dunlink=puts" \
    ./configure --prefix=${NACLPORTS_PREFIX}
}

CustomPackageInstall() {
  DefaultPreInstallStep
  DefaultSyncSrcStep
  CustomConfigureStep
  DefaultBuildStep
  DefaultTranslateStep
  DefaultValidateStep
  DefaultInstallStep
}

CustomPackageInstall
