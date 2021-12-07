---
title: "[WebLogic] WLDF (건강보험공단 차세대그룹웨어 기준으로 정리)"
date: 2021-12-06 00:00:00 +0900
categories: [WAS, WebLogic]
tags: [WebLogic, Issues, WLDF]
author: DongHyun Kim
---

---
**Contents**
* TOC
{:toc}
---

# 1. 개요
SR 3-18108256751 : [건강보험공단] every hour cpu spike 건을 정리


# 2. 현상
## 2.1 WLDF
WebLogic Diagnostics Framework
servers/<server>/data/store/diagnostics/WLS_DIAGNOSTICS000000.DAT 파일로 저장.
12cR1 기준으로, 5분마다 위 데이터 수집.
1시간마다 용량 100mb 도달 시, old record 삭제.


## 2.2 WLDF 파일로 인해 문제 발생
건보에서 1시간마다 cpu spike 발생.
진단파일 손상 되었을 것으로 예상한다는 오라클 답변이지만,
에러 로그가 없는 것에 대해서는
디버그 하면 볼 수 있을 것이라는 답변


# 3. 해결
## 3.1 첫번째 방법
1차 파일 삭제, 재기동으로 클리어 후에도 용량이 90mb 도달시에
1시간마다 cpu spike 동일 증상 발생하는 것으로 보아
용량과 관계 있어 보여.
우선 기능 disable 옵션 아래 적용.

> How to Prevent the 'WLS_DIAGNOSTICSxxxxxx.DAT' file (under the DOMAIN_NAME/servers/SERVER_NAME/data/store/diagnostics folder) From Growing Too Large (문서 ID 965416.1)

```bash
-Dcom.bea.wlw.netui.disableInstrumentation=true
-D_Offline_FileDataArchive=true
-Dweblogic.connector.ConnectionPoolProfilingEnabled=false
```

-Dcom.bea...

> Dcom.bea... : page flow event 로깅을 하지 않음 이라고 답변받았다.
>
> _(https://docs.oracle.com/cd/E13218_01/wlp/docs81/ipcguide/custevent.html> 의 What is a Page Flow Event?)_ 에 정확한 설명은 있으나,
>
> 이해 안감.. 로그인 웹페이지를 보여주는 포틀릿과, 다른 포틀릿간의 상호 연계(호출 또는 아이디/패스워드를 수집하여 db로 보낸다는건지..)를 기록할 수 있고,
>
> 이러한 기록기능을 disable 하는 것으로 보임.

-D_Offline...

> 진단파일을 언제나 빠르게 검색하게 하기 위한 색인화(indexer)를 중지. 라고 답변받았으나,
>
> _(How Can I Reduce the Size of the Logs Produced by the WebLogic Diagnostic Framework (WLDF)? (문서 ID 950742.1))_ 문서에서는
>
> 위 Dcom.bea.. 옵션도 같이 사용해야 하는 것으로 설명되어 있다.

-Dweblogic.connector...

> JDBC 데이터소스 설정에 커넥션 프로파일링(커넥션 Leak 을 잡기 위해 주로 사용) 로그를 진단파일에 기록하지 않는다고 되어있다.
>
> 몇건의 사례에서, 위 프로파일링으로 인해 진단파일을 오랫동안 기록, 많은 양을 기록하여 문제된 적이 발견된다.

위와 같이 정리를 하고보면, 세개의 옵션은 몇가지 기능을 끄는 것으로 disable 효과를 볼 수는 있으나
WLDF 진단파일 공식문서에서는 MBeans, 시스템 상태 등등 더 부피가 큰 데이터를 기록하는게 기본이다...
즉 위 옵션은 용량이 큰 진단파일을 더 작게 리사이징 하는 정도의 옵션이다.
Doc ID. 950742.1 문서에도 reduce size 로 표현되고 있다.


## 3.2 두번째 방법 (권장?)
콘솔 - Diagnostics - Built-in Diagnostic Modules - <Servers> - Low 값을 None 으로 변경.
> 3.1 옵션을 적용하지 않아도 되며, 파일에 아무런 기록을 하지 않는다. 기본 파일은 생성이 된다.