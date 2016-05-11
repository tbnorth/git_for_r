utf8ToInt('a')
utf8ToInt('b')
utf8ToInt('c')
utf8ToInt('1')
utf8ToInt('22')
utf8ToInt('333')
utf8ToInt('☺')

hash_text <- function (text) {
    # a two digit (00-99) hash (or fingerprint, or checksum) of text
    check <- 0
    for (character in strsplit(text, "")[[1]]) {
        check <- check + utf8ToInt(character)
        if (check >= 100) check <- check - 100
    }
    return(check)    
}

hash_text("test")
hash_text("more")
hash_text("test again: 234")

# 00-99 is 100 hashes for all possible data sets

# SHA1 hash is 20 bytes, 20*8 = 160 bits, 
# 2**160 = 1.461502e+48 hashes for all possible data sets
# 1,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000

require(digest)

sha1("test")
sha1("more")
sha1("test again: 234")

# make a simple text "file" cataloging the state of "files":

commit <- "
fa76210bdf56ea68a9bd9e081da193f763fe3395 dataset_001
eb32f2c893d4dcd35e0513c2ecce5381e81d850f dataset_002
61bad3a121bfe88d19ee344aebb62ea18b7cf79a dataset_003
"

sha1(commit)
# a single value (40 character string) that confirms the
# identity (fingerprint) of *all* the files in a data
# set, regardless of number of files or size
