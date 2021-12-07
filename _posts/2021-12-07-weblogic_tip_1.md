---
title: "[WebLogic] weblogic.socket.muxer is blocked"
categories: [WAS, WebLogic]
tags: [WebLogic, Issues]
author: DongHyun Kim
date: 2021-12-07 12:41:58 +0900
---

---
**Contents**

* TOC
{:toc}
---

# 1. 개요

스레드 덤프에서 muxer Thread가 blocked 으로 보여지는 현상은 무엇일까?

# 2. 설명

웹로직 스레드 덤프를 떠보면, muxer 중 1개는 waiting on condition , 1개는 blocked 상태에 머무는 것이 확인된다.



스레드 경합을 피하기 위해, blocked, waiting on condition 의 상태를 수시로 갖게 된다.

muxer 자체가 매우 빠르게 동작하기 위함이며, 실제로도 많은 작업을 하지 않기 때문에 덤프를 뜰때마다 그렇게 보이는 것으로 이해된다.



> Java Socket Muxer - polling 방식
>
> Native Socket (Native Muxer; 웹로직 기본 muxer) - interrupt 방식

>  _**Is It Normal to See Blocked "weblogic.socket.muxer" Threads? (Doc ID 857031.1)**_
