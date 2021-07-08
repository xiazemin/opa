http://just4coding.com/2020/02/13/open-policy-agent/

OPA的策略决策过程涉及三个部分:

数据(Data): 数据是OPA评估策略时所需的外部信息。比如，在实现用户级粒度的简单访问控制时，OPA需要知道所有允许访问的用户列表。它是JSON格式文档。
查询输入(Query): 它触发策略评估过程，并为其提供参数，它也是JSON格式文档。
策略(Policy): 策略指定了计算逻辑，它根据数据和查询输入来执行计算逻辑产生策略的评估结果。

业务应用可以通过sidecar容器、独立服务或者依赖库(针对Golang应用)几种方式集成OPA。



https://engineering.linecorp.com/zh-hant/blog/open-policy-agent-authz-in-microservice/


在Kubernetes中, 当资源创建、更新、删除的时候会通过准入控制器（Admission Controllers）进行决策，是Kubernetes中非常重要的一个环节。
准入控制器是一段代码，用于在对象持久之前但在请求得到验证和授权之后，截取对kube-apiserver的请求进行验证或是修改
OPA 和 MutatingAdmissionWebhook 、ValidatingAdmissionWebhook 可以很好的进行结合，完成数据的校验亦或是数据的加工处理。可以通过OPA来做复杂的决策，以此来提高集群的安全性和易用性，有以下的使用场景。
https://github.com/open-policy-agent/gatekeeper

https://www.sohu.com/a/363261501_198222
动态准入控制具有以下限制：仅在 Kubernetes 资源上调用 Webhook 来创建、更新和删除事件。
https://zhuanlan.zhihu.com/p/57208435
https://cloud.tencent.com/developer/article/1549256
https://blog.csdn.net/anxin997483092/article/details/100177887
https://zhuanlan.zhihu.com/p/147217737

https://zhuanlan.zhihu.com/p/353531134
https://zhuanlan.zhihu.com/p/385390385
https://blog.csdn.net/k8scaptain/article/details/89307828

OPA chart
https://segmentfault.com/a/1190000017434493

在 Amazon EKS 上使用 Open Policy Agent
https://aws.amazon.com/cn/blogs/china/using-open-policy-agent-on-amazon-eks/
http://www.dockone.io/article/9560


授权–一种定制服务（Authorization），用于接收请求并为Open Policy Agent创建格式化的输入请求。
开放策略代理（OPA）–作为辅助工具运行，并公开http端点以与授权容器进行通信。
https://segmentfault.com/a/1190000022753560
https://blog.csdn.net/qq_44586683/article/details/110942129