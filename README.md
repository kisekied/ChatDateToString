#ChatDateToString
这是一个传入NSDate输出仿照手机QQ时间戳的类
>1.传入Date大于当前时间，则输出"Time Error"

>2.传入时间与今天是同一天，则显示为`HH:mm`形式

>3.传入时间是昨天，则显示为`昨天 HH:mm`形式

>4.传入时间是7日之内，则显示为`星期X HH:mm`形式

>5.传入时间大于7天，但在今年，则显示为`MM-dd HH:mm`形式

>6.传入时间不在今年，则显示为`YYYY-MM-dd HH:mm`形式


