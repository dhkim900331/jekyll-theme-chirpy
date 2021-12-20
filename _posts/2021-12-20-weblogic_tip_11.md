---
title: "[WebLogic] weblogic.jar와 wlfullclient.jar"
categories: [WAS, WebLogic]
tags: [WAS, WebLogic]
date: 2021-12-20 19:31:57 +0900
author: DongHyun Kim
typora-root-url: ..
---

---
**Contents**
* TOC
{:toc}
---

# 1. 개요

weblogic.jar와 wlfullclient.jar 생성 방법



# 2. 설명

WebLogic 10.0 이전까지는, weblogic.jar file 하나로 T3, WLS-IIOP client application을 개발하여 WebLogic Server과 통신할 수 있다.

WebLogic 10.3.x 이후부터는, weblogic.jar 대신에 wlfullclient.jar을 사용해야 client application을 개발하고 사용할 수 있다.



[여기](https://docs.oracle.com/cd/E13222_01/wls/docs103/client/basics.html#wp1066820) 에서 client application 확인

[여기](https://docs.oracle.com/cd/E13222_01/wls/docs103/client/jarbuilder.html) 에서 wlfullclient.jar 생성 방법 확인

> 원격으로 PC에서 웹로직 서버 도메인 접근하여 어떠한 기능을 수행하려는 경우 wlfullclient.jar를 만들면 된다~
