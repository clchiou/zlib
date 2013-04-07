#!/bin/bash

source pkg_info
source ../common.sh

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
  DefaultInstallStep
  DefaultCleanUpStep
}

CustomPackageInstall
