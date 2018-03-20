使用 SSM 框架构建一个小的 web 项目:

框架封装了很多实现的方法，调用也很方便，省去了大量与业务关的代码，可以让我们更加关注于功能的实现。
在练习中，对使用框架的好处深有体会，代码结构更加清晰，每一层只做一件事。

当浏览器发出请求后，前端控制器 DispatcherServlet 处理请求，在 Controller 类里处理，通过接口，调用 Service 层的方法，再在 Service 层里调用 DAO 层的方法，一层一层通过接口调用。

DispatcherServlet 只做任务的分派，
Controller 里处理请求返回视图模型，
Service 层做具体业务的处理， 
DAO 层只对数据库。
前台页面使用JSP，EL表达式来做展示和简单的逻辑处理


Demo的环境: JDK1.7，maven3.5，Spring3.2.16，MyBatis3.2.2，
IDE: MyEclipse
数据库: MySQL


构建一个demo的步骤：
1. 导入 jar 包(如果使用 maven 则是配置 pom.xml)
2. 配置 web.xml 文件
3. 配置 spring.xml
4. 配置 springMVC.xml
5. 配置 myBatis.xml
6. 配置资源文件，database.properties，log4j.properties 等等
7. 设计 pojo 实体类
7. 编写 DAO 层接口和 Mapper.xml
8. 编写 service 业务层
9. 编写 cotroller 控制器
10. 视图代码：前台 jsp 页面



租房系统功能分析：
1. 用户注册和登录
2. 租房信息列表查询显示
3. 按条件搜索查询（定义一个查询类 HouseQuery）
4. 分页查询（定义一个分页类 Page）
5. 查询数据的回显
6. 不登录用户：       查询
7. 登录的用户：       查询、  增加、修改、删除信息

数据库中有六张表：
![tables.png](https://github.com/JasonMHo/house/blob/master/table.png)


基本功能效果：
![house.gif](https://github.com/JasonMHo/house/blob/master/house.gif)





可扩展功能：
1，用户的管理，管理员可以添加修改删除用户
2，用户权限的控制，
3，可根据用户查询该用户下面的房子信息
等等......

