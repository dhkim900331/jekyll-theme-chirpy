---
title: "[RHCSA] Root Password 변경"
categories: [Study, RHCSA]
tags: [Study, RHCSA]
date: 2021-12-16 15:55:18 +0900
author: DongHyun Kim
typora-root-url: ..
---

---
**Contents**
* TOC
{:toc}
---

# 1. 개요

root 계정 패스워드 변경 방법



# 2. 설명

(1). Linux 부팅 단계에서 e 를 눌러 명령줄 편집모드 진입

![](/assets/img/rhcsa_resetpass/image-20211209081730920.png)



(2). linux 행에 마지막(End 키)에 rd.break 입력 후 Ctrl-x 키로 이어서 부팅

![image-20211209082647748](../assets/img/rhcsa_resetpass/image-20211209082647748.png)

> 일반 파일 시스템의 루트가 올라오지 않아, sysroot가 올라온다.
>
> 그래서 아래에서 _chroot /sysroot_를 한다고 구글신이 알려준다.



(3). sysroot 리마운트

현재 sysroot가 ro(read only)다.

![image-20211209082924852](/assets/img/rhcsa_resetpass/image-20211209082924852.png)



리마운트 한다.

```bash
# mount -o(options) remount,rw /sysroot
```

![image-20211209083022990](/assets/img/rhcsa_resetpass/image-20211209083022990.png)



다음 명령어가 정확히 어떤 의미인지 모르나, 시스템 파일이 있는 root로 변경하는 것으로 보인다.

```bash
# chroot /sysroot
```



(4). root 패스워드 변경

```bash
# passwd root
New Password:
Re-type Password:
```



(5). autorelabel

변경 완료 후 부팅 시에 SELinux가 /etc/shadow 파일을 리라벨링(?) 하도록 지시한다.

```bash
# touch /.autorelabel
```



(6). reboot

```bash
# exit
# exit
```

> 두번의 exit을 통해 reboot 시도한다.



(7). relabel 작업으로 보여지는 로그들

![image-20211209083949074](/assets/img/rhcsa_resetpass/image-20211209083949074.png)
