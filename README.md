# 数据库课设——企业产品仓库管理系统
## 开发文档（未完善）：
[https://blog.csdn.net/weixin_43207025/category_10141552.html](https://blog.csdn.net/weixin_43207025/category_10141552.html)
## 项目目录
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628172823872.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
## 运行环境：

 - Spring Boot版本：`2.2.6`
 - Java版本：`jdk1.8.0_251`
 - Maven版本：`apache-maven-3.6.2`
 - MYSQL版本：`MySQL Ver 8.0.17 for Win64 on x86_64`（5.7版本也可以）
 - Mybatis版本：`2.0.0`
 - 开发工具：`IntelliJ IDEA  2019.3.3`
## 开发使用的技术
- 前端UI：`layui-2.x + X-admin2.2`
- 前后端数据传送：`Ajax + Thymeleaf`
- 依赖管理工具：`Maven 版本-3.6.2`
- 数据库操作：`Mybatis-2.0.0`
- 拦截器：`Shiro`
- 系统日志：`AOP`

其余使用的依赖见项目的 `pom.xml`文件


## 要实现的基本功能：
- **客户基本信息管理**：客户基本信息添加、修改、查询、删除；
- **仓库基本信息管理**：仓库基本信息添加、修改、查询、删除；
- **产品基本信息管理**：产品基本信息添加、修改、查询、删除；
- **用户管理**：添加用户、权限修改、删除系统用户。
- **入库记录管理**：入库记录的添加、修改、查询、删除
- **出库记录管理**：出库记录的添加、修改、查询、删除
- **库存管理**：库存的添加、修改、查询、删除
- **系统日志**：查看系统日志

## 需求分析
### 用户需求
用户的操作是根据管理员赋予的权限相对应，没有相应权限的用户在系统页面上是不会出现操作按钮的。管理员可随时修改用户权限。
1.	**产品管理**：用户登录后可以查看产品信息，并且可以根据产品名称查找产品信息。添加产品信息，系统会对添加的数据进行检查，判断数据是否符合要求，从而保证添加的数据正确，比如当输入产品数量上限小于数量下限时，会自动提示错误。修改产品信息，会回显以前数据，用户只需要编辑要修改的信息即可，同时也会有数据约束条件显示。删除产品信息，删除分单个删除和批量删除，删除前会进行确认判断。
2.	**客户管理**：用户可以对客户信息进行查看、编辑、添加、删除等操作。根据客户名称查询客户；在添加和修改客户信息时有约束条件提示，会对客户的具体信息加以验证。
3.	**仓库管理**：用户可以添加、查询、修改、删除仓库，根据仓库名称查询仓库，同时都会有相应的约束和错误提示。
4.	**库存管理**：用户可以选择查询条件来查询库存记录；用户可以批量删除或单一删除任意库存记录；同时，删除某一仓库或者产品，其对应的库存记录也会相应的删除，保证了数据的同步。用户还可以添加库存，编辑库存。并且，添加库存的产品数量时会进行错误提示，以保证添加的产品数量在产品数量的上限和下限之间。
5.	**详细库存情况查看**：为了方便用户查看详细的库存信息，在设计数据库时添加了“产品-仓库-库存”视图，并把视图的信息返回到前端页面。视图内容为：产品编号、产品名称、仓库编号、仓库名称、产品库存数量、产品数量下限、产品数量上限。同时用户可以选择查询条件来查询库存信息，极大的方面了用户管理库存信息。
6.	**入库记录管理**：用户可以添加入库记录，每次添加入库记录后，产品的库存也会自动的增加，同时，对添加产品的数量有约束，当添加的产品数量大于产品的数量上限后，页面会提醒。用户也可以查询入库记录，查询的条件分别是仓库编号、产品编号和入库时间，用户可以根据任意一个作为条件来查询入库记录。用户还可以删除入库记录，删除也分为单个删除和批量删除。用户可对入库记录进行编辑，但是编辑库存数量并不会引起实际库存数量的改变。删除和编辑都属于敏感权限，管理员可对用户权限进行限制。
7.	**出库记录管理**：和入库记录需求一样，用户添加出库记录的时候，系统会自动判断出库的数量是否符合要求，也就是出库后产品数量会不会低于商品数量下限。每次出库后，产品的库存数量会自动更新。同时，用户可以删除、修改出库记录。

### 管理员需求
管理员有多个，但只有一个超级管理员。超级管理员可以修改普通管理员的权限，也可以修改用户权限。
1.	**用户管理**：管理员根据权限，可以拥有下面功能：添加用户，自动保证用户名的唯一（如输入用户名不唯一会报错），赋予用户不同的角色（管理员，用户），用户登录后根据角色会跳转至相应的界面。修改用户的权限，在用户需求中，用户的增、删、改、查操作都是根据用户的权限而来的。没有权限的用户是无法对数据进行操作的。管理员可以修改某一用户的权限，使其进行有权限的操作，这样保证了数据的安全性。更改用户密码，如果用户密码忘记可以联系管理员进行修改。
2.	**系统日志**：不管是用户还是管理员，自登陆开始，他们的一系列操作都会以日志的形式保存在数据库中。系统日志只允许管理员查看，不允许编辑、删除。同时，为了方便查看日志，设置了条件查询，管理员可以根据用户名或者日期来查询相应的操作日志。
3.	由于是企业库存管理系统，所以设置该系统由企业内部相关人员访问，就没有提供注册功能。用户密码忘记直接寻找管理员即可。设置了一个超级管理员admin账号，其数据不在页面展示，用于管理所有用户和管理员。


## 系统整体设计
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628172013743.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
## 数据库逻辑结构设计
产品（**产品编号**，产品名称，产品规格，参考价格，数量上限，数量下限）
仓库（**仓库编号**，仓库名称，仓库说明）
客户（**客户编号**，客户姓名，客户类型，联系人，联系电话，通信地址，备注）
用户（**用户编号**，用户昵称，用户名，密码，权限，角色）
系统日志（**日志编号**，操作用户，操作函数，方法描述，操作时间）
入库记录（**入库编号**，产品编号，仓库编号，入库数量，入库时间）
出库记录（**出库编号**，产品编号，仓库编号，出库数量，出库时间）
库存（**产品编号**，**仓库编号**，库存数量）

## 系统演示和说明
后台默认账号：`admin`   密码：`database`  可以连接自己的数据库设置。具体请看开发文档。
## 页面展示
### 用户管理页面
#### 登录页面：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173023992.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
输入用户名、密码和验证码，进行验证。系统会显示具体的错误信息：用户名错误、密码错误和验证码错误。如果看不清验证码，单击验证码图片可切换验证码。登录成功后系统会根据账号的角色进行相应页面的跳转，即用户管理页面和管理员管理页面。
#### 用户管理页面：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173113767.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
如果是用户角色，直接进入用户管理界面。可通过左侧查看各种信息。
#### 客户信息展示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173152916.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
显示客户信息，并且根据用户的权限显示对应的操作按钮
#### 编辑客户信息
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020062817321925.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
会将数据库中要编辑的客户信息都会回显到页面上，我们只需要修改想要修改的部分即可。在编辑信息同时会有数据格式约束提示。
#### 添加客户信息
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173250785.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
在添加时，系统会对输入数据进行检查，判断输入的格式是否符合要求
#### 查找客户信息
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173316236.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
根据客户名称查找客户
#### 产品信息展示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173345132.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
在添加和编辑产品信息时，都会有错误提示，如果产品的数量下限大于数量上限将无法添加。另外，对产品名称和产品价格等都有约束。
#### 仓库信息展示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173413807.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 库存详细信息——视图显示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173439762.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
库存详细信息是将数据库中的视图返回到页面上，它将产品表、仓库表、库存表信息结合为一张表中，该视图只允许查看和查询，不允许编辑和删除。
#### 库存查询方式选择
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173506596.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 出库信息展示
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020062817352888.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 入库信息展示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173546517.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 出入库信息查找
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173613579.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
可以根据产品编号、仓库编号、出入库时间来查询出入库记录。
#### 添加出库记录
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173640686.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
在出库数量填入后，系统会自动对该数量进行检查，判断如果执行后是否会出现错误。

### 管理员管理页面
#### 系统日志查看
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173825539.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 系统日志查询
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173847510.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
可以根据时间和操作的用户查询系统日志
#### 用户管理页面
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200628173921719.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzIwNzAyNQ==,size_16,color_FFFFFF,t_70#pic_center)
#### 版权信息
本源码遵循Apache2.0开源协议发布，并提供免费使用。
