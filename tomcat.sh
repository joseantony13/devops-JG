# Step 1: Install Java 17 (if not already installed)
yum install java-17-amazon-corretto -y

# Step 2: Download and extract Apache Tomcat 11.0.6
wget https://downloads.apache.org/tomcat/tomcat-11/v11.0.6/bin/apache-tomcat-11.0.6.tar.gz
tar -zxvf apache-tomcat-11.0.6.tar.gz
cd apache-tomcat-11.0.6

# Step 3: Configure tomcat-users.xml for deployment access
sed -i '/<\/tomcat-users>/i\<role rolename="manager-gui"/>' conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="manager-script"/>' conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<user username="tomcat" password="admin@123" roles="manager-gui,manager-script"/>' conf/tomcat-users.xml

# Step 4: Remove IP-based access restrictions in manager app
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/d' webapps/manager/META-INF/context.xml

# Step 5: Start Tomcat
sh bin/startup.sh
