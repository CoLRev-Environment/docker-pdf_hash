# colrev/pdf_hash

[pdf_hash](https://github.com/CoLRev-framework/docker-pdf_hash) is a Python script that generates a hash from a PDF based on an image.

## Usage

The docker image expects the path to a pdf file, a page number and a hash size as the input and returns the hash value.

`docker run --rm -ti -v ${PWD}:/home/docker colrev/pdf_hash python app.py "{pdf_path}" {page_nr} {hash_size}`
