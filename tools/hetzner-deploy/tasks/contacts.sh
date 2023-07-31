#! /bin/bash
#
# References:
# - https://ocloud.de/doc/user/lang/de/pim/calendar.html
#
# 2022-08-22, jw@owncloud.com

# source ./env.sh	# probably not needed.

user=admin
app=contacts
occ app:enable $app

mkdir vcf
cat << EOV > vcf/simon_perreault.vcf	# from https://en.wikipedia.org/wiki/VCard
BEGIN:VCARD
VERSION:4.0
FN:Simon Perreault
N:Perreault;Simon;;;ing. jr,M.Sc.
BDAY:--0203
GENDER:M
EMAIL;TYPE=work:simon.perreault@viagenie.ca
END:VCARD
EOV

cat << EOV > vcf/celebrities.vcf	# from chatgpt promt: generate a vcf file with 100 dummy entries of celebrities
BEGIN:VCARD
VERSION:3.0
FN:Tom Hanks
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:tom.hanks@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Angelina Jolie
ORG:Actress Co.
TEL:555-5678
EMAIL:angelina.jolie@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Brad Pitt
ORG:Movie Star Inc.
TEL:555-9876
EMAIL:brad.pitt@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Meryl Streep
ORG:Actress Co.
TEL:555-5432
EMAIL:meryl.streep@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Leonardo DiCaprio
ORG:Movie Star Inc.
TEL:555-8765
EMAIL:leonardo.dicaprio@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jennifer Aniston
ORG:Actress Co.
TEL:555-2345
EMAIL:jennifer.aniston@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Johnny Depp
ORG:Movie Star Inc.
TEL:555-6543
EMAIL:johnny.depp@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Scarlett Johansson
ORG:Actress Co.
TEL:555-8765
EMAIL:scarlett.johansson@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Will Smith
ORG:Movie Star Inc.
TEL:555-5432
EMAIL:will.smith@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Emma Watson
ORG:Actress Co.
TEL:555-2345
EMAIL:emma.watson@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Robert Downey Jr.
ORG:Movie Star Inc.
TEL:555-9876
EMAIL:robert.downey@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Julia Roberts
ORG:Actress Co.
TEL:555-5678
EMAIL:julia.roberts@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Chris Evans
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:chris.evans@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Natalie Portman
ORG:Actress Co.
TEL:555-8765
EMAIL:natalie.portman@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Hugh Jackman
ORG:Movie Star Inc.
TEL:555-6543
EMAIL:hugh.jackman@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Sandra Bullock
ORG:Actress Co.
TEL:555-5432
EMAIL:sandra.bullock@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ryan Reynolds
ORG:Movie Star Inc.
TEL:555-2345
EMAIL:ryan.reynolds@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Anne Hathaway
ORG:Actress Co.
TEL:555-9876
EMAIL:anne.hathaway@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Chris Hemsworth
ORG:Movie Star Inc.
TEL:555-5678
EMAIL:chris.hemsworth@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Cate Blanchett
ORG:Actress Co.
TEL:555-1234
EMAIL:cate.blanchett@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Emma Stone
ORG:Actress Co.
TEL:555-5678
EMAIL:emma.stone@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:George Clooney
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:george.clooney@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Matt Damon
ORG:Movie Star Inc.
TEL:555-2345
EMAIL:matt.damon@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jessica Alba
ORG:Actress Co.
TEL:555-1234
EMAIL:jessica.alba@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Reese Witherspoon
ORG:Actress Co.
TEL:555-5678
EMAIL:reese.witherspoon@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Chris Pine
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:chris.pine@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ryan Gosling
ORG:Movie Star Inc.
TEL:555-6543
EMAIL:ryan.gosling@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Mila Kunis
ORG:Actress Co.
TEL:555-5432
EMAIL:mila.kunis@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Charlize Theron
ORG:Actress Co.
TEL:555-9876
EMAIL:charlize.theron@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Channing Tatum
ORG:Movie Star Inc.
TEL:555-5678
EMAIL:channing.tatum@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Keira Knightley
ORG:Actress Co.
TEL:555-6543
EMAIL:keira.knightley@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Chris Pratt
ORG:Movie Star Inc.
TEL:555-5432
EMAIL:chris.pratt@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jennifer Lawrence
ORG:Actress Co.
TEL:555-2345
EMAIL:jennifer.lawrence@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Emma Roberts
ORG:Actress Co.
TEL:555-5678
EMAIL:emma.roberts@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Dwayne Johnson
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:dwayne.johnson@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Mark Wahlberg
ORG:Movie Star Inc.
TEL:555-6543
EMAIL:mark.wahlberg@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Amy Adams
ORG:Actress Co.
TEL:555-5432
EMAIL:amy.adams@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Zac Efron
ORG:Movie Star Inc.
TEL:555-2345
EMAIL:zac.efron@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Rachel McAdams
ORG:Actress Co.
TEL:555-9876
EMAIL:rachel.mcadams@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Will Ferrell
ORG:Movie Star Inc.
TEL:555-5678
EMAIL:will.ferrell@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Dakota Johnson
ORG:Actress Co.
TEL:555-6543
EMAIL:dakota.johnson@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Tom Hardy
ORG:Movie Star Inc.
TEL:555-5432
EMAIL:tom.hardy@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jennifer Garner
ORG:Actress Co.
TEL:555-2345
EMAIL:jennifer.garner@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Joaquin Phoenix
ORG:Movie Star Inc.
TEL:555-9876
EMAIL:joaquin.phoenix@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Megan Fox
ORG:Actress Co.
TEL:555-5678
EMAIL:megan.fox@example.com
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Matthew McConaughey
ORG:Movie Star Inc.
TEL:555-1234
EMAIL:matthew.mcconaughey@example.com
END:VCARD

