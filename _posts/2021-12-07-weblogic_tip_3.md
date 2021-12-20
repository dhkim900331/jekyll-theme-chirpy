---
title: "[WebLogic] JMX MBean 사용을 위한 기초 개념"
categories: [WAS, WebLogic]
tags: [WAS, WebLogic, MBean, JMX]
date: 2021-12-07 18:16:49 +0900
author: DongHyun Kim
---

---
**Contents**
* TOC
{:toc}
---

# 1. 개요

WebLogic 환경에서 MBean 사용방법을 간단하게 알아보자

# 2. WebLogic 에서 MBean 이란?

- 웹로직의 모든 접근 가능한 정보들은 MBeanServer에 저장된다. 웹로직 콘솔 페이지 또한 이 MBeanServer를 보여주는 것에 불과하다.
- MBeanServer는 계층적 구조를 가지고 있으며, 접근하기 위해서는 JMX API를 구현한 MBeans로 가능하다.
- 이 MBean에 접근하여 수정하는 코드를 만든다면, 웹로직 콘솔을 커스터마이즈 하는 것과 동일하다.

# 3. WebLogic 에서 MBean 접근 방법

## 3.1 사용할 MBean

먼저 MBeans 구조에 접근하기 위해서는 어떤 Service를 제공하는 MBean에 접근할지를 정해야 한다.



>  DomainRuntimeServiceMBean : 전체 도메인에 대하여 어플리케이션 배치, JMS 서버, JDBC 데이터소스 등을 제공한다.
>
> RuntimeServiceMBean : 현재 서버에 대한 정보를 제공한다.
>
> EditServiceBean : 현재 웹로직 도메인의 설정을 관리한다.



위 서비스 중 하나를 접근하기 위해선 각기 다른 JMX Object Name을 알아야 한다.

>  DomainRuntimeServiceMBean : com.bea:Name=DomainRuntimeService,Type=weblogic.management.mbeanservers.domainruntime.DomainRuntimeServiceMBean
>
> RuntimeServiceMBean : com.bea:Name=RuntimeService,Type=weblogic.management.mbeanservers.runtime.RuntimeServiceMBean
>
> EditServiceBean : com.bea:Name=EditService, Type=weblogic.management. mbeanservers.edit. EditServiceMBean

> _출처 : http://docs.oracle.com/cd/E24329_01/web.1211/e24415/understandwls.htm#JMXCU130_



## 3.2 MBean 접근

자, 이제 위에 설명한 3개의 서비스 중 원하는 하나를 골랐다면, 해당 되는 MBean 서버에 접근 할 수단이 필요하다.

> 왜 수단이 필요하냐고 묻는다면, 1번에서 설명하였듯이 MBean 제어는 JMX API를 통해 이루어지기 때문이다.



접근은 javax.management.remote.JMXServiceURL 객체를 통해 한다.

> 접근이라는 의미는 실제로 웹로직 아이피와 포트, Admin id/pwd 정보를 기재하고 다음 프로토콜을 사용하여 MBean 서버에 전달하는 것을 의미한다.
>
> t3, t3s, http, https, iiop, iiops 중 하나를 사용한다.
>
> MBeans는 결국 인스턴스의 JNDI 정보를 보는 것과 동일하다. MBeans 서버에 접근하려면 JMXServiceURL의 **첫 시작은 /jndi/ 이어야만 한다.**



접근할 수단이라는 것에 대해 알았다. 그렇다면 실제 URL은?

> DomainRuntimeMBeanServer : weblogic.management.mbeanservers.domainruntime
>
> RuntimeMBeanServer : weblogic.management.mbeanservers.runtime
>
> EditMBeanServer : weblogic.management.mbeanservers.edit



3가지 중 하나의 ServiceBean을 정했고,

ServiceBean의 JMX Object Name을 알아냈다.

접근하는 방법도 알았다.

예시는 다음과 같다.

> 현재 서버에 대한 정보 중 배포 되어 있는 어플리케이션 들이 무엇무엇이 있고, Targets 값은 무엇으로 되어있는지가 궁금하다

```
RuntimeServiceMBean , com.bea:Name=RuntimeService,Type=weblogic.management.mbeanservers.runtime.RuntimeServiceMBean , /jndi/weblogic.management.mbeanservers.runtime
```
