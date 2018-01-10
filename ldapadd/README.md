# SoftLeader ldapadd

>  Quick init LDAP data

## Preparing your LDIF file for initiation 

let's say `my.ldif`

```ld
version: 1

dn: o=00,dc=example,dc=com
objectClass: organizationalUnit
objectClass: top
dc: org
```

## Run

```shell
$ docker run -t -v "$(pwd)":/data \
    -e FILE=my.ldif \
    softleader/ldapadd
```

### -e

- `FILE` - read operations from file (default: `sample.ldif`)
- `BINDDN` - bind DN (default: `uid=admin,ou=system`)
- `HOST` - LDAP server (default: `127.0.0.1`)
- `PORT` - port on LDAP server (defualt: `10389`)
- `PASSWD` - bind password (for simple authentication) (default: `secret`)