EOV

cat << EOV > vcf/musicians.vcf	# from chatgpt promt: generate vcard entries for famous musicians with birthday and note in which band they played
BEGIN:VCARD
VERSION:3.0
FN:John Lennon
ORG:The Beatles
BDAY:1940-10-09
NOTE:Co-founder and rhythm guitarist of The Beatles.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Paul McCartney
ORG:The Beatles
BDAY:1942-06-18
NOTE:Bassist, singer, and songwriter of The Beatles.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:George Harrison
ORG:The Beatles
BDAY:1943-02-25
NOTE:Lead guitarist of The Beatles.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ringo Starr
ORG:The Beatles
BDAY:1940-07-07
NOTE:Drummer of The Beatles.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Freddy Mercury
ORG:Queen
BDAY:1946-09-05
NOTE:Lead vocalist and pianist of Queen.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Brian May
ORG:Queen
BDAY:1947-07-19
NOTE:Lead guitarist and backing vocalist of Queen.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Roger Taylor
ORG:Queen
BDAY:1949-07-26
NOTE:Drummer and backing vocalist of Queen.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:John Deacon
ORG:Queen
BDAY:1951-08-19
NOTE:Bassist of Queen.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Elvis Presley
ORG:Solo Artist
BDAY:1935-01-08
NOTE:Iconic rock and roll singer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Bob Dylan
ORG:Solo Artist
BDAY:1941-05-24
NOTE:Singer-songwriter and Nobel laureate.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:David Bowie
ORG:Solo Artist
BDAY:1947-01-08
NOTE:Innovative singer, songwriter, and actor.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Bob Marley
ORG:The Wailers
BDAY:1945-02-06
NOTE:Reggae legend and leader of Bob Marley & The Wailers.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jimi Hendrix
ORG:The Jimi Hendrix Experience
BDAY:1942-11-27
NOTE:Revolutionary guitarist and frontman of The Jimi Hendrix Experience.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Eric Clapton
ORG:Cream
BDAY:1945-03-30
NOTE:Guitar virtuoso and member of Cream.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jimmy Page
ORG:Led Zeppelin
BDAY:1944-01-09
NOTE:Legendary guitarist and founding member of Led Zeppelin.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Robert Plant
ORG:Led Zeppelin
BDAY:1948-08-20
NOTE:Lead vocalist of Led Zeppelin.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:John Bonham
ORG:Led Zeppelin
BDAY:1948-05-31
NOTE:Drummer of Led Zeppelin.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:John Paul Jones
ORG:Led Zeppelin
BDAY:1946-01-03
NOTE:Bassist and keyboardist of Led Zeppelin.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Michael Jackson
ORG:Solo Artist
BDAY:1958-08-29
NOTE:King of Pop.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Madonna
ORG:Solo Artist
BDAY:1958-08-16
NOTE:Queen of Pop.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Prince
ORG:Solo Artist
BDAY:1958-06-07
NOTE:Versatile musician and performer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Beyoncé
ORG:Solo Artist
BDAY:1981-09-04
NOTE:Iconic singer, actress, and businesswoman.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Eminem
ORG:Solo Artist
BDAY:1972-10-17
NOTE:Renowned rapper and producer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Billie Eilish
ORG:Solo Artist
BDAY:2001-12-18
NOTE:Young and acclaimed singer-songwriter.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Taylor Swift
ORG:Solo Artist
BDAY:1989-12-13
NOTE:Multi-award-winning singer-songwriter.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Lady Gaga
ORG:Solo Artist
BDAY:1986-03-28
NOTE:Iconic singer and actress.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Shakira
ORG:Solo Artist
BDAY:1977-02-02
NOTE:International superstar and philanthropist.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Adele
ORG:Solo Artist
BDAY:1988-05-05
NOTE:Soulful and powerful vocalist.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Drake
ORG:Solo Artist
BDAY:1986-10-24
NOTE:Canadian rapper and singer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Kanye West
ORG:Solo Artist
BDAY:1977-06-08
NOTE:Influential rapper, producer, and fashion designer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Bruno Mars
ORG:Solo Artist
BDAY:1985-10-08
NOTE:Multi-talented singer, songwriter, and producer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ed Sheeran
ORG:Solo Artist
BDAY:1991-02-17
NOTE:Chart-topping singer-songwriter.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ariana Grande
ORG:Solo Artist
BDAY:1993-06-26
NOTE:Pop superstar and actress.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Justin Bieber
ORG:Solo Artist
BDAY:1994-03-01
NOTE:Canadian pop sensation.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Rihanna
ORG:Solo Artist
BDAY:1988-02-20
NOTE:Versatile singer, actress, and entrepreneur.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:J. Cole
ORG:Solo Artist
BDAY:1985-01-28
NOTE:Multi-platinum rapper and producer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Snoop Dogg
ORG:Solo Artist
BDAY:1971-10-20
NOTE:Iconic rapper and media personality.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Jay-Z
ORG:Solo Artist
BDAY:1969-12-04
NOTE:Rapper, entrepreneur, and music mogul.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Ice Cube
ORG:N.W.A, Solo Artist
BDAY:1969-06-15
NOTE:Rapper, actor, and member of N.W.A.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Dr. Dre
ORG:N.W.A, Solo Artist
BDAY:1965-02-18
NOTE:Hip-hop pioneer and record producer.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Kendrick Lamar
ORG:Solo Artist
BDAY:1987-06-17
NOTE:Acclaimed rapper and lyricist.
END:VCARD

BEGIN:VCARD
VERSION:3.0
FN:Nas
ORG:Solo Artist
BDAY:1973-09-14
NOTE:Legendary rapper and lyricist.
END:VCARD

EOV


dest=/var/www/owncloud/data/$user/files/
mkdir -p $dest
chown -R www-data. vcf $dest/..
cp -a vcf $dest
occ files:scan -q $user

cat << EOM | sed -e "s/^/$app: /g" >>  ~/POSTINIT.msg
Example VCF files:
  $user/vcf/*.vcf
EOM
