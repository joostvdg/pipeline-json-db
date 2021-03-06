#!/bin/bash
CONTEXT_LOCATION_DEFAULT=.
CONTEXT_LOCATION="${1:-$CONTEXT_LOCATION_DEFAULT}"

TAGNAME_DEFAULT="jvdg-pl-jsondb-image"
TAGNAME="${2:-$TAGNAME_DEFAULT}"

echo "[JSON_DB][build]  Building new ${TAGNAME_DEFAULT}"
docker build --tag=$TAGNAME ${CONTEXT_LOCATION}