# SoftLeader ldap-client

>  Quick Initialize LDAP data

## Preparing your LDIF file for initiation 

let's say `sample.ldif` looks like:

```ld
version: 1

dn: dc=softleader,dc=example,dc=com
objectClass: domain
objectClass: top
dc: softleader

dn: o=00,dc=softleader,dc=example,dc=com
objectClass: organization
objectClass: top
o: 00

dn: uid=admin,o=00,dc=softleader,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: top
cn: admin
sn: admin
uid: admin
```

## Run

**Initial:**

將 `sample.ldif` copy 當前目錄，客製化自己的 `sample.ldif`

```shell
$ docker run -it --rm -v "$(pwd)":/data softleader/ldap-client initial
```

**Create Dn:**

create `sample.ldif` 裡頭的 `dn`

```shell
$ docker run -it --rm -v "$(pwd)":/data softleader/ldap-client createdn
```

**Change Dn Password:**

修改 binddn 的 password

```shell
$ docker run -it --rm -e NEWPASSWD=${your new password} softleader/ldap-client changepwd
```

**Delete Dn:**

```shell
docker run -it --rm softleader/ldap-client deletedn [dc=softleader,dc=example,dc=com ...]
```

### -e

- `FILE` - read operations from file (**REQUIRED**)
- `BINDDN` - bind DN (default: `uid=admin,ou=system`)
- `HOST` - LDAP server (default: `127.0.0.1`)
- `PORT` - port on LDAP server (defualt: `10389`)
- `PASSWD` - bind password (for simple authentication) (default: `secret`)
- `NEWPASSWD` - change password (default: `secret`)

## Example

在公司的 `Ldap Server` create 一個 `DN` 

```shell
$ docker run -it --rm -e HOST=softleader.com.tw -e PORT=10388 -v "$(pwd)":/data softleader/ldap-client createdn
```

