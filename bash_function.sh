#! /bin/bash

ajv_image_name="ajv"

function ajv() {
    if [ -z "$1" ]; then
        echo "Pass in a schema file path"
        exit 1
    else
        if [ -z "$2" ]; then
            echo "Pass in a doc file path"
            exit 1
        else
            schema_file="$1"
            doc_file="$2"
            docker run -v "${schema_file}":/data/schema.json \
                -v "${doc_file}":/data/doc.json \
                "${ajv_image_name}" \
                validate \
                -s schema.json \
                -d doc.json
        fi
    fi
}
