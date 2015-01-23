2014年12月10日 宣言的プログラミング
===

Installation 
---
### Ubuntu

```bash
$ sudo apt-get install swi-prolog
```

### Mac OS X

```bash
$ brew install swi-prolog
```

Usage
---

### Ubuntu

```bash
$ prolog -f like.swi
? - listing.
like(taro, coffee).
like(hanako, tea).
like(taro, cocoa).
true.
```

### Mac OS X

```bash
$ swipl -f like.swi
?- like(X,Y).
X = taro,
Y = coffee ;
X = hanako,
Y = tea ;
X = taro,
Y = cocoa.
```