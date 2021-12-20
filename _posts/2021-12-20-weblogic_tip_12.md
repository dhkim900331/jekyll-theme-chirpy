---
title: "[WebLogic] 데이터소스 커넥션 풀 시도 횟수 관련 옵션"
categories: [WAS, WebLogic]
tags: [WAS, WebLogic, Datasource, Connection Pool]
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

데이터소스 커넥션 풀 시도 횟수 관련 옵션



# 2. 설명

![image-20211220154554776](/assets/img/weblogic_tip_12/image-20211220154554776.png)



Connection Reserve Timeout 기본값 10초.

사진상 3 초일 경우,



Reached maximum data... 에러의 경우

3초 동안 Free connection pool 찾음.



없으면 503 error.



해당 3초 내에 몇번의 요청을 하는 구조인지는 모르겠다.
