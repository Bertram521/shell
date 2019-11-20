#!/bin/bash
##author Mr.Bertram
##配置jdk环境变量与tomcat内存分配
##tocmat内存##
sed -i '/#\ OS\ specific\ support/'a\ 'JAVA_OPTS="-server\ -d64\ -Djava.awt.headless=true\ -Xms2048m\ -Xmx2048m\ -Xss1024k\ -Ddruid.registerToSysProperty=true" ' /usr/local/tomcat/bin/catalina.sh
echo -e "\033[41;37mTomcat内存配置finish!\033[0m"

cat >> /etc/profile << \EOF
###jdk######
export HISTTIMEFORMAT="%F %T `whoami` " 

JAVA_HOME=/usr/local/jdk
JRE_HOME=/usr/local/jdk/jre
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$JAVA_HOME/bin
export JAVA_HOME JRE_HOME CLASSPATH  PATH

EOF
source /etc/profile
echo  -e "\033[43;34m环境变量配置完成!\033[0m"
