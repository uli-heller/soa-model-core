#!/bin/sh
#set -x
D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"

TPD="${D}/../3rd-party"

GROOVY_VERSION="2.1.0"
GROOVY_ZIP_BASENAME="groovy-binary-${GROOVY_VERSION}.zip"
GROOVY_ZIP_DOWNLOAD_URL="http://dist.groovy.codehaus.org/distributions/${GROOVY_ZIP_BASENAME}"
GROOVY_ZIP_ABSOLUTE_PATH="${TPD}/${GROOVY_ZIP_BASENAME}"

if [ ! -d "${TPD}" ]; then
  mkdir -p "${TPD}"
fi

if [ ! -d "${D}/groovy" ]; then
  if [ ! -s  "${GROOVY_ZIP_ABSOLUTE_PATH}" ]; then
    "${D}/httpcat.sh" "${GROOVY_ZIP_DOWNLOAD_URL}" >"${GROOVY_ZIP_ABSOLUTE_PATH}"
  fi
  (cd "${D}"; "${D}/myjar.sh" -xf "${GROOVY_ZIP_ABSOLUTE_PATH}")
  mv "${D}/groovy-${GROOVY_VERSION}" "${D}/groovy"
  (cd "${D}/groovy/bin"; ls|grep -v "bat"|xargs chmod +x)
fi

COMMONS_HTTPCLIENT_VERSION="3.1"
COMMONS_HTTPCLIENT_ZIP_BASENAME="commons-httpclient-${COMMONS_HTTPCLIENT_VERSION}.zip"
COMMONS_HTTPCLIENT_ZIP_DOWNLOAD_URL="http://archive.apache.org/dist/httpcomponents/commons-httpclient/binary/${COMMONS_HTTPCLIENT_ZIP_BASENAME}"
COMMONS_HTTPCLIENT_ZIP_ABSOLUTE_PATH="${TPD}/${COMMONS_HTTPCLIENT_ZIP_BASENAME}"
if [ ! -s "${COMMONS_HTTPCLIENT_ZIP_ABSOLUTE_PATH}" ]; then
    "${D}/httpcat.sh" "${COMMONS_HTTPCLIENT_ZIP_DOWNLOAD_URL}" >"${COMMONS_HTTPCLIENT_ZIP_ABSOLUTE_PATH}"
fi

#WSDLDIFF_ZIP_BASENAME=soa-model-distribution-1.2.1.RC2.zip
#WSDLDIFF_ZIP_DOWNLOAD_URL="http://mirror.predic8.com/membrane/soa-model/${WSDLDIFF_ZIP_BASENAME}?"
#WSDLDIFF_ZIP_ABSOLUTE_PATH="${TPD}/${WSDLDIFF_ZIP_BASENAME}"
#if [ ! -d "${D}/wsdldiff" ]; then
#  if [ ! -s  "${WSDLDIFF_ZIP_ABSOLUTE_PATH}" ]; then
#    "${D}/httpcat.sh" "${WSDLDIFF_ZIP_DOWNLOAD_URL}" >"${WSDLDIFF_ZIP_ABSOLUTE_PATH}"
#  fi
#  (cd "${D}"; mkdir wsdldiff; cd wsdldiff; "${D}/myjar.sh" -xf "${WSDLDIFF_ZIP_ABSOLUTE_PATH}")
#fi
exit 0
