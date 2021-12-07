---
title: "[WLST] Thread Dump"
categories: [WAS, WebLogic]
tags: [WebLogic, Tips]
author: DongHyun Kim
date: 2021-12-07 15:34:11 +0900
---

---
**Contents**
* TOC
{:toc}
---

# 1. 개요

WLST로 Thread dump를 뜨는 스크립트

# 2. 설명

```bash
java -cp wlfullclient.jar weblogic.Admin -url t3://ip:port -username weblogic -password weblogic1 THREAD_DUMP
```

> nohup에 기록된다.
>
> wlfullclient.jar는 _https://docs.oracle.com/cd/E13222_01/wls/docs103/client/jarbuilder.html#wp1078098_ 를 참고하여 생성한다.
