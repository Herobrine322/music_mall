# music_mall
音乐电商微信小程序+springboot后端+vue3网页端管理

下载好后，把touko_mall文件夹放到你的D盘，这是数据库图片文件映射的路径，(当然你想改文件夹名字和位置你得去Springboot文件夹里 找到映射路径慢慢改)

先打开你的数据库软件 比如Navicat Premium 15，然后命令行建立呢个touko_mall的数据库 当然可以随便改数据库名

IDEA 打开spring1boot文件夹，然后找到application.yml修改配置信息 （配好数据库路径映射 root用户密码 小程序的id） 然后点击左上角三角形运行。

打开你的微信者工具，导入这个项目，直接用测试号就行。要是画面没数据 呢就是你的数据库没启动，和后端IJ报错了 没配置好

呢个vue网页用webstorm打开或者vs code打开都行 前提是你装了node 其他配置应该也不需要吧（忘了） ，然后在软件底下打开命令行用npm i 再npm run serve 我的话直接yarn 再 yarn serve 记得是在根目录下用

应该没问题了吧。前端后台有时候改不了 ，得自己到数据库里直接修改 应该是sql的表有问题 后端没啥毛病 建议建表别带数据 自己慢慢加数据， 毕竟我是二改的。 然后微信付款其实也实现了，但是我实在不想为了个破毕设给腾讯打米300，直接后台显示未付款 就说明成功了。 那么共勉（）